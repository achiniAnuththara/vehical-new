<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Service Table</title>
    <link rel="icon" href="imgs/admin1.jpg">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            font-family: "Segoe UI", sans-serif;
        }

        body {
            background-image: url('imgs/home1.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            flex-direction: column;
        }

        nav {
            padding: 20px 100px 10px 100px;
            background-color: rgba(255, 255, 255, 0.9);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        nav img.img1 {
            width: 300px;
            height: 65px;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            font-weight: bold;
            font-size: 20px;
        }

        nav li {
            cursor: pointer;
        }

        nav li:hover {
            color: #ec1d23;
        }

        .but1 {
            padding: 12px 24px;
            background-color: #ec1d23;
            border: none;
            font-size: 16px;
            border-radius: 6px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .but1:hover {
            background-color: black;
        }

        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .table-container {
            width: 90%;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 32px;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #ec1d23;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .btn-update {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-update:hover {
            background-color: #218838;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        form {
            display: inline;
        }

        .footer {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px;
            text-align: center;
            width: 100%;
        }
    </style>
</head>
<body>

<nav>
    <img src="imgs/home7.png" alt="logo" class="img1">
    <ul>
        <li>HOME |</li>
        <li>ABOUT US |</li>
        <li>SERVICES |</li>
        <li>CONTACT US </li>
    </ul>
    <a href="services.html"><button class="but1">BOOK NOW ></button></a>
</nav>

<div class="main-content">
    <div class="table-container">
        <h2>Service Records</h2>
        <table>
            <tr>
                <th>Service ID</th>
                <th>Service Type</th>
                <th>Description</th>
                <th>Date</th>
                <th>Cost</th>
                <th>Center</th>
                <th>Actions</th>
            </tr>

            <c:forEach var="service" items="${allservice}">
                <tr>
                    <td>${service.service_id}</td>
                    <td>${service.service_type}</td>
                    <td>${service.service_description}</td>
                    <td>${service.service_date}</td>
                    <td>${service.service_cost}</td>
                    <td>${service.service_center}</td>
                    <td>
                        <div class="action-buttons">
                            <a href="Updateservice.jsp?service_id=${service.service_id}&service_type=${service.service_type}&service_description=${service.service_description}&service_date=${service.service_date}&service_cost=${service.service_cost}&service_center=${service.service_center}">
                                <button type="button" class="btn-update">Update</button>
                            </a>
                            <form action="DeleteServlet1" method="post">
                                <input type="hidden" name="service_id" value="${service.service_id}" />
                                <button type="submit" class="btn-delete" onclick="return confirm('Are you sure you want to delete this entry?');">Delete</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<div class="footer">
    <p>&copy; 2024 Vehicle Management System. All rights reserved.</p>
</div>

</body>
</html>
