<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/10
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<html>
<head>
    <title>Title</title>

</head>
<body>
<table border="1">
    <tr>
        <th>编号</th><th>问卷名</th><th>统计</th><th>编辑</th>
    </tr>
    <c:forEach items="${questionnaire_list}" var="questionnaire">
        <tr>
            <td>${questionnaire.id}</td>
            <td>${questionnaire.title}</td>
            <td><a href="<%=basePath%>/sta?id=${questionnaire.id}" >统计</a></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
