<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking list</title>
    <link rel="stylesheet" href="/css/bookingList.css" />
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
                <li class="nav-item dropdown my-3">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Tipe Kost</a>
                <ul class="dropdown-menu" >
                    <li><a class="dropdown-item" style="text-align: left;" href="./listPutra.jsp">Putra</a></li>
                    <li><a class="dropdown-item" style="text-align: left;" href="./listPutri.jsp">Putri</a></li>
                    <li><a class="dropdown-item" style="text-align: left;" href="./listCampur.jsp">Campur</a></li>
                </ul>
                </li>
                <li class="nav-item my-3">
                    <a class="nav-link" href="">
                        <img src="/aset/notification.png" alt="Icon Notif" style="width: 30px;"/>
                    </a>
                </li>
                <li class="nav-item dropdown2 my-3">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
                        <img src="/aset/ikonuser.png" alt="Icon User" style="width: 30px; margin-bottom: 10px;"/>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" style="text-align: left;" href="#">Edit Profil</a></li>
                        <li><a class="dropdown-item" style="text-align: left;" href="/booking/list">Riwayat Booking</a></li>
                        <li><a class="dropdown-item" style="text-align: left;" href="#" data-bs-toggle="modal" data-bs-target="#logoutGolivin">Logout</a></li>
                    </ul>
                </li>
                
            </ul>
        </div>
    </section>
    <!-- navbar section end -->

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
    
    <script>
        function logoutAndRedirect() {
            window.location.href = '${pageContext.request.contextPath}/logout';
        }
    </script>


    <!-- booking kos section start -->
    <section class="list_kost">
        <div class="text" style="font-size: 30px; margin-left: 280px;">
            <h1>Riwayat Transaksi</h1>
        </div>
        <div class="container my-5" >
            <!-- <div class="row border border-danger"></div> -->
            <div class="row">
                <c:forEach var="booking" items="${bookings}">
                    <div class="col-4 desc_kost my-3" style="border: 2px solid #ccc; padding: 45px; border-radius: 20px;">
                        <img src="/aset/kost1.jpg" alt="">
                        <p style="margin-top: 15px;">Room ID: ${booking.booking_id}</p>
                        <form method="get" action="/booking/${booking.booking_id}/date">
                            <button type="submit" class="my-3">
                                <b style="margin-top: 5px;">${booking.room.kost.name}</b>
                            </button>
                        </form>
                        
                        <div class="d-flex flex-column">
                            <p class="m-0">Tanggal Masuk  : ${booking.entryDate.date} ${booking.entryDate.month + 1} ${booking.entryDate.year + 1900}</p>
                            <p class="m-0">Tanggal Keluar : ${booking.exitDate.date} ${booking.exitDate.month + 1} ${booking.exitDate.year + 1900}</p>
                            <p class="m-0">Booking Status : ${booking.payment.status}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- booking kos section end -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>