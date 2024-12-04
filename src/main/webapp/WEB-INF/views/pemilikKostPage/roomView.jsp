<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>room view</title>
    <link rel="stylesheet" href="/css/roomView.css" />
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
                    Data Kamar
                </span><br><br>
            </ul>
        </div>
    </section>
    <!-- sidebar section end -->

    <!-- kos section start -->
    <section class="list_kost">
        <div class="text" style="font-size: 30px; margin-left: 280px;">
            <h1>Halo, selamat datang</h1>
        </div>
        <div class="text2" style="font-size: 20px; margin-left: 280px;">
            <h2>Waktunya Mengelola Kamar</h2>
        </div>
        <div class="container my-5">
            <div class="row">
                <div class="col-4 addkos my-3">
                    <button class="button">
                        <a href="room/create" style="color: black; text-decoration: none;">
                            <img src="/aset/plus.png" alt="Data kos" style="width: 50px;">
                            <br>Tambahkan Kamar Anda</br>
                        </a>
                    </button>
                </div>
                <c:forEach var="room" items="${rooms}">
                    <div class="col-4 desc_kost my-3" style="border: 2px solid #ccc; padding: 33px; border-radius: 20px;">
                        <img src="/aset/kost1.jpg" alt="">
                        <button class="my-3">
                            <b>${room.room_id}</b>
                        </button>
                        <button class="my-3">
                            <b>Edit Kamar</b>
                        </button>
                        <div class="d-flex flex-column">
                            <p class="m-0">${room.description}</p>
                            <p>Rp ${room.price} / bulan</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- kos section end -->


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>

