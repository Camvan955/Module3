<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/10/2022
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<title>Customer List</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<header>
    <div class="row container-fluid">
        <div class="col-lg-2" style="display: flex">
            <a class="navbar-brand" href="#" style="margin: 3px auto">
                <img src="https://printgo.vn/uploads/file-logo/1/512x512.b34453a20c19849144c890211fcce945.ai.1.png"
                     width="120px" height="100%"/>
            </a>
        </div>
        <div class="col-xl-2" style="display: flex;">
            <a class="navbar-brand" href="#" style="margin: 30px auto">
                <img src="https://truevaluevietnam.com/wp-content/uploads/2015/10/TA_brand_logo.png" width="250px"
                     height="100px"/>
            </a>
        </div>
        <div class="col-xl-5" style="display: flex">
            <div style="width: 50%; margin: auto">
                <p style="margin: 20px auto">103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District,
                    Danang
                    City, Vietnam</p>
                <p style="margin: 5px auto">7,0 km from Danang Airport</p>
            </div>
        </div>
        <div class="col-xl-3" style="text-align: left;margin-top: 15px; padding-left: 20px">
            <p style="margin: 7px auto"> Tel: 84-236-3847 333/888</p>
            <p style="margin: 5px auto"> Email: reservation@furamavietnam.com</p>
        </div>
    </div>
</header>
<div>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #046056">
        <div class="col-lg-2"></div>
        <div class="col-lg-7 container-fluid">
            <a class="navbar-brand" href="#"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ">
                    <a class="nav-link active text-white a" aria-current="page"
                       href="http://localhost:8080/view/home.jsp">HOME</a>
                    <a class="nav-link active text-white a" aria-current="page"
                       href="http://localhost:63342/module3/case_study2/facility/facility_list.html?_ijt=8jjepl9lu90nhqkti1bodo072b"
                       style="margin-left: 30px">FACILITY</a>
                    <a class="nav-link active text-white a" aria-current="page"
                       href="http://localhost:63342/module3/case_study2/employee/employee_list.html?_ijt=2qrr77pp9f0rveqv3ktluq4uam"
                       style="margin-left: 30px">EMPLOYEE</a>
                    <a class="nav-link active text-white a" aria-current="page"
                       href="http://localhost:63342/module3/case_study2/contract/contractt.html?_ijt=4e572asiqjus9a0tu0c2hscdd7"
                       style="margin-left: 30px">CONTRACT</a>
                    <a class="nav-link active text-white a" aria-current="page" href="#" style="margin-left: 30px">SERVICE</a>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="container-fluid">
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Nhập tên khách hàng cần tìm"
                           aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Tìm</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<div>
    <h1 style="text-align: center; margin-top: 20px"> CẬP NHẬT THÔNG TIN KHÁCH HÀNG</h1>

    <form action="/customer?action=edit" method="post">
        <div>
            <span hidden>ID</span>
            <input type="text" hidden name="id" value="${customer.getId()}">
            <span>Tên</span>
            <input type="text" name="name" value="${customer.getName()}"><br>
            <span>Ngày sinh</span>
            <input type="date" name="birthday" value="${customer.getBirthday()}"><br>
            <span>Giới tính</span>
            <span>Nam</span>
            <input type="radio" name="gender" value="true">
            <span>Nữ</span>
            <input type="radio" name="gender" value="false"><br>
            <span>Số CMND</span>
            <input type="text" name="idCard" value="${customer.getIdCard()}"><br>
            <span>Số điện thoại</span>
            <input type="text" name="phoneNumber" value="${customer.getPhoneNumber()}"><br>
            <span>Email</span>
            <input type="text" name="email" value="${customer.getEmail()}"><br>
            <span>Địa chỉ</span>
            <input type="text" name="address" value="${customer.getAddress()}"><br>
            <span>Loại khách</span>
            <select name="customerTypeId">
                <option value="1">Diamond</option>
                <option value="2">Platinium</option>
                <option value="3">Gold</option>
                <option value="4">Silver</option>
                <option value="5">Member</option>
            </select>

        </div>
        <div class="d-grid gap-2 col-2 mx-auto">
            <button class="btn btn-success" type="submit">Cập nhật</button>
        </div>
    </form>
</div>
</body>
</html>
