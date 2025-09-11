<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Register — Library System</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body { background-color: #f8f9fa; }
    .card { max-width: 540px; margin: 3.5rem auto; }
    .password-toggle { cursor: pointer; user-select: none; }
  </style>
</head>
<body>
<div class="container">
  <div class="card shadow-sm">
    <div class="card-body p-4">
      <h4 class="card-title mb-3">Create an Account</h4>

      <!-- Server error message -->
      <c:if test="${not empty errorMsg}">
        <div class="alert alert-danger" role="alert">${errorMsg}</div>
      </c:if>

      <form id="registerForm" action="/register" method="post" novalidate>
        <!-- Add CSRF token here if using Spring Security -->
        <!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> -->

        <div class="mb-3">
          <label for="fullName" class="form-label">Full Name</label>
          <input
                  type="text"
                  class="form-control"
                  id="fullName"
                  name="fullName"
                  placeholder="John Doe"
                  required
                  value="${form.fullName != null ? form.fullName : ''}">
          <div class="invalid-feedback">Please enter your full name.</div>
        </div>

        <div class="mb-3">
          <label for="email" class="form-label">Email address</label>
          <input
                  type="email"
                  class="form-control"
                  id="email"
                  name="email"
                  placeholder="name@example.com"
                  required
                  value="${form.email != null ? form.email : ''}">
          <div class="invalid-feedback">Please enter a valid email address.</div>
        </div>

        <div class="row g-3">
          <div class="col-md-6">
            <label for="password" class="form-label">Password</label>
            <div class="input-group">
              <input
                      type="password"
                      class="form-control"
                      id="password"
                      name="password"
                      minlength="6"
                      placeholder="At least 6 characters"
                      required>
              <span class="input-group-text password-toggle" id="togglePwd">👁</span>
              <div class="invalid-feedback">Password is required (min 6 characters).</div>
            </div>
          </div>

          <div class="col-md-6">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input
                    type="password"
                    class="form-control"
                    id="confirmPassword"
                    name="confirmPassword"
                    minlength="6"
                    placeholder="Repeat your password"
                    required>
            <div class="invalid-feedback" id="confirmFeedback">Passwords must match.</div>
          </div>
        </div>

        <!-- Hidden role field (default USER) -->
        <input type="hidden" name="role" value="USER">

        <div class="form-check my-3">
          <input class="form-check-input" type="checkbox" value="true" id="terms" required>
          <label class="form-check-label" for="terms">
            I agree to the terms and conditions
          </label>
          <div class="invalid-feedback">You must accept the terms.</div>
        </div>

        <div class="d-grid">
          <button id="btnSubmit" class="btn btn-primary" type="submit">Register</button>
        </div>

        <div class="text-center mt-3">
          <small>Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a></small>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Bootstrap JS + validation script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // Toggle password visibility
  (function () {
    const pwd = document.getElementById('password');
    const toggle = document.getElementById('togglePwd');
    toggle.addEventListener('click', () => {
      pwd.type = pwd.type === 'password' ? 'text' : 'password';
    });
  })();

  // Client-side validation + password match check
  (function () {
    const form = document.getElementById('registerForm');
    const password = document.getElementById('password');
    const confirm = document.getElementById('confirmPassword');
    const confirmFeedback = document.getElementById('confirmFeedback');

    function passwordsMatch() {
      return password.value && confirm.value && password.value === confirm.value;
    }

    form.addEventListener('submit', function (e) {
      confirm.setCustomValidity('');
      if (!passwordsMatch()) {
        confirm.setCustomValidity('Passwords do not match');
        confirmFeedback.textContent = 'Passwords do not match.';
      } else {
        confirm.setCustomValidity('');
      }

      if (!form.checkValidity()) {
        e.preventDefault();
        e.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);

    confirm.addEventListener('input', function () {
      if (!passwordsMatch()) {
        confirm.setCustomValidity('Passwords do not match');
      } else {
        confirm.setCustomValidity('');
      }
    });
  })();
</script>
</body>
</html>