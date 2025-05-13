<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Make a Reservation</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('images/new.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 40px 0;
            overflow-y: auto;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 420px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        label {
            margin-top: 15px;
            font-weight: bold;
            color: #333;
            display: block;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            background-color: #4a69bd;
            color: white;
            border: none;
            margin-top: 25px;
            cursor: pointer;
            font-weight: bold;
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
    </style>
</head>
<body>

<div class="form-container">
    <h2>Reservation Form</h2>
    <form action="InsertReservationServlet" method="post" onsubmit="return validateForm();">
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" required>
        <div class="error-message" id="customerNameError"></div>

        <label for="vehicleNumber">Vehicle Number:</label>
        <input type="text" id="vehicleNumber" name="vehicleNumber" required>
        <div class="error-message" id="vehicleNumberError"></div>

        <label for="serviceType">Service Type:</label>
        <select id="serviceType" name="serviceType" required>
            <option value="">-- Select Service Type --</option>
            <option value="fuel">Fuel</option>
            <option value="service">Service</option>
        </select>

        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required>
        <div class="error-message" id="dateError"></div>

        <label for="time">Time:</label>
        <input type="time" id="time" name="time" required>
        <div class="error-message" id="timeError"></div>

        <input type="submit" value="Submit Reservation">
    </form>
</div>

<script>
    function showError(input, message) {
        const error = document.getElementById(input.id + "Error");
        if (error) {
            error.textContent = message;
            error.style.display = "block";
        }
        input.classList.add("invalid");
    }

    function clearError(input) {
        const error = document.getElementById(input.id + "Error");
        if (error) {
            error.style.display = "none";
            error.textContent = "";
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

        // Name validation
        if (!nameRegex.test(name.value.trim())) {
            showError(name, "Only letters and spaces are allowed.");
            isValid = false;
        } else {
            clearError(name);
        }

        // Vehicle Number validation
        if (!vehicleRegex.test(vehicle.value.trim())) {
            showError(vehicle, "Only capital letters and numbers are allowed.");
            isValid = false;
        } else {
            clearError(vehicle);
        }

        // Date validation
        const today = new Date().toISOString().split('T')[0];
        if (!date.value || date.value < today) {
            showError(date, "Date must be today or later.");
            isValid = false;
        } else {
            clearError(date);
        }

        // Time validation
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