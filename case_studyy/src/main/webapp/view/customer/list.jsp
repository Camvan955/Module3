<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/9/2022
  Time: 10:19 AM
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
                <img src="view/image/Logo-FURAMA-RESORT.jpg" width="120px" height="100%"/>
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
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<div>
    <div class="row">
        <div class="col-2">
        </div>
        <div class="col-8" style="margin-top: 10px">
            <h1 style="text-align: center">CUSTOMER LIST</h1>
        </div>
        <div class="col-2" style="margin-top: 20px">
            <a href="view/customer/add.jsp">
                <button type="button" class="btn btn-outline-success">Thêm mới khách hàng</button>
            </a>
        </div>
    </div>
    <table class="table table-striped table-lg" style="margin-top: 10px">
        <thead>
        <tr>
            <th>STT</th>
            <th hidden>ID</th>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Giới tính</th>
            <th>Số CMND</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Địa chỉ</th>
            <th>Loại khách</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerList}" varStatus="stt">
            <tr>
                <th scope="row">${stt.count}</th>
                <td hidden>${customer.getId()}</td>
                <td>${customer.getName()}</td>
                <td>${customer.getBirthday()}</td>
                <td>${customer.isGender() == true ? "Nam" : "Nữ"}</td>
                <td>${customer.getIdCard()}</td>
                <td>${customer.getPhoneNumber()}</td>
                <td>${customer.getEmail()}</td>
                <td>${customer.getAddress()}</td>
                <td>${customer.getCustomerTypeId()}</td>
                <td>
                    <a href="/customer?action=edit&id=${customer.id}"
                       class="btn btn-primary btn-lg ms-2 text-light">Cập nhật</a>
                </td>
                <td>
                    <button type="button" onclick="infoDelete('${customer.getId()}', '${customer.getName()}')"
                            class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Xóa
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Bạn có muốn xóa khách hàng? </span>
                <span id="deleteName" style="color: brown"></span>
            </div>
            <form action="/customer" method="post">
                <div class="modal-footer">
                    <input type="text" hidden name="action" value="delete">
                    <input type="text" hidden name="deleteId" id="deleteId">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</html>