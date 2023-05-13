<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Tasks for the Day</title>
    <style>
        body {
            background-color: #2a1a5e;
            font-family: 'Montserrat', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
            background-color: #251e3e;
            padding: 20px;
            border-radius: 10px;
        }

        form label {
            display: block;
            margin-bottom: 5px;
            color: #f1d2d8;
            font-size: 18px;
        }

        form input[type="text"] {
            padding: 5px;
            border-radius: 3px;
            border: 1px solid #ccc;
            width: 300px;
            font-size: 16px;
            margin-bottom: 10px;
        }

        form input[type="submit"] {
            padding: 10px 20px;
            background-color: #f1d2d8;
            color: #2a1a5e;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
        }

        ul {
            margin: 0;
            padding: 0;
            list-style-type: none;
            background-color: #251e3e;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.5);
            color: #f1d2d8;
            font-size: 16px;
            text-align: center;
        }

        li {
            margin-bottom: 10px;
        }

        h1 {
            color: #f1d2d8;
            font-size: 36px;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<h1>My Tasks for the Day</h1>
<form method="post" action = "/addTask">
    <label for="text">Task:</label>
    <input type="text" id="text" name="text">
    <input type="submit" value="Add Task">
</form>
<ul class="task-list">
    <c:forEach var="task" items="${tasks}">
        <li>${task.text}</li>
        <form method="post" action="/deleteTask">
            <input type="hidden" name="id" value="${task.id}">
            <button class="delete-button" type="submit">Delete</button>
        </form>
    </c:forEach>
</ul>
</body>
</html>