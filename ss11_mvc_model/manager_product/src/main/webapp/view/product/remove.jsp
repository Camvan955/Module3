<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/6/2022
  Time: 12:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Remove Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

</head>
<body>
<form action="/product?action=remove" method="post">
    <h3>Do you want delete product?</h3>
    <table>
        <tr>
            <td>Id</td>
            <th>Name</th>
            <th>Origin</th>
            <th>Price</th>
        </tr>

        <tr>
            <td><input type="text" name="id" value="${product.getId()}"></td>
            <td><input type="text" name="name" value="${requestScope["product"].getName()}"></td>
            <td><input type="text" name="origin" value="${requestScope["product"].getOrigin()}"></td>
            <td><input type="text" name="price" value="${requestScope["product"].getPrice()}"></td>
        </tr>
    </table>
    <button>Remove</button>
</form>
<a href="/product">
    <button>Back to Customer List</button>
</a>
</body>
</html>
