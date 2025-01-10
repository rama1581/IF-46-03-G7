<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Pay</title>
    <link rel="stylesheet" href="/css/bookingpay.css" />
    <link rel="stylesheet" href="/css/Homepage.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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

    <!-- Booking Pay start -->
    <section>
        <form id="booking-form" action = "${pageContext.request.contextPath}/booking/${booking_id}/confirm" method="GET">
            <div class="payment-outer">
            <div class="payment-container">
                <div class="left-section">
                    <h1>Pembayaran</h1>
                    <div class="durasi" style="font-size: 20px;">
                        <label for="paymentMethod">Durasi sewa kost:</label>
                    </div>
                        <p class="m-0">Tanggal Masuk  : ${entryDate}</p>
                        <p class="m-0">Tanggal Keluar : ${exitDate}</p>
                    
                    <div class="payment" style="font-size: 20px;">
                        <label for="paymentMethod">Pilih metode pembayaran:</label>
                    </div>
                
                    <div class="payment-method-option">
                        <input type="radio" id="QRIS" name="method" value="QRIS">
                        <label for="QRIS">QRIS</label>
                        <input type="radio" id="QRIS" name="method" value="QRIS">
                        <label for="QRIS">Transfer Bank</label>
                    </div>
                </div>
            
    
            <div class="right-section">
                <h2>Detail Pembayaran</h2>
                <!-- Elemen untuk menampilkan metode pembayaran yang dipilih -->
                <!-- <p id="selectedPaymentMethod">Metode Pembayaran:</p> -->

                <script>
                    // Dapatkan semua elemen radio button dengan name="paymentMethod"
                    var radios = document.querySelectorAll('input[name="paymentMethod"]');

                    // Tambahkan event listener untuk setiap radio button
                    radios.forEach(function(radio) {
                        radio.addEventListener('change', function() {
                            if (this.checked) {
                                // Perbarui elemen dengan ID 'selectedPaymentMethod' dengan teks "Metode Pembayaran: " diikuti dengan teks dari radio button yang dipilih
                                document.getElementById('selectedPaymentMethod').innerText = "Metode Pembayaran: " + this.nextElementSibling.innerText;
                            }
                        });
                    });
                </script>


                    <p>Subtotal: <span id="subtotal">Rp <c:out value="${price}" /></span></p>
                    <p>Biaya Administrasi: Rp 2500</p>
                    <p>Total: <span id="total">Rp ${price + 2500} </span></p>
                    
                    <button type="button" class="cancel-button" data-bs-toggle="modal" data-bs-target="#cancelModal">Batalkan Pesanan</button>
    
                    
                    <button class="continue-button">Lanjutkan</button>
                    <script>
                        document.querySelector('.continue-button').addEventListener('click', function (event) {
                            const selectedPaymentMethod = document.querySelector('input[name="method"]:checked');
                            if (!selectedPaymentMethod) {
                                event.preventDefault(); // Mencegah form dikirim
                                alert("Silakan pilih metode pembayaran sebelum melanjutkan.");
                            }
                        });
                    </script>
                </div>
            </div>
        </form>
    </section>
    
    <!-- Modal Konfirmasi Pembatalan -->
<div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cancelModalLabel">Konfirmasi Pembatalan</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Apakah Anda yakin ingin membatalkan pesanan ini?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tidak</button>
                <a href="${pageContext.request.contextPath}/booking/${booking_id}/cancel" class="btn btn-danger">Ya, Batalkan</a>
            </div>
        </div>
    </div>
</div>

    <br><br><br><br><br><br><br><br><br><br>
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
