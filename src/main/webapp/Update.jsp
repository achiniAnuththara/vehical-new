<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Fuel</title>
    <link rel="stylesheet" type="text/css" href="Update.css">
    
</head>
<body>
    <%
        String fuel_id = request.getParameter("fuel_id");
        String fuel_type = request.getParameter("fuel_type");
        String quantity = request.getParameter("quantity_liters");
        String price = request.getParameter("price_per_liter");
        String supplier_name = request.getParameter("supplier_name");
        String added_date = request.getParameter("added_date");
    %>

    <div class="form-container">
        <h2>Update Fuel Details</h2>
       <form action="UpdateServlet" method="post" onsubmit="return validateUpdateForm()">
    <input type="hidden" name="fuel_id" value="<%= fuel_id %>" readonly>

    <label for="fuelType">Fuel Type:</label>
    <input type="text" id="fuelType" name="fuel_type"
           value="<%= fuel_type %>" required
           pattern="^[A-Za-z0-9\s\-]+$"
           title="Can contain letters, numbers, spaces, and hyphens">

    <label for="quantity">Quantity (Liters):</label>
    <input type="number" id="quantity" name="quantity_liters"
           value="<%= quantity %>" min="1" required>

    <label for="price">Price per Liter:</label>
    <input type="number" id="price" name="price_per_liter"
           value="<%= price %>" step="0.01" min="0.01" required>

    <label for="supplier">Supplier Name:</label>
    <input type="text" id="supplier" name="supplier_name"
           value="<%= supplier_name %>" required
           pattern="^[A-Za-z\s]+$"
           title="Only letters and spaces allowed">

    <label for="addedDate">Added Date:</label>
    <input type="date" id="addedDate" name="added_date"
           value="<%= added_date %>" required>

    <button type="submit">Update Fuel</button>
</form>

<script>
function validateUpdateForm() {
    const addedDate = document.getElementById("addedDate").value;
    const today = new Date().toISOString().split('T')[0];

    if (addedDate > today) {
        alert("Added Date cannot be in the future.");
        return false;
    }

    return true;
}
</script>

    </div>
</body>
</html>
