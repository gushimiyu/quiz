<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: youyusama
  Date: 2018/6/15
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>问卷预览</title>
    <script src="jquery-3.3.1.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="../assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <%
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
    %>
</head>
<body>
<div class="col-md-2 col-sm-2" style="margin-right: 20px;margin-left: 20px;">

    <div class="card"  style="position: fixed ! important; left: 20px; top: 0px;width: 300px">
        <div class="card-action">
            <button class="btn btn-primary" onclick="location.href='<%=basePath%>/quizEditForm'" formaction="#" type="button">&lt;返回编辑</button>
        </div>
    </div>
</div>

<div class="col-md-6 col-sm-6" style="margin:0 auto;">
    <div class="card" >

        <div class="card-action" style="padding-top: 50px;">
            <span class="card-title">&nbsp;&nbsp;&nbsp;&nbsp;问卷1</span>
            <p style="padding-top: 30px">&nbsp;&nbsp;&nbsp;&nbsp;描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述</p>
        </div>


        <div class="card-content" style="padding-bottom: 50px">

            <div id="showplace">

                <c:forEach items="${questionlist}" var="question">
                    <div class="card-content" style="margin-bottom: 10px">
                        <form>
                            <input type="hidden" name="belongsto" id="belongsto" value="1">
                            <input type="hidden" name="id" id="questionid" value="${question.q.id}">
                            <input type="hidden" name="numbering" id="numbering" value="${question.q.numbering}">
                            <c:if test="${question.q.type=='radio'||question.q.type=='checkbox'}">
                                <input type="hidden" name="optnum" id="optnum" value="${question.o.size()}">
                            </c:if>
                            <input type="hidden" name="qtype" id="qtype" value="${question.q.type}">
                            <span class="card-title">${question.q.numbering}. ${question.q.content}</span>
                            <c:choose>
                                <c:when test="${question.q.type=='radio'||question.q.type=='checkbox'}">
                                    <c:forEach items="${question.o}" var="opt">
                                        <p>
                                            <input class="with-gap" type="${question.q.type}" name="opt${question.q.id}" id="opt${opt.id}">
                                            <label for="opt${opt.id}">${opt.content}</label>
                                        </p>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${question.q.type=='star'}">
                                    <p>
                                        非常不满意
                                        <input class="with-gap" type="radio" name="star${question.q.id}" id="star1">
                                        <label for="star1">1分&nbsp;&nbsp;</label>
                                        <input class="with-gap" type="radio" name="star${question.q.id}" id="star2">
                                        <label for="star2">2分&nbsp;&nbsp;</label>
                                        <input class="with-gap" type="radio" name="star${question.q.id}" id="star3">
                                        <label for="star3">3分&nbsp;&nbsp;</label>
                                        <input class="with-gap" type="radio" name="star${question.q.id}" id="star4">
                                        <label for="star4">4分&nbsp;&nbsp;</label>
                                        <input class="with-gap" type="radio" name="star${question.q.id}" id="star5">
                                        <label for="star5">5分&nbsp;&nbsp;</label>
                                        非常满意
                                    </p>
                                </c:when>
                                <c:when test="${question.q.type=='textarea'}">
                                    <textarea type="text" class="materialize-textarea"  placeholder="用户可以在此处答题"></textarea>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" class="form-control"  placeholder="用户可以在此处答题">
                                </c:otherwise>
                            </c:choose>

                        </form>
                    </div>
                </c:forEach>

            </div>


        </div>


    </div>
</div>
</body>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/materialize/js/materialize.min.js"></script>
</html>
