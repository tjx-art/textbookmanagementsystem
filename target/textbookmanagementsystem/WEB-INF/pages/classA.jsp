<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2021/1/2
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>班级</title>
    <link rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/js.js"></script>
</head>
<body>
<jsp:include page="fitting/top.jsp"/>
<jsp:include page="fitting/left.jsp"/>
<div class="conter_z">
    <div class="s_top">
        <form method="get" action="classByCName">
            &nbsp;&nbsp;班级名：&nbsp;
            <input type="text" name="cname" />
            &nbsp;&nbsp;&nbsp;
            <input type="submit" value="搜索" />
        </form>
    </div>
    <div class="s_bottom ghbs">
        <table cellpadding="0" cellspacing="0" border="0px">
            <tr>
                <th width="100px" height="30px">编号</th>
                <th width="100px" >班级名</th>
                <th width="100px" >系部</th>
                <th width="100px" >年级</th>
                <th width="100px" >操作</th>
            </tr>
            <c:forEach items="${clist}" var="c">
                <tr>
                    <td height="30px" align="center" class="cidone">${c.cid}</td>
                    <td align="center" class="cnameone">${c.cname}</td>
                    <td align="center">${c.department.dname}</td>
                    <td align="center">${c.grade.grade}</td>
                    <c:if test="${user[0].utype==0}">
                        <td align="center"><button type="button" class="but">增改</button></td>
                    </c:if>
                    <c:if test="${user[0].utype!=0}">
                    <td align="center"><button type="button" class="but1">查看</button></td>
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
                <form method="post" action="classAdd" onsubmit="return showone()">
                    <table cellpadding="0" cellspacing="0" border="0px">
                        <tr><th colspan="2" align="center">新增班级</th></tr>
                        <tr><td> 班级名：</td><td><input type="text" name="cname" class="cna1"></td></tr>
                        <tr><td>  系部：</td><td>
                            <select name="did"></select>
                        </td></tr>
                        <tr><td>  年级：</td><td>
                            <select name="gid"></select>
                        </td></tr>
                        <tr><td colspan="2" align="center"><input type="submit" value="添加"></td></tr>
                    </table>
                </form>
            </div>
            <hr color="white"/>
            <div class="conter_right_bottom">
                <form method="post" action="classUpdate" onsubmit="return showtwo()">
                    <table cellpadding="0" cellspacing="0" border="0px">
                        <tr><th colspan="2" align="center">修改班级</th></tr>
                        <tr><td> 编号：</td><td><input type="text" class="cid" disabled="disabled">
                            <input type="hidden" name="cid" class="cid"></td></tr>
                        <tr><td> 班级名：</td><td><input type="text" name="cname" class="cna2"></td></tr>
                        <tr><td>  系部：</td><td>
                            <select name="did" class=""></select>
                        </td></tr>
                        <tr><td>  年级：</td><td>
                            <select name="gid"></select>
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
        $('.but').each(function (i) {
            $(this).click(function () {
                $(".conter_right").css("display", "block");
                //查询系部
                $.ajax({
                    url:"departmentAll",
                    success:function (data) {
                        // alert("成功！");
                        console.log(data);
                        var str="";
                        for (var i=0;i<data.length;i++){
                            str+="<option value="+data[i].did+">"+data[i].dname+"</option>";
                        }
                        $('[name="did"]').append(str);
                    }
                })
                //查询年级
                $.ajax({
                    url:"gradeAll",
                    success:function (data) {
                        // alert("成功！");
                        console.log(data);
                        var str="";
                        for (var i=0;i<data.length;i++){
                            str+="<option value="+data[i].gid+">"+data[i].grade+"</option>";
                        }
                        $('[name="gid"]').append(str);
                    }
                })
                //将获取到的数据放到修改
                var cid=$(".cidone").eq(i).text();
                var cname=$(".cnameone").eq(i).text();
                // alert(cid+cname);
                $(".cid").val(cid);
                $(".cna2").val(cname);
            })
        })

        $('.but1').each(function (i) {
            $(this).click(function () {
                var id=$('.cidone').eq(i).text();
                var cid=parseInt(id);
                $.ajax({
                    url:"bookAndClassByCid",
                    data:{cid:cid},
                    type:"get",
                    success:function (result) {
                        console.log(result);
                        $(".conter_right table tr").remove();
                        var str="<tr><th>书名</th><th>状态</th></tr>";
                        for (var i=0;i<result.length;i++){
                            str+="<tr><td align='center'><input type='hidden' name='cid' class='cid4' value='"+result[i].cid+"'><input type='hidden' class='bid4' name='bid' value='"+result[i].textbook.bid+"'>"+result[i].textbook.bookname+"</td>";
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


        $("table").on('click','.but4',function (){
            var cid=$(this).parent().prev().find("input").val();
            var bid=$(this).parent().prev().find("input").next().val();
            if (confirm("你确定领取吗？")){
                // alert(tid+bid);
                var bookandteacher={
                    cid:cid,bid:bid
                }
                $.ajax({
                    async:true,
                    url:"bookandClassUpdate",
                    data:bookandteacher,
                    type: "post",
                    success:function (data){
                        if (data>0){
                            $.ajax({
                                url:"bookAndClassByCid",
                                data:{cid:cid},
                                type:"get",
                                success:function (result) {
                                    console.log(result);
                                    $(".conter_right table tr").remove();
                                    var str="<tr><th>书名</th><th>状态</th></tr>";
                                    for (var i=0;i<result.length;i++){
                                        str+="<tr><td align='center'><input type='hidden' name='cid' class='cid4' value='"+result[i].cid+"'><input type='hidden' class='bid4' name='bid' value='"+result[i].textbook.bid+"'>"+result[i].textbook.bookname+"</td>";
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
                        }
                    },error:function (data) {
                        alert("错误！")
                    }
                })
            }
        })
    })

    //判断新增是否为空
    function showone() {
        var bok=$('.cna1').val();
        // alert(bok+""+pre);
        if (bok==''){
            alert("班级名不能为空！");
            return false;
        }
    }

    //判断修改是否为空
    function showtwo() {
        var bok=$('.cna2').val();
        if (bok==''){
            alert("班级名不能为空！");
            return false;
        }
    }
</script>
</html>
