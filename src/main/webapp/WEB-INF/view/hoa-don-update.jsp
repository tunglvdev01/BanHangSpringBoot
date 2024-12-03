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
<h1>Hoa Don Update</h1>
<form action="/hoa-don/update/${hoaDon.id}" method="post">
    Id Khach Hang:
    <select name="khachHang">
        <option value=""></option>
        <c:forEach items="${listKhachHang}" var="kh">
            <option value="${kh.id}" ${hoaDon.khachHang.id == kh.id ? "selected" : ""}>${kh.hoTen}</option>
        </c:forEach>
    </select>

    <br> <br>
    Dia Chi:
    <input name="diaChi" value="${hoaDon.diaChi}" > <br> <br>
    Sdt:
    <input name="soDienThoai" value="${hoaDon.soDienThoai}"> <br> <br>
    Trang thai:
    <input type="radio" name="trangThai" value="hoat dong" ${hoaDon.trangThai == "hoat dong" ? "checked" : ""} >
    Hoat dong
    <input type="radio" name="trangThai" value="khong hoat dong" ${hoaDon.trangThai == "khong hoat dong" ? "checked" : ""} >
    Khong hoat dong <br> <br>



    <button type="submit" class="btn btn-success">Update</button>
</form>
</body>
</html>