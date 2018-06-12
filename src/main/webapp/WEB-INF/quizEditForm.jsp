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

<div class="row">
    <div class="col-md-4 col-sm-4">
        <div class="card">
            <div class="card-action">
                题目编辑
            </div>
            <div class="card-content">
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">reorder</i>单选题</div>
                        <div class="collapsible-body" style="padding-bottom: 50px;padding-right: 10px">


                            <form><!--单选题提交-->
                                <div class="row" id="radioform" style="padding-left:40px;padding-right: 40px">

                                    <input type="hidden" name="qtype" value="radio">
                                    <input type="hidden" name="belongsto" value="1">
                                    <div class="input-field">问题：<input id="content" name="content" type="text" placeholder="在此输入问题描述">
                                    </div>
                                    <input type="text" class="form-control" id="numbering" name="numbering" placeholder="请输入题号">

                                    <input type="hidden" id="optnum" name="optnum" value="1">
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="option0" name="option0" placeholder="请输入选项内容">
                                    </div>
                                    <label for="option0" class="col-sm-2 control-label"><a onclick="" id="delbtn">x</a></label>


                                </div>
                                <button class="btn btn-primary" style="float: right;" id="btn_addquestion" formaction="#" type="button">添加题目</button>
                                <button class="btn btn-primary" style="float: right;margin-right: 5px;" id="addbtn" formaction="#" type="button">添加选项</button>
                            </form>


                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">reorder</i>多选题</div>
                        <div class="collapsible-body" style="padding-bottom: 50px;padding-right: 10px">

                            <div class="row" style="padding-left:40px;padding-right: 40px">


                                <div class="input-field">你是不是哈皮<input id="111" type="text">
                                </div>


                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="firstname" placeholder="请输入名字">
                                </div>
                                <label for="firstname" class="col-sm-2 control-label"><a href="">x</a></label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="firstname" placeholder="请输入名字">
                                </div>
                                <label for="firstname" class="col-sm-2 control-label"><a href="">x</a></label>

                            </div>
                            <button class="btn btn-primary" style="float: right;" formaction="#">添加题目</button>
                            <button class="btn btn-primary" style="float: right;margin-right: 5px;" formaction="#">添加选项</button>

                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">reorder</i>文字</div>
                        <div class="collapsible-body" style="padding-bottom: 50px;padding-right: 10px">
                            <div class="row" style="padding-left:40px;padding-right: 40px">
                                <div class="input-field">nmsl<textarea id="textarea1" class="materialize-textarea"></textarea>
                                </div>
                            </div>
                            <button class="btn btn-primary" style="float: right;">添加题目</button>

                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-6">
        <div class="card" >

            <div class="card-action">
                <span class="card-title">&nbsp;&nbsp;&nbsp;&nbsp;问卷1</span>
                <p style="padding-top: 30px">&nbsp;&nbsp;&nbsp;&nbsp;描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述</p>
            </div>


            <div class="card-content" style="padding-bottom: 50px">

                <div id="showplace"></div>

                <c:forEach items="${questionlist}" var="question">
                    <div class="card-content">
                        <span class="card-title">${question.q.content}</span>
                        <c:forEach items="${question.o}" var="opt">
                            <p>
                                <input class="with-gap" type="radio" name="opt${question.q.id}" id="opt${opt.id}">
                                <label for="opt${opt.id}">${opt.content}</label>
                            </p>
                        </c:forEach>
                        <div class="card-action" style="float: right">
                            <a href="#" style="color: red">删除</a>
                            <button class="btn btn-primary" type="button">编辑</button>
                        </div>
                    </div>
                </c:forEach>

                <div class="card-content">
                    <span class="card-title">Card Title</span>
                    <p>
                        <input class="with-gap" name="group1" type="radio" id="test1"  />
                        <label for="test1">Green</label>
                        <input class="with-gap" name="group1" type="radio" id="test2"  />
                        <label for="test2">Green</label>
                        <input class="with-gap" name="group1" type="radio" id="test3"  />
                        <label for="test3">Green</label>
                    </p>
                    <p>
                        <input type="checkbox" class="filled-in" id="filled-in-box" checked="checked" />
                        <label for="filled-in-box">Filled in</label>
                    </p>
                    <div class="card-action" style="float: right">
                        <a href="#" style="color: red">删除</a>
                        <button class="btn btn-primary">编辑</button>
                    </div>
                </div>

                <div class="card-content">
                    <span class="card-title">Card Title</span>
                    <p>
                        <input class="with-gap" name="group1" type="radio" id="test3"  />
                        <label for="test3">Green</label>
                    </p>
                    <p>
                        <input type="checkbox" class="filled-in" id="filled-in-box" checked="checked" />
                        <label for="filled-in-box">Filled in</label>
                    </p>
                    <div class="card-action" style="float: right">
                        <a href="#" style="color: red">删除</a>
                        <button class="btn btn-primary">编辑</button>
                    </div>
                </div>
            </div>


        </div>
    </div>
    <div class="col-md-2 col-sm-2">
        <div class="card">
            <div class="card-action">
                题目模板
            </div>
            <div class="card-content">
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">filter_drama</i>First</div>
                        <div class="collapsible-body"><p>111</p></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
                        <div class="collapsible-body"><p>222</p></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">whatshot</i>Third</div>
                        <div class="collapsible-body"><p>333</p></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>

<!-- Bootstrap Js -->
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/materialize/js/materialize.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#addbtn').click(function(){
            var optnum=$(this).prev().prev().children("#optnum").val();


            var opt_div=document.createElement("div");
            var opt_ipt=document.createElement("input");
            var lab_btn=document.createElement("label");
            var a_btn=document.createElement("a");

            opt_div.setAttribute("class","col-sm-10");

            opt_ipt.type="text";
            opt_ipt.setAttribute("class","form-control");
            opt_ipt.id="option"+optnum;
            opt_ipt.name="option"+optnum;
            opt_ipt.setAttribute("placeholder","请输入选项内容");

            lab_btn.setAttribute("for","option"+optnum);
            lab_btn.setAttribute("class","col-sm-2 control-label");

            a_btn.setAttribute("onclick","");
            a_btn.id="delbtn";
            a_btn.text="x";

            opt_div.appendChild(opt_ipt);
            lab_btn.appendChild(a_btn);

            document.getElementById('radioform').appendChild(opt_div);
            document.getElementById('radioform').appendChild(lab_btn);

            var temp=parseInt(optnum);
            temp=temp+1;
            $(this).prev().prev().children("#optnum").val(temp);
        });

        $('#radioform').on("click","#delbtn",function(){
            var optnum=$(this).parent().siblings("#optnum").val();
            $(this).parent().siblings("#optnum").val(optnum-1);

            var ltemp=$(this).parent().prev().children().attr("name");
            $(this).parent().nextAll(".col-sm-10").each(function(){
                var ntemp=$(this).children().attr("name");
                $(this).children().attr("name",ltemp);
                $(this).children().attr("id",ltemp);
                $(this).next().attr("for",ltemp);
                ltemp=ntemp;
            });

            $(this).parent().prev().remove();
            $(this).parent().remove();
        });

        $('form').on("click","#btn_addquestion",function () {
            $.ajax({
                type:"POST",
                dataType:"json",
                url:"<%=basePath%>/json.addq",
                data:$(this).parent().serialize(),
                success:function (data) {
                    var str="<div class=\"card-content\"><span class=\"card-title\">"+data.q.content+"</span>";
                    for (i=0;i<data.o.length;i++){
                        str=str+"<p><input class=\"with-gap\" type=\"radio\" name=\"opt"+data.q.id+"\" id=\"opt"+data.o[i].id+"\"><label for=\"opt"+data.o[i].id+"\">"+data.o[i].content+"</label></p>";
                    }
                    str=str+"<div class=\"card-action\" style=\"float: right\"><a href=\"#\" style=\"color: red\">删除</a><button class=\"btn btn-primary\" type=\"button\">编辑</button></div>";
                    $('#showplace').append(str);
                }
            });
        })
    });
</script>
</html>
