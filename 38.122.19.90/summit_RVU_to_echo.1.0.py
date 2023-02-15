#!/usr/bin/python3.7

import sys
import argparse
import re
import datetime
from datetime import timedelta
import requests
import json
from requests.packages import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


#FUNCTIONS HERE --------------------------------------------------------------------------------------------------------
def summit_authenticator(authkey):
    summiturl="http://data.summitrad.net/custom/api/authenticator.php?"
    geturl="authkey=" + authkey
    authurl = summiturl + geturl
    r = requests.get(authurl, verify=False)
    response = r.text
    authenticated = response.strip()
    if authenticated != "1":
        print("access not allowed")
        exit()
    return


def summit_keytotoken(authkey):
    summiturl="http://data.summitrad.net/custom/api/authtoken.php?"
    geturl="authkey=" + authkey
    authurl=summiturl + geturl
    r = requests.get(authurl, verify=False)
    response = r.text
    return response.strip()

def summit_pulldatabydate(authkey,datakey, start, end):
    startDate = "&begindate=" + start
    endDate = "&enddate=" + end
    authtoken= "&authtoken=" + summit_keytotoken(authkey)
    summiturl="http://data.summitrad.net/custom/api/pullbydate.php?"
    geturl="authkey=" + datakey + authtoken + startDate + endDate
    authurl=summiturl + geturl
    r = requests.get(authurl, verify=False)
    response = r.text
    return response.strip()

#data manipulation

def get_data(start, end):
    start_date = convert_date(start)[0]   #adjusted to pull 1 day before the entered to get overlapping shift data
    end_date = convert_date(end)[0] + timedelta(days=1)
    rippeddata = summit_pulldatabydate(authkey_ted, authkey_data, start_date.strftime('%m/%d/%y'), end_date.strftime('%m/%d/%y'))
    rippeddata = rippeddata.splitlines(keepends=False)
    unique_data = []
    data = []
    for x in rippeddata:
        if x not in unique_data:
            unique_data.append(x)


    for x in unique_data:
        var = x.split(',')
        line_dict = {
            'accession': var[0],
            'examdescription': var[1],
            'imgcode': var[2],
            'simpledate': var[3].replace(' ', 'T'), #convert_date(var[3]),
            'orderdate': var[4].replace(' ', 'T'),
            'lastmodifieddate': var[5].replace(' ', 'T'), #convert_date(var[5]),                                                          # 0 date object, 1 time object, 2 date converted to str mm/dd/yyyy
            'system': var[6],
            'site': var[7],                                                                                    # accession,examdescription,imgcode,simpledate,orderdate,
            'rad': var[8],                                                                                     # lastmodifieddate,system,site,rad,chair,cptcode,wrvu,orderid,reportid,priority
            'chair': var[9],
            'cptcode': var[10],
            'wrvu': var[11],
            'orderid': var[12],
            'reportid': var[13],
            'priority': var[14]
        }

        data.append(line_dict)                                                                                     #all exam data

    return data



# QGENDA================================================================================================================

def login():
    url = "https://api.qgenda.com/v2/login"

    payload='email=SRSPCAPI%40qgenda.com&password=%403dLhRKvvj!_%3F%40)_'
    headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    }

    response = requests.request("POST", url, headers=headers, data=payload)
    token = response.text
    token = token.split('\"')
    # print(token[3])                                                                                                   #returns in the format of: "access_token":"KEY"
    token = token[3]
    return token


def get_schedule(start, end):                                                                                                     #0 = rad, 1 = shift, 2 = date
    startDate = "&startDate=" + start #start
    endDate = "&endDate=" + end #end
    url = base_url + "schedule" + ckey + startDate + endDate + '&$select=Date,TaskAbbrev,StaffAbbrev,IsStruck,StartTime,EndTime,EndDate,StartDate' + '&$filter=IsPublished'
    payload = {}
    headers = {
        'Authorization': 'Bearer ' + login()
    }

    response = requests.request("GET", url, headers=headers, data=payload)
    response_python = json.loads(str(response.text))
    data = []
    ignored_tasks = ['No Call', 'Not Working', 'Vacation', 'Admin', 'Practice Management']
    for x in response_python:
        if x['TaskAbbrev'] not in ignored_tasks:                                                                        #remove certain shifts and struck shifts
            data.append(x)
    return data

def get_rad_and_shifts(target_date):
    unique_rads = []
    for x in schedule:
        if x['Date'] == target_date[3]:
            if x['StaffAbbrev'] not in unique_rads:
                unique_rads.append(x['StaffAbbrev'])

    var = []
    for x in unique_rads:
        line = []
        line.append(x)
        for y in schedule:
            if y['Date'] == target_date[3] and x == y['StaffAbbrev']:
                if y['TaskAbbrev'] not in line:
                    line.append(y['TaskAbbrev'])
        var.append(line)
    rad_with_shifts = []
    for x in var:
        task = []
        line = []
        task = x[1]
        for y in x[2:]:
            task += '/' + y
        line.append(x[0])
        line.append(task)
        rad_with_shifts.append(line)
    return rad_with_shifts

def get_rvu(target_date):
    night_shifts = ['Overnight', 'Bridge', 'Swing']
    rad_shifts = get_rad_and_shifts(target_date)
    next_day = convert_date((target_date[0] + timedelta(days=1)).strftime('%m/%d/%Y'))

    shift_start = target_date[3]
    shift_end = target_date[3].split('T')[0] + 'T24:00:00'

    overnight_start = target_date[3].split('T')[0] + 'T21:00:00'
    overnight_end = next_day[3].split('T')[0] + 'T07:00:00'

    bridge_start = target_date[3].split('T')[0] + 'T17:00:00'
    bridge_end = next_day[3].split('T')[0] + 'T03:00:00'

    swing_start = target_date[3].split('T')[0] + 'T16:00:00'
    swing_end = next_day[3].split('T')[0] + 'T01:00:00'

    rad_shift_rvu = []
    for x in rad_shifts:
        line = []
        wrvu = 0
        study_count = 0
        if x[1] not in night_shifts:
            for y in data:
                if x[0] == y['rad'] and y['lastmodifieddate'] > shift_start and y['lastmodifieddate'] < shift_end:
                    study_count += 1
                    try:
                        wrvu += float(y['wrvu'])
                    except:
                        print(y['wrvu'])
            line.append(x[0])
            line.append(round(wrvu, 2))
            line.append(str(round(wrvu, 2)))
            line.append(x[1])
            rad_shift_rvu.append(line)
        elif x[1] == 'Overnight':                                                                                      #exceptions for off hour shifts. could have it pull the shift hours and then use them as the bounds in future
            for y in data:
                if x[0] == y['rad'] and y['lastmodifieddate'] > overnight_start and y['lastmodifieddate'] < overnight_end:
                    study_count += 1
                    try:
                        wrvu += float(y['wrvu'])
                    except:
                        print(y['wrvu'])
            line.append(x[0])
            line.append(round(wrvu, 2))
            line.append(str(round(wrvu, 2)))
            line.append(x[1])
            rad_shift_rvu.append(line)
        elif x[1] == 'Bridge':
            for y in data:
                if x[0] == y['rad'] and y['lastmodifieddate'] > bridge_start and y['lastmodifieddate'] < bridge_end:
                    study_count += 1
                    try:
                        wrvu += float(y['wrvu'])
                    except:
                        print(y['wrvu'])
            line.append(x[0])
            line.append(round(wrvu, 2))
            line.append(str(round(wrvu, 2)))
            line.append(x[1])
            rad_shift_rvu.append(line)
        elif x[1] == 'Swing':
            for y in data:
                if x[0] == y['rad'] and y['lastmodifieddate'] > swing_start and y['lastmodifieddate'] < swing_end:
                    study_count += 1
                    try:
                        wrvu += float(y['wrvu'])
                    except:
                        print(y['wrvu'])
            line.append(x[0])
            line.append(round(wrvu, 2))
            line.append(str(round(wrvu, 2)))
            line.append(x[1])
            rad_shift_rvu.append(line)

    return rad_shift_rvu

def convert_date(date):                                                                                                 #converts to datetime object.
    if 'T' in date:
        date = date.split('T')
    else:
        date = date.split()

    requested_date = date[0]
    if '-' in requested_date:
        var = requested_date.split('-')
        y = var[0]
        m = var[1]
        d = var[2]

    elif '/' in requested_date:                                                                                         #converts mm/dd/yyyy
        var = requested_date.split('/')
        y = var[2]
        m = var[0]
        d = var[1]

    if len(date) > 1:
        requested_time = date[1]
        requested_time = datetime.time(int(requested_time.split(':')[0]), int(requested_time.split(':')[1]))
    else:
        requested_time = datetime.time(0, 0, 0)
    requested_date = datetime.date(int(y), int(m), int(d))
    formal_date = y+'-'+m+'-'+d+'T00:00:00'
    date_time = [requested_date, requested_time, requested_date.strftime('%m/%d/%Y'), formal_date]
    return date_time



#QGENDA INPUTS==========================================================================================================
base_url = "https://api.qgenda.com/v2/"
companyKey = '702d849a-3403-4792-9502-7dd508c1a883'; ckey = "?companyKey=" + companyKey

#USER INPUT HERE ----------------------------------
#AUTH CREDENTIALS - THIS ONE IS TEDS MAIN AUTH
authkey_ted= "4666ceb859308da21b7c5a6370b5af6a"
#AUTH CREDENTIALS - THIS ONE ALLOWS A DATA PULL
authkey_data="fda7594f60f6e400b86243abdd92ed65"
#put in some dates for data you want - has to be formatted right, but i have a whole script on the server to deal with this formatting:    MM/DD/YYYY

parser = argparse.ArgumentParser()
parser.add_argument("begindate", help="start date")
args = parser.parse_args()
begindate = args.begindate
target_date = begindate.split('-')[1] + '/' + begindate.split('-')[2] + '/' + begindate.split('-')[0]



# target_date = (datetime.date.today()).strftime('%m/%d/%Y')
target_date = convert_date(target_date)
start=(target_date[0] - timedelta(days=7)).strftime('%m/%d/%Y')
end= (target_date[0] + timedelta(days=1)).strftime('%m/%d/%Y')

summit_authenticator(authkey_ted)
data = get_data(start, end)
schedule = get_schedule(start, end)

target_date_range_start = target_date[0] - timedelta(days=6)
target_date_range_end = target_date[0] + timedelta(days=0)

while target_date_range_start <= target_date_range_end:
    print('--------------------------------------')
    print('<br>')
    parse_date = target_date_range_start.strftime('%m/%d/%Y')
    print(target_date_range_start.strftime('%m/%d/%Y'))
    print('<br>')
    target_date = convert_date(target_date_range_start.strftime('%m/%d/%Y'))
    rad_shifts = get_rad_and_shifts(target_date)
    Rad_Rvu = get_rvu(target_date)
    filtered_rad_rvu = []
    for x in Rad_Rvu:
        if x[1] > 1:
            filtered_rad_rvu.append(x)
    Rad_Rvu = filtered_rad_rvu
    Rad_Rvu.sort(key=lambda Rad_Rvu: Rad_Rvu[1], reverse=True)

    count = 0
    for x in Rad_Rvu:
        count += 1
        line = x[0] + ',' + x[3] + ',' + x[2]
        if count < len(Rad_Rvu):
            line += '<br>'
        print(line)
    target_date_range_start = target_date_range_start + timedelta(days=1)
    print('<br>')
    # print('--------------------------------------')