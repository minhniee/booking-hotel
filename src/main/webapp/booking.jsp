<%--
  Created by IntelliJ IDEA.
  User: minhl
  Date: 5/16/2024
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>booking page</title>
</head>

<body>
<form action="booking-servlet" method="get">


<label for="check-in">Check-in</label>
<input type="date" name="checkInDate" id="check-in">
<label for="check-out">Check-out</label>
<input type="date" name="checkOutDate" id="check-out" onchange="calculateDays()">
<p>Result: <span id="result"></span></p>
<label for="adult">Adult</label>
<input type="number" id="adult" name="adults" min="0">
<label for="child">Child</label>
<input type="number" id="child" name="childs" min="0">
<input type="submit" value="Booking">
</form>

<script>
    function calculateDays() {
        // Get the input values
        const checkInDate = document.getElementById('check-in').value;
        const checkOutDate = document.getElementById('check-out').value;

        // Check if the dates are valid
        if (!checkInDate || !checkOutDate) {
            document.getElementById('result').innerText = "Please select both dates.";
            return;
        }

        // Convert input values to Date objects
        const checkIn = new Date(checkInDate);
        const checkOut = new Date(checkOutDate);

        // Calculate the difference in time
        const timeDifference = checkOut - checkIn;

        // Convert time difference to days
        const daysDifference = timeDifference / (1000 * 3600 * 24);
        // Display the result
        console.log(daysDifference);
        if (daysDifference >= 0) {
            document.getElementById('result').innerText = `Number of days:`+ (daysDifference);
        } else {
            document.getElementById('result').innerText = "Check-out date must be after check-in date.";
        }
    }
</script>
</body>
</html>

