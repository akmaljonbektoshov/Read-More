<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Verify Your Email</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container d-flex justify-content-center align-items-center vh-100">
  <div class="card shadow p-4" style="width: 400px;">
    <h3 class="text-center mb-3">Verify Your Email</h3>
    <p class="text-center">Enter the 4-digit code sent to your email.</p>
    <%--        <p class="text-center">Enter the 4-digit code sent to your email.</p>--%>

    <form action="/verify" method="post">
      <div class="mb-3">
        <label for="code" class="form-label">Verification Code</label>
        <input type="text" id="code" name="code" class="form-control" required maxlength="4">
      </div>
      <button type="submit" class="btn btn-primary w-100">Verify</button>
    </form>

    <p class="text-center mt-3">
      Didn’t receive the code?
      <a href="${pageContext.request.contextPath}/resendCode">Resend</a>
    </p>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>