<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>HOME</title>
    <link rel="icon" href="imgs/home6.jpeg">
    <link rel="stylesheet" href="home.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
        background-image: url('imgs/home10.jpg');
	    background-position: center;
	    background-repeat: no-repeat;
	    background-size: cover;
	    min-height: 100vh;
        }

        nav {
            padding: 20px 50px;
            background-color: aliceblue;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .img1 {
            width: 300px;
            height: 65px;
        }

        .nav-links {
            display: flex;
            gap: 30px;
            list-style: none;
            font-weight: bold;
            font-size: 20px;
        }

        .nav-links li {
            cursor: pointer;
            padding: 5px;
        }

        .nav-links li:hover {
            color: #ec1d23;
        }

        .but1 {
            background-color: #ec1d23;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 6px;
            display: inline-flex;
            transition: background-color 0.3s ease, transform 0.2s ease;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        .but1:hover {
            background-color: black;
        }

        h1 {
            margin-top: 30px;
            margin-bottom: 10px;
            font-size: 24px;
        }

        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 30px;
        }

        .box {
            border: 3px solid #ccc;
            width: 500px;
            margin: 25px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background-color: #fbf3f3;
            display: flex;
            flex-direction: column;
            align-items: center; /* centers button and content horizontally */
            text-align: center;
        }

        .img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-bottom: 5px solid #0a4271;
        }

        .but {
            background-color: black;
            color: white;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 6px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
        }

        .but:hover {
            color: #ec1d23;
        }
        .footer {
            background-color: black;
            color:white;
            padding: 10px;
            text-align: center;
            position: relative;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

    <div class="header">
        <nav>
            <img src="imgs/home7.png" alt="logo" class="img1">
            <ul class="nav-links">
                <li>HOME |</li>
                <li>ABOUT US |</li>
                <li>SERVICES |</li>
                <li>CONTACT US </li>
            </ul>
            <button class="but1">BOOK NOW ></button>
        </nav>
    </div>

    <div class="products">

        <div class="box">
            <img src="imgs/home1.jpg" alt="img1" class="img">
            <h1>VEHICLE REPAIR</h1>
            <hr style="width: 200px; height: 3px; background-color: #ec1d23; border: none;">
            <p style="margin-top:10px">Our experts are skilled to handle any major mechanical repair. We are armed with the best of tools to get you moving again.</p>
            <button class="but">BOOK NOW</button>
        </div>

        <div class="box">
            <img src="imgs/home2.jpg" alt="img2" class="img">
            <h1>VEHICLE SERVICING</h1>
            <hr style="width: 200px; height: 3px; background-color: #ec1d23; border: none;">
            <p style="margin-top:10px">Ensure your vehicle runs at its best. We offer professional and affordable servicing packages tailored to your needs.</p>
            <button class="but">BOOK NOW</button>
        </div>

        <div class="box">
            <img src="imgs/home4.jpg" alt="img3" class="img">
            <h1>AUTO DEALING</h1>
            <hr style="width: 200px; height: 3px; background-color: #ec1d23; border: none;">
            <p style="margin-top:10px">Find the best deals for buying and selling vehicles. Our trusted network ensures a smooth transaction.</p>
            <button class="but">BOOK NOW</button>
        </div>

        <div class="box">
            <img src="imgs/home5.jpg" alt="img4" class="img">
            <h1>MOBILE FIRST AID</h1>
            <hr style="width: 200px; height: 3px; background-color: #ec1d23; border: none;">
            <p style="margin-top:10px">24/7 roadside assistance with towing and on-site technical support to keep you safe wherever you go.</p>
            <button class="but">BOOK NOW</button>
        </div>

    </div>
    <div class="footer">
    <p>&copy; 2024 Vehicle Management System. All rights reserved.</p>
</div>

</body>
</html>
