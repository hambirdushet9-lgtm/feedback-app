<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback List</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    body {
        background: linear-gradient(135deg, #11998e, #38ef7d);
        min-height: 100vh;
        padding: 20px;
    }

    .container {
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        max-width: 900px;
        margin: auto;
        box-shadow: 0 5px 20px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background: #11998e;
        color: white;
    }

    tr:hover {
        background: #f5f5f5;
    }

    a {
        text-decoration: none;
        color: #11998e;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }

    .actions a {
        margin: 0 5px;
    }

    .back {
        display: block;
        text-align: center;
        margin-top: 20px;
        font-weight: bold;
        color: #333;
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

    <h2>Feedback List</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Feedback</th>
                <th>Rating</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="f" items="${list}">
                <tr>
                    <td data-label="ID">${f.feedbackId}</td>
                    <td data-label="Feedback">${f.feedbackText}</td>
                    <td data-label="Rating">${f.rating}</td>

                    <td data-label="Action" class="actions">
                        <a href="/feedback/edit/${f.feedbackId}">Edit</a> |
                        <a href="/feedback/delete/${f.feedbackId}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a class="back" href="/dashboard">⬅ Back to Dashboard</a>

</div>

</body>
</html>