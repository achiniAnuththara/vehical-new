<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>UPDATE SERVICE</title>
    <link rel="icon" href="imgs/admin1.jpg">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-image: url('imgs/home1.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            font-family: Georgia, serif;
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
            font-family: Garamond;
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

        .container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #form {
            width: 100%;
            max-width: 500px;
            background-color: rgba(0, 0, 0, 0.75);
            color: white;
            padding: 60px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        }

        h1 {
            text-align: center;
            margin-bottom: 24px;
            font-family: Georgia, serif;
            font-size: 28px;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        .input-group label {
            margin-bottom: 8px;
            font-weight: bold;
        }

        input, textarea {
            width: 100%;
            font-size: 1.1em;
            border-radius: 5px;
            padding: 10px;
            border: none;
            background-color: #fbf3f3;
            font-family: 'Orbitron', sans-serif;
        }

        textarea {
            resize: none;
        }

        .footer {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px;
            text-align: center;
            position: relative;
            width: 100%;
            bottom: 0;
        }

        .input-group .error {
            color: rgb(242, 18, 18);
            font-size: 14px;
            margin-top: 4px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .but10 {
            width: 150px;
            height: 45px;
            background-color: #28a745;
            border: none;
            font-size: 16px;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .but10:hover {
            background-color: black;
        }
    </style>
</head>
<body>
    <div class="header">
        <nav>
            <img src="imgs/home7.png" alt="logo" class="img1">
            <ul>
                <li>HOME  |</li>
                <li>ABOUT US  |</li>
                <li>SERVICES  |</li>
                <li>CONTACT US  </li>
            </ul>
            <a href="services.html"><button class="but1">BOOK NOW ></button></a>
        </nav>
    </div>

    <div class="container">
        <form action="UpdateServlet1" method="post" id="form">
            <h1>UPDATE SERVICE</h1>
            <hr style="width: 200px; height: 3px; background-color: #ec1d23; border: none; margin: 0 auto;">
            <br>

            <input type="hidden" name="service_id" value="${param.service_id}">

            <div class="input-group">
                <label>SERVICE TYPE:</label>
                <input type="text" name="service_type" id="sname" value="${param.service_type}">
                <div class="error"></div>
            </div>

            <div class="input-group">
                <label>SERVICE DESCRIPTION:</label>
                <textarea name="service_description" rows="4" required>${param.service_description}</textarea>
                <div class="error"></div>
            </div>

            <div class="input-group">
                <label>SERVICE DATE:</label>
                <input type="date" name="service_date" id="sdate" value="${param.service_date}">
                <div class="error"></div>
            </div>

            <div class="input-group">
                <label>SERVICE COST:</label>
                <input type="number" name="service_cost" id="price" value="${param.service_cost}" step="0.01">
                <div class="error"></div>
            </div>

            <div class="input-group">
                <label>SERVICE CENTER:</label>
                <input type="text" name="service_center" value="${param.service_center}">
                <div class="error"></div>
            </div>

            <div class="button-group">
                <input type="submit" value="Update" class="but10">
            </div>
        </form>
    </div>

    <div class="footer">
        <p>&copy; 2024 Vehicle Management System. All rights reserved.</p>
    </div>

    <!-- JavaScript validation -->
    <script>
        const form = document.querySelector('#form');
        const sname = document.querySelector('#sname');
        const price = document.querySelector('#price');
        const sdate = document.querySelector('#sdate');

        form.addEventListener('submit', (e) => {
            e.preventDefault();
            ValidateInputs();
        });

        function ValidateInputs() {
            const servicename = sname.value.trim();
            const sprice = price.value.trim();
            const servicedate = sdate.value.trim();

            let valid = true;

            if (servicename === '') {
                setError(sname, 'Service name is required');
                valid = false;
            } else {
                setSuccess(sname);
            }

            if (sprice === '') {
                setError(price, 'Price is required');
                valid = false;
            } else {
                setSuccess(price);
            }

            if (servicedate === '') {
                setError(sdate, 'Date is required');
                valid = false;
            } else {
                setSuccess(sdate);
            }

            if (valid) {
                form.submit();
            }
        }

        function setError(element, message) {
            const inputGroup = element.parentElement;
            const errorElement = inputGroup.querySelector('.error');
            errorElement.innerText = message;
            inputGroup.classList.add('error');
            inputGroup.classList.remove('success');
        }

        function setSuccess(element) {
            const inputGroup = element.parentElement;
            const errorElement = inputGroup.querySelector('.error');
            errorElement.innerText = '';
            inputGroup.classList.add('success');
            inputGroup.classList.remove('error');
        }
    </script>
</body>
</html>
