<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation List</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('images/station.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            overflow-y: auto;
            padding: 30px 20px;
        }

        .container {
            max-width: 1100px;
            margin: auto;
            background-color: rgba(0, 0, 0, 0.85);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: left;
            color: white;
            font-size: 28px;
            margin-bottom: 20px;
        }

        #searchInput {
            display: block;
            margin: 0 0 20px 0;
            padding: 10px;
            width: 300px;
            border-radius: 5px;
            border: 1px solid #aaa;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 6px;
            overflow: hidden;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #6A0DAD;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #eee;
        }

        .btn {
            padding: 8px 14px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            color: white;
            font-weight: bold;
            font-size: 13px;
        }

        .btn-update {
            background-color: #007bff;
            margin-right: 5px;
        }

        .btn-update:hover {
            background-color: #0056b3;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
            background-color: #b42a36;
        }

        .message {
            text-align: center;
            font-size: 16px;
            color: #ccc;
            margin-bottom: 10px;
        }

        .back-link {
            text-align: center;
            margin-top: 30px;
        }

        .back-link a {
            color: #9e48dc;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Reservation List</h2>
    
    <c:if test="${not empty message}">
  <div class="message-box" style="text-align: center; margin: 10px 0;">
    <span style="background-color: #28a745; color: white; padding: 10px 20px; border-radius: 8px; font-weight: bold; display: inline-block;">
        ${message}
    </span>
</div>
  
</c:if>
    

    <input type="text" id="searchInput" placeholder="Search..." onkeyup="filterTable()" />

    <c:if test="${empty reservationsList}">
        <p class="message">No reservations found.</p>
    </c:if>

    <c:if test="${not empty reservationsList}">
        <p class="message">Total Reservations: ${fn:length(reservationsList)}</p>
        <table>
            <tr>
                <th>Reservation ID</th>
                <th>Customer Name</th>
                <th>Vehicle Number</th>
                <th>Service Type</th>
                <th>Date</th>
                <th>Time</th>
                <th>Action</th>
            </tr>
            <c:forEach var="res" items="${reservationsList}">
                <tr>
                    <td>${res.reservationId}</td>
                    <td>${res.customerName}</td>
                    <td>${res.vehicleNumber}</td>
                    <td>${res.serviceType}</td>
                    <td>${res.date}</td>
                    <td>${res.time}</td>
                    <td>
                        <form action="UpdateReservationServlet" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="${res.reservationId}" />
                            <button type="submit" class="btn btn-update">Update</button>
                        </form>
                        <form action="ReservationDeleteServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to cancel your reservation?');">
                            <input type="hidden" name="id" value="${res.reservationId}" />
                            <button type="submit" class="btn btn-delete">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <div class="back-link">
        <a href="index.jsp">← Back to Home</a>
    </div>
</div>

<script>
    function filterTable() {
        var input, filter, table, tr, td, i, j, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.querySelector("table");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td");
            let match = false;
            for (j = 0; j < td.length; j++) {
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        match = true;
                        break;
                    }
                }
            }
            tr[i].style.display = match ? "" : "none";
        }
    }
    
    
    window.onload = function () {
        const msg = document.querySelector('.message-box');
        if (msg) {
            setTimeout(() => {
                msg.style.display = 'none';
            }, 3000);
        }
    };
</script>

</body>
</html>
