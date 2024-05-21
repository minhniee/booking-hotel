<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>roomReservations</title>
</head>
<body>
<div class="room-booking">
    <h3>Your Reservation</h3>
    <p>Please check the information of the form. Your registration will be verified
        prior to your arrival.</p>
    <form action="">
        <div class="check-date">
            <div class="date">
                <label for="date-in">Check In:</label>
                <input type="text" class="date-input" id="date-in">
                <i class="icon_calendar"></i>
            </div>
            <div class="date">
                <label for="date-out">Check Out:</label>
                <input type="text" class="date-input" id="date-out">
                <i class="icon_calendar"></i>
            </div>
        </div>
        <div class="check-date">
            <label for="date-out">Room information:</label>
            <input type="text" class="date-input" id="date-out">
            <i id="show" class='bx bx-show' onclick=""></i>
        </div>
        <div class="select-option">
            <label for="guest">Guests:</label>
            <select id="guest">
                <option value="">3 Adults</option>
            </select>
        </div>
        <div class="select-option">
            <label for="room">Room:</label>
            <select id="room">
                <option value="">1 Room</option>
            </select>
        </div>
        <div class="select-option">
            <label for="email">Email:</label>
            <input id="email" type="text" placeholder="Email">
        </div>
        <div class="select-option">
            <label for="phone">Phone number:</label>
            <input id="phone" type="text" placeholder="Phonenumber">
        </div>
        <div class="select-option">
            <label for="payment">Payment Method:</label>
            <select id="payment">
                <option value="">VNPAY</option>
                <option value="">Direct</option>
            </select>
        </div>

        <div>
            <button class="btn" type="submit">Subtmit</button>
            <button class="btn" type="submit">Cancel</button>
        </div>
    </form>
</div>
</div>
</body>
</html>