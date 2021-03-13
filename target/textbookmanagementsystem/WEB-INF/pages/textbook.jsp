<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/1/2
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>教材</title>
    <link rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/js.js"></script>
</head>
<body>
<jsp:include page="fitting/top.jsp"/>
<jsp:include page="fitting/left.jsp"/>
<div class="conter_z">
    <div class="s_top">
        <form method="get" action="textbookAll">
            &nbsp;&nbsp;教材名：&nbsp;
            <input type="text" name="bookname" />
            &nbsp;&nbsp;&nbsp;
            <input type="submit" value="搜索" />
        </form>
    </div>
    <div class="s_bottom ghbs">
        <table cellpadding="0" cellspacing="0" border="0px" style="padding: 5px 5px">
            <tr>
                <th width="100px" height="30px">编号</th>
                <th width="100px" >教材名</th>
                <th width="150px" >出版社</th>
                <th width="200px" >添加时间</th>
                <c:if test="${user[0].utype==0}">
                    <th width="100px" >操作</th>
                </c:if>
            </tr>
            <c:forEach items="${booklist}" var="book">
                <tr>
                    <td height="30px" align="center" class="bid">${book.bid}</td>
                    <td align="center" class="bookname">${book.bookname}</td>
                    <td align="center" class="press">${book.press}</td>
                    <td align="center">${book.bdate}</td>
                    <c:if test="${user[0].utype==0}">
                        <td align="center">
                            <button type="button" class="but">增改</button>
                            <button type="button" class="delete">删除</button>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="conter_right">
        <div class="conter_right_top">
            <form method="post" action="textbookAdd" onsubmit="return showone()">
                <table cellpadding="0" cellspacing="0" border="0px">
                    <tr><th colspan="2" align="center">添加</th></tr>
                    <tr><td> 教材名：</td><td><input type="text" name="bookname" class="bok"></td></tr>
                    <tr><td>  出版社：</td><td> <input type="text" name="press" class="pre"></td></tr>
                    <tr><td colspan="2" align="center"><input type="submit" value="添加"></td></tr>
                </table>
            </form>
        </div>
        <hr color="white"/>
        <div class="conter_right_bottom">
            <form method="post" action="textbookUpdate" onsubmit="return showtwo()">
                <table cellpadding="0" cellspacing="0" border="0px">
                    <tr><th colspan="2" align="center">修改</th></tr>
                    <tr><td> 编号：</td><td><input type="text" class="bid1" disabled="disabled">
                        <input type="hidden" name="bid" class="bid2"></td></tr>
                    <tr><td> 教材名：</td><td><input type="text" name="bookname" id="bookname"></td></tr>
                    <tr><td>  出版社：</td><td> <input type="text" name="press" id="press"></td></tr>
                    <tr><td colspan="2" align="center"><input type="submit" value="修改"></td></tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        $('.but').each(function (i) {
            $(this).click(function (){
                var bid=$(".bid").eq(i).text();
                var bookname=$(".bookname").eq(i).text();
                var press=$(".press").eq(i).text();
                // alert(bid+" "+bookname+" "+press);
                $(".conter_right").css("display","block");
                $(".bid1").val(bid);
                $(".bid2").val(bid);
                $("#bookname").val(bookname);
                $("#press").val(press);
            })
        })

        $('.delete').each(function (i) {
            $(this).click(function (){
                var bid=$(".bid").eq(i).text();
                if (confirm("你确定删除吗？")){
                location.href="textbookDelete?bid="+bid;
                }
            })
        })

    })

    function showone() {
        var bok=$('.bok').val();
        var pre=$('.pre').val();
        // alert(bok+""+pre);
        if (bok==''||pre==''){
            alert("内容不能为空！");
            return false;
        }
    }

    function showtwo() {
        var id=$('#bid').val();
        var bookname=$('#bookname').val();
        // var press=$('#press').val();
        if (id==''||bookname==''||press==''){
            alert("内容不能为空！");
            return false;
        }
    }
</script>
</html>
