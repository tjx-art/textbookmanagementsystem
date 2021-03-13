<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2020/12/26
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生</title>
    <link rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/js.js"></script>
</head>
<body>
<jsp:include page="fitting/top.jsp"/>
<jsp:include page="fitting/left.jsp"/>
<div class="conter_z">
    <div class="s_top">
        <form method="get" action="studentAll">
            &nbsp;&nbsp;姓名：&nbsp;
            <input type="text" name="sname" />
            &nbsp;&nbsp;&nbsp;
            <input type="submit" value="搜索" />
        </form>
    </div>
    <div class="s_bottom ghbs">
        <table cellpadding="0" cellspacing="0" border="0px">
            <tr>
                <th width="100px" height="30px">学号</th>
                <th width="100px" >姓名</th>
                <th width="100px" >性别</th>
                <th width="100px" >班级</th>
                <th width="100px" >年级</th>
                <th width="100px" >系部</th>
                <th width="100px" >操作</th>
            </tr>
            <c:forEach items="${slist}" var="s">
                <tr>
                    <td height="30px" align="center" class="sid">${s.sid}</td>
                    <td align="center" class="sname">${s.sname}</td>
                    <td align="center" class="ssex">${s.ssex}</td>
                    <td align="center">${s.classA.cname}
                        <input type="hidden" class="cid" value="${s.classA.cid}"></td>
                    <td align="center">${s.classA.grade.grade}</td>
                    <td align="center">${s.classA.department.dname}</td>
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
                <form method="post" action="studentAdd" onsubmit="return showone()">
                    <table cellpadding="0" cellspacing="0" border="0px">
                        <tr><th colspan="2" align="center">添加学生信息</th></tr>
                        <tr><td> 姓名：</td><td><input type="text" name="sname" class="sna1"></td></tr>
                        <tr><td>  性别：</td><td>
                            <input type="radio" name="ssex" value="男" checked="checked"/>男
                            <input type="radio" name="ssex" value="女"/>女
                        </td></tr>
                        <tr><td>班级</td><td>
                            <select name="cid">

                            </select>
                        </td></tr>
                        <tr><td colspan="2" align="center"><input type="submit" value="添加"></td></tr>
                    </table>
                </form>
            </div>
            <hr color="white"/>
            <div class="conter_right_bottom">
                <form method="post" action="studentUpdate" onsubmit="return showtwo()">
                    <table cellpadding="0" cellspacing="0" border="0px">
                        <tr><th colspan="2" align="center">修改学生信息</th></tr>
                        <tr><td> 编号：</td><td><input type="text" class="sid1" disabled="disabled">
                            <input type="hidden" name="sid" class="sid1"></td></tr>
                        <tr><td> 姓名：</td><td><input type="text" name="sname" class="sna2"></td></tr>
                        <tr><td>  性别：</td><td>
                            <input type="radio" name="ssex" class="sse1" value="男"/>男
                            <input type="radio" name="ssex" class="sse2" value="女"/>女
                        </td></tr>
                        <tr><td>班级</td><td>
                            <select name="cid">

                            </select>
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
    $('.but2').each(function (i) {
        $(this).click(function () {
            $(".conter_right").css("display", "block");
            var sid=$('.sid').eq(i).text();
            var sname=$('.sname').eq(i).text();
            var ssex=$('.ssex').eq(i).text();
            $(".sid1").val(sid);
            $(".sna2").val(sname);
            $('.sse1').removeAttr("checked");
            $('.sse2').removeAttr("checked");
            if (ssex=='男'){
                $('.sse1').prop('checked', 'checked');
            }else {
                $('.sse2').prop('checked', 'checked');
            }
            $.ajax({
                url:"classAllOne",
                success:function (data) {
                    // alert("成功！");
                    console.log(data);
                    var str="";
                    for (var i=0;i<data.length;i++){
                        str+="<option value="+data[i].cid+">"+data[i].cname+"</option>";
                    }
                    $('[name="cid"]').append(str);
                }
            })
        })
    })
    //删除
    $('.but3').each(function (i) {
        $(this).click(function (){
            var sid=$(".sid").eq(i).text();
            if (confirm("你确定删除吗？")){
                location.href="studentDelete?sid="+sid;
            }
        })
    })

    $('.but1').each(function (i) {
        $(this).click(function () {
            var id=$('.cid').eq(i).val();
            $.ajax({
                url:"bookAndClassByCid",
                data:{cid:id},
                type:"get",
                success:function (result) {
                    console.log(result);
                    $(".conter_right table tr").remove();
                    var str="<tr><th>书名</th></tr>";
                    for (var i=0;i<result.length;i++){
                        str+="<tr><td align='center'>"+result[i].textbook.bookname+"</td></tr>";
                    }
                    $(".conter_right table").append(str);
                },error:function (result) {
                    alert("出错");
                }
            })
            $(".conter_right").css("display", "block");
        })
    })

})

function showone() {
    var sna=$('.sna1').val();
    if (sna==''){
        alert("姓名不能为空！");
        return false;
    }
}

function showtwo() {
    var sna=$('.sna2').val();
    if (sna==''){
        alert("姓名不能为空！");
        return false;
    }
}
</script>
</html>
