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
</head>
<body>
    <h3>login</h3>
    <form action="login" method="post">
        <font color="#b22222">${requestScope.message}</font>
        <table>
            <tr>
                <tb><label>acc:</label></tb>
                <tb><input type="text" id="acc" name="acc"></tb>
            </tr>
            <tr>
                <tb><label>passwd:</label></tb>
                <tb><input type="text" id="passwd" name="passwd"></tb>
            </tr>
            <tr>
                <td><input type="submit" value="login"></td>
            </tr>
        </table>
    </form>
</body>
</html>
