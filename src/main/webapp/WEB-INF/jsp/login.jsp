<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    body {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #667eea, #764ba2);
    }

    .container {
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        width: 100%;
        max-width: 400px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    input {
        width: 100%;
        padding: 10px;
        margin: 8px 0 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        transition: 0.3s;
    }

    input:focus {
        border-color: #667eea;
        outline: none;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #667eea;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #5a67d8;
    }

    .message {
        text-align: center;
        margin-top: 10px;
        font-size: 14px;
    }

    .error {
        color: red;
    }

    .success {
        color: green;
    }

    a {
        display: block;
        text-align: center;
        margin-top: 15px;
        text-decoration: none;
        color: #667eea;
    }

    a:hover {
        text-decoration: underline;
    }

    /* Responsive */
    @media (max-width: 500px) {
        .container {
            margin: 20px;
            padding: 20px;
        }
    }
</style>

</head>

<body>

<div class="container">
    <h2>Login</h2>

    <form action="/login" method="post">
        <input type="text" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <button type="submit">Login</button>
    </form>

    <p class="message error">${error}</p>
    <p class="message success">${msg}</p>

    <a href="/register">New User? Register Here</a>
</div>

</body>
</html>