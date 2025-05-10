<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Fuel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .form-container {
            background-color: #ffffff;
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus {
            border-color: #007bff;
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
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
        <form action="UpdateServlet" method="post">
            <input type="hidden" name="fuel_id" value="<%= fuel_id %>" readonly>

            <label for="fuelType">Fuel Type:</label>
            <input type="text" id="fuelType" name="fuel_type" value="<%= fuel_type %>" required>

            <label for="quantity">Quantity (Liters):</label>
            <input type="number" id="quantity" name="quantity_liters" value="<%= quantity %>" required>

            <label for="price">Price per Liter:</label>
            <input type="number" id="price" name="price_per_liter" value="<%= price %>" required>

            <label for="supplier">Supplier Name:</label>
            <input type="text" id="supplier" name="supplier_name" value="<%= supplier_name %>" required>

            <label for="addedDate">Added Date:</label>
            <input type="date" id="addedDate" name="added_date" value="<%= added_date %>" required>

            <button type="submit">Update Fuel</button>
        </form>
    </div>
</body>
</html>
