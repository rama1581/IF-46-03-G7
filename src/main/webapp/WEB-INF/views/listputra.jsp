<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KOST-IN - Kost Putra</title>
    <link rel="stylesheet" href="css/Homepage.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <!-- <link rel="stylesheet" href="../src/main/resources/static/css/style.css"> -->
</head>
<body>
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
                            <li><a class="dropdown-item" href="../editprofile">Edit Profile</a></li>
                            <li><a class="dropdown-item" href="../booking/list">Riwayat Booking</a></li>
                            <li><a class="dropdown-item" href="../logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Header End -->

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

    <!-- Content Start -->
    <section class="content">
        <div class="container">
            <br><br><br>
            <h1 class="page-title">Daftar Kost Putra</h1>
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <!-- Kost Abal-abal -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100" onclick="window.location.href='kost/1'" style="cursor: pointer;">
                        <img src="../aset/kost1.jpg" alt="Kost Putra 1" class="card-img-top" style="height: 300px;">
                        <div class="card-body">
                            <span class="badge bg-success">Laki-Laki</span>
                            <h5 class="card-title">Kost Abal-abal</h5>
                            <p class="card-text">Alamat: Umayah</p>
                            <p class="card-text">WiFi - Kasur - Akses 24 Jam</p>
                            <p class="card-text text-success fw-bold">5.0 ★</p>
                            <p class="card-text text-danger">Ada Kamar Yang Diskon 50%!! Dari Harga <del>Rp1500000</del></p>
                            <p class="card-text fw-bold">Jadi Harga : Rp 750000.0 / bulan</p>
                        </div>
                    </div>
                </div>
                
                <!-- Kost Darul Ilmi -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100" onclick="window.location.href='/kost/3'" style="cursor: pointer;">
                    <img src="../aset/kost3.jpg" alt="Kost Putra 1" class="card-img-top" style="height: 300px;">
                    <div class="card-body">
                        <span class="badge bg-success">Laki-Laki</span>
                            <h5 class="card-title">Kost Darul Ilmi</h5>
                            <p class="card-text">Alamat: Sukabirus</p>
                            <p class="card-text">WiFi - Kasur - Akses 24 Jam</p>
                            <p class="card-text text-success fw-bold">5.0 ★</p>
                            <p class="card-text text-danger">Ada Kamar Yang Diskon 50%!! Dari Harga <del>Rp3500000</del></p>
                            <p class="card-text fw-bold">Jadi Harga : Rp 1750000.0 / bulan</p>
                        </div>
                    </div>
                </div>
                
                <!-- Kost Abal-abal 2 -->
                <div class="col-md-4 mb-4">
                    <div class="card h-100" onclick="window.location.href='kost/202'" style="cursor: pointer;">
                        <img src="../aset/kost6.jpg" alt="Kost Putra 1" class="card-img-top" style="height: 300px;">
                        <div class="card-body">
                            <span class="badge bg-success">Laki-Laki</span>
                            <h5 class="card-title">Kost Abal-abal 2</h5>
                            <p class="card-text">Alamat: Sukabirus</p>
                            <p class="card-text">WiFi - Kasur - Akses 24 Jam</p>
                            <p class="card-text text-success fw-bold">5.0 ★</p>
                            <p class="card-text text-danger">Ada Kamar Yang Diskon 50%!! Dari Harga <del>Rp3000000</del></p>
                            <p class="card-text fw-bold">Jadi Harga : Rp 1500000.0 / bulan</p>
                        </div>
                    </div>
                </div>

                <!-- Kost Abal-abal 4 -->
                <div class="col-md-4 md-4 ">
                    <div class="card h-100" onclick="window.location.href='kost/252'" style="cursor: pointer;">
                        <img src="../aset/kost7.jpg" alt="Kost Putra 1" class="card-img-top" style="height: 300px;">
                        <div class="card-body">
                            <span class="badge bg-success">Laki-Laki</span>
                            <h5 class="card-title">Kost Abal-abal 4</h5>
                            <p class="card-text">Alamat: Sukabirus</p>
                            <p class="card-text">WiFi - Kasur - Akses 24 Jam</p>
                            <p class="card-text text-success fw-bold">5.0 ★</p>
                            <p class="card-text text-danger">Ada Kamar Yang Diskon 50%!! Dari Harga <del>Rp1200000</del></p>
                            <p class="card-text fw-bold">Jadi Harga : Rp 600000.0 / bulan</p>
                        </div>
                    </div>
                </div>

                <!-- Kost Putra E -->
                <div class="col-md-4 md-4">
                    <div class="card h-100" onclick="window.location.href='kost/352'" style="cursor: pointer;">
                        <img src="../aset/kost8.jpg" alt="Kost Putra 1" class="card-img-top" style="height: 300px;">
                        <div class="card-body">
                            <span class="badge bg-success">Laki-Laki</span>
                            <h5 class="card-title">Kost Putra E</h5>
                            <p class="card-text">Alamat: Jl Telekomunikasi </p>
                            <p class="card-text">WiFi - Kasur - Akses 24 Jam</p>
                            <p class="card-text text-success fw-bold">5.0 ★</p>
                            <p class="card-text text-danger">Ada Kamar Yang Diskon 50%!! Dari Harga <del>Rp1400000</del></p>
                            <p class="card-text fw-bold">Jadi Harga : Rp 700000.0 / bulan</p>
                        </div>
                    </div>
                </div>

                <!-- Kost Putra F -->
                <div class="col-md-4 md-4">
                    <div class="card h-100" onclick="window.location.href='kost/353'" style="cursor: pointer;">
                        <img src="../aset/kost9.jpg" alt="Kost Putra 1" class="card-img-top" style="height: 300px;">
                        <div class="card-body">
                            <span class="badge bg-success">Laki-Laki</span>
                            <h5 class="card-title">Kost Putra F</h5>
                            <p class="card-text">Alamat: Sukabirus No 29 </p>
                            <p class="card-text">WiFi - Kasur - Akses 24 Jam</p>
                            <p class="card-text text-success fw-bold">5.0 ★</p>
                            <p class="card-text text-danger">Ada Kamar Yang Diskon 50%!! Dari Harga <del>Rp450000</del></p>
                            <p class="card-text fw-bold">Jadi Harga : Rp 225000.0 / bulan</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>    
    <!-- Content End -->

    <br><br><br><br><br><br><br>
    <!-- Footer -->
    <footer class="footer bg-dark text-white py-4">
        <div class="container position-relative">
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
            <div class="row">
                <div class="col-md-6 text-center text-md-start">
                    <div class="social-media mb-4">
                        <a href="#" class="text-white me-3"><i class="fab fa-facebook"></i></a>
                        <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="text-white"><i class="fab fa-tiktok"></i></a>
                    </div>
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
