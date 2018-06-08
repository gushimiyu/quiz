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
    <script type="text/javascript">
        function wow(){
            var acc=$("#acc").val();
            alert("hey");
            alert("<%=basePath%>");
            $.post("ajaxList.action",{
                acc:acc,
            },function (data) {
                for(i=0;i<data.length;i++) {
                    var str = "<li value=" + data[i].acc + ">" + data[i].acc+"----"+data[i].passwd + "</li>";
                    $("#listStudent").append(str);
                }
            });
        }
    </script>
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
    <span id="nameDiv2" style="color: red; font-size: 15px;"></span>
    <ul  id="listStudent">
        <li>如下</li>
    </ul>

    <button onclick="wow()">baobao</button>
</body>

</html>
