<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fuel Table</title>
    <link rel="stylesheet" type="text/css" href="DisplayFuel.css">
    
</head>
<body>
    <header>
        <h1>Fuel Station Management</h1>
    </header>

    <h2>Fuel Table</h2>
    <table>
        <tr>
            <th>Fuel ID</th>
            <th>Fuel Type</th>
            <th>Quantity (Liters)</th>
            <th>Price per Liter</th>
            <th>Total Price</th>
            <th>Supplier Name</th>
            <th>Added Date</th>
            <th>Action</th>
        </tr>

        <c:forEach var="fuel" items="${allfuel}">
            <tr>
                <td>${fuel.fuel_id}</td>
                <td>${fuel.fuel_type}</td>
                <td>${fuel.quantity_liters}</td>
                <td>${fuel.price_per_liter}</td>
                <td>${fuel.total_price}</td>
                <td>${fuel.supplier_name}</td>
                <td>${fuel.added_date}</td>
                <td>
                    <a href="Update.jsp?fuel_id=${fuel.fuel_id}&fuel_type=${fuel.fuel_type}&quantity_liters=${fuel.quantity_liters}&price_per_liter=${fuel.price_per_liter}&total_price=${fuel.total_price}&supplier_name=${fuel.supplier_name}&added_date=${fuel.added_date}">
                        <button type="button">Update</button>
                    </a>
                    <form action="DeleteServlet" method="post" style="display:inline;">
                        <input type="hidden" name="fuel_id" value="${fuel.fuel_id}" />
                        <button type="submit" onclick="return confirm('Are you sure you want to delete this fuel entry?');">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <footer>
        <p>&copy; 2025 Fuel Station and Vehicle Service System</p>
    </footer>
</body>
</html>
