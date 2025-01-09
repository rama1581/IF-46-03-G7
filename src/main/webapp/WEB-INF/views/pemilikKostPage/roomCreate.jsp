<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menambah Kost</title>
    <link rel="stylesheet" href="/css/roomCreate.css" />
    <link rel="stylesheet" href="/css/Homepage.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

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
                    <!-- Dropdown Cari Apa? -->
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
                            <li><a class="dropdown-item" href="/logout">Logout</a></li>
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
        document.querySelectorAll('a[href="/logout"]').forEach(function (logoutLink) {
        logoutLink.addEventListener('click', function (event) {
            event.preventDefault(); // Cegah redirect langsung
            const logoutModal = new bootstrap.Modal(document.getElementById('logoutModal'));
            logoutModal.show(); // Tampilkan modal konfirmasi logout
        });
    });

    // Ketika tombol "Keluar" diklik pada modal
    document.getElementById('confirmLogout').addEventListener('click', function () {
        window.location.href = "/logout"; // Ganti dengan URL logout Anda
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

    <!-- form room section start -->
    <section>
        <form action="${pageContext.request.contextPath}" method="post" contentType="application/json">
            <div class="main">
                <span style="font-size: 40px; font-weight: bolder; margin-left: 285px; margin-top: 40px;">
                    Silahkan lengkapi data kamar
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
