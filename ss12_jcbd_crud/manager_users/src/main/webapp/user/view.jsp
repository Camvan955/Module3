<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/7/2022
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
</head>
<body>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    <td>${user.getId()}</td>
    <td>${user.getName()}</td>
    <td>${user.getEmail()}</td>
    <td>${user.getCountry()}</td>


</table>

</body>
</html>