<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: youyusama
  Date: 2018/6/9
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>问卷编辑</title>
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


    <div class="col-md-4 col-sm-4" style="margin-right: -15px">

        <div class="card"  style="position: fixed ! important; left: 0px; top: 0px;width: 600px;overflow-y: scroll;height: 800px">
            <div class="card-action">
                题目编辑
                <button class="btn btn-primary" onclick="location.href='<%=basePath%>/preview'" type="button" style="float: right">预览问卷&gt;</button>
            </div>
            <div class="card-content" style="margin-top: -20px">
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">reorder</i>单选题</div>
                        <div class="collapsible-body" style="padding-bottom: 50px;padding-right: 10px">


                            <form class="radioform"><!--单选题提交-->
                                <div class="row" id="radioform" style="padding-left:40px;padding-right: 40px">

                                    <input type="hidden" name="qtype" value="radio">
                                    <input type="hidden" name="belongsto" value="1">
                                    <div class="input-field">问题：<input id="content" name="content" type="text" placeholder="在此输入问题描述">
                                    </div>
                                    <input type="number" class="form-control" id="numbering" name="numbering" placeholder="默认添加至最后一题，也可在指定位置插入题目" min="1" step="1">

                                    <input type="hidden" id="optnum" name="optnum" value="1">
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="option0" name="option0" placeholder="请输入选项内容">
                                    </div>
                                    <label for="option0" class="col-sm-2 control-label"><a onclick="" id="delbtn">x</a></label>


                                </div>
                                <button class="btn btn-primary" style="float: right;" id="btn_addquestion" formaction="#" type="button">添加题目</button>
                                <button class="btn btn-primary" style="float: right;margin-right: 5px;" id="addbtn" formaction="#" type="button">添加选项</button>
                                <a onclick="" id="cancela" style="float:right;margin-right:8px;margin-top:6px">重置</a>
                            </form>


                        </div>
                    </li>


                    <li>
                        <div class="collapsible-header"><i class="material-icons">reorder</i>多选题</div>
                        <div class="collapsible-body" style="padding-bottom: 50px;padding-right: 10px">

                            <form class="checkboxform"><!--多选题提交-->
                                <div class="row" id="checkboxform" style="padding-left:40px;padding-right: 40px">

                                    <input type="hidden" name="qtype" value="checkbox">
                                    <input type="hidden" name="belongsto" value="1">
                                    <div class="input-field">问题：<input id="content" name="content" type="text" placeholder="在此输入问题描述">
                                    </div>
                                    <input type="number" class="form-control" id="numbering" name="numbering" placeholder="默认添加至最后一题，也可在指定位置插入题目" min="1" step="1">

                                    <input type="hidden" id="optnum" name="optnum" value="1">
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="option0" name="option0" placeholder="请输入选项内容">
                                    </div>
                                    <label for="option0" class="col-sm-2 control-label"><a onclick="" id="delbtn">x</a></label>


                                </div>
                                <button class="btn btn-primary" style="float: right;" id="btn_addquestion" formaction="#" type="button">添加题目</button>
                                <button class="btn btn-primary" style="float: right;margin-right: 5px;" id="addbtn" formaction="#" type="button">添加选项</button>
                                <a onclick="" id="cancela" style="float:right;margin-right:8px;margin-top:6px">重置</a>
                            </form>

                        </div>
                    </li>

                    <li>
                        <div class="collapsible-header"><i class="material-icons">reorder</i>量表题</div>
                        <div class="collapsible-body" style="padding-bottom: 50px;padding-right: 10px">

                            <form><!--量表题提交-->
                                <div class="row" id="starform" style="padding-left:40px;padding-right: 40px">

                                    <input type="hidden" name="qtype" value="star">
                                    <input type="hidden" name="belongsto" value="1">
                                    <div class="input-field">问题：<input id="content" name="content" type="text" placeholder="在此输入问题描述">
                                    </div>
                                    <input type="number" class="form-control" id="numbering" name="numbering" placeholder="默认添加至最后一题，也可在指定位置插入题目" min="1" step="1">

                                </div>
                                <button class="btn btn-primary" style="float: right;" id="btn_addquestion" formaction="#" type="button">添加题目</button>
                                <a onclick="" id="cancela" style="float:right;margin-right:8px;margin-top:6px">重置</a>
                            </form>

                        </div>
                    </li>


                    <li>
                        <div class="collapsible-header"><i class="material-icons">reorder</i>文字题</div>
                        <div class="collapsible-body" style="padding-bottom: 50px;padding-right: 10px">

                            <form><!--文字题提交-->
                                <div class="row" id="textform" style="padding-left:40px;padding-right: 40px">

                                    <input type="hidden" name="qtype" value="text">
                                    <input type="hidden" name="belongsto" value="1">
                                    <div class="input-field">问题：<input id="content" name="content" type="text" placeholder="在此输入问题描述">
                                    </div>
                                    <input type="number" class="form-control" id="numbering" name="numbering" placeholder="默认添加至最后一题，也可在指定位置插入题目" min="1" step="1">

                                </div>
                                <button class="btn btn-primary" style="float: right;" id="btn_addquestion" formaction="#" type="button">添加题目</button>
                                <a onclick="" id="cancela" style="float:right;margin-right:8px;margin-top:6px">重置</a>
                            </form>

                        </div>
                    </li>

                    <li>
                        <div class="collapsible-header"><i class="material-icons">reorder</i>多行文字题</div>
                        <div class="collapsible-body" style="padding-bottom: 50px;padding-right: 10px">

                            <form><!--文字题提交-->
                                <div class="row" id="textareaform" style="padding-left:40px;padding-right: 40px">

                                    <input type="hidden" name="qtype" value="textarea">
                                    <input type="hidden" name="belongsto" value="1">
                                    <div class="input-field">问题：<input id="content" name="content" type="text" placeholder="在此输入问题描述">
                                    </div>
                                    <input type="number" class="form-control" id="numbering" name="numbering" placeholder="默认添加至最后一题，也可在指定位置插入题目" min="1" step="1">

                                </div>
                                <button class="btn btn-primary" style="float: right;" id="btn_addquestion" formaction="#" type="button">添加题目</button>
                                <a onclick="" id="cancela" style="float:right;margin-right:8px;margin-top:6px">重置</a>
                            </form>

                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-6" style="margin-right: -15px">
        <div class="card" >

            <div class="card-action" style="padding-top: 50px;">
                <span class="card-title">&nbsp;&nbsp;&nbsp;&nbsp;问卷1</span>
                <p style="padding-top: 30px">&nbsp;&nbsp;&nbsp;&nbsp;描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述</p>
            </div>


            <div class="card-content" style="padding-bottom: 50px">

                <div id="showplace">

                <c:forEach items="${questionlist}" var="question">
                    <div class="card-content" style="margin-bottom: 30px">
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
                            <div class="card-action" style="float: right">
                                <a onclick="" style="color: red" id="delq">删除</a>
                                <button class="btn btn-primary" type="button" id="edtbtn">编辑</button>
                            </div>
                        </form>
                    </div>
                </c:forEach>

                </div>


            </div>


        </div>
    </div>
    <div class="col-md-2 col-sm-2">
        <div class="card">
            <div class="card-action">
                题目模板
            </div>
            <div class="card-content" style="margin: -10px">
                <ul class="collapsible" data-collapsible="accordion">
                    <c:forEach items="${templatelist}" var="tems">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">subject</i>${tems.type}</div>
                            <div class="collapsible-body">
                            <c:forEach items="${tems.templates}" var="tem">
                                <input type="hidden" value="${tem.showname}" name="showname">
                                <p><a id="edittemplate">${tem.showname}</a></p>
                            </c:forEach>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>


</body>

<!-- Bootstrap Js -->
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/materialize/js/materialize.min.js"></script>
<script src="../editformjs.js"></script>
</html>