<%@ include file="header.jsp" %>
<link rel="stylesheet" href="/css/login.css">
<html>
    <head>
        <title>Your Expenses</title>
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
