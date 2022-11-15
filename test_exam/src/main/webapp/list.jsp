<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 11/14/2022
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Danh sách phòng trọ</title>
<%--    <link href="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css" rel="stylesheet"--%>
<%--          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
<%--<link href="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css.map">--%>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css">
</head>
<body>
<div class="row">
    <h1 style="text-align: center; background-color: darkslategrey">DANH SÁCH PHÒNG TRỌ</h1>
    <h1><c:if test="${mess!=null}">
        <span>${mess}</span>
    </c:if></h1>
</div>
<div class="row" style="display: flex">
    <div  class="col-2" style="margin: 10px ">
        <a href="add.jsp">
            <button type="button" class="btn btn-outline-success">Thêm mới </button>
        </a>
    </div>
    <div class="col-10">
    </div>

</div>


</div>
<div>
    <table class="table table-primary table-striped" id="tableRoom">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Mã phòng trọ</th>
            <th scope="col">Tên người thuê trọ</th>
            <th scope="col">Số điện thoại</th>
            <th scope="col">Ngày bắt đầu thuê</th>
            <th scope="col">Hình thức thanhh toán</th>
            <th scope="col">Ghi chú</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="room" items="${roomList}" varStatus="stt">
            <tr>
                <td scope="row"> ${stt.count}</td>
                <td >${room.getId()}</td>
                <td>${room.getName()}</td>
                <td>${room.getPhoneNumber()}</td>
                <td>${room.getRentalDay()}</td>
                <td>${room.getNamePay()}</td>
                <td>${room.getNote()}</td>
                <td>
                    <a href="/customer?action=edit&id=${customer.id}">
                    <button type="button"
                            class="btn btn-primary" >Sửa
                    </button></a>
                </td>
                <td>
                    <a href="#">
                        <button type="button" onclick="infoDelete('${room.getId()}', '${room.getName()}')"
                                class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Xóa
                        </button>
                    </a>
                </td>
            </c:forEach>
            </tr>
        </tbody>
    </table>
</div>

<script src="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js" ></script>
</body>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Bạn có muốn xóa ? </span>
                <span id="deleteName" style="color: brown"></span>
            </div>
            <form action="/room" method="post">
                <div class="modal-footer">
                    <input type="text" hidden name="action" value="delete">
                    <input type="text" hidden name="id" id="deleteId">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Trở lại</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableRoom').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 3
        });
    });
</script>
</html>
