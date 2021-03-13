<%--
  Created by IntelliJ IDEA.
  User: tjx
  Date: 2020/12/26
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>登入</title>
    <link rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<div class="bg">
    <div class="box1">
        <form action="login" method="post">
            <table border="0px" cellspacing="0" class="table">
                <th colspan="3" height="50px">
                    <font color="" size="7" face="华文行楷">系&nbsp;统&nbsp;登&nbsp;录</font><br /><br />
                </th>
                <tr>
                    <td width="100px" align="right">用户名：</td>
                    <td><input type="text" name="username" placeholder="请输入用户名"
                               onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]+/g,'')"/></td>
                </tr>
                <tr>
                    <td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                    <td><input type="password" name="password" placeholder="请输入密码" /></td>
                </tr>
                <tr>
                    <td align="right">验证码：</td>
                    <td><input type="text" name="cod"  placeholder="验证码" size="4"  style="vertical-align:top;margin-top: 2px;"
                               onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9]+/g,'')"/>&nbsp;&nbsp;
                        <img src="code" alt="加载中" title="看不清，换一张" onclick="changeCode(this)"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit"  value="登        录" class="submit" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
<script>
    $(function () {
        $('[type="submit"]').click(function () {
            var username=$('[name="username"]').val();
            var password=$('[name="password"]').val();
            var cod=$('[name="cod"]').val();

            if (username==''||password==''||cod==''){
                alert("不能为空！");
                return false;
            }
         })
    })

    function changeCode(obj){
        $('[name="cod"]').val('');
        obj.src="code?"+Math.random();
    }

</script>
</html>

