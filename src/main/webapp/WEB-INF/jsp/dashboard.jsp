<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    body {
        min-height: 100vh;
        background: linear-gradient(135deg, #43cea2, #185a9d);
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }

    .container {
        background: white;
        padding: 30px;
        border-radius: 10px;
        width: 100%;
        max-width: 500px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 15px;
        color: #333;
    }

    h3 {
        margin-top: 20px;
        margin-bottom: 10px;
        color: #444;
    }

    .link {
        display: block;
        text-align: center;
        margin: 10px 0;
        color: #185a9d;
        text-decoration: none;
        font-weight: bold;
    }

    .link:hover {
        text-decoration: underline;
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
        border-color: #43cea2;
        outline: none;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #43cea2;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #2bbf8a;
    }

    .userid {
        font-size: 12px;
        color: #777;
        text-align: center;
        margin-bottom: 10px;
    }

    /* Responsive */
    @media (max-width: 500px) {
        .container {
            padding: 20px;
        }
    }
</style>

</head>

<body>

<div class="container">

    <h2>Welcome ${user.name}</h2>

    <p class="userid">User ID: ${user.userId}</p>

    <a class="link" href="/feedback/view/${user.userId}">My Feedback</a>

    <h3>Add Feedback</h3>

    <form action="/feedback/add" method="post">
        
        <!-- Hidden field -->
        <input type="hidden" name="user.userId" value="${user.userId}" />

        <input type="text" name="feedbackText" placeholder="Enter your feedback" required>
        <input type="number" name="rating" placeholder="Rating (1-5)" min="1" max="5" required>

        <button type="submit">Submit</button>
    </form>

</div>

</body>
</html>