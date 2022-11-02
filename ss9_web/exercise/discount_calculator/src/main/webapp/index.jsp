<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/2/2022
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
    <title>Product Discount Calculator</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
<body>
<h2>Product Discount Calculator </h2>
<form action="/display_discount" method="post">
    <label>Product Description:</label><br/>
    <input type="text" name="productDescription" placeholder="Enter product description"/><br/>
    <label> List Price:</label><br/>
    <input type="text" name="listPrice" placeholder="Enter list price"/><br/>
    <label>Discount Percent:</label><br/>
    <input type="text" name="discountPercent" placeholder="Enter discount percent(%) "/><br/>
    <input type="submit" id="/display_discount" value="Calculate Discount"/><br/>

</form>
</body>
</html>
