﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CalendarExample.WebForm1" %>

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
    <script src="lib/fullcalendar.min.js"></script>

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

                    alert('Date: ' + date.format());
                    alert('Resource ID: ' + resourceObj.id);

                }

            });




            //    $('#calendar').fullCalendar({
            //        header: {
            //            left: 'prev,next today',
            //            center: 'title',
            //            right: 'month,agendaWeek,agendaDay,listWeek'
            //        },
            //        defaultDate: '2017-05-12',
            //        navLinks: true, // can click day/week names to navigate views
            //        editable: true,
            //        eventLimit: true, // allow "more" link when too many events
            //        events: [
            //            {
            //                title: 'All Day Event',
            //                start: '2017-05-01'
            //            },
            //            {
            //                title: 'Long Event',
            //                start: '2017-05-07',
            //                end: '2017-05-10'
            //            },
            //            {
            //                id: 999,
            //                title: 'Repeating Event',
            //                start: '2017-05-09T16:00:00'
            //            },
            //            {
            //                id: 999,
            //                title: 'Repeating Event',
            //                start: '2017-05-16T16:00:00'
            //            },
            //            {
            //                title: 'Conference',
            //                start: '2017-05-11',
            //                end: '2017-05-13'
            //            },
            //            {
            //                title: 'Meeting',
            //                start: '2017-05-12T10:30:00',
            //                end: '2017-05-12T12:30:00'
            //            },
            //            {
            //                title: 'Lunch',
            //                start: '2017-05-12T12:00:00'
            //            },
            //            {
            //                title: 'Meeting',
            //                start: '2017-05-12T14:30:00'
            //            },
            //            {
            //                title: 'Happy Hour',
            //                start: '2017-05-12T17:30:00'
            //            },
            //            {
            //                title: 'Dinner',
            //                start: '2017-05-12T20:00:00'
            //            },
            //            {
            //                title: 'Birthday Party',
            //                start: '2017-05-13T07:00:00'
            //            },
            //            {
            //                title: 'Click for Google',
            //                url: 'http://google.com/',
            //                start: '2017-05-28'
            //            }
            //        ]
            //    });

        });

    </script>
   
         
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hdnEmployees" runat="server" />
        <div id='calendar'></div>
    </form>
</body>
</html>
