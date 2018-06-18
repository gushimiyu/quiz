<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    </div>
</section>
<section class="contact-sec" style="background:url(../gushimiyu/images/contact-bg.jpg)no-repeat 0 0;">
    <div class="cover"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 content aos-item" data-aos="fade-right" data-aos-duration="1000">
                <h2>创建一份问卷
                </h2>
                <h3>添加题目与选项</h3>
            </div>
            <div class="col-md-6 form aos-item" data-aos="fade-left" data-aos-duration="1000">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" id="title" name="title" placeholder="题目" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <input type="text" id="description" name="description" placeholder="选项" class="form-control">
                        </div>
                        <div class="col-md-12">
                            <button formaction="createquestionnaire" type="submit" onclick="javascript:window.location='/createquestionnaire'">开始创建</button></div>
                    </div>
                </form>
            </div>
        </div>
        </form>
    </div>
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
<script type="text/javascript">
    $(".lightninBox").lightninBox();
</script>
<!--   //     <script>
//   AOS.init({
//     easing: 'ease-in-out-sine'
//   });
// </script> -->
</body>

</html>