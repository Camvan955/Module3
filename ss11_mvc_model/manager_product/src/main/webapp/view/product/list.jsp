<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/4/2022
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<h1 style="text-align: center; margin-top: 20px">List Product</h1>
<a href="/product?action=add">
    <button class="btn btn-outline-success"> Add Product</button>
</a>
<table class="table table-striped" style="margin-top: 40px">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Origin</th>
        <th>Price</th>
        <th colspan="3"></th>
    </tr>

    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getOrigin()}</td>
            <td>${product.getPrice()}</td>
            <td>
                <a href="/controller-product"><button class="btn btn-primary">View</button></a>
            </td>
            <td>
                <button class="btn btn-primary">Edit</button>
            </td>
            <td>
                <button class="btn btn-primary">Delete</button>
            </td>
        </tr>

    </c:forEach>
</table>
</body>
</html>