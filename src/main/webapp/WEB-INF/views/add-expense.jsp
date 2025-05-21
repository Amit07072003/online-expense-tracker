<%@ include file="header.jsp" %>
<link rel="stylesheet" href="/css/login.css">

<style>
    body {
        background-color: #ccd;
    }

    .form-container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
    }

    .card-sh {
        background: #ffffff;
        padding: 30px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .form-title {
        text-align: center;
        font-size: 28px;
        font-weight: bold;
        color: #333;
        margin-bottom: 30px;
    }

    .expense-form .form-group {
        margin-bottom: 20px;
    }

    .expense-form label {
        display: block;
        font-weight: 500;
        color: #333;
        margin-bottom: 8px;
    }

    .expense-form input {
        width: 100%;
        padding: 10px 15px;
        border: 1px solid #ccc;
        border-radius: 10px;
        font-size: 16px;
        transition: border-color 0.3s;
    }

    .expense-form input:focus {
        border-color: #17a2b8;
        outline: none;
    }

    .form-actions {
        text-align: center;
        margin-top: 30px;
    }

    .form-actions .btn {
        padding: 10px 30px;
        font-size: 16px;
        background-color: #17a2b8;
        color: #fff;
        border: none;
        border-radius: 10px;
        transition: background-color 0.3s ease;
    }

    .form-actions .btn:hover {
        background-color: #138496;
    }

    @media (max-width: 600px) {
        .card-sh {
            padding: 20px;
        }

        .form-title {
            font-size: 22px;
        }

        .form-actions .btn {
            width: 100%;
        }
    }
</style>

<div class="container form-container">
    <div class="card-sh">
        <h2 class="form-title">${expense.id != null ? "Edit Expense" : "Add Expense"}</h2>
        <form action="save-expense" method="post" class="expense-form">
            <input type="hidden" name="id" value="${expense.id}" />

            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" id="title" name="title" value="${expense.title}" placeholder="Enter title" required />
            </div>

            <div class="form-group">
                <label for="category">Category</label>
                <input type="text" id="category" name="category" value="${expense.category}" placeholder="Enter category" required />
            </div>

            <div class="form-group">
                <label for="amount">Amount</label>
                <input type="number" step="0.01" id="amount" name="amount" value="${expense.amount}" placeholder="Enter amount" required />
            </div>

            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" id="date" name="date" value="${expense.date}" required />
            </div>

            <div class="form-actions">
                <button type="submit" class="btn">Save Expense</button>
            </div>
        </form>
    </div>
</div>
