<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>你妈死了问卷</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="../gushimiyu/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700|Old+Standard+TT" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../gushimiyu/css/jQuery.lightninBox.css">
    <link rel="stylesheet" href="../gushimiyu/css/aos.css">
    <link rel="stylesheet" type="text/css" href="../gushimiyu/css/style.css">
    <link rel="stylesheet" type="text/css" href="../gushimiyu/css/htmleaf-demo.css">
    <link rel="stylesheet" type="text/css" href="../gushimiyu/css/style-1.css">
    <link rel="stylesheet" type="text/css" href="../gushimiyu/assets/css/table.css">
    <!-- Bootstrap Styles-->
    <link href="../gushimiyu/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="../gushimiyu/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="../gushimiyu/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="../gushimiyu/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>

<body>
<script type="text/javascript">
    var dialogInstace , onMoveStartId;  //  用于记录当前可拖拽的对象

    // var zIndex = 9000;

    //  获取元素对象
    function g(id){return document.getElementById(id);}

    //  自动居中元素（el = Element）
    function autoCenter( el ){
        var bodyW = document.documentElement.clientWidth;
        var bodyH = document.documentElement.clientHeight;

        var elW = el.offsetWidth;
        var elH = el.offsetHeight;

        el.style.left = (bodyW-elW)/2 + 'px';
        el.style.top = (bodyH-elH)/2 + 'px';

    }

    //  自动扩展元素到全部显示区域
    function fillToBody( el ){
        el.style.width  = document.documentElement.clientWidth  +'px';
        el.style.height = document.documentElement.clientHeight + 'px';
    }

    //  Dialog实例化的方法
    function Dialog( dragId , moveId ){

        var instace = {} ;

        instace.dragElement  = g(dragId);   //  允许执行 拖拽操作 的元素
        instace.moveElement  = g(moveId);   //  拖拽操作时，移动的元素

        instace.mouseOffsetLeft = 0;            //  拖拽操作时，移动元素的起始 X 点
        instace.mouseOffsetTop = 0;         //  拖拽操作时，移动元素的起始 Y 点

        instace.dragElement.addEventListener('mousedown',function(e){

            var e = e || window.event;

            dialogInstace = instace;
            instace.mouseOffsetLeft = e.pageX - instace.moveElement.offsetLeft ;
            instace.mouseOffsetTop  = e.pageY - instace.moveElement.offsetTop ;

            // instace.moveElement.style.zIndex = zIndex ++;
        })

        return instace;
    }

    //  在页面中侦听 鼠标弹起事件
    document.onmouseup = function(e){

        dialogInstace = false;
        clearInterval(onMoveStartId);

    }

    //  在页面中侦听 鼠标移动事件
    document.onmousemove = function(e) {
        var e = e || window.event;
        var instace = dialogInstace;
        if (instace) {

            var maxX = document.documentElement.clientWidth -  instace.moveElement.offsetWidth;
            var maxY = document.documentElement.clientHeight - instace.moveElement.offsetHeight ;

            instace.moveElement.style.left = Math.min( Math.max( ( e.pageX - instace.mouseOffsetLeft) , 0 ) , maxX) + "px";
            instace.moveElement.style.top  = Math.min( Math.max( ( e.pageY - instace.mouseOffsetTop ) , 0 ) , maxY) + "px";
        }
        if(e.stopPropagation) {
            e.stopPropagation();
        } else {
            e.cancelBubble = true;
        }
    };

    //  拖拽对话框实例对象
    Dialog('dialogDrag','dialogMove');

    function onMoveStart(){

    }


    //  重新调整对话框的位置和遮罩，并且展现
    function showDialog(){
        g('dialogMove').style.display = 'block';
        g('mask').style.display = 'block';
        autoCenter( g('dialogMove') );
        fillToBody( g('mask') );
    }

    //  关闭对话框
    function hideDialog(){
        g('dialogMove').style.display = 'none';
        g('mask').style.display = 'none';
    }

    //  侦听浏览器窗口大小变化
    //window.onresize = showDialog;
</script>

<header class="d-flex flex-column flex-md-row align-items-center">
    <div class="container">
        <a href="loginform2.html" class="navbar-brand">
            你妈死了问卷.
        </a>
        <nav class="navbar navbar-expand-lg navbar-light right">
            <div class="main-navbar show">
                <ul class="navbar-nav mr-auto">

                    <li class="nav-item">
                        <a class="nav-link" href="loginform2.html">首页 </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="create.html">创建问卷</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mypaper.html">我的问卷 </a>
                    </li>
                    <c:if test="${sessionScope.user.id==null}">
                        <li class="nav-item active">
                            <a class="nav-link" href="javascript:showDialog()">登录</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.user.id!=null}">
                        <li class="nav-item">
                            <a class="nav-link" href="mypaper.html">${sessionScope.user.acc}</a>
                        </li>

                            <li class="nav-item active">
                                <a  class="nav-link" onclick="javascript:window.location='/logout'">退出</a>
                            </li>

                    </c:if>
                </ul>
            </div>
            <div class="ui-dialog" id="dialogMove" onselectstart='return false;'>
                <div class="ui-dialog-title" id="dialogDrag"  onselectstart="return false;" >
                    登录
                    <a class="ui-dialog-closebutton" href="javascript:hideDialog();"></a>
                </div>
                <div class="ui-dialog-content">
                    <div class="ui-dialog-l40 ui-dialog-pt15">
                        <input class="ui-dialog-input ui-dialog-input-username" type="input" placeholder="用户名" />
                    </div>
                    <div class="ui-dialog-l40 ui-dialog-pt15">
                        <input class="ui-dialog-input ui-dialog-input-password" type="input" placeholder="密码" />
                    </div>
                    <div class="ui-dialog-l40">
                        <a href="#">忘记密码</a>
                    </div>
                    <div>
                        <a class="ui-dialog-submit" href="#" >登录</a>
                    </div>
                    <div class="ui-dialog-l40">
                        <a href="#">立即注册</a>
                    </div>
                </div>
            </div>

        </nav>
    </div>
</header>



<section class="portipolio-sec">
    <div class="main-container">
    </div>
</section>
<!-- /. NAV SIDE  -->

<section class="artical-sec">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="artical aos-item" data-aos="fade-up" data-aos-duration="600">
                    <h3>问卷浏览量</h3>
                    <h6>0</h6>
                </div>
            </div>
            <div class="col-md-4">
                <div class="artical aos-item" data-aos="fade-up" data-aos-dura]]]]]]]]]]]]]][]tion="1000">
                    <h3>问卷回收量</h3>
                    <h6>${sessionScope.num}</h6>
                </div>
            </div>
            <div class="col-md-4">
                <div class="artical aos-item" data-aos="fade-up" data-aos-duration="1400">
                    <h3>回收率</h3>
                    <h6>0</h6>
                </div>
            </div>
            <c:forEach items="${a_list}" var="a">
            <div class="col-md-12">
                <h4 class="title" align="center">
                        ${a.q.numbering}.${a.q.content}
                </h4>
            </div>
            <div class="row" style="margin: 0 auto">
                <table id="customers" style="  width:500px;">

                    <tr>
                        <th>选项</th>
                        <th>小计</th>
                        <th>百分比</th>
                    </tr>
                    <c:forEach items="${a.option}" var="s">
                    <tr>

                            <td>${s.opt.content}</td>
                            <td>${s.n}</td>
                            <td>${s.x}</td>

                    </tr>
                    </c:forEach>
                </table>
            </div>
            </c:forEach>

            <c:forEach items="${b_list}" var="x">
            <div class="col-md-12">
                <h4 class="title" align="center">
                        ${x.file.numbering}.${x.file.content}
                </h4>
            </div>
            <div class="row" style="margin: 0 auto">
                <table id="customers" style="  width:500px;">

                    <tr>
                        <th>选项</th>
                        <th>小计</th>
                    </tr>
                    <c:forEach items="${x.bibli}" var="y">
                        <tr>

                            <td>${y.j}</td>
                            <td>${y.i.content}</td>


                        </tr>
                    </c:forEach>
                </table>
            </div>
            </c:forEach>
        </div>
    </div>
</section>
            <footer>
                <div class="container">
                    <div class="menu-sec aos-item" data-aos="fade-down" data-aos-duration="1500">
                        <ul>
                            <li>
                                <a href="index.html">首页</a>
                            </li>
                            <li>
                                <a href="create.html">创建问卷</a>
                            </li>
                            <li>
                                <a href="mypaper.html">我的问卷</a>
                            </li>

                        </ul>
                        <h3>(C) 2018. All Rights Reserved 2026.</h3>
                    </div>
                    <div class="logo aos-item" data-aos="fade-in" data-aos-duration="1500">
                        <a href="#">你妈死了问卷.</a>
                    </div>
                </div>
            </footer>
            <script type="text/javascript" src="../gushimiyu/js/jquery.js"></script>
            <script type="text/javascript" src="../gushimiyu/js/bootstrap.min.js">
            </script>
            <script src="../gushimiyu/js/jQuery.lightninBox.min.js"></script>
            <script src="../gushimiyu/js/aos.js"></script>
            <script type="text/javascript" src="../gushimiyu/js/custom.js"></script>

            <script src="../gushimiyu/assets/js/jquery-1.10.2.js"></script>
            <!-- jQuery Js -->
            <script src="../gushimiyu/assets/js/jquery-1.10.2.js"></script>
            <!-- Bootstrap Js -->
            <script src="../gushimiyu/assets/js/bootstrap.min.js"></script>
            <!-- Metis Menu Js -->
            <script src="../gushimiyu/assets/js/jquery.metisMenu.js"></script>
            <!-- Morris Chart Js -->
            <script src="../gushimiyu/assets/js/morris/raphael-2.1.0.min.js"></script>
            <script src="../gushimiyu/assets/js/morris/morris.js"></script>
            <!-- Custom Js -->
            <script src="../gushimiyu/assets/js/custom-scripts.js"></script>
            <script type="text/javascript">$(".lightninBox").lightninBox();
            </script>
            <!--   //     <script>
        //   AOS.init({
        //     easing: 'ease-in-out-sine'
        //   });
        // </script> -->
</body>
<script type="text/javascript">
    $(function(){
        // 圖表的資料
        var data = [
            {"period": "2011 Q3", "licensed": 3407, "sorned": 660},
            {"period": "2011 Q2", "licensed": 3351, "sorned": 629},
            {"period": "2011 Q1", "licensed": 3269, "sorned": 618},
            {"period": "2010 Q4", "licensed": 3246, "sorned": 661},
            {"period": "2010 Q3", "licensed": 3257, "sorned": 667},
            {"period": "2010 Q2", "licensed": 3248, "sorned": 627},
            {"period": "2010 Q1", "licensed": 3171, "sorned": 660},
            {"period": "2009 Q4", "licensed": 3171, "sorned": 676},
            {"period": "2009 Q3", "licensed": 3201, "sorned": 656},
            {"period": "2009 Q2", "licensed": 3215, "sorned": 622},
            {"period": "2009 Q1", "licensed": 3148, "sorned": 632},
            {"period": "2008 Q4", "licensed": 3155, "sorned": 681},
            {"period": "2008 Q3", "licensed": 3190, "sorned": 667},
            {"period": "2007 Q4", "licensed": 3226, "sorned": 620},
            {"period": "2006 Q4", "licensed": 3245, "sorned": null},
            {"period": "2005 Q4", "licensed": 3289, "sorned": null},
            {"period": "2004 Q4", "licensed": 3263, "sorned": null},
            {"period": "2003 Q4", "licensed": 3189, "sorned": null},
            {"period": "2002 Q4", "licensed": 3079, "sorned": null},
            {"period": "2001 Q4", "licensed": 3085, "sorned": null},
            {"period": "2000 Q4", "licensed": 3055, "sorned": null},
            {"period": "1999 Q4", "licensed": 3063, "sorned": null},
            {"period": "1998 Q4", "licensed": 2943, "sorned": null},
            {"period": "1997 Q4", "licensed": 2806, "sorned": null},
            {"period": "1996 Q4", "licensed": 2674, "sorned": null},
            {"period": "1995 Q4", "licensed": 1702, "sorned": null},
            {"period": "1994 Q4", "licensed": 1732, "sorned": null}
        ];

        // 產生圖表, 資料來源為 data
        // x 軸為 period, y 軸為 ['licensed', 'sorned']
        Morris.Line({
            element: 'barchart',
            data: data,
            xkey: 'period',
            ymax: 'auto 5000',
            ykeys: ['licensed', 'sorned'],
            labels: ['Licensed', 'SORN']
        });
    });
</script>

</html>