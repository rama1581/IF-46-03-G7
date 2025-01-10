<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selamat Datang di KOST-IN!</title>
    <link rel="stylesheet" href="/css/dashboardpemilik.css" />
    <link rel="stylesheet" href="/css/Homepage.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position: fixed; top: 0; left: 0; right: 0; z-index: 1000; opacity: 0.75; width: 100%; padding: 10px 0;">
        <div class="container-fluid">
            <a class="navbar-brand" href="/edit/kost">
                <img src="../aset/Home.png" alt="KOST-IN" width="120px" height="40px">
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

    <!-- kos section start -->
    <section class="list_kost">
        <div class="text" style="font-size: 30px; margin-left: 0px;">
            <br><br>
            <h1>Halo, selamat datang di KOST-IN!!</h1>
        </div>
        <div class="text2" style="font-size: 20px; margin-left: 305px;">
            <h2>Waktunya Mengelola Properti</h2>
        </div>
        <div class="container my-5">
            <!-- <div class="row border border-danger"></div> -->
            <div class="row">
                <div class="col-4 addkos my-3">
                    <button class="button btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/edit/kost/create'" style="border: none;">
                        <img src="/aset/plus.png" alt="Data kos" style="width: 50px; ">
                        <br>Tambahkan Kost Anda<br>
                    </button>                    
                </div>
                <c:forEach var="kost" items="${kosts}">
                    <div class="col-4 desc_kost my-3"style="border: 2px solid #ccc; padding: 45px; border-radius: 20px;">
                        <img src="/aset/kost1.jpg" alt="">
                        <p style="margin-top: 15px;">Kost ID: ${kost.kost_id}</p>
                        <form method="get" action="/edit/kost/${kost.kost_id}/room">
                            <button type="submit" class="my-3">
                                <b>Detail Kamar</b>
                            </button>
                        </form>
                        <button class="buttonedit">
                            <a href="${pageContext.request.contextPath}/edit/kost/${kost.kost_id}">
                                <b>Edit Kost</b>
                            </a>
                        </button>
                        <div class="d-flex flex-column" style="margin-top: 10px;">
                            <c:if test="${kost.allowedMale}">
                                <p class="m-0">Khusus : Putra</p>
                            </c:if>
                            <c:if test="${kost.allowedFemale}">
                                <p class="m-0">Khusus : Putri</p>
                            </c:if>
                            <p class="m-0">Lokasi : ${kost.address}</p>
                            <c:if test="${kost.price != null && kost.discountPrice != null}">
                            <p class="card-text text-danger">
                                Ada Kamar Yang Diskon 50%!! Dari Harga <del>Rp${kost.price}</del>
                            </p>
                            <p class="card-text fw-bold">
                                Jadi Harga : Rp ${kost.discountPrice} / bulan
                            </p>
                        </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- kos section end -->

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

