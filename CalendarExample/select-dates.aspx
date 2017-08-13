<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="select-dates.aspx.cs" Inherits="CalendarExample.select_dates" %>

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
                selectable: true,
                selectHelper: true,
                select: function (start, end) {
                    // var title = prompt('Event Title:');
                    var title = showEventViewPopup(start, end);

                },

            });
        });
        function showEventViewPopup(start, end) {
            $('#envent-entry-popup').dialog({

                buttons: {
                    'Submit': function () {
                        $(this).dialog("close");
                        createEvent(start, end);

                    },
                    'Cancel': function () {
                        $(this).dialog("close");
                    }
                }


            });
        }

        function createEvent(start, end) {
            var title = $('#title').val();

            var eventData;
            if (title) {
                eventData = {
                    title: title,
                    start: start,
                    end: end
                };
                $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
            }
            $('#calendar').fullCalendar('unselect');
            saveEvent(eventData);
            $('#title').val('');
        }

        function saveEvent(eventData) {
        
            //$.post('save');// in MVC
            $('#eventFromCalander').val(JSON.stringify(eventData))
            $('#save').trigger('click');
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hdnEmployees" runat="server" />
        <asp:HiddenField ID="eventFromCalander" runat="server" />
        <asp:HiddenField ID="userId" runat="server" />
        <div id="calendar"></div>
        <div id="envent-entry-popup" title="Edit/View Event">
            <div id="event-entry-body">
                Welcome <span></span>
                Title:
                <input id="title" type="text" />


            </div>
        </div>
        <button style="display: none" type="submit" id="save"></button>
    </form>
</body>
</html>
