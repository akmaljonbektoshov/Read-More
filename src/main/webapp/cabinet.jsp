<%--
  Created by IntelliJ IDEA.
  User: sultan
  Date: 11/09/25
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Object user = session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("/auth/login.jsp");
        return;
    }
%>

<h1>cabinetjonda test shunchaki</h1>
</body>
</html>
