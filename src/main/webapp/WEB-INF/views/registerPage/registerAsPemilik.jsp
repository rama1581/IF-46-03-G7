<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regist Pemilik Kost</title>
    <link rel="stylesheet" href="/css/Homepage.css" />
    <!-- <link rel="stylesheet" href="Home.css" /> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
</head>
<body class="Regist">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="">
                <img src="../aset/Home.png" alt="KOST-IN" width="120px" height="40px">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
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
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#helpModal">Pusat Bantuan</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="../aset/icon.png" alt="Login" width="40px" height="40px">
                        </a>
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
                    <p>Selamat datang di Pusat Bantuan Kost-In! Jika Anda membutuhkan bantuan terkait pencarian kost, pengaturan akun, atau masalah lainnya, silahkan kontak ke email kami: cs@kostin.com.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Login Section -->
    <div class="container d-flex align-items-center justify-content-center min-vh-100">
        <div class="row login-container">
            <!-- Bagian Gambar -->
            <div class="col-md-6 d-none d-md-block">
                <img src="../aset/fotokoslogin.png" alt="Login Illustration" class="login-image img-fluid rounded">
            </div>
            <!-- Form Login -->
            <div class="col-md-6">
                <form action="#" method="POST" class="login-form">
                    <h3 class="mb-4 text-center"><b>Daftar Pemilik Kost</b></h3>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username:</label>
                        <input type="username" id="username" name="username" class="form-control" placeholder="Enter your username" required>
                    </div>
                    <div class="mb-3">
                        <label for="phonenumber" class="form-label">Phone Number:</label>
                        <input type="phonenumber" id="phonenumber" name="phonenumber" class="form-control" placeholder="Enter your phone number" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password:</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                    </div>


                    <p>Sudah punya akun Kost-In? <a href="../login" style="color: #EDD9A3;">Masuk Disini</a></p>
                    <button type="submit" class="btn submit-btn w-100">SUBMIT</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Registrasi Berhasil -->
    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="successModalLabel">Registrasi Berhasil</h5>
        </div>
        <div class="modal-body">
            Selamat, registrasi berhasil dilakukan! Anda akan diarahkan ke halaman login dalam beberapa saat.
        </div>
    </div>
</div>
</div>

<script>
    document.querySelector('.login-form').addEventListener('submit', function (event) {
    event.preventDefault(); // Mencegah pengiriman form secara langsung

    // Simulasikan pengiriman form ke server
    fetch(this.action, {
        method: 'POST',
        body: new FormData(this),
    })
    .then(response => {
        if (response.ok) {
            // Tampilkan modal jika server merespons sukses
            const successModal = new bootstrap.Modal(document.getElementById('successModal'));
            successModal.show();

            // Redirect ke halaman login setelah 3 detik
            setTimeout(() => {
                window.location.href = "/login";
            }, 3000);
        } else {
            // Tangani error jika ada
            alert("Registrasi gagal. Silakan coba lagi.");
        }
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Terjadi kesalahan. Silakan coba lagi.");
    });
});
</script>

    <!-- Footer -->
    <footer class="footer bg-dark text-white py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="social-media mb-4">
                        <a href="#" class="text-white me-3"><i class="fab fa-facebook"></i></a>
                        <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="text-white"><i class="fab fa-tiktok"></i></a>
                    </div>
                    <ul class="list-unstyled">
                        <li><b>Contact</b></li>
                        <li><a href="#" class="text-white">Customer Support</a></li>
                        <li><a href="#" class="text-white">Submit a Request</a></li>
                        <li><a href="#" class="text-white">Support Center</a></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <div class="d-flex justify-content-end">
                        <div>
                            <label for="language" class="text-white">Language:</label>
                            <select id="language" class="form-select">
                                <option value="english">English</option>
                                <option value="indonesian">Indonesian</option>
                            </select>
                        </div>
                        <div class="ms-3">
                            <label for="country" class="text-white">Country:</label>
                            <select id="country" class="form-select">
                                <option value="us">United States</option>
                                <option value="id">Indonesia</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap 5 Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>