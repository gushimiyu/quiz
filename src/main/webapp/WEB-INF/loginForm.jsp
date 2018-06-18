
<%--
  Created by IntelliJ IDEA.
  User: youyusama
  Date: 2018/6/5
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../jquery-3.3.1.min.js"></script>
    <%
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
    %>

</head>
<body>
<h3>login</h3>
<form  method="post">
    <font color="#b22222">${requestScope.message1}</font>
    <table>
        <tr>
            <tb><label>题目</label></tb>
            <tb><input type="text" id="title" name="title"></tb>
        </tr>
        <tr>
            <tb><label>描述</label></tb>
            <tb><input type="text" id="description" name="description"></tb>
        </tr>
        <tr>
            <td><button formaction="createquestionnaire" type="submit" onclick="javascript:window.location='/createquestionnaire'">登录</button></td>
            <td><button formaction="register" type="submit" onclick="javascript:window.location='/register'">注册</button></td>
        </tr>
    </table>
</form>
</body>

</html>

