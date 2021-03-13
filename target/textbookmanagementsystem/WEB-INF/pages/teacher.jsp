<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/1/2
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>教师</title>
    <link rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/js.js"></script>
</head>
<body>
<jsp:include page="fitting/top.jsp"/>
<jsp:include page="fitting/left.jsp"/>
<div class="conter_z">
    <div class="s_top">
        <form method="get" action="teacherAll">
            &nbsp;&nbsp;姓名：&nbsp;
            <input type="text" name="tname" />
            &nbsp;&nbsp;&nbsp;
            <input type="submit" value="搜索" />
        </form>
    </div>
    <div class="s_bottom ghbs">
        <table cellpadding="0" cellspacing="0" border="0px">
            <tr>
                <th width="100px" height="30px">编号</th>
                <th width="100px" >姓名</th>
                <th width="100px" >性别</th>
                <th width="100px" >操作</th>
            </tr>
            <c:forEach items="${tlist}" var="t">
                <tr>
                    <td height="30px" align="center" class="tid">${t.tid}</td>
                    <td align="center" class="tname">${t.tname}</td>
                    <td align="center" class="tsex">${t.tsex}</td>
                    <c:if test="${user[0].utype!=0}">
                    <td align="center"><button type="button" class="but1">查看</button></td>
                    </c:if>
                    <c:if test="${user[0].utype==0}">
                        <td align="center">
                            <button type="button" class="but2">增改</button>
                            <button type="button" class="but3">删除</button>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>
    <c:if test="${user[0].utype!=0}">
    <div class="conter_right">
        <table cellpadding="0" cellspacing="0" border="1px"></table>
    </div>
    </c:if>
    <c:if test="${user[0].utype==0}">
        <div class="conter_right">
            <div class="conter_right_top">
                <form method="post" action="teacherAdd" onsubmit="return showone()">
                    <table cellpadding="0" cellspacing="0" border="0px">
                        <tr><th colspan="2" align="center">添加老师信息</th></tr>
                        <tr><td> 姓名：</td><td><input type="text" name="tname" class="tna1"></td></tr>
                        <tr><td>  性别：</td><td>
                            <input type="radio" name="tsex" value="男" checked="checked"/>男
                            <input type="radio" name="tsex" value="女"/>女
                        </td></tr>
                        <tr><td colspan="2" align="center"><input type="submit" value="添加"></td></tr>
                    </table>
                </form>
            </div>
            <hr color="white"/>
            <div class="conter_right_bottom">
                <form method="post" action="teacherUpdate" onsubmit="return showtwo()">
                    <table cellpadding="0" cellspacing="0" border="0px">
                        <tr><th colspan="2" align="center">修改老师信息</th></tr>
                        <tr><td> 编号：</td><td><input type="text" class="tid1" disabled="disabled">
                            <input type="hidden" name="tid" class="tid1"></td></tr>
                        <tr><td> 姓名：</td><td><input type="text" name="tname" class="tna2"></td></tr>
                        <tr><td>  性别：</td><td>
                            <input type="radio" name="tsex" class="tse1" id="tsex1" value="男"/>男
                            <input type="radio" name="tsex" class="tse2" d="tsex1" value="女"/>女
                        </td></tr>
                        <tr><td colspan="2" align="center"><input type="submit" value="修改"></td></tr>
                    </table>
                </form>
            </div>
        </div>
    </c:if>
</div>
</body>
<script>
    $(function () {
      $('.but1').each(function (i) {
            $(this).click(function () {
                var id=$('.tid').eq(i).text();
                var tid=parseInt(id);
                $.ajax({
                    async:false,
                    url:"bookAndTeachersByTid",
                    data:{tid:tid},
                    type:"get",
                    dataType:"json",
                    contentType:"application/json;charset=utf-8",
                    success:function (result) {
                        // alert("进来");
                        console.log(result);
                        $(".conter_right table tr").remove();
                        var str="<tr><th>书名</th><th>状态</th></tr>";
                        for (var i=0;i<result.length;i++){
                            str+="<tr><td align='center'><input type='hidden' name='tid' class='tid4' value='"+result[i].tid+"'><input type='hidden' class='bid4' name='bid' value='"+result[i].textbook.bid+"'>"+result[i].textbook.bookname+"</td>";
                            if (result[i].state==0){
                                str+="<td class='dingwei'><span></span><button type='button' class='but4'>领取</button></td></tr>";
                            }else {
                                str+="<td>已领</td></tr>";
                            }
                        }
                        $(".conter_right table").append(str);
                    },error:function (result) {
                        alert("出错");
                    }
                })
                $(".conter_right").css("display", "block");
            })
        })

        $('.but2').each(function (i) {
            $(this).click(function () {
                $(".conter_right").css("display", "block");
                var tid=$('.tid').eq(i).text();
                var tname=$('.tname').eq(i).text();
                var tsex=$('.tsex').eq(i).text();
                $(".tid1").val(tid);
                $(".tna2").val(tname);
                if (tsex=='男'){
                    $('.tse2').removeAttr('checked');
                    $('.tse1').prop('checked', 'checked');
                }else {
                    $('.tse2').prop('checked', 'checked');
                    $('.tse1').removeAttr('checked');
                }
            })
        })
        //删除
        $('.but3').each(function (i) {
            $(this).click(function (){
                var tid=$(".tid").eq(i).text();
                if (confirm("你确定删除吗？")){
                    location.href="teacherDelete?tid="+tid;
                }
            })
        })

        $("table").on('click','.but4',function (){
            var tid=$(this).parent().prev().find("input").val();
            var bid=$(this).parent().prev().find("input").next().val();
            if (confirm("你确定领取吗？")){
                    // alert(tid+bid);
                var bookandteacher={
                    tid:tid,bid:bid
                }
                $.ajax({
                    async:true,
                    url:"bookandteacherUpdate",
                    data:bookandteacher,
                    type: "post",
                    success:function (data){
                        if (data>0){
                            $.ajax({
                                async: false,
                                url: "bookAndTeachersByTid",
                                data: {tid: tid},
                                type: "get",
                                dataType: "json",
                                contentType: "application/json;charset=utf-8",
                                success: function (result) {
                                    // alert("进来");
                                    console.log(result);
                                    $(".conter_right table tr").remove();
                                    var str = "<tr><th>书名</th><th>状态</th></tr>";
                                    for (var i = 0; i < result.length; i++) {
                                        str += "<tr><td align='center'><input type='hidden' name='tid' class='tid4' value='" + result[i].tid + "'><input type='hidden' class='bid4' name='bid' value='" + result[i].textbook.bid + "'>" + result[i].textbook.bookname + "</td>";
                                        if (result[i].state == 0) {
                                            str += "<td class='dingwei'><span></span><button type='button' class='but4'>领取</button></td></tr>";
                                        } else {
                                            str += "<td>已领</td></tr>";
                                        }
                                    }
                                    $(".conter_right table").append(str);
                                }, error: function (result) {
                                    alert("出错");
                                }
                            })
                        }
                    },error:function (data) {
                        alert("错误！")
                    }
                })
                }
        })
    })

    function showone() {
        var tna=$('.tna1').val();
        if (tna==''){
            alert("姓名不能为空！");
            return false;
        }
    }

    function showtwo() {
        var tna=$('.tna2').val();
        if (tna==''){
            alert("姓名不能为空！");
            return false;
        }
    }
</script>
</html>
