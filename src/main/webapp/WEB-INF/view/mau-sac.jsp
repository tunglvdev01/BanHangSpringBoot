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
    <h1>Mau Sac</h1>
    <form action="/mau-sac/add" method="post">
        Ma mau:
        <input name="maMau" value="${mauSac.maMau}"> <br> <br>
        Ten mau:
        <input name="tenMau" value="${mauSac.tenMau}"> <br> <br>
        Trang thai:
        <input type="radio" name="trangThai" value="Hoat Dong" ${mauSac.trangThai == "Hoat Dong" ? "checked" : ""} >
        Hoat dong
        <input type="radio" name="trangThai" value="Khong Hoat Dong" ${mauSac.trangThai == "Khong Hoat Dong" ? "checked" : ""} >
        Khong hoat dong <br> <br>

        <br> <br>
        <button type="submit" class="btn btn-success">Add</button>
    </form>
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Ma Mau</th>
            <th>Ten Mau</th>
            <th>Trang Thai</th>
            <th>Ngay Tao</th>
            <th>Ngay Sua</th>
            <th></th>
            <th>Hanh Dong</th>
            <th></th>
        </tr>
        <tr>
            <c:forEach var="mau" items="${listMau}">
                <tr>
        <td>${mau.id}</td>
         <td>${mau.maMau}</td>
         <td>${mau.tenMau}</td>
         <td>${mau.trangThai}</td>
         <td>${mau.ngayTao}</td>
         <td>${mau.ngaySua}</td>
        <td><a type="button" class="btn btn-danger" href="/mau-sac/delete/${mau.id}"
         onclick="return confirm('Do you want to delete?')">Delete</a></td>
        <td><a type="button" class="btn btn-success" href="/mau-sac/view-update/${mau.id}">Update</a></td>
        <td><a type="button" class="btn btn-primary" href="/mau-sac/details/${mau.id}">Details</a></td>
    </tr>
            </c:forEach>
        </tr>
    </table>
</body>
</html>