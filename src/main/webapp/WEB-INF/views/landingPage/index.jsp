<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selamat Datang di KOST-IN!</title>
    <link rel="stylesheet" href="css/Homepage.css" />
    <!-- <link rel="stylesheet" href="Home.css" /> -->
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
</head>
<body class="home">
        <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position: fixed; top: 0; left: 0; right: 0; z-index: 1000; opacity: 0.75; width: 100%; padding: 10px 0;">
        <div class="container-fluid">
            <a class="navbar-brand" href="../">
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
                        <!-- Tambahkan class dropdown-menu-start agar dropdown muncul di kiri -->
                        <ul class="dropdown-menu dropdown-menu-start" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="../login">Kost Perempuan</a></li>
                            <li><a class="dropdown-item" href="../login">Kost Laki-Laki</a></li>
                            <li><a class="dropdown-item" href="../login">Kost Campur</a></li>
                        </ul>
                    </li>
                     <!-- Pusat Bantuan -->
                     <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#helpModal">Pusat Bantuan</a>
                    </li>

                    <!-- Dropdown Foto User -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="../aset/icon.png" alt="Login" width="40px" height="40px">
                        </a>
                        <!-- Tambahkan class dropdown-menu-start agar dropdown muncul di kiri -->
                        <ul class="dropdown-menu dropdown-menu-start dropdown-menu-end">
                            <li><a class="dropdown-item" href="../login">Masuk</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

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
    
   <!-- Hero Section -->
    <header class="hero bg-cover bg-center text-white">
        <div class="container d-flex justify-content-start align-items-center" style="height: 100%; margin-left: 150px;">
            <div class="text-start">
                <h1 class="display-4 mb-3">Mau Cari Kos?</h1>
                <p class="lead mb-4">Dapatkan Infonya Dan Langsung Sewa Di Kost-In Aja</p>
                <!-- Search bar -->
                <form action="/kost/search" method="get" class="d-flex justify-content-start">
                    <div class="input-group w-75">
                        <input type="text" name="q" class="form-control" placeholder="Masukkan Lokasi/Area/Alamat" name="query">
                        <button class="btn btn-primary" type="submit">Cari <i class="fas fa-search"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </header>


<br><br><br><br><br>
    <!-- footer -->
    <footer class="footer bg-dark text-white py-4">
    <div class="container position-relative">
        <!-- Bahasa dan Lokasi -->
        <div class="language-country position-absolute">
            <div>
                <label for="language" class="text-white">Language</label>
                <select id="language" class="form-select">
                    <option value="english">English</option>
                    <option value="indonesian">Indonesian</option>
                </select>
            </div>
            <div>
                <label for="country" class="text-white">Country</label>
                <select id="country" class="form-select">
                    <option value="us">United States</option>
                    <option value="id">Indonesia</option>
                </select>
            </div>
        </div>

        <!-- Sosial Media dan Kontak -->
        <div class="row">
            <div class="col-md-6 text-center text-md-start">
                <!-- Logo sosial media -->
                <div class="social-media mb-4">
                    <a href="#" class="text-white me-3"><i class="fab fa-facebook"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-tiktok"></i></a>
                </div>

                <!-- Customer Support dan lainnya -->
                <div class="contact">
                    <ul class="list-unstyled">
                        <li><b>Contact</b></li>
                        <li><a href="#" class="text-white">Customer Support</a></li>
                        <li><a href="#" class="text-white">Submit a Request</a></li>
                        <li><a href="#" class="text-white">Support Center</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>


    <!-- Bootstrap 5 Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="/WEB-INF/views/chat.jsp" />
</body>
</html>
