<%@ include file="header.jsp" %>
<link rel="stylesheet" href="/css/login.css">

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
                <button type="submit" class="btn btn-info">Save Expense</button>
            </div>
        </form>
    </div>
</div>
