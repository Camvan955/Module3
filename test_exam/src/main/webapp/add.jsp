<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/14/2022
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm mới phòng trọ</title>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css">
    <script src="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js" ></script>
</head>
<body>
<c:if test="${mess!=null}">
    <h4 style="color: red">${mess}</h4>
</c:if>

<div>
    <h1 style="text-align: center"> THÊM MỚI PHÒNG TRỌ</h1>
</div>
<form action="/room?action=add" method="post">
    <div>
        <div class="col-8" style="margin-left: 30%">
            <div class="form-floating col-lg-8 mb-3">
                <input type="text" class="form-control" placeholder="Tên" name="name">
                <label>Tên</label>
            </div>
            <div class="form-floating col-lg-8 mb-3">
                <input type="text" class="form-control" placeholder="Số điện thoại" name="phoneNumber">
                <label>Số điện thoại</label>
            </div>
            <div class="form-floating col-lg-8 mb-3">
                <input type="text" class="form-control" placeholder="Ngày bắt đầu thuê" name="rentalDay">
                <label>Ngày bắt đầu thuê</label>
            </div>
            <div class="form-floating col-lg-8 mb-3">
                <select class="form-select" aria-label="Default select example" id="formInput1"
                        name="idPay">
                    <option value="Chọn hình thức thanh toán" selected>Chọn hình thức thanh toán</option>
                    <option value="1">Theo tháng</option>
                    <option value="2">Theo quý</option>
                    <option value="3">Theo năm</option>
                </select>
                <label>Hình thức thanh toán</label>
            </div>
            <div class="form-floating col-lg-8 mb-3">
                <input type="text" class="form-control" placeholder=" Ghi chú" name="note">
                <label>Ghi chú</label>
            </div>
        </div>
        <div class="d-grid gap-2 col-2 mx-auto">
            <button class="btn btn-success" type="submit">Xong</button>
        </div>
    </div>
</form>
<div class="col-2" style="margin-top: 20px">
    <a href="http://localhost:8080/room">
        <button type="button" class="btn btn-outline-success" style="text-align: end">Trở về danh sách phòng
        </button>
    </a>

</div>
</body>
</html>
