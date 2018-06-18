<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/11
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<html>
<head>
    <title>你妈死了</title>

</head>
<body>
<table border="1">
    <tr>
        <th>编号</th><th>题号</th><th>统计</th><th>编辑</th>
    </tr>
    <c:forEach items="${a_list}" var="a">
    <tr>
        <td>${a.q.numbering}</td>
        <td>${a.q.content}</td>
        <c:forEach items="${a.option}" var="s">
            <td>${s.opt.content}</td>
            <td>${s.n}</td>
            <td>${s.x}</td>
        </c:forEach>
    </tr>
    </c:forEach>
    <table border="2">
    <tr>
        <th>题号</th><th>答题号</th><th>答题内容</th>
    </tr>
    <c:forEach items="${b_list}" var="b">
    <tr>
    <td>${b.file.id}</td>
        <c:forEach items="${b.bibli}" var="c">
            <td>${c.j}</td>
        <td>${c.i.content}</td>
        </c:forEach>

    </tr>

    </c:forEach>
    </table>

</body>
</html>
