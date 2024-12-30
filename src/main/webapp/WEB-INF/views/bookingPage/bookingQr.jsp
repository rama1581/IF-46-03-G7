<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verifikasi Pembayaran</title>
    <link rel="stylesheet" href="/css/booking.css" />
    <link rel="stylesheet" href="/css/Homepage.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="Booking">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position: fixed; top: 0; left: 0; right: 0; z-index: 1000; opacity: 0.75; width: 100%; padding: 10px 0;">
        <div class="container-fluid">
            <a class="navbar-brand" href="/home">
                <img src="${pageContext.request.contextPath}/aset/Home.png" alt="KOST-IN" width="120px" height="40px">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <!-- Dropdown Cari Apa? -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Cari Apa?
                        </a>
                        <ul class="dropdown-menu dropdown-menu-start" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="../putri">Kost Wanita</a></li>
                            <li><a class="dropdown-item" href="../putra">Kost Pria</a></li>
                            <li><a class="dropdown-item" href="../campur">Kost Campur</a></li>
                        </ul>
                    </li>
                    <!-- Pusat Bantuan -->
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#helpModal">Pusat Bantuan</a>
                    </li>
                    
                    <!-- Dropdown Notifikasi dengan Toggler -->
                    <li class="nav-item position-relative">
                        <a class="nav-link" href="#" id="notificationToggle">
                            <img src="${pageContext.request.contextPath}/aset/Bell.png" alt="Notifikasi" width="35px" height="35px">
                        </a>
                    </li>
                    
                    <!-- Pesan notifikasi di luar navbar -->
                    <div id="notificationMessage" 
                    style="position: fixed; bottom: 20px; left: 50%; transform: translateX(-50%);
                        background-color: rgba(0, 0, 0, 0.8); color: white; font-size: 18px;
                        padding: 10px 30px; border-radius: 25px; display: none; z-index: 1000;
                        white-space: nowrap; min-width: 200px; text-align: center;">
                    </div>

                    <script>
                    // JavaScript untuk mengatur toggle notifikasi
                    let isNotificationEnabled = false; // Status awal: Notifikasi dimatikan

                    document.getElementById('notificationToggle').addEventListener('click', function (e) {
                    e.preventDefault(); // Mencegah reload halaman
                    const messageElement = document.getElementById('notificationMessage');

                    // Toggle status notifikasi
                    isNotificationEnabled = !isNotificationEnabled;

                    if (isNotificationEnabled) {
                        messageElement.textContent = "Notifikasi dinyalakan";
                        messageElement.style.display = "block";
                    } else {
                        messageElement.textContent = "Notifikasi dimatikan";
                        messageElement.style.display = "block";
                    }

                    // Sembunyikan pesan setelah 3 detik
                    setTimeout(() => {
                        messageElement.style.display = "none";
                    }, 3000);
                    });
                    </script>
                    <!-- Foto User Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="${pageContext.request.contextPath}/aset/icon.png" alt="Login" width="40px" height="40px">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-start dropdown-menu-end">
                            <li><a class="dropdown-item" href="../editprofile">Edit Profile</a></li>
                            <li><a class="dropdown-item" href="../booking/list">Riwayat Booking</a></li>
                            <li><a class="dropdown-item" href="../logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- navbar section end -->

   <!-- Modal Konfirmasi Logout -->
   <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="logoutModalLabel">Konfirmasi Logout</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            Apakah Anda yakin ingin keluar?
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
            <button id="confirmLogout" class="btn btn-danger">Keluar</button>
            </div>
        </div>
    </div>
</div>  
<script>
    // Tangkap tombol logout di dropdown dan tambahkan event listener
        document.querySelectorAll('a[href="../logout"]').forEach(function (logoutLink) {
        logoutLink.addEventListener('click', function (event) {
            event.preventDefault(); // Cegah redirect langsung
            const logoutModal = new bootstrap.Modal(document.getElementById('logoutModal'));
            logoutModal.show(); // Tampilkan modal konfirmasi logout
        });
    });

    // Ketika tombol "Keluar" diklik pada modal
    document.getElementById('confirmLogout').addEventListener('click', function () {
        window.location.href = "../logout"; // Ganti dengan URL logout Anda
    });
</script>

    <!-- Modal Pusat Bantuan -->
    <div class="modal fade" id="helpModal" tabindex="-1" aria-labelledby="helpModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="helpModalLabel">Pusat Bantuan</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Selamat datang di Pusat Bantuan Kost-In! Jika Anda membutuhkan bantuan terkait pencarian kost, pengaturan akun, atau masalah lainnya silahkan kontak ke email kami @cs.kostin.com</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                </div>
            </div>
        </div>
    </div>

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
        <div class="container">
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
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <jsp:include page="/WEB-INF/views/chat.jsp" />
</body>
</html> 