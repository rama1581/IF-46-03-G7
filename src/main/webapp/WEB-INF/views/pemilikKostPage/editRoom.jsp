<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>edit room</title>
    <link rel="stylesheet" href="/css/roomCreate.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <!-- sidebar section start -->
    <section>
        <div class="sidebar">
            <div class="image">
                <img src="/aset/Logo copy.png" alt="">
            </div>
            <ul class="nav">
                <span style="font-weight: bold;">
                    Edit data kamar
                </span><br><br>
            </ul>
        </div>
    </section>
    <!-- sidebar section end -->

    <!-- form room section start -->
    <section>
        <form action="${pageContext.request.contextPath}" method="post" contentType="application/json">
            <div class="main">
                <span style="font-size: 40px; font-weight: bolder; margin-left: 285px; margin-top: 25px;">
                    Silakan ubah dan lengkapi data kamar
                </span>
                <h2>Lengkapi data kamar agar penyewa lebih mengetahui spesifikasi kamar kost yang Anda sewakan</h2><br>
        
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
                    <textarea class="form-control mb-3 mx-1" style="height: 400px; width: 700px; margin-left: 300px;" id="address" name="address" required></textarea><br>
                </div><br>

                <button type="submit" class="btn btn-link no-border" style="margin-left: 1300px; background-color: #00BBB4;">Lanjutkan</button>
            </div>
        </form>
    <!-- form room section end -->
</body>
</html>