<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h1 style="text-align: center">Quan Ly Ban Hang</h1>
<nav class="navbar navbar-expand-lg bg-body-tertiary" >
    <div class="container-fluid">
        <a class="navbar-brand" href="/san-pham/hien-thi">San Pham</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/mau-sac/hien-thi">Mau Sac</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/khach-hang/hien-thi">Khach Hang</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/size/hien-thi">Size</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/danh-muc/hien-thi">Danh Muc</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/hoa-don/hien-thi">Hoa Don</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/doa-don-chi-tiet/hien-thi">Hoa Don Chi Tiet</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/chi-tiet-san-pham/hien-thi">Chi Tiet San Pham</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<h1>Khach Hang</h1>
<form action="/khach-hang/add" method="post">
    Ho Ten:
    <input name="hoTen" value="${khachHang.hoTen}"> <br> <br>
    Dia chi:
    <input name="diaChi" value="${khachHang.diaChi}"> <br> <br>
    SDT:
    <input name="sdt" value="${khachHang.sdt}"> <br> <br>
    Trang thai:
    <input type="radio" name="trangThai" value="Hoat dong" ${khachHang.trangThai == "Hoat dong" ? "checked" : ""} >
    Hoat dong
    <input type="radio" name="trangThai" value="Khong hoat dong" ${khachHang.trangThai == "Khong hoat dong" ? "checked" : ""} >
    Khong hoat dong <br> <br>
<%--    Ngay Tao:--%>
<%--    <input name="ngayTao" value="${khachHang.ngayTao}" type="date">--%>
<%--    <br> <br>--%>
<%--    Ngay Sua:--%>
<%--    <input name="ngaySua" value="${khachHang.ngaySua}" type="date">--%>
    <br> <br>
    <button type="submit" class="btn btn-success">Add</button>
</form>
<table class="table">
    <tr>
        <th>Id</th>
        <th>Ho Ten</th>
        <th>Dia Chi</th>
        <th>SDT</th>
        <th>Trang Thai</th>
        <th>Ngay Tao</th>
        <th>Ngay Sua</th>
        <th></th>
        <th>Hanh Dong</th>
        <th></th>
    </tr>
    <tr>
        <c:forEach var="kh" items="${listKhachHang}">
    <tr>
        <td>${kh.id}</td>
       <td>${kh.hoTen}</td>
       <td>${kh.diaChi}</td>
       <td>${kh.sdt}</td>
       <td>${kh.trangThai}</td>
       <td>${kh.ngayTao}</td>
       <td>${kh.ngaySua}</td>
    <td> <a type="button" class="btn btn-danger"  onclick="return confirm('Do you want to delete?')" href="/khach-hang/delete/${kh.id}" >Delete</a></td>
    <td><a type="button" class="btn btn-success" href="/khach-hang/details/${kh.id}">Details</a></td>
    <td><a type="button" class="btn btn-primary" href="/khach-hang/view-update/${kh.id}">Update</a></td>
    </tr>
    </c:forEach>
    </tr>
</table>
</body>
</html>