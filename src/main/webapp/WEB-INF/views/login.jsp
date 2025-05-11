<%@ include file="header.jsp" %>
<link rel="stylesheet" href="/css/login.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>



    <div class="container">
        <div class="row align-items-center vh-100">
            <div class="col-md-6 mx-auto">
                <div class="card-sh text-center">

                    <!-- Optional Logo -->
                    <img src="${pageContext.request.contextPath}/img/logo.png" class="mb-3" style="max-height: 60px;" alt="Expense Tracker Logo">

                    <h3 class="mb-3">Login</h3>

                    <!-- Flash Message for Errors -->
                    <c:if test="${not empty msg}">
                        <div class="alert alert-danger">${msg}</div>
                        <c:remove var="msg"/>
                    </c:if>

                    <!-- Login Form -->
                    <form action="login" method="post">
                        <div class="mb-3">
                            <input type="email" name="email" placeholder="Email" class="form-control" required aria-label="Email">
                        </div>

                        <div class="mb-3">
                            <input type="password" name="password" placeholder="Password" class="form-control" required aria-label="Password">
                        </div>

                        <button class="btn btn-info w-100">
                            <i class="fas fa-sign-in-alt me-2"></i> Login
                        </button>
                    </form>

                    <!-- Create Account Link -->
                    <p class="text-center mt-3">
                        Don't have an account?
                        <a href="register" class="text-decoration-none fw-bold">Create one</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
