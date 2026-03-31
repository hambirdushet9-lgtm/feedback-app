<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Feedback</title>

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
        background: linear-gradient(135deg, #ff7e5f, #feb47b);
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
        border-color: #ff7e5f;
        outline: none;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #ff7e5f;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #e96b50;
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

    <h2>Edit Feedback</h2>

    <form action="/feedback/update" method="post">

        <input type="hidden" name="feedbackId" value="${feedback.feedbackId}" />

        <input type="text" name="feedbackText" 
               value="${feedback.feedbackText}" 
               placeholder="Edit your feedback" required>

        <input type="number" name="rating" 
               value="${feedback.rating}" 
               placeholder="Rating (1-5)" min="1" max="5" required>

        <!-- Keep user ID -->
        <input type="hidden" name="user.userId" value="${feedback.user.userId}" />

        <button type="submit">Update</button>
    </form>

</div>

</body>
</html>