<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="css/Homepage.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
</head>
<body class="Login">
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
                
                    <!-- Foto User Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="../aset/icon.png" alt="Login" width="40px" height="40px">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-start dropdown-menu-end">
                            <li><a class="dropdown-item" href="../editprofileaspemilik">Edit Profile</a></li>
                            <li><a class="dropdown-item" href="../logout">Logout</a></li>
                            <li class="nav-item"> <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#helpModal">Pusat Bantuan</a></li>
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
                <p>Selamat datang di Pusat Bantuan Kost-In! Jika Anda membutuhkan bantuan pengaturan akun, atau masalah lainnya silahkan kontak ke email kami @cs.kostin.com</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>

     <!-- Edit Profile Section -->
     <div class="container d-flex align-items-center justify-content-center min-vh-100">
        <div class="row edit-profile-container">
            <!-- Form Edit Profile -->
            <div class="col-md-12">
                <form action="/editprofileaspemilik" method="POST" class="login-form">
                    <h3 class="mb-4 text-center"><b>Edit Profile</b></h3>
                    
                    <!-- Input Username -->
                    <div class="mb-3">
                        <label for="username" class="form-label">Username:</label>
                        <input type="text" name="username" value="${user.username}" required class="form-control">
                    </div>
                    <!-- Input Current Password -->
                    <div class="mb-3">
                        <label for="current-password" class="form-label">Current Password:</label>
                        <input type="password" id="current-password" name="currentPassword" placeholder="Enter current password" class="form-control" required>
                    </div>
                    <!-- Input New Password -->
                    <div class="mb-3">
                        <label for="password" class="form-label">New Password:</label>
                        <input type="password" id="password" name="password" placeholder="Enter new password" class="form-control" required>
                    </div>

                    <script>
                        document.querySelector('form').addEventListener('submit', function(event) {
                            const password = document.getElementById('password').value;
                            if (password.length < 6) {
                                alert('Password harus memiliki minimal 6 karakter.');
                                event.preventDefault();
                            }
                        });
                        </script>                        
                
                    <!-- Error Messages -->
                    <c:if test="${not empty message}">
                        <div class="alert alert-info" role="alert">
                            <c:out value="${message}" />
                        </div>
                    </c:if>
                
                    <button type="submit" class="btn-submit">Update Profile</button>
                </form>                
            </div>
        </div>
    </div>

    <!-- Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Success</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Profil Anda Berhasil Diperbarui!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-submit" data-bs-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<c:if test="${not empty successMessage}">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var successModal = new bootstrap.Modal(document.getElementById('successModal'));
            successModal.show();
        });
    </script>
</c:if>


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
