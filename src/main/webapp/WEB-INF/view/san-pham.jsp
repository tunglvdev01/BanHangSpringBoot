<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>San Pham</title>

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
    <h5>Add San Pham</h5>
<form action="/san-pham/add" method="post">
    Ma san pham:
    <input name="maSanPham" value="${sanPham.maSanPham}"> <br> <br>
    Ten san pham:
    <input name="tenSanPham" value="${sanPham.tenSanPham}"> <br> <br>
    Trang thai:
    <input type="radio" name="trangThai" value="hoat dong" ${sanPham.trangThai == "hoat dong" ? "checked" : ""} >
    Hoat dong
    <input type="radio" name="trangThai" value="khong hoat dong" ${sanPham.trangThai == "khong hoat dong" ? "checked" : ""} >
    Khong hoat dong <br> <br>
    Danh Muc:
    <select name="danhMuc" >
        <option value=""></option>
        <c:forEach items="${listDanhMuc}" var="ld">
            <option value="${ld.id}" ${sanPham.danhMuc.id == ld.id ? "selected" : ""}>${ld.tenDanhMuc}</option>
        </c:forEach>
    </select>
    <br> <br>
    <button type="submit" class="btn btn-success">Add</button>
</form>
  <table class="table">
      <tr>
          <th>Id</th>
          <th>Ma SP</th>
          <th>Ten Sp</th>
          <th>Trang Thai</th>
          <th>Ngay Tao</th>
          <th>Ngay Sua</th>
          <th>Danh Muc</th>
          <th></th>
          <th>Hanh Dong</th>
          <th></th>
      </tr>
      <tr>
          <c:forEach var="sp" items="${listSanPham}">
      <tr>
        <td>${sp.id}</td>
          <td>${sp.maSanPham}</td>
          <td>${sp.tenSanPham}</td>
          <td>${sp.trangThai}</td>
          <td>${sp.ngayTao}</td>
          <td>${sp.ngaySua}</td>
          <td>${sp.danhMuc.tenDanhMuc}</td>
      <td> <a type="button" class="btn btn-danger"  onclick="return confirm('Do you want to delete?')" href="/san-pham/delete/${sp.id}" >Delete</a></td>
      <td><a type="button" class="btn btn-success" href="/san-pham/details/${sp.id}">Details</a></td>
      <td><a type="button" class="btn btn-primary" href="/san-pham/view-update/${sp.id}">Update</a></td>
      </tr>
      </c:forEach>
      </tr>
  </table>
</body>
</html>