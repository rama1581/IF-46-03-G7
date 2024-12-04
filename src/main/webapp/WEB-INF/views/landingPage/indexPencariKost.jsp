<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>homepage</title>
    <link rel="stylesheet" href="./css/Homepage.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
    <style>
        #notifDiv {
            /* ... gaya-gaya lain ... */
            font-size: 16px;
            line-height: 1.6;
        }

        .notif-item img {
            width: 50px;
            margin-right: 10px;
        }

        .notif-item h2 {
            font-size: 1.2em;
            margin-top: 0;
        }

        .notif-item p {
            font-size: 1em;
            margin-bottom: 15px;
        }   
    </style>

    <!-- navbar section start -->
    <section class="header">
        <div class="container-fluid cont_nav" style="height: 84px;">
            <ul class="nav nav-pills justify-content-end content_nav">
                <li class="logo my-2">
                    <img src="./aset/logo.png" alt="" style="height: 54px; width: 178px;margin-right: 1470px;">
                </li>
                <li class="nav-item dropdown my-3">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Tipe Kost</a>
                    <ul class="dropdown-menu" >
                        <li><a class="dropdown-item" style="text-align: left;" href="./listPutra.jsp">Putra</a></li>
                        <li><a class="dropdown-item" style="text-align: left;" href="./listPutri.jsp">Putri</a></li>
                        <li><a class="dropdown-item" style="text-align: left;" href="./listCampur.jsp">Campur</a></li>
                    </ul>
                </li>
                <li class="nav-item my-3" onclick="toggleNotif()">
                    <a class="nav-link" href="#">
                        <img src="./aset/notification.png" alt="Icon Notif" style="width: 30px;"/>
                    </a>
                </li>
                <!-- Struktur notifikasi yang akan ditampilkan saat di-klik -->
                <div id="notifDiv" style="display: none; position: absolute; right: 10px; top: 50px; width: 300px; background-color: #f9f9f9; border: 1px solid #ccc; padding: 10px; z-index: 100;">
                    <!-- Isi notifikasi Anda di sini -->
                    <!-- <div class="notif-item">
                        <img src="./aset/notif1.png" alt="">
                        <h2>Booked kost berhasil!</h2>
                        <p>Kamu berhasil melakukan booking kost Sazira dengan tanggal check in 5 Januari 2023 dan check out 5 Januari 2024</p>
                    </div>
                    <div class="notif-item">
                        <img src="./aset/notif1.png" alt="">
                        <h2>Booked kost berhasil!</h2>
                        <p>Kamu berhasil melakukan booking kost Sazira dengan tanggal check in 5 Januari 2022 dan check out 5 Januari 2023</p>
                    </div> -->
                    <c:forEach var="notification" items="${notifications}">
                        <div class="notif-item">
                            <img src="./aset/notif1.png" alt="">
                            <!-- <h2>Booked kost berhasil!</h2> -->
                            <p>${notification.message}</p>
                        </div>
                    </c:forEach>
                </div>
                <li class="nav-item dropdown2 my-3">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
                        <img src="./aset/ikonuser.png" alt="Icon User" style="width: 30px;"/>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" style="text-align: left;" href="#">Edit Profil</a></li>
                        <li><a class="dropdown-item" style="text-align: left;" href="/booking/list">Riwayat Booking</a></li>
                        <li><a class="dropdown-item" style="text-align: left;" href="#" data-bs-toggle="modal" data-bs-target="#logoutGolivin">Logout</a></li>

                    </ul>
                </li>
                
            </ul>
        </div>
    </section>
    <!-- navbar section end -->

    <!-- slider section start -->
    <section>
        <div class="col-sm-12 px-4 pt-5">
            <div id="carouselExampleCaptions" class="carousel slide">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                </div>

                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./aset/Cslide1.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block my-5">
                            <h1>Temukan Kost Impianmu!</h1>
                            <!-- SearchBar Start -->
                            <div class="search-bar">
                                <form action="/kost/search" method="get">
                                    <div class="search-input-container">
                                        <input type="text" class="search-input" placeholder="Mau tinggal di daerah mana?" name="query">
                                        <button type="submit" class="search-button">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>                            
                            <!-- SearchBar End -->
                        </div>
                    </div>

                    <div class="carousel-item">
                        <img src="./aset/Cslide2.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block my-5">
                            <h1>Temukan Kost Impianmu!</h1>
                            <!-- SearchBar Start -->
                            <div class="search-bar">
                                <form action="/kost/search" method="get">
                                    <div class="search-input-container">
                                        <input type="text" class="search-input" placeholder="Mau tinggal di daerah mana?" name="query">
                                        <button type="submit" class="search-button">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </form>
                            </div> 
                            <!-- SearchBar End -->
                        </div>
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
    </section>
    <!-- slider section end -->

    <!-- kos section start -->
    <section class="list_kost">
        <div class="text my-5">
            <h1>Kost Popular</h1>
        </div>
        <div class="container my-5">
            <!-- <div class="row border border-danger"></div> -->
            <div class="row">
                <div class="col-4 desc_kost my-3">
                    <img src="./aset/kost1.jpg" alt="">
                    <button class="my-3">
                        <b>Kost Rumah Sazira</b>
                    </button>
                    <div class="d-flex flex-column">
                        <p class="m-0">Khusus Putri</p>
                        <p class="m-0">Sukapura</p>
                        <p>Rp 1.100.000 / bulan</p>
                    </div>
                </div>
                <div class="col-4 desc_kost my-3">
                    <img src="./aset/kost2.png" alt="">
                    <button class="my-3">
                        <b>Kost Saraswati</b>
                    </button>
                    <div class="d-flex flex-column">
                        <p class="m-0">Khusus Putri</p>
                        <p class="m-0">Sukabirus</p>
                        <p>Rp 1.100.000 / bulan</p>
                    </div>
                </div>
                <div class="col-4 desc_kost my-3">
                    <img src="./aset/kost3.png" alt="">
                    <button class="my-3">
                        <b>Kost Seven Days</b>
                    </button>
                    <div class="d-flex flex-column">
                        <p class="m-0">Khusus Putra</p>
                        <p class="m-0">PGA</p>
                        <p>Rp 1.100.000 / bulan</p>
                    </div>
                </div>
                <div class="col-4 desc_kost my-3">
                    <img src="./aset/kost3.png" alt="">
                    <button class="my-3">
                        <b>Kost Tirta Asri</b>
                    </button>
                    <div class="d-flex flex-column">
                        <p class="m-0">Khusus Putri</p>
                        <p class="m-0">Ciganitri</p>
                        <p>Rp 1.100.000 / bulan</p>
                    </div>
                </div>
                <div class="col-4 desc_kost my-3">
                    <img src="./aset/kost2.png" alt="">
                    <button class="my-3">
                        <b>Kost GG</b>
                    </button>
                    <div class="d-flex flex-column">
                        <p class="m-0">Khusus Campur</p>
                        <p class="m-0">Sukapura</p>
                        <p>Rp 1.100.000 / bulan</p>
                    </div>
                </div>
                <div class="col-4 desc_kost my-3">
                    <img src="./aset/kost1.jpg" alt="">
                    <button class="my-3">
                        <b>Kost House Of Edith</b>
                    </button>
                    <div class="d-flex flex-column">
                        <p class="m-0">Khusus Putra</p>
                        <p class="m-0">Margacinta</p>
                        <p>Rp 1.100.000 / bulan</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- kos section end -->

    <!-- footer section start -->
    <section>
        <div class="container-fluid footer_cont">
            <div class="row">
                <div class="col-4 description p-5">
                    <img class="mx-5" src="./aset/logobawah.png" alt="">
                    <p class="mx-5"> KOST-IN memanfaatkan teknologi untuk berkembang<br>
                        menjadi website yang memudahkan calon anak kos<br>
                        di wilayah Telkom University untuk booking properti kos<br> 
                        dan juga melakukan pembayaran kos.</p>
                </div>
                <div class="col-5">
                    <p>&nbsp;</p>
                </div>
                <div class="col-3 contact p-5">
                    <a>Hubungi Kami</a>
                    <div class="row my-2">
                        <div class="col-1">
                            <img src="./aset/pesan.png" alt="">
                        </div>
                        <div class="col-5 email">
                            <a href="#"><u>info@kostin.com</u></a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-1 ">
                            <img src="./aset/telpon.png" alt="">
                        </div>
                        <div class="col-5 telpon">
                            <a href="#"><u>0899-3322-1212</u></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- footer section end -->

    <!-- Modal Logout Start -->
    <section>
        <div class="modal logout" id="logoutGolivin" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content shadow-lg">
                    <div class="modal-header bg-gray-200">
                        <h5 class="modal-title text-xm font-weight-bold text-info text-uppercase" id="logoutModalLabel">Keluar</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Anda yakin ingin keluar?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light shadow-lg waves-effect" data-bs-dismiss="modal">
                            <i class="fas fa-window-close"></i>Batal
                        </button>
                        <a type="button" class="btn btn-info shadow-lg waves-effect" onclick="logoutAndRedirect()">
                            <i class="fas fa-sign-out-alt"></i>Ya, keluar
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- Modal Logout End -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script>
        function logoutAndRedirect() {
            window.location.href = '${pageContext.request.contextPath}/logout';
        }
    </script>
    <!-- <script src="../src/main/webapp/WEB-INF/views/notif.js"></script> -->
    <script>
        function toggleNotif() {
            // Ambil elemen notifikasi
            var notifDiv = document.getElementById("notifDiv");
    
            // Toggle tampilan notifikasi
            if (notifDiv.style.display === "none" || notifDiv.style.display === "") {
                notifDiv.style.display = "block";
            } else {
                notifDiv.style.display = "none";
            }
        }
    </script>
    
    
</body>
</html>

