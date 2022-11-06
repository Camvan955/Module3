<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/5/2022
  Time: 9:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<h1> Search Product By Name</h1>

<label>Enter name product:</label>
<input type="text" id="name">
<button type="button" class="btn btn-primary">Submit</button>
<p>
    <a style="text-decoration: none" href="/product">Back list product</a>
</p>
<p><c:if test="${mess!=null}">
    <span style="color: red">${mess}</span>
</c:if>

</p>
<table class="table table-striped">
    <tr>
        <td>Id</td>
        <td>${product.getId()}</td>
    </tr>
    <tr>
        <td>Name</td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Origon</td>
        <td>${product.getOrigin()}</td>
    </tr>
    <tr>
        <td>Price</td>
        <td>${product.getPrice()}</td>
    </tr>
</table>
</body>
</html>
