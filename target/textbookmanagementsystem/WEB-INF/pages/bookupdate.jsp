<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/1/5
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教材添加管理</title>
    <link rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/js.js"></script>
    <style type="text/css">
        .s_top select{
            height: 30px;
        }
    </style>
</head>
<body>
<jsp:include page="fitting/top.jsp"/>
<jsp:include page="fitting/left.jsp"/>
<div class="conter_z">
    <div class="s_top">
        类型：<select id="sel">
            <option>请选择</option>
            <option value="0">学生</option>
            <option value="1">老师</option>
        </select>

        选择：<select id="select">
            <option>请选择</option>
        </select>

    </div>
    <div class="s_bottom ghbs">
        <table cellpadding="0" cellspacing="0" border="0px" style="padding: 5px 5px;background: dodgerblue"></table>
    </div>
</div>
<div class="conter_right">
    <table cellpadding="0" cellspacing="0" border="1px"></table>
</div>
</body>
<script>
    $(function () {
        $('#sel').change(function () {
            var sel=$(this).val();
            $('#select option').remove();
            if (sel==0){
                $.ajax({
                    url:"classAllOne",
                    success:function (data) {
                        // alert("成功！");
                        // console.log(data);
                        var str="<option>请选择班级</option>";
                        for (var i=0;i<data.length;i++){
                            str+="<option value="+data[i].cid+">"+data[i].cname+"</option>";
                        }
                        $('#select').append(str);
                    }
                })
            }else if (sel==1){
                $.ajax({
                    url:"teacherAllOne",
                    success:function (data) {
                        // alert("成功！");
                        // console.log(data);
                        var str="<option>请选择老师</option>";
                        for (var i=0;i<data.length;i++){
                            str+="<option value="+data[i].tid+">"+data[i].tname+"</option>";
                        }
                        $('#select').append(str);
                    }
                })
            }else {
                alert("请先选择")
            }
        })

        $('#select').change(function () {
            var sel=$('#sel').val();
            var select=$(this).val();
            $(".conter_right").css("display", "block");
            $(".conter_right table tr").remove();
            $('.s_bottom table tr').remove();
            if (sel==0){
                $.ajax({
                    url:'bookAndTeachersRightOne',
                    data:{tid:select},
                    success:function (data) {
                        console.log(data);
                        var str="<tr><th width=\"100px\" height=\"30px\">编号</th><th width=\"100px\" >教材名</th><th width=\"150px\" >出版社</th><th width=\"100px\" >操作</th></tr>";
                        var str1="<tr><th>书名</th><th>操作</th></tr>"
                        for(var i=0;i<data.length;i++){
                            if(data[i].cid==null){
                                str+="<tr><td height=\"30px\" align=\"center\" class=\"bid\">"+data[i].bid+"</td>" +
                                    "<td align=\"center\" class=\"bookname\">"+data[i].bookname+"</td>" +
                                    "<td align=\"center\" class=\"press\">"+data[i].press+"</td>" +
                                    "<td align=\"center\"><button type=\"button\" class=\"but\">添加</button></td></tr>"
                            }else {
                                str1+="<tr><td align='center'><input type='hidden' name='tid' class='tid4' value='"+data[i].tid+"'>" +
                                    "<input type='hidden' class='bid4' name='bid' value='"+data[i].bid+"'>"+data[i].bookname+"</td>" +
                                    "<td><button type='button' class='but1'>移除</button></td></tr>";
                            }
                        }
                        $(".conter_right table").append(str1);
                        $('.s_bottom table').append(str);
                    },error:function (data) {
                        alert('出错');
                    }
                })
            }else if (sel==1) {
                $.ajax({
                    url:'bookAndTeachersRight',
                    data:{tid:select},
                    success:function (data) {
                        console.log(data);
                        var str="<tr><th width=\"100px\" height=\"30px\">编号</th><th width=\"100px\" >教材名</th><th width=\"150px\" >出版社</th><th width=\"100px\" >操作</th></tr>";
                        var str1="<tr><th>书名</th><th>操作</th></tr>"
                        for(var i=0;i<data.length;i++){
                            if(data[i].tid==null){
                            str+="<tr><td height=\"30px\" align=\"center\" class=\"bid\">"+data[i].bid+"</td>" +
                                "<td align=\"center\" class=\"bookname\">"+data[i].bookname+"</td>" +
                                "<td align=\"center\" class=\"press\">"+data[i].press+"</td>" +
                                "<td align=\"center\"><button type=\"button\" class=\"but\">添加</button></td></tr>"
                            }else {
                                str1+="<tr><td align='center'><input type='hidden' name='tid' class='tid4' value='"+data[i].tid+"'>" +
                                    "<input type='hidden' class='bid4' name='bid' value='"+data[i].bid+"'>"+data[i].bookname+"</td>" +
                                    "<td><button type='button' class='but1'>移除</button></td></tr>";
                            }
                        }
                        $(".conter_right table").append(str1);
                        $('.s_bottom table').append(str);
                    },error:function (data) {
                        alert('出错');
                    }
                })
            }else {

            }
        })
        
        $('.s_bottom table').on("click",".but",function () {
            var sel=$('#sel').val();
            var select=$('#select').val();
            var bid=$(this).parent().prev().prev().prev().text();
            $(".conter_right table tr").remove();
            $('.s_bottom table tr').remove();
            // alert(select+bid);
            if (sel==0){
                $.ajax({
                    url:'bookAndClassInsert',
                    data:{cid:select,bid:bid},
                    type:"post",
                    success:function (data) {
                        $.ajax({
                            url:'bookAndTeachersRightOne',
                            data:{tid:select},
                            success:function (data) {
                                console.log(data);
                                var str="<tr><th width=\"100px\" height=\"30px\">编号</th><th width=\"100px\" >教材名</th><th width=\"150px\" >出版社</th><th width=\"100px\" >操作</th></tr>";
                                var str1="<tr><th>书名</th><th>操作</th></tr>"
                                for(var i=0;i<data.length;i++){
                                    if(data[i].cid==null){
                                        str+="<tr><td height=\"30px\" align=\"center\" class=\"bid\">"+data[i].bid+"</td>" +
                                            "<td align=\"center\" class=\"bookname\">"+data[i].bookname+"</td>" +
                                            "<td align=\"center\" class=\"press\">"+data[i].press+"</td>" +
                                            "<td align=\"center\"><button type=\"button\" class=\"but\">添加</button></td></tr>"
                                    }else {
                                        str1+="<tr><td align='center'><input type='hidden' name='tid' class='tid4' value='"+data[i].tid+"'>" +
                                            "<input type='hidden' class='bid4' name='bid' value='"+data[i].bid+"'>"+data[i].bookname+"</td>" +
                                            "<td><button type='button' class='but1'>移除</button></td></tr>";
                                    }
                                }
                                $(".conter_right table").append(str1);
                                $('.s_bottom table').append(str);
                            },error:function (data) {
                                alert('出错');
                            }
                        })
                    },error:function (data) {
                        alert("系统错误！");
                    }
                })
            }else if (sel==1) {
                $.ajax({
                    url:'bookAndTeacherInsert',
                    data:{tid:select,bid:bid},
                    type:"post",
                    success:function (data) {
                        $.ajax({
                            url: 'bookAndTeachersRight',
                            data: {tid: select},
                            success: function (data) {
                                console.log(data);
                                var str = "<tr><th width=\"100px\" height=\"30px\">编号</th><th width=\"100px\" >教材名</th><th width=\"150px\" >出版社</th><th width=\"100px\" >操作</th></tr>";
                                var str1 = "<tr><th>书名</th><th>操作</th></tr>"
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].tid == null) {
                                        str += "<tr><td height=\"30px\" align=\"center\" class=\"bid\">" + data[i].bid + "</td>" +
                                            "<td align=\"center\" class=\"bookname\">" + data[i].bookname + "</td>" +
                                            "<td align=\"center\" class=\"press\">" + data[i].press + "</td>" +
                                            "<td align=\"center\"><button type=\"button\" class=\"but\">添加</button></td></tr>"
                                    } else {
                                        str1 += "<tr><td align='center'><input type='hidden' name='tid' class='tid4' value='" + data[i].tid + "'>" +
                                            "<input type='hidden' class='bid4' name='bid' value='" + data[i].bid + "'>" + data[i].bookname + "</td>" +
                                            "<td><button type='button' class='but1'>移除</button></td></tr>";
                                    }
                                }
                                $(".conter_right table").append(str1);
                                $('.s_bottom table').append(str);
                            }, error: function (data) {
                                alert('出错');
                            }
                        })
                    },error:function (data) {
                        alert("错误！");
                    }
                })
            }
        })

        $('.conter_right table').on("click",".but1",function () {
            var sel=$('#sel').val();
            var select=$('#select').val();
            var bid=$(this).parent().prev().find("input").next().val();
            $(".conter_right table tr").remove();
            $('.s_bottom table tr').remove();
            // alert(select+bid);
            if (sel==0){
                $.ajax({
                    url:'bookAndClassDelete',
                    data:{cid:select,bid:bid},
                    type:"post",
                    success:function (data) {
                        $.ajax({
                            url:'bookAndTeachersRightOne',
                            data:{tid:select},
                            success:function (data) {
                                console.log(data);
                                var str="<tr><th width=\"100px\" height=\"30px\">编号</th><th width=\"100px\" >教材名</th><th width=\"150px\" >出版社</th><th width=\"100px\" >操作</th></tr>";
                                var str1="<tr><th>书名</th><th>操作</th></tr>"
                                for(var i=0;i<data.length;i++){
                                    if(data[i].cid==null){
                                        str+="<tr><td height=\"30px\" align=\"center\" class=\"bid\">"+data[i].bid+"</td>" +
                                            "<td align=\"center\" class=\"bookname\">"+data[i].bookname+"</td>" +
                                            "<td align=\"center\" class=\"press\">"+data[i].press+"</td>" +
                                            "<td align=\"center\"><button type=\"button\" class=\"but\">添加</button></td></tr>"
                                    }else {
                                        str1+="<tr><td align='center'><input type='hidden' name='tid' class='tid4' value='"+data[i].tid+"'>" +
                                            "<input type='hidden' class='bid4' name='bid' value='"+data[i].bid+"'>"+data[i].bookname+"</td>" +
                                            "<td><button type='button' class='but1'>移除</button></td></tr>";
                                    }
                                }
                                $(".conter_right table").append(str1);
                                $('.s_bottom table').append(str);
                            },error:function (data) {
                                alert('出错');
                            }
                        })
                    },error:function (data) {
                        alert("系统错误！");
                    }
                })
            }else if (sel==1) {
                $.ajax({
                    url:'bookAndTeacherDelete',
                    data:{tid:select,bid:bid},
                    type:"post",
                    success:function (data) {
                        $.ajax({
                            url: 'bookAndTeachersRight',
                            data: {tid: select},
                            success: function (data) {
                                console.log(data);
                                var str = "<tr><th width=\"100px\" height=\"30px\">编号</th><th width=\"100px\" >教材名</th><th width=\"150px\" >出版社</th><th width=\"100px\" >操作</th></tr>";
                                var str1 = "<tr><th>书名</th><th>操作</th></tr>"
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].tid == null) {
                                        str += "<tr><td height=\"30px\" align=\"center\" class=\"bid\">" + data[i].bid + "</td>" +
                                            "<td align=\"center\" class=\"bookname\">" + data[i].bookname + "</td>" +
                                            "<td align=\"center\" class=\"press\">" + data[i].press + "</td>" +
                                            "<td align=\"center\"><button type=\"button\" class=\"but\">添加</button></td></tr>"
                                    } else {
                                        str1 += "<tr><td align='center'><input type='hidden' name='tid' class='tid4' value='" + data[i].tid + "'>" +
                                            "<input type='hidden' class='bid4' name='bid' value='" + data[i].bid + "'>" + data[i].bookname + "</td>" +
                                            "<td><button type='button' class='but1'>移除</button></td></tr>";
                                    }
                                }
                                $(".conter_right table").append(str1);
                                $('.s_bottom table').append(str);
                            }, error: function (data) {
                                alert('出错');
                            }
                        })
                    },error:function (data) {
                        alert("错误！");
                    }
                })
            }
        })
    })
</script>
</html>
