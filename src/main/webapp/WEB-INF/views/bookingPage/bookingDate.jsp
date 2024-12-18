<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Tanggal</title>
    <link rel="stylesheet" href="/css/bookingDate.css"/>
    <link rel="stylesheet" href="/css/Homepage.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
</head>
<body class="home">
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

    <!-- Tanggal section start -->
    <div style="display: flex; align-items: center; justify-content: center; min-height: 100vh; padding-top: 80px;">
        <section class="booking-section" style="background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0px 4px 10px rgba(0,0,0,0.2);">
            <h2>Pilih Rentang Tanggal Sewa</h2>
            <form id="booking-form" action="${pageContext.request.contextPath}/booking/${booking_id}/payment" method="GET" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="entryDate">Tanggal Masuk:</label>
                    <input type="text" id="entryDate" name="entryDate" class="form-control" placeholder="Pilih tanggal" autocomplete="off" required>
                </div>
            
                <div class="form-group">
                    <label for="exitDate">Tanggal Keluar:</label>
                    <input type="text" id="exitDate" name="exitDate" class="form-control" placeholder="Pilih tanggal" autocomplete="off" required>
                </div>
            
                <div id="date-info">
                    <!-- Info tanggal akan ditampilkan di sini -->
                </div>
            
                <button type="submit" id="submitButton" class="btn btn-primary">Lanjutkan ke Pembayaran</button>
            </form>
        </section>
        <!-- Tanggal section end -->
        
        <!-- Masukkan semua script Anda di sini -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        
        <script>
            $(document).ready(function () {
                $('#entryDate, #exitDate').datepicker({
                    format: 'yyyy-mm-dd',
                    todayHighlight: true,
                    autoclose: true,
                    entryDate: new Date()
                });
        
            });
        
            function validateForm() {
                var entryDate = document.getElementById('entryDate').value;
                var exitDate = document.getElementById('exitDate').value;
        
                if (!entryDate || !exitDate) {
                    alert('Mohon isi kedua tanggal terlebih dahulu.');
                    return false; // Mencegah pengiriman formulir
                }
                return true; // Kirim formulir jika semua syarat terpenuhi
            }
        </script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
