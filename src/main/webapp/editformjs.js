//添加选项按钮
    $(document).ready(function() {

        $('.radioform').on("click","#addbtn",function (){
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

        $('.checkboxform').on("click","#addbtn",function (){
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

            document.getElementById('checkboxform').appendChild(opt_div);
            document.getElementById('checkboxform').appendChild(lab_btn);

            var temp=parseInt(optnum);
            temp=temp+1;
            $(this).prev().prev().children("#optnum").val(temp);
        });

        //删除选项按钮
        $('form').on("click","#delbtn",function(){
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


        //添加题目按钮
        $('form').on("click","#btn_addquestion",function () {
            $(this).text("添加题目");
            $.ajax({
                type:"POST",
                dataType:"json",
                url:"json.addq",
                data:$(this).parent().serialize(),
                success:function (data) {
                    $('#showplace').find("*").remove();
                    for(var j=0;j<data.length;j++) {
                        var str="<div class=\"card-content\" style=\"margin-bottom: 30px\">\n" +
                            "<form>\n" +
                            "<input type=\"hidden\" name=\"belongsto\" id=\"belongsto\" value=\""+data[j].q.belongsto+"\">\n" +
                            "<input type=\"hidden\" name=\"id\" id=\"questionid\" value=\""+data[j].q.id+"\">\n" +
                            "<input type=\"hidden\" name=\"numbering\" id=\"numbering\" value=\""+data[j].q.numbering+"\">";
                        if(data[j].q.type==="radio"||data[j].q.type==="checkbox"){
                            str=str+"<input type=\"hidden\" name=\"optnum\" id=\"optnum\" value=\""+data[j].o.length+"\">";
                        }
                        str=str+"<input type=\"hidden\" name=\"qtype\" id=\"qtype\" value=\""+data[j].q.type+"\">\n" +
                            "<span class=\"card-title\">"+data[j].q.numbering+". "+data[j].q.content+"</span>";
                        if(data[j].q.type==="radio"||data[j].q.type==="checkbox"){
                            for (var i = 0; i < data[j].o.length; i++) {
                                str=str+"<p>\n" +
                                    "<input class=\"with-gap\" type=\""+data[j].q.type+"\" name=\"opt"+data[j].q.id+"\" id=\"opt"+data[j].o[i].id+"\">\n" +
                                    "<label for=\"opt"+data[j].o[i].id+"\">"+data[j].o[i].content+"</label>\n" +
                                    "</p>";
                            }
                        }else if(data[j].q.type==="star"){
                            str=str+"<p>\n" +
                                "非常不满意\n" +
                                "<input class=\"with-gap\" type=\"radio\" name=\"star"+data[j].q.id+"\" id=\"star1\">\n" +
                                "<label for=\"star1\">1分&nbsp;&nbsp;</label>\n" +
                                "<input class=\"with-gap\" type=\"radio\" name=\"star"+data[j].q.id+"\" id=\"star2\">\n" +
                                "<label for=\"star2\">2分&nbsp;&nbsp;</label>\n" +
                                "<input class=\"with-gap\" type=\"radio\" name=\"star"+data[j].q.id+"\" id=\"star3\">\n" +
                                "<label for=\"star3\">3分&nbsp;&nbsp;</label>\n" +
                                "<input class=\"with-gap\" type=\"radio\" name=\"star"+data[j].q.id+"\" id=\"star4\">\n" +
                                "<label for=\"star4\">4分&nbsp;&nbsp;</label>\n" +
                                "<input class=\"with-gap\" type=\"radio\" name=\"star"+data[j].q.id+"\" id=\"star5\">\n" +
                                "<label for=\"star5\">5分&nbsp;&nbsp;</label>\n" +
                                "非常满意\n" +
                                "</p>";
                        }else if(data[j].q.type==="textarea"){
                            str=str+"<textarea type=\"text\" class=\"materialize-textarea\"  placeholder=\"用户可以在此处答题\"></textarea>"
                        }else{
                            str=str+"<input type=\"text\" class=\"form-control\"  placeholder=\"用户可以在此处答题\">";
                        }
                        str=str+"<div class=\"card-action\" style=\"float: right\">\n" +
                            "<a onclick=\"\" style=\"color: red\" id=\"delq\">删除</a>\n" +
                            "<button class=\"btn btn-primary\" type=\"button\" id=\"edtbtn\">编辑</button>\n" +
                            "</div>\n" +
                            "</form>\n" +
                            "</div>";
                        $('#showplace').append(str);
                    }
                }
            });
        });


//编辑题目按钮
        $(".card-content").on("click","#edtbtn",function(){
            var optnum=$(this).parent().prevAll("#optnum").val();
            var qtype=$(this).parent().prevAll("#qtype").val();
            var content=$(this).parent().prevAll(".card-title").text();
            var lcontent=content.split(".");
            content=content.slice(lcontent[0].length+1);

            var numbering=$(this).parent().prevAll("#numbering").val();

            //reset-----
            var i=0;
            $("#"+qtype+"form").find(".col-sm-10").each(function(){
                if(i==0){
                    i++;
                    $(this).children("input").val("");
                }
                else $(this).remove();
            })
            i=0;
            $("#"+qtype+"form").find("label").each(function(){
                if(i==0) i++;
                else $(this).remove();
            });
            //reset--end

            $("#"+qtype+"form").find("#content").val(content);
            $("#"+qtype+"form").find("#numbering").val(numbering);
            $("#"+qtype+"form").find("#optnum").val(optnum);

            var pos=$(this).parent().prevAll(".card-title")
            for(var i=0;i<optnum;i++){
                if(i!=0){
                    //add-----
                    var opt_div=document.createElement("div");
                    var opt_ipt=document.createElement("input");
                    var lab_btn=document.createElement("label");
                    var a_btn=document.createElement("a");

                    opt_div.setAttribute("class","col-sm-10");

                    opt_ipt.type="text";
                    opt_ipt.setAttribute("class","form-control");
                    opt_ipt.id="option"+i;
                    opt_ipt.name="option"+i;
                    opt_ipt.setAttribute("placeholder","请输入选项内容");
                    opt_ipt.value=pos.next().find("label").text();

                    lab_btn.setAttribute("for","option"+i);
                    lab_btn.setAttribute("class","col-sm-2 control-label");

                    a_btn.setAttribute("onclick","");
                    a_btn.id="delbtn";
                    a_btn.text="x";

                    opt_div.appendChild(opt_ipt);
                    lab_btn.appendChild(a_btn);

                    document.getElementById(qtype+"form").appendChild(opt_div);
                    document.getElementById(qtype+"form").appendChild(lab_btn);
                    //add--end

                }else{
                    $("#"+qtype+"form").find("#option"+i).val(pos.next().find("label").text());
                }
                pos=pos.next();
            }


            $("#"+qtype+"form").next().text("确认修改");
            $("#"+qtype+"form").nextAll("#cancela").text("取消");
            if($("#"+qtype+"form").parent().children('a').length==0){
                var cancela=document.createElement("a");
                cancela.setAttribute("id","cancela");
                cancela.setAttribute("onclick","");
                cancela.text="取消";
                cancela.setAttribute("style","float:right;margin-right:5px;margin-top:5px");
                $("#"+qtype+"form").parent().append(cancela);
            }
            if(!$("#"+qtype+"form").parent().parent().prev().hasClass("active"))
                $("#"+qtype+"form").parent().parent().prev().trigger("click");
        });



        //重置题目按钮
        $('.collapsible-body').on("click","#cancela",function(){
            $(this).text("重置");
            $(this).prevAll("#btn_addquestion").text("添加题目");

            $(this).prevAll(".row").find("#content").val("");
            $(this).prevAll(".row").find("#numbering").val("");
            $(this).prevAll(".row").find("#optnum").val(1);
            var i=0;
            $(this).prevAll(".row").find(".col-sm-10").each(function(){
                if(i==0){
                    $(this).children("input").val("");
                    i++;
                }
                else $(this).remove();
            })
            i=0;
            $(this).prevAll(".row").find("label").each(function(){
                if(i==0) i++;
                else $(this).remove();
            })
        });


        //删除题目按钮
        $('.card-content').on("click","#delq",function () {
            $.ajax({
                type:"POST",
                dataType:"json",
                url:"json.delq",
                data:$(this).parent().parent().serialize(),
                success:function (data) {
                    $('#showplace').find("*").remove();
                    for(var j=0;j<data.length;j++) {
                        var str="<div class=\"card-content\" style=\"margin-bottom: 30px\">\n" +
                            "<form>\n" +
                            "<input type=\"hidden\" name=\"belongsto\" id=\"belongsto\" value=\""+data[j].q.belongsto+"\">\n" +
                            "<input type=\"hidden\" name=\"id\" id=\"questionid\" value=\""+data[j].q.id+"\">\n" +
                            "<input type=\"hidden\" name=\"numbering\" id=\"numbering\" value=\""+data[j].q.numbering+"\">";
                        if(data[j].q.type==="radio"||data[j].q.type==="checkbox"){
                            str=str+"<input type=\"hidden\" name=\"optnum\" id=\"optnum\" value=\""+data[j].o.length+"\">";
                        }
                        str=str+"<input type=\"hidden\" name=\"qtype\" id=\"qtype\" value=\""+data[j].q.type+"\">\n" +
                            "<span class=\"card-title\">"+data[j].q.numbering+". "+data[j].q.content+"</span>";
                        if(data[j].q.type==="radio"||data[j].q.type==="checkbox"){
                            for (var i = 0; i < data[j].o.length; i++) {
                                str=str+"<p>\n" +
                                    "<input class=\"with-gap\" type=\""+data[j].q.type+"\" name=\"opt"+data[j].q.id+"\" id=\"opt"+data[j].o[i].id+"\">\n" +
                                    "<label for=\"opt"+data[j].o[i].id+"\">"+data[j].o[i].content+"</label>\n" +
                                    "</p>";
                            }
                        }else if(data[j].q.type==="star"){
                            str=str+"<p>\n" +
                                "非常不满意\n" +
                                "<input class=\"with-gap\" type=\"radio\" name=\"star"+data[j].q.id+"\" id=\"star1\">\n" +
                                "<label for=\"star1\">1分&nbsp;&nbsp;</label>\n" +
                                "<input class=\"with-gap\" type=\"radio\" name=\"star"+data[j].q.id+"\" id=\"star2\">\n" +
                                "<label for=\"star2\">2分&nbsp;&nbsp;</label>\n" +
                                "<input class=\"with-gap\" type=\"radio\" name=\"star"+data[j].q.id+"\" id=\"star3\">\n" +
                                "<label for=\"star3\">3分&nbsp;&nbsp;</label>\n" +
                                "<input class=\"with-gap\" type=\"radio\" name=\"star"+data[j].q.id+"\" id=\"star4\">\n" +
                                "<label for=\"star4\">4分&nbsp;&nbsp;</label>\n" +
                                "<input class=\"with-gap\" type=\"radio\" name=\"star"+data[j].q.id+"\" id=\"star5\">\n" +
                                "<label for=\"star5\">5分&nbsp;&nbsp;</label>\n" +
                                "非常满意\n" +
                                "</p>";
                        }else if(data[j].q.type==="textarea"){
                            str=str+"<textarea type=\"text\" class=\"materialize-textarea\"  placeholder=\"用户可以在此处答题\"></textarea>"
                        }else{
                            str=str+"<input type=\"text\" class=\"form-control\"  placeholder=\"用户可以在此处答题\">";
                        }
                        str=str+"<div class=\"card-action\" style=\"float: right\">\n" +
                            "<a onclick=\"\" style=\"color: red\" id=\"delq\">删除</a>\n" +
                            "<button class=\"btn btn-primary\" type=\"button\" id=\"edtbtn\">编辑</button>\n" +
                            "</div>\n" +
                            "</form>\n" +
                            "</div>";
                        $('#showplace').append(str);
                    }
                }
            });
        });


        //添加模板题目按钮
        $(".card-content").on("click","#edittemplate",function(){
            $.ajax({
                type:"POST",
                dataType:"json",
                url:"json.gettemplate",
                data:$(this).parent().prev().serialize(),
                success:function (data) {
                    var optnum=data.o.length;
                    var qtype=data.q.type;
                    var content=data.q.content;

                    //reset-----
                    var i=0;
                    $("#"+qtype+"form").find(".col-sm-10").each(function(){
                        if(i==0){
                            i++;
                            $(this).children("input").val("");
                        }
                        else $(this).remove();
                    })
                    i=0;
                    $("#"+qtype+"form").find("label").each(function(){
                        if(i==0) i++;
                        else $(this).remove();
                    });
                    //reset--end

                    $("#"+qtype+"form").find("#content").val(content);
                    $("#"+qtype+"form").find("#optnum").val(optnum);

                    for(var i=0;i<data.o.length;i++){
                        if(i!=0){
                            //add-----
                            var opt_div=document.createElement("div");
                            var opt_ipt=document.createElement("input");
                            var lab_btn=document.createElement("label");
                            var a_btn=document.createElement("a");

                            opt_div.setAttribute("class","col-sm-10");

                            opt_ipt.type="text";
                            opt_ipt.setAttribute("class","form-control");
                            opt_ipt.id="option"+i;
                            opt_ipt.name="option"+i;
                            opt_ipt.setAttribute("placeholder","请输入选项内容");
                            opt_ipt.value=data.o[i].content;

                            lab_btn.setAttribute("for","option"+i);
                            lab_btn.setAttribute("class","col-sm-2 control-label");

                            a_btn.setAttribute("onclick","");
                            a_btn.id="delbtn";
                            a_btn.text="x";

                            opt_div.appendChild(opt_ipt);
                            lab_btn.appendChild(a_btn);

                            document.getElementById(qtype+"form").appendChild(opt_div);
                            document.getElementById(qtype+"form").appendChild(lab_btn);
                            //add--end

                        }else{
                            $("#"+qtype+"form").find("#option"+i).val(data.o[i].content);
                        }
                    }
                    if(!$("#"+qtype+"form").parent().parent().prev().hasClass("active"))
                        $("#"+qtype+"form").parent().parent().prev().trigger("click");

                }
            });

        });
    });
