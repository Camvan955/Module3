<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/5/2022
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<h1 style="text-align: center">Edit Product</h1>
<p>
    <a href="/product">
        <button class="btn btn-success">Back to Product List</button>
    </a>
</p>
    <c:if test="${mess!=null}">
        <span>${mess}</span>
    </c:if>

<form action="/product?action=edit" method="post" style="text-align: center">

    <table style="width: 500px">

        <tr>
            <td>
                <label>ID Product: </label>
            </td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td><label>Name Product:</label></td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td><label>Origin: </label></td>
            <td><input type="text" name="origin"></td>
        </tr>
        <tr>
            <td><label>Price: </label></td>
            <td><input type="text" name="price"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button class="btn btn-outline-primary">Save</button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
