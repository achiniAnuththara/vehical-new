<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Reservation</title>
    <meta charset="UTF-8">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('images/vehicles.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 40px;
            overflow-y: auto;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 28px;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #333;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            background-color: #fff;
            color: #333;
        }

        input[type="submit"] {
            margin-top: 25px;
            padding: 12px;
            background-color: #4a69bd;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #3b55a3;
        }

        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 2px;
            display: none;
        }

        .invalid {
            border-color: red;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            text-decoration: none;
            color: #9e48dc;
            font-weight: bold;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-container">
    <form action="UpdateReservationServlet" method="post" onsubmit="return validateForm();">
        <h2>Update Reservation</h2>

        <label>Reservation Id:</label>
        <input type="text" name="reservation_id" value="${reservation.reservationId}" readonly />

        <label>Customer Name:</label>
        <input type="text" id="customerName" name="customerName" value="${reservation.customerName}" required />
        <div class="error-message" id="customerNameError">Only letters and spaces are allowed.</div>

        <label>Vehicle Number:</label>
        <input type="text" id="vehicleNumber" name="vehicleNumber" value="${reservation.vehicleNumber}" required />
        <div class="error-message" id="vehicleNumberError">Only capital letters and numbers are allowed.</div>

        <label>Service Type:</label>
        <select id="serviceType" name="serviceType" required>
            <option value="">-- Select Service Type --</option>
            <option value="fuel" ${reservation.serviceType == 'fuel' ? 'selected' : ''}>Fuel</option>
            <option value="service" ${reservation.serviceType == 'service' ? 'selected' : ''}>Service</option>
        </select>

        <label>Date:</label>
        <input type="date" id="date" name="date" value="${reservation.date}" required />
        <div class="error-message" id="dateError">Date must be today or later.</div>

        <label>Time:</label>
        <input type="time" id="time" name="time" value="${reservation.time}" required />
        <div class="error-message" id="timeError">Time must be between 09:00 and 21:00.</div>

        <input type="submit" value="Update Reservation" />

        <div class="back-link">
            <a href="GetAllReservationsServlet">← Back to Reservation List</a>
        </div>
    </form>
</div>

<script>
    function showError(input, message) {
        const errorEl = document.getElementById(input.id + "Error");
        if (errorEl) {
            errorEl.textContent = message;
            errorEl.style.display = "block";
        }
        input.classList.add("invalid");
    }

    function clearError(input) {
        const errorEl = document.getElementById(input.id + "Error");
        if (errorEl) {
            errorEl.style.display = "none";
        }
        input.classList.remove("invalid");
    }

    function validateForm() {
        let isValid = true;

        const name = document.getElementById("customerName");
        const vehicle = document.getElementById("vehicleNumber");
        const date = document.getElementById("date");
        const time = document.getElementById("time");

        const nameRegex = /^[A-Za-z\s]+$/;
        const vehicleRegex = /^[A-Z0-9]+$/;

        if (!nameRegex.test(name.value.trim())) {
            showError(name, "Customer name must contain only letters and spaces.");
            isValid = false;
        } else {
            clearError(name);
        }

        if (!vehicleRegex.test(vehicle.value.trim())) {
            showError(vehicle, "Vehicle number must be uppercase letters and numbers only.");
            isValid = false;
        } else {
            clearError(vehicle);
        }

        const today = new Date().toISOString().split('T')[0];
        if (!date.value || date.value < today) {
            showError(date, "Date must be today or later.");
            isValid = false;
        } else {
            clearError(date);
        }

        if (!time.value || time.value < "09:00" || time.value > "21:00") {
            showError(time, "Time must be between 09:00 and 21:00.");
            isValid = false;
        } else {
            clearError(time);
        }

        return isValid;
    }
</script>

</body>
</html>
