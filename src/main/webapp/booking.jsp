<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 5/16/2024
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Date Range Picker</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/min/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
        }
        .calendar-container {
            max-width: 400px;
            margin: 0 auto;
        }
        .apply-btn {
            background-color: #917bf7;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%--<div class="calendar-container">--%>
<%--    <label for="daterange">Select a date range:</label>--%>
<%--    <input type="text" id="daterange" class="form-control" >--%>
<%--</div>--%>
<%--<p>Night: <span id="result"></span></p>--%>

<%--<label for="adult">Adult</label>--%>
<%--<input type="number" id="adult" name="adults" min="0">--%>

<%--<label for="child">Child</label>--%>
<%--<input type="number" id="child" name="childs" min="0">--%>

<%--<input type="submit" value="Booking">--%>
<%--<input type="reset" value="Cancel">--%>

<form action="booking-servlet" method="get">
    <label for="check-in">Check-in</label>
    <input type="date" name="checkInDate" id="check-in">

    <label for="check-out">Check-out</label>
    <input type="date" name="checkOutDate" id="check-out" onchange="calculateDays()">

    <p>Night: <span id="result"></span></p>

    <label for="adult">Adult</label>
    <input type="number" id="adult" name="adults" min="0">

    <label for="child">Child</label>
    <input type="number" id="child" name="childs" min="0">

    <input type="submit" value="Booking">
    <input type="reset" value="Cancel">
</form>


<script>
    // $(function() {
    //     $('#daterange').daterangepicker({
    //         locale: {
    //             format: 'MMM D, YYYY'
    //         },
    //         startDate: moment().startOf('day'),
    //         endDate: moment().add(1, 'days').endOf('day'),
    //         minDate: moment().startOf('day'),
    //         // autoApply: true
    //         autoApply: true,
    //         opens: 'center',
    //         showDropdowns: true,
    //         linkedCalendars: true
    //     });
    // });

    // $(function() {
    //     $('#daterange').daterangepicker({
    //         // ... other options
    //         ranges: {
    //             'Today': [moment(), moment()],
    //             'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')]
    //         }
    //     });
    //     $('#daterange').on('apply.daterangepicker', function(ev, picker) {
    //         const startDate = picker.startDate;
    //         const endDate = picker.endDate;
    //         const nightCount = endDate.diff(startDate, 'days');
    //         $('#result').text(nightCount);
    //     });
    // });


        document.addEventListener('DOMContentLoaded', (event) => {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('check-in').setAttribute('min', today);
            document.getElementById('check-out').setAttribute('min', today);

            document.getElementById('check-in').addEventListener('change', function() {
                const checkInDate = this.value;
                document.getElementById('check-out').setAttribute('min', checkInDate);
                calculateDays();
            });
        });

        function calculateDays() {
            const checkInDate = document.getElementById('check-in').value;
            const checkOutDate = document.getElementById('check-out').value;

            if (!checkInDate || !checkOutDate) {
                document.getElementById('result').innerText = "Please select both dates.";
                return;
            }

            const checkIn = new Date(checkInDate);
            const checkOut = new Date(checkOutDate);
            const timeDifference = checkOut - checkIn;
            const daysDifference = timeDifference / (1000 * 3600 * 24);

            if (daysDifference >= 0) {
                document.getElementById('result').innerText = `Night:` + daysDifference;
            } else {
                document.getElementById('result').innerText = "Check-out date must be after check-in date.";
            }
        }

</script>
</body>
</html>

<%--<form action="booking-servlet" method="get">--%>
<%--    <label for="check-in">Check-in</label>--%>
<%--    <input type="date" name="checkInDate" id="check-in">--%>

<%--    <label for="check-out">Check-out</label>--%>
<%--    <input type="date" name="checkOutDate" id="check-out" onchange="calculateDays()">--%>

<%--    <p>Night: <span id="result"></span></p>--%>

<%--    <label for="adult">Adult</label>--%>
<%--    <input type="number" id="adult" name="adults" min="0">--%>

<%--    <label for="child">Child</label>--%>
<%--    <input type="number" id="child" name="childs" min="0">--%>

<%--    <input type="submit" value="Booking">--%>
<%--    <input type="reset" value="Cancel">--%>
<%--</form>--%>

<%--<script>--%>
<%--    document.addEventListener('DOMContentLoaded', (event) => {--%>
<%--        const today = new Date().toISOString().split('T')[0];--%>
<%--        document.getElementById('check-in').setAttribute('min', today);--%>
<%--        document.getElementById('check-out').setAttribute('min', today);--%>

<%--        document.getElementById('check-in').addEventListener('change', function() {--%>
<%--            const checkInDate = this.value;--%>
<%--            document.getElementById('check-out').setAttribute('min', checkInDate);--%>
<%--            calculateDays();--%>
<%--        });--%>
<%--    });--%>

<%--    function calculateDays() {--%>
<%--        const checkInDate = document.getElementById('check-in').value;--%>
<%--        const checkOutDate = document.getElementById('check-out').value;--%>

<%--        if (!checkInDate || !checkOutDate) {--%>
<%--            document.getElementById('result').innerText = "Please select both dates.";--%>
<%--            return;--%>
<%--        }--%>

<%--        const checkIn = new Date(checkInDate);--%>
<%--        const checkOut = new Date(checkOutDate);--%>
<%--        const timeDifference = checkOut - checkIn;--%>
<%--        const daysDifference = timeDifference / (1000 * 3600 * 24);--%>

<%--        if (daysDifference >= 0) {--%>
<%--            document.getElementById('result').innerText = `Night:` + daysDifference;--%>
<%--        } else {--%>
<%--            document.getElementById('result').innerText = "Check-out date must be after check-in date.";--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>