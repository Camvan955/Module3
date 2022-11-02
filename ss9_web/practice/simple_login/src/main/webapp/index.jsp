<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/2/2022
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style type="text/css">
    .login {
        height:280px; width:280px;
        margin: auto;
        padding:10px;
        border:1px #CCC solid;
    }
    .login input {
        padding:5px; margin:5px;
    }
    .login{
        text-align: center;
    }
</style>
<body>
<form method="post" action="/login" >
    <div class="login" >
        <h2>Login</h2>
        <input type="text" name="username" size="30"  placeholder="username" />
        <input type="password" name="password" size="30" placeholder="password" />
        <input type="submit" value="Sign in"/>
    </div>
</form>
</body>
</html>
