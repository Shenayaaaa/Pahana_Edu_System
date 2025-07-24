<%--
  Created by IntelliJ IDEA.
  User: shena
  Date: 7/24/2025
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home | Your System Name</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f4f4;
        }
        header {
            background-color: #222;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }
        nav {
            background-color: #333;
            text-align: center;
            padding: 10px;
        }
        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }
        nav a:hover {
            text-decoration: underline;
        }
        section {
            padding: 40px;
            text-align: center;
        }
        footer {
            background-color: #222;
            color: #ccc;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome to Your System</h1>
    <p>Your trusted platform for [insert purpose, e.g., Gym Management, Hospital Portal, etc.]</p>
</header>

<nav>
    <a href="login.jsp">Login</a>
    <a href="register.jsp">Register</a>
    <a href="about.jsp">About</a>
    <a href="contact.jsp">Contact</a>
</nav>

<section>
    <h2>Explore Our Services</h2>
    <p>This is the homepage where you can navigate to different modules such as login, registration, services, or contact.</p>
</section>

<footer>
    &copy; 2025 Your System Name. All rights reserved.
</footer>

</body>
</html>
