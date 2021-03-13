<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2020/12/26
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>左侧导航条</title>
</head>
<body>
    <div class="conter_left">
        <ul type="none">
            <a href="index" target="_self"><li>首页</li></a>
            <a href="studentAll" target="_self"><li>学生</li></a>
            <a href="teacherAll" target="_self"><li>教师</li></a>
            <a href="classByCName" target="_self"><li>班级</li></a>
            <a href="textbookAll" target="_self"><li>教材</li></a>
            <c:if test="${user[0].utype==0}">
                <a href="tiao" target="_self"><li>发放添加</li></a>
            </c:if>
        </ul>
    </div>
</body>
</html>
