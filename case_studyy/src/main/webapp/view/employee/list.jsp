<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/9/2022
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../style.css">

</head>
<body>
<header>
    <div class="row content text-center">
        <div class="col-lg-2" style="display: flex">
            <a class="navbar-brand" href="#" style="margin: 3px auto">
                <img src="../image/Logo-FURAMA-RESORT.jpg" width="120px" height="100%"/>
            </a>
        </div>
        <div class="col-xl-2" style="display: flex;">
            <a class="navbar-brand" href="#" style="margin: 30px auto">
                <img src="../image/tripadvisor.jpg" width="250px" height="100px"/>
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
                       href="http://localhost:63342/module3/case_study2/casestudy.html?_ijt=8jjepl9lu90nhqkti1bodo072b#">HOME</a>
                    <a class="nav-link active text-white a" aria-current="page"
                       href="http://localhost:63342/module3/case_study2/facility/facility_list.html?_ijt=8jjepl9lu90nhqkti1bodo072b"
                       style="margin-left: 30px">FACILITY</a>
                    <a class="nav-link active text-white a" aria-current="page"
                       href=http://localhost:63342/module3/case_study2/customer/customer_list.html?_ijt=q6oiufk6bhm7qc2urikeofvti2
                       style="margin-left: 30px">CUSTOMER</a>
                    <a class="nav-link active text-white a" aria-current="page"
                       href="http://localhost:63342/module3/case_study2/contract/contractt.html?_ijt=arpv08nvgmcd3qdn1lqhb3pao0"
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
    <div class="row content text-center">
        <div class="col-2">
        </div>
        <div class="col-8" style="margin-top: 10px">
            <h1 style="text-align: center">EMPLOYEE LIST</h1>
        </div>
        <div class="col-2" style="margin-top: 20px">
            <a href="http://localhost:63342/module3/case_study2/employee/add_employee.html?_ijt=nv9060eg2j1nj0ah00kvmlromu">
                <button type="button" class="btn btn-outline-success">Add Employee</button>
            </a>
        </div>
    </div>
    <table class="table table-striped table-lg" style="margin: 10px 20px 20px 20px; border:1px solid #565e64">
        <thead>
        <tr style="border:1px solid #565e64; background-color: #d1d2d4">
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Day Of Birth</th>
            <th scope="col">ID Card</th>
            <th scope="col">Salary</th>
            <th scope="col">Phone Number</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">User Name</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>

            <th></th>

        </tr>
        <c:forEach var="employee" items="${employeeList}" varStatus="status">
        <tr>

            <td>${status.count}</td>
            <td><c:out value="${employee.name}"/></td>
            <td><c:out value="${employee.dayOfBirth}"/></td>
            <td><c:out value="${employee.idCard}"/></td>
            <td><c:out value="${employee.salary}"/></td>
            <td><c:out value="${employee.phoneNumber}"/></td>
            <td><c:out value="${employee.email}"/></td>
            <td><c:out value="${employee.address}"/></td>
            <td><c:out value="${employee.userName}"/></td>
<%--            <td><c:out value="${employee.positonId}"/></td>--%>
<%--            <td><c:out value="${employee.educationDegreeId}"/></td>--%>
<%--            <td><c:out value="${employee.divisionId}"/></td>--%>


        </tr>



        </c:forEach>


    </table>
</div>
</body>
</html>