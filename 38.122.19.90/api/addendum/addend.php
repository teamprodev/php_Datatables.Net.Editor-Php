


<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #0d4478;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
<body>

<form method='post' action='send_addendum_args.php'>
  <h2><br>Communication Recorder<br></h2>
  <h3>Summit Radiology tool for logging communicated results</h3>
  <br>
  <div class="imgcontainer">
    <img src="img_avatar2.jpg" alt="Avatar" class="avatar">
  </div>
  <label for='rid'></label>
  <input type='hidden' name='rid' id= 'rid' value='' readonly>  

  <label for='system'></label>
  <input type='hidden' name='system' id= 'system' value='' readonly>
  
  <label for='group_id'></label>
  <input type='hidden' name='group_id' id= 'group_id' value='' readonly>  

  <label for='radid'></label>
  <input type='hidden' name='radid' id= 'radid' value='' readonly>

  <label for='accession'>Accession Number:</label><br>
  <input type='text' name='accession' id= 'accession' value='' readonly>


  <br>
  <label for='Contacted'>Person Contacted:</label><br>
  <input type='text' name='contacted' id= 'contacted' value=''>
  <br><br>
  <label for='PSR'>Physician Support Representative:</label>
  <br>
  <select name='PSR' id='PSR'>
  <option value='Anna Bearden'>Anna Bearden</option>
  <option value='Chelsea Seabolt'>Chelsea Seabolt</option>
  <option value='Ben Morris'>Ben Morris</option>
  <option value='Kimberly Cantrell'>Kimberly Cantrell</option>
  <option value='Melissa Bramlett'>Melissa Bramlett</option>
  <option value='Madison Howard'>Madison Howard</option>
  <option value='Kim Atkins'>Kim Atkins</option>
  <option value='Taylor Eskew'>Taylor Eskew</option>
  <option value='Stacie Snow'>Stacie Snow</option>
  <option value='Llana Hughes'>Llana Hughes</option>
  <option value='Heather Parker'>Heather Parker</option>
  <option value='DELETE'>DELETE THIS ENTRY. WILL MARK CRITICAL COMPLETE</option>
  </select>

<!--   <input type='hidden' name='accession' id= 'accession' value= ''> -->

  <br><br>
  <button type="submit" id = 'submit'>Submit</button>
</form>

</body>
</html>


