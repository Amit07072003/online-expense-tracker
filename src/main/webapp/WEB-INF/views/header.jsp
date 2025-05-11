<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Tracker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
    <div class="custom-navbar">
        <h2>Expense Tracker</h2>

        <!-- Hamburger Icon (will appear on mobile) -->
        <div class="hamburger" onclick="toggleNav()">
            <i class="fas fa-bars"></i>
        </div>

        <!-- Navbar Links -->
        <div class="nav-links" id="navbar-links">
            <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/add-expense">Add Expense</a>
            <a href="${pageContext.request.contextPath}/view-expenses">View Expenses</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
    </div>

    <script>
        // Toggle navigation links visibility
        function toggleNav() {
            const navLinks = document.getElementById('navbar-links');
            navLinks.classList.toggle('active'); // Toggle the visibility of navbar links
        }
    </script>
</body>

</html>
