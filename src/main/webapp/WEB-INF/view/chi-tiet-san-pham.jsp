<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<h1 style="text-align: center">Chi Tiet San Pham</h1>
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
<form:form action="/chi-tiet-san-pham/add" method="post" modelAttribute="ctsp">
    Id San Pham:
    <form:select path="sanPham">
        <option value=""></option>
        <form:options items="${listSanPham}"/>
    </form:select>
    <br> <br>
    Id Mau Sac:
    <form:select path="mauSac">
        <option value=""></option>
        <form:options items="${listMauSac}"/>
    </form:select>
    <br> <br>
    Id Size:
    <form:select path="size">
        <option value=""></option>
        <form:options items="${listSize}"/>
    </form:select>
    <br> <br>
    Gia Ban: <input value="${ctsp.giaBan}" name="giaBan">
    <br> <br>
    So luong ton:
    <input value="${ctsp.soLuongTon}" name="soLuongTon">
    <br> <br>
    Trang Thai:
    Hoat Dong <input type="radio" name="trangThai" value="Hoat dong" ${ctsp.trangThai == "Hoat dong" ? "checked" : ""} >
     Khong Hoat Dong <input type="radio" name="trangThai" value="Khong hoat dong" ${ctsp.trangThai == "Khong hoat dong" ? "checked" : ""}>
    <br> <br>
    <button type="submit" class="btn btn-success">Add</button>
</form:form>
<table class="table">
    <tr>
        <th>ID CTSP</th>
        <th>ID SP</th>
        <th>ID Mau Sac</th>
        <th>ID Size</th>
        <th>Gia Ban</th>
        <th>So luong ton</th>
        <th>Trang Thai</th>
        <th>Ngay Tao</th>
        <th>Ngay Sua</th>
        <th></th>
        <th>Hanh Dong</th>
        <th></th>
    </tr>
    <tr>
        <c:forEach var="sp" items="${listCtsp}">
            <tr>
        <td>${sp.id}</td>
        <td>${sp.sanPham.id}</td>
        <td>${sp.mauSac.id}</td>
        <td>${sp.size.id}</td>
        <td>${sp.giaBan}</td>
        <td>${sp.soLuongTon}</td>
        <td>${sp.trangThai}</td>
        <td>${sp.ngayTao}</td>
        <td>${sp.ngaySua}</td>
    <td> <a type="button" class="btn btn-danger"  onclick="return confirm('Do you want to delete?')" href="/chi-tiet-san-pham/delete/${sp.id}" >Delete</a></td>
    <td><a type="button" class="btn btn-success" href="/chi-tiet-san-pham/details/${sp.id}">Details</a></td>
    <td><a type="button" class="btn btn-primary" href="/chi-tiet-san-pham/view-update/${sp.id}">Update</a></td>
</tr>
        </c:forEach>
    </tr>
</table>
</body>
</html>