<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<form action="UpdateServlet" method="post">
	 <label for="fuelId">Fuel ID:</label>
    <input type="hidden" id="fuelType" name="fuel_id" value="<%=fuel_id %>" readonly>
	
    <label for="fuelType">Fuel Type:</label>
    <input type="text" id="fuelType" name="fuel_type" value="<%=fuel_type%>" required>

    <label for="quantity">Quantity (Liters):</label>
    <input type="number" id="quantity" name="quantity_liters" value="<%=quantity %>" required>

    <label for="price">Price per Liter:</label>
    <input type="number" id="price" name="price_per_liter" value="<%=price%>" required>

    <label for="supplier">Supplier Name:</label>
    <input type="text" id="supplier" name="supplier_name" value="<%=supplier_name %>" required>

    <label for="addedDate">Added Date:</label>
    <input type="date" id="addedDate" name="added_date" value="<%=added_date %>" required>

    <button type="submit">Update Fuel</button>
</form>
</body>
</html>