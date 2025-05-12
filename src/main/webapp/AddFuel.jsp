<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Fuel Entry</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        padding: 20px;
    }
    form {
        display: flex;
        flex-direction: column;
        max-width: 400px;
        margin: 0 auto;
    }
    label {
        margin: 10px 0 5px;
    }
    input[type="text"], input[type="number"], input[type="date"] {
        padding: 8px;
        margin-bottom: 10px;
        width: 100%;
        box-sizing: border-box;
    }
    button {
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }
    button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<h2>Add Fuel Entry</h2>

<form action="InsertFuelServlet" method="post" onsubmit="return validateForm()">
    <label for="fuelType">Fuel Type:</label>
    <input type="text" id="fuelType" name="fuel_type"
           placeholder="Enter Fuel Type (e.g., Petrol 95, E10-Diesel)"
           required
           pattern="^[A-Za-z0-9\s\-]+$"
           title="Can contain letters, numbers, spaces, and hyphens">

    <label for="quantity">Quantity (Liters):</label>
    <input type="number" id="quantity" name="quantity_liters" min="1" required>

    <label for="price">Price per Liter:</label>
    <input type="number" id="price" name="price_per_liter" step="0.01" min="0.01" required>

    <label for="supplier">Supplier Name:</label>
    <input type="text" id="supplier" name="supplier_name"
           placeholder="Enter Supplier Name"
           required
           pattern="^[A-Za-z\s]+$"
           title="Only letters and spaces allowed">

    <label for="addedDate">Added Date:</label>
    <input type="date" id="addedDate" name="added_date" required>

    <button type="submit">Add Fuel</button>
</form>

<script>
function validateForm() {
    const addedDate = document.getElementById("addedDate").value;
    const today = new Date().toISOString().split('T')[0];

    if (addedDate > today) {
        alert("Added Date cannot be in the future.");
        return false;
    }

    return true;
}
</script>


</body>
</html>
