        function jqPopulateCGACalendar() {
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
            
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,basicWeek,basicDay'
                },
                editable: true,
                weekMode: 'liquid',
                events: 'in-calevents.php',
                defaultView: 'basicDay',
                height: 300,

                eventClick: function (calEvent, jsEvent, view) {
                    var event = 'Event: ' + calEvent.title + '\n' +
                           'Location: ' + calEvent.location + '\n' +
                           'Start time: ' + calEvent.start + '\n' +
                           'End time: ' + calEvent.end + '\n'
                    alert(event);
                    if (calEvent.url) {
                        window.open(calEvent.url);
                        return false;
                    }
                },

                eventRender: function (event, element, view) {
                    if (view.name === 'basicDay') {
                        $(element).height('30px');
                        //$(element).css('font-size','16px !important');
                    }
                }
            });
        }
        $(document).ready(function () {
            $('.carousel').carousel();
        });
        $(document).ready(jqPopulateCGACalendar);

/*        function jqChangeToDay() {
            var width = $(window).width();
            if (width <= 767) {
                $('#calendar').fullCalendar('changeView', 'basicDay');
            }
        }

        $(document).ready(jqChangeToDay);*/

        $(document).ready(function () {
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                if (e.target.id == 'myTabCalendar') {
                    $('#calendar').fullCalendar('destroy');
                    jqPopulateCGACalendar();
                    jqChangeToDay();
                }
            });

        });
        
function jqUpdateSize() {
    var width = $(window).width();
    var myID = "#" + $(this).attr('id') + "plus";
    if (width <= 767) {
        $('.autocollapse').collapse('hide');
        $(myID).removeClass("glyphicon-minus");
        $(myID).addClass("glyphicon-plus");
    }
    else {
        $('.autocollapse').collapse('show');
    }
}
function jqToggleSymbolOnLoad() {
    var width = $(window).width();
    if (width <= 767) {
        $(".panel-title .glyphicon").toggleClass("glyphicon-minus glyphicon-plus");
    }
 }
$(document).ready(jqUpdateSize);
$(document).ready(jqToggleSymbolOnLoad);
$(window).resize(jqUpdateSize);
$(document).ready(function () {
    $("#srch-term").focus(function () { $(this).select(); });
    $("#srch-term1").focus(function () { $(this).select(); });
    $('.panel-body').on('show.bs.collapse', function () {
        var myID = "#" + $(this).attr('id') + "plus";
        $(myID).removeClass("glyphicon-plus");
        $(myID).addClass("glyphicon-minus");
    });
    $('.panel-body').on('hide.bs.collapse', function () {
        var myID1 = "#" + $(this).attr('id') + "plus";
        $(myID1).removeClass("glyphicon-minus");
        $(myID1).addClass("glyphicon-plus");
    });
}); 

$(window).bind('scroll', function () {
    if ($(this).scrollTop() > 180) {
        $("#smlogo").fadeIn("6000");
        $("#smlogo").removeClass("hidden-lg");
        $("#smlogo").removeClass("hidden-md");
    }
    else
    {
        $("#smlogo").addClass("hidden-lg");
        $("#smlogo").addClass("hidden-md");
    }
});
