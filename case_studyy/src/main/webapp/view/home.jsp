<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/9/2022
  Time: 10:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <title>Furama</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">

    <body>
    <header>
        <div class="row container-fluid">
            <div class="col-lg-2" style="display: flex">
                <a class="navbar-brand" href="#" style="margin: 3px auto">
                    <img src="image/Logo-FURAMA-RESORT.jpg" width="120px" height="100%"/>
                </a>
            </div>
            <div class="col-xl-2" style="display: flex;">
                <a class="navbar-brand" href="#" style="margin: 30px auto">
                    <img src="https://truevaluevietnam.com/wp-content/uploads/2015/10/TA_brand_logo.png" width="250px" height="100px"/>
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
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNavAltMarkup"
                        aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav ">
                        <a class="nav-link active text-white a " aria-current="page"
                           href="http://localhost:63342/module3/case_study2/facility/facility_list.html?_ijt=8jjepl9lu90nhqkti1bodo072b">FACILITY</a>
                        <a class="nav-link active text-white a" aria-current="page"
                           href="http://localhost:63342/module3/case_study2/employee/employee_list.html?_ijt=2qrr77pp9f0rveqv3ktluq4uam"
                           style="margin-left: 30px">EMPLOYEE</a>
                        <a class="nav-link active text-white a" aria-current="page"
                           href="/customer"
                           style="margin-left: 30px">CUSTOMER</a>
                        <a class="nav-link active text-white a" aria-current="page"
                           href="http://localhost:63342/module3/case_study2/contract/contractt.html?_ijt=ua916053md0u4ep395kc3rj86g"
                           style="margin-left: 30px">CONTRACT</a>
                        <a class="nav-link active text-white a" aria-current="page" href="#" style="margin-left: 30px">SERVICE</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="container-fluid">
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Nhập tên/địa chỉ khách hàng cần tìm" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Tìm</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <div class="row">
        <div class=" col-lg-2 container d-flex justify-content-center">
            <div class="sidenav m-3">
                <a href="#about">About</a>
                <a href="#About">About</a>
                <a href="#About">About</a>
                <a href="#About">About</a>
                <a href="#About">About</a>
            </div>
        </div>
        <div class="col-lg-10">
            <img src="image/furama-resort-da-nang.jpg" height="800px" width="100%"/>
        </div>
    </div>
    <div>
        <footer class="text-center text-start" style="height: 50px;width: 100%">
            <div class="text-center text-white p-3" style="background-color:#046056 ;">
                &copy;2022 Design By Nguyen Thi Cam Van
            </div>
        </footer>
    </div>

    <script src="image/furama-resort-da-nang.jpg"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    </body>
</html>