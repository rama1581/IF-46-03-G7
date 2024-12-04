<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>booking</title>
    <link rel="stylesheet" href="/css/booking.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

    <!-- Title Start -->
    <div class="row">
        <div class="col-md-12">
            <div class="text" style="font-size: 30px; margin-left: 280px;">
                <h1>Pembayaran</h1>
            </div>
        </div>
    </div>
    <!-- Title End -->

    <!-- booking section start -->
    <section class="booking">
        <div class="row">
            <div class="col-6 container" style="width: 700px; height: 650px; margin-left: 295px; margin-top: 50px;">
                <div class="text3">
                    <h2>Scan QR di bawah untuk melanjutkan pembayaran</h1>
                </div>
                
                <div class="text4">
                    <h2>Kode QR akan kadaluwarsa dalam <span id="countdownDisplay">20:00</span></h2>
                </div>
                
                <script>
                    var minutes = 20;
                    var seconds = 0;
                
                    function updateCountdown() {
                        if (seconds === 0) {
                            if (minutes === 0) {
                                clearInterval(interval);
                                document.getElementById("countdownDisplay").innerText = "Waktu habis!";
                                return;
                            }
                            minutes--;
                            seconds = 59;
                        } else {
                            seconds--;
                        }
                
                        var formattedTime = (minutes < 10 ? "0" : "") + minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
                        document.getElementById("countdownDisplay").innerText = formattedTime;
                    }
                
                    // Update setiap 1 detik
                    var interval = setInterval(updateCountdown, 1000);
                </script>
                
                
                <div class="qrcode">
                    <img src="/aset/qrcode.png" alt="">
                </div>
                <!-- <div class="text4">
                    <h3>Total Pembayaran</h1>
                </div> -->
                
            </div>
            <div class="col-6 container" style="width: 700px; height: 650px; margin-right: 295px; margin-top: 50px;">
                <div class="text5">
                    <h1>Cara Membayar</h1>
                    <ul style="margin-top: 30px; margin-right: 50px;">
                        <li>Buka aplikasi m-banking atau dompet digital  yang mendukung pembayaran melalui QR</li>
                        <li>Scan QR Code disamping</li>
                        <li>Pastikan total pembayaran sudah sama dengan total pembayaran yang tertera di web</li>
                        <li>Tunggu sampai proses pembayaran selesai</li>
                        <li>Jika pembayaran dilakukan diluar batas waktu, maka pesanan otomatis dibatalkan</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    
    <!-- booking section end -->
    <!-- Button Success start -->
    <div class="row">
        <div class="col-md-12 text-center mt-4">
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#successModal">
                Saya Sudah Transfer
            </button>
        </div>
    </div>
    <!-- Button Success End -->

    <!-- Modal Success Start -->
    <div class="modal fade modal-success" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Pembayaran Berhasil</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <img src="/aset/Success.png" alt="Success Image" style="width: 100px; height: 100px;">
                    <p class="mt-3">Terima kasih! Pembayaran Anda telah berhasil.</p>
                </div>
                <div class="modal-footer justify-content-center">
                    <form action="/booking/list">
                        <button type="submit" class="btn btn-secondary">Okay</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Success End -->
    
    <script>
        function logoutAndRedirect() {
            window.location.href = '${pageContext.request.contextPath}/logout';
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>