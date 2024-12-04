<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>homepage</title>
    <link rel="stylesheet" href="/css/roomCreate.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <!-- navbar section start -->
    <section class="header">
        <div class="container-fluid cont_nav" style="height: 84px;">
            <ul class="nav nav-pills justify-content-end content_nav">
                <li class="logo my-3">
                    <img src="/aset/logo.png" alt="">
                </li>
                <li class="nav-item my-3">
                    <a class="nav-link" href="./dashboardpemilik.html">Home</a>
                </li>
                <li class="nav-item my-3">
                    <a class="nav-link" href="./chatpemilik.html">Chat</a>
                </li>
                <li class="nav-item my-3">
                    <a href="notifikasipemilik.html" style="color: black; text-decoration: none;">
                        <img src="/aset/notification.png" alt="notif" style="margin-top: 9px; margin-right: 15px;">
                    </a>
                </li>
                <li class="nav-item my-3">
                    <a href="akunpemilik.html" style="color: black; text-decoration: none;">
                        <img src="/aset/ikonuser.png" alt="notif" style=" margin-top: 5px; width: 33px; margin-right: 10px;">
                    </a>
                </li>
                <li class="nav-item my-3">
                    <a href="/logout" style="color: black; text-decoration: none;">
                        <img src="/aset/logout.png" alt="userpemilik" style=" margin-top: 5px; width: 33px; margin-right: 10px;">
                    </a>
                </li>
        </div>
    </section>
    <!-- navbar section end -->

    <!-- form room section start -->
    <section>
        <form action="${pageContext.request.contextPath}" method="post" contentType="application/json">
            <div class="main">
                <span style="font-size: 40px; font-weight: bolder; margin-left: 285px; margin-top: 25px;">
                    Silakan lengkapi data kamar
                </span>
                <h2>Lengkapi kamar kos agar penyewa lebih mengetahui spesifikasi kamar yang Anda sewakan</h2><br>
        
                <span style="font-size: x-large; font-weight: bolder; margin-left: 285px; margin-top: 25px;">
                    Harga
                </span>
                <h2>Masukan harga /bulan</h2>
                <div class="form mb-3 my-1">
                    <input class="form-control" style="height: 50px; width: 300px" type="text" id="name" name="price" required>
                </div><br>

                <span style="font-size: x-large; font-weight: bolder; margin-top: 30px; margin-left: 285px;">
                    Deskripsi
                </span>
                <h2>Saran: Tulis lengkap seluruh fasilitas yang tersedia</h2>
                <div class="form mb-3 my-1">
                    <textarea class="form-control mb-3 mx-1" style="height: 400px; width: 700px; margin-left: 300px;" id="description" name="description" required></textarea><br>
                </div><br>

                <button type="submit" class="btn btn-link no-border" style="margin-left: 1300px; background-color: #00BBB4; color: black; text-decoration: none;">Lanjutkan</button>
            </div>
        </form>
    <!-- form room section end -->
</body>
</html>