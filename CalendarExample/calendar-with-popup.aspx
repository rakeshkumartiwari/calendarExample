<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar-with-popup.aspx.cs" Inherits="CalendarExample.calendar_with_popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset='utf-8' />

    <link href="css/fullcalendar.min.css" rel="stylesheet" />
    <link href="css/fullcalendar.print.min.css" rel="stylesheet" />
    <link href="css/myStylesheet.css" rel="stylesheet" />
    <script src="lib/moment.min.js"></script>
    <script src="lib/jquery.min.js"></script>
    <link href="lib/cupertino/jquery-ui.min.css" rel="stylesheet" />
    <script src="lib/fullcalendar.min.js"></script>
    <script src="lib/jquery-ui.min.js"></script>

    <script>
        $(document).ready(function () {
            var employess = $('#hdnEmployees').val();
            var jsEmployees = $.parseJSON(employess);
            console.log('employess', jsEmployees);
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,listWeek'
                },
                defaultDate: '2017-05-12',
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                events: jsEmployees,
                dayClick: function (date, jsEvent, view, resourceObj) {
                    debugger;
                    //alert('Date: ' + date.format());
                    //alert('Resource ID: ' + resourceObj.id);
                    showEventViewPopup();
                },
                eventClick: function (calEvent, jsEvent, view) {

                    alert('Event: ' + calEvent.title);
                    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                    alert('View: ' + view.name);

                    // change the border color just for fun
                    $(this).css('border-color', 'red');
                    showEventViewPopup();

                }

            });
        });
        function showEventViewPopup()
        {
            $('#envent-entry-popup').dialog({

                buttons: {
                    'OK': function () {
                        $(this).dialog("close");
                    },
                    'Cancel': function () {
                        $(this).dialog("close");
                    }
                }


            });
        }    


    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hdnEmployees" runat="server" />
        <div id="calendar"></div>
        <div id="envent-entry-popup" title="Edit/View Event">
            <div id="event-entry-body">
                Start Date : <input />
                End Date: <input />
                <button></button>
            </div>
        </div>

    </form>
</body>
</html>
