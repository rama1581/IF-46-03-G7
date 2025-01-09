<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifikasi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/Homepage.css" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .notification-container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .notification-item {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }
        .notification-item:last-child {
            border-bottom: none;
        }
        .notification-item strong {
            display: block;
            font-size: 16px;
            margin-bottom: 5px;
        }
        .notification-item small {
            color: #777;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position: fixed; top: 0; left: 0; right: 0; z-index: 1000; opacity: 0.75; width: 100%; padding: 10px 0;">
    <div class="container-fluid">
        <a class="navbar-brand" href="/home">
            <img src="../aset/Home.png" alt="KOST-IN" width="120px" height="40px">
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
                
                <!-- Notifikasi -->
                <li class="nav-item position-relative">
                    <a class="nav-link" href="/notifications">
                        <img id="notificationIcon" src="../aset/Bell.png" alt="Notifikasi" width="35px" height="35px">
                    </a>
                </li>


                <!-- Foto User Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="../aset/icon.png" alt="Login" width="40px" height="40px">
                    </a>
                    <ul class="dropdown-menu dropdown-menu-start dropdown-menu-end">
                        <li><a class="dropdown-item" href="../editprofileaspencari">Edit Profile</a></li>
                        <li><a class="dropdown-item" href="../booking/list">Riwayat Booking</a></li>
                        <li><a class="dropdown-item" href="../logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

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
    
<br><br><br><br>
<div class="notification-container">
    <h2 class="mb-4">Notifikasi</h2>
    <c:choose>
        <c:when test="${not empty notifications}">
            <c:forEach var="notification" items="${notifications}">
                <div class="notification-item">
                    <strong>${notification.message}</strong>
                    <small>${notification.notifyTime}</small>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p class="text-center text-muted">Tidak ada notifikasi baru.</p>
        </c:otherwise>
    </c:choose>
</div>
    
<!-- Bootstrap 5 Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/WEB-INF/views/chat.jsp" />

</body>
</html>
