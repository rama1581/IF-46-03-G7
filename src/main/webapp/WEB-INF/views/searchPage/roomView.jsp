<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Room</title>
    <link rel="stylesheet" href="/css/roomView2.css" />
    <link rel="stylesheet" href="/css/Homepage.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
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
                    
                    <!-- Dropdown Notifikasi dengan Toggler -->
                    <li class="nav-item position-relative">
                        <a class="nav-link" href="#" id="notificationToggle">
                            <img src="../aset/Bell.png" alt="Notifikasi" width="35px" height="35px">
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
    <!-- navbar section end -->

    <!-- Title Start -->
    <div class="row">
        <div class="col-md-12">
            <div class="text2" style="font-size: 20px; margin-left: 280px; margin-top: 100px;">
                <h2>Pilih kamar yang sesuai dengan keinginanmu</h2>
            </div>
        </div>
    </div>
    <!-- Title End -->

    <!-- kos section start -->
    <c:choose>
        <c:when test="${not empty rooms}">
            <c:forEach var="room" items="${rooms}">
                <section class="room1">
                    <div class="list_room">
                        <div class="container">
                            <div class="room_content">
                                <div class="container_media">
                                    <div id="carouselExampleCaptions" class="carousel slide">
                                        <div class="carousel-indicators">
                                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                        </div>
            
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img src="/aset/kost2.png" alt="Slide 1">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="/aset/kost3.png" alt="Slide 2">
                                            </div>
                                        </div>
            
                                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                        </button>
            
                                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="container_info">
                                    <div class="container_info-wrapper">
                                        <div class="container_info-details">
                                            <div class="idkamar">ID Kamar: ${room.room_id}</div>
                                            <div class="harga-kamar">Harga: Rp. ${room.price} / Bulan</div>
                                            <div class="alamat-kost">Alamat: <c:out value="${address}"/></div>
                                            <div class="fasilitas">
                                                <div>Fasilitas:</div>
                                                <ul>
                                                    <li>${room.description}</li>
                                                </ul>
                                            </div>
                                            <a href="${pageContext.request.contextPath}/room/${room.room_id}/book" class="btn btn-primary"style="background-color: #00BBB4; border: none;">Ajukan sewa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="row">
                <div class="col-md-12" style="margin-left: 430px; font-size: 25px; font-weight: bold; color: red; margin-top: 30px;">
                    <p>Maafkan kami, kost ini belum memiliki ruangan yang tersedia.</p>
                </div>
            </div>
        </c:otherwise>
    </c:choose>

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

    <br><br><br><br><br>
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





