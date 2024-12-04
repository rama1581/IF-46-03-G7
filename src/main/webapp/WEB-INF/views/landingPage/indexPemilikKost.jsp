<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>homepage</title>
    <link rel="stylesheet" href="/css/dashboardpemilik.css" />
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
                    <a href="#" data-bs-toggle="modal" data-bs-target="#logoutGolivin">
                        <img src="/aset/logout.png" alt="userpemilik" style=" margin-top: 5px; width: 33px; margin-right: 10px;">
                    </a>
                </li>
        </div>
    </section>
    <!-- navbar section end -->

    <!-- kos section start -->
    <section class="list_kost">
        <div class="text" style="font-size: 30px; margin-left: 280px;">
            <h1>Halo, selamat datang di Go-Livin</h1>
        </div>
        <div class="text2" style="font-size: 20px; margin-left: 280px;">
            <h2>Waktunya Mengelola Properti</h2>
        </div>
        <div class="container my-5">
            <!-- <div class="row border border-danger"></div> -->
            <div class="row">
                <div class="col-4 addkos my-3">
                    <button class="button btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/edit/kost/create'" style="border: none;">
                        <img src="/aset/plus.png" alt="Data kos" style="width: 50px; ">
                        <br>Tambahkan Kost Anda<br>
                    </button>                    
                </div>
                <c:forEach var="kost" items="${kosts}">
                    <div class="col-4 desc_kost my-3"style="border: 2px solid #ccc; padding: 45px; border-radius: 20px;">
                        <img src="/aset/kost1.jpg" alt="">
                        <p style="margin-top: 15px;">Kost ID: ${kost.kost_id}</p>
                        <form method="get" action="/edit/kost/${kost.kost_id}/room">
                            <button type="submit" class="my-3">
                                <b>${kost.name}</b>
                            </button>
                        </form>
                        <button class="buttonedit">
                            <a href="room/create" style="color: black; text-decoration: none;">
                                <b>Edit Kost</b>
                            </a>
                        </button>
                        <div class="d-flex flex-column" style="margin-top: 10px;">
                            <p class="m-0">Khusus Putra? ${kost.allowedMale}</p>
                            <p class="m-0">Khusus Putri? ${kost.allowedFemale}</p>
                            <p class="m-0">${kost.address}</p>
                            <p>Rp 1.100.000 / bulan</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- kos section end -->

    <!-- Modal Logout Start -->
    <section>
        <div class="modal logout" id="logoutGolivin" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content shadow-lg">
                    <div class="modal-header bg-gray-200">
                        <h5 class="modal-title text-xm font-weight-bold text-info text-uppercase" id="logoutModalLabel">Keluar</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Anda yakin ingin keluar?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light shadow-lg waves-effect" data-bs-dismiss="modal">
                            <i class="fas fa-window-close"></i>Batal
                        </button>
                        <a type="button" class="btn btn-info shadow-lg waves-effect" onclick="logoutAndRedirect()">
                            <i class="fas fa-sign-out-alt"></i>Ya, keluar
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Modal Logout End -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script>
        function logoutAndRedirect() {
            window.location.href = '${pageContext.request.contextPath}/logout';
        }
    </script>
</body>
</html>

