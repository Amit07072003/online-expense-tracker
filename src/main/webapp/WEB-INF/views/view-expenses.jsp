<%@ include file="header.jsp" %>
<link rel="stylesheet" href="/css/login.css">

<!DOCTYPE html>
<html>
<head>
    <title>Your Expenses</title>
    <style>
        body {
            background-color: #ccd;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .expense-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
        }

        .expense-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .expense-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .expense-header h3 {
            margin: 0;
            font-size: 20px;
            color: #333;
        }

        .expense-category {
            background-color: #17a2b8;
            color: #fff;
            padding: 5px 10px;
            border-radius: 8px;
            font-size: 14px;
        }

        .expense-details {
            margin-top: 10px;
        }

        .expense-details p {
            margin: 5px 0;
            color: #444;
        }

        .expense-actions {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 8px 16px;
            font-size: 14px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            text-decoration: none;
            color: #fff;
            transition: background-color 0.3s ease;
        }

        .edit-btn {
            background-color: #28a745;
        }

        .edit-btn:hover {
            background-color: #218838;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        @media (max-width: 600px) {
            .expense-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Your Expenses</h2>
        <div class="expense-container">
            <c:forEach var="expense" items="${expenses}">
                <div class="expense-card">
                    <div class="expense-header">
                        <h3>${expense.title}</h3>
                        <span class="expense-category">${expense.category}</span>
                    </div>
                    <div class="expense-details">
                        <p><strong>Amount:</strong> ${expense.amount}</p>
                        <p><strong>Date:</strong> ${expense.date}</p>
                    </div>
                    <div class="expense-actions">
                        <a href="edit-expense?id=${expense.id}" class="btn edit-btn">Edit</a>
                        <a href="delete-expense?id=${expense.id}" class="btn delete-btn" onclick="return confirm('Are you sure?')">Delete</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
