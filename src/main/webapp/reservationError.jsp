<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Failed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff0f0;
            text-align: center;
            padding-top: 100px;
        }
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 20px;
            display: inline-block;
            border-radius: 8px;
        }
        a {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #0069d9;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="error-message">
        <h1>Reservation Update Failed</h1>
        <p><%= request.getAttribute("errorMsg") != null ? request.getAttribute("errorMsg") : "Something went wrong. Please try again." %></p>
        <%
            Object idObj = request.getAttribute("reservationId");
            if (idObj != null) {
        %>
            <a href="UpdateReservationServlet?id=<%= idObj %>">Try Updating Again</a>
        <%
            } else {
        %>
            <a href="GetAllReservationsServlet">Back to Reservation List</a>
        <%
            }
        %>
    </div>
</body>
</html>
