<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    body {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        min-height: 100vh;
        padding: 20px;
    }

    .container {
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        max-width: 1000px;
        margin: auto;
        box-shadow: 0 5px 20px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 10px;
        color: #333;
    }

    h3 {
        margin: 15px 0;
        color: #444;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    th, td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background: #2a5298;
        color: white;
    }

    tr:hover {
        background: #f5f5f5;
    }

    a {
        text-decoration: none;
        color: #2a5298;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }

    .actions a {
        margin: 0 5px;
    }

    .logout {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: red;
        font-weight: bold;
    }

    /* Responsive Table */
    @media (max-width: 768px) {
        table, thead, tbody, th, td, tr {
            display: block;
        }

        thead {
            display: none;
        }

        tr {
            margin-bottom: 15px;
            background: #fafafa;
            padding: 10px;
            border-radius: 8px;
        }

        td {
            text-align: left;
            padding: 8px;
            position: relative;
        }

        td::before {
            content: attr(data-label);
            font-weight: bold;
            display: block;
            color: #555;
        }
    }
</style>

</head>

<body>

<div class="container">

    <h2>Admin Dashboard</h2>
    <h3>All User Feedbacks</h3>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>User Name</th>
                <th>Feedback</th>
                <th>Rating</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="f" items="${list}">
                <tr>
                    <td data-label="ID">${f.feedbackId}</td>
                    <td data-label="User Name">${f.user.name}</td>
                    <td data-label="Feedback">${f.feedbackText}</td>
                    <td data-label="Rating">${f.rating}</td>
                    <td data-label="Date">${f.createdAt}</td>

                    <td data-label="Action" class="actions">
                        <a href="/feedback/edit/${f.feedbackId}">Edit</a> |
                        <a href="/feedback/delete/${f.feedbackId}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a class="logout" href="/admin/logout">Logout</a>

</div>

</body>
</html>