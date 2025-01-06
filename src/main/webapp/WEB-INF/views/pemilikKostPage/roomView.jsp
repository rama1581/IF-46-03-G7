<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Kamar</title>
    <link rel="stylesheet" href="/css/roomView.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position: fixed; top: 0; left: 0; right: 0; z-index: 1000; opacity: 0.75; width: 100%; padding: 10px 0;">
        <div class="container-fluid">
            <a class="navbar-brand" href="/edit/kost">
                <img src="/aset/Home.png" alt="KOST-IN" width="120px" height="40px">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <!-- Menampilkan saldo -->
                <li class="nav-item">
                    <span class="nav-link text-white">
                        <c:if test="${not empty sessionScope.LOGGED_USER.balance}">
                            Saldo Anda: Rp ${sessionScope.LOGGED_USER.balance}
                        </c:if><c:forEach items="${notifications}" var="notification">
                            <div>
                                <p><strong>${notification.message}</strong></p>
                                <p><small>${notification.notifyTime}</small></p>
                            </div>
                        </c:forEach>                        
                        <c:if test="${empty sessionScope.LOGGED_USER.balance}">
                            Saldo Anda: Data tidak tersedia
                        </c:if>
                    </span>
                </li>

                    <!-- Foto User Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="/aset/icon.png" alt="Login" width="40px" height="40px">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-start dropdown-menu-end">
                            <li><a class="dropdown-item" href="/editprofileaspemilik">Edit Profile</a></li>
                            <li><a class="dropdown-item" href="../logout">Logout</a></li>
                            <li class="nav-item"> <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#helpModal">Pusat Bantuan</a></li>
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
                    <p>Selamat datang di Pusat Bantuan Kost-In! Jika Anda membutuhkan bantuan pengaturan akun, atau masalah lainnya silahkan kontak ke email kami @cs.kostin.com</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Kamar Section Start -->
    <section class="list_kost py-5">
        <div class="container">
            <div class="text-center mb-4">
                <h1>Halo, Selamat Datang</h1>
                <h2>Waktunya Mengelola Kamar</h2>
            </div>
            <div class="row g-4">
                <!-- Tambahkan Kamar -->
                <div class="col-md-4">
                    <div class="card text-center h-100">
                        <div class="card-body d-flex flex-column justify-content-center align-items-center">
                            <a href="room/create" style="color: black; text-decoration: none;">
                                <img src="/aset/plus.png" alt="Tambah Kamar" style="width: 50px;">
                                <h5 class="mt-3">Tambahkan Kamar Anda</h5>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Kamar List -->
                <c:forEach var="room" items="${rooms}">
                    <div class="col-md-4">
                        <div class="card h-100">
                            <img src="/aset/kost1.jpg" class="card-img-top" alt="Kamar">
                            <div class="card-body">
                                <h5 class="card-title">Kamar ID: ${room.room_id}</h5>
                                <p class="card-text">${room.description}</p>
                                <p class="text-success fw-bold">Rp ${room.price} / bulan</p>
                                <div class="d-flex justify-content-between">
                                    <a href="${pageContext.request.contextPath}/edit/kost/${room.kost.kost_id}/room/${room.room_id}" class="btn btn-primary w-100">
                                        Edit Kamar
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Kamar Section End -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
