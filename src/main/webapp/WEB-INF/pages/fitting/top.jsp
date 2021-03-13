<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2020/12/26
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>头部</title>
</head>
<body>
    <div class="top">
        <h1>教&nbsp;材&nbsp;管&nbsp;理&nbsp;系&nbsp;统</h1>
        <h4>亲爱的
            <span style="color: red;"><em>${user[0].username}</em></span>&nbsp;
            <c:if test="${!empty user[0].username}">
                <a href="logout" style="color: dodgerblue">注销</a>
            </c:if>
            <br />欢迎来到教材管理系统</h4>
    </div>
    <div style="height: 60px;"></div>
</body>
</html>
