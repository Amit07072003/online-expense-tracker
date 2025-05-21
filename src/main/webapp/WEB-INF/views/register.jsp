<%@ include file="header.jsp" %>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/logins/login-4/assets/css/login-4.css">
<link rel="stylesheet" href="/css/login.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<style>
  body {
    background-color: #ccd !important;
  }
</style>

<!-- Login 4 - Bootstrap Brain Component -->
<section class="p-3 p-md-4 p-xl-5">
  <div class="container">
    <div class="card border-light-subtle shadow-sm">
      <div class="row g-0">
        <div class="col-12 col-md-6">
          <img class="img-fluid rounded-start w-100 h-100 object-fit-cover" loading="lazy" src="https://freepngimg.com/thumb/money/70851-currency-money-payment-bag-free-transparent-image-hq.png">
        </div>
        <div class="col-12 col-md-6">
          <div class="card-body p-3 p-md-4 p-xl-5">
            <div class="row">
              <div class="col-12">
                <div class="mb-5">
                  <h3>Register</h3>
                </div>
              </div>
            </div>
            <form action="register" method="post" onsubmit="return validateForm();">
              <div class="row gy-3 gy-md-4 overflow-hidden">
                <div class="col-12">

                  <div class="mb-3">
                    <input type="text" name="name" placeholder="Full Name" class="form-control" required>
                  </div>

                  <div class="mb-3">
                    <input type="email" name="email" placeholder="Email" class="form-control" required>
                  </div>

                  <div class="mb-3">
                    <input type="password" id="password" name="password" placeholder="Password" class="form-control" required>
                  </div>

                  <div class="mb-3">
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" class="form-control" required>
                  </div>

                  <div class="mb-3">
                    <span id="errorMsg" class="text-danger"></span>
                  </div>

                  <div class="mb-3">
                    <input type="number" name="monthlyIncome" placeholder="Monthly Income" class="form-control" min="0" required>
                  </div>

                </div>
                <div class="col-12">
                  <div class="d-grid">
                    <button class="btn bsb-btn-xl btn-primary" type="submit">Register</button>
                  </div>
                </div>
              </div>
            </form>

            <div class="row">
              <div class="col-12">
                <hr class="mt-5 mb-4 border-secondary-subtle">
                <div class="d-flex gap-2 gap-md-4 flex-column flex-md-row justify-content-md-end">
                  <a href="login" class="link-secondary text-decoration-none">Already have an account?</a>
                </div>
              </div>
            </div>

            <!-- Social Buttons Section (Optional) -->
            <!--
            <div class="row">
              <div class="col-12">
                <div class="d-flex gap-3 flex-column flex-xl-row">
                  <a href="#!" class="btn bsb-btn-xl btn-outline-primary">Google</a>
                  <a href="#!" class="btn bsb-btn-xl btn-outline-primary">Facebook</a>
                  <a href="#!" class="btn bsb-btn-xl btn-outline-primary">Twitter</a>
                </div>
              </div>
            </div>
            -->

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Password Validation Script -->
<script>
  function validateForm() {
    var pass = document.getElementById("password").value;
    var confirmPass = document.getElementById("confirmPassword").value;
    var errorMsg = document.getElementById("errorMsg");

    if (pass !== confirmPass) {
      errorMsg.textContent = "Passwords do not match!";
      return false;
    }

    errorMsg.textContent = "";
    return true;
  }
</script>
