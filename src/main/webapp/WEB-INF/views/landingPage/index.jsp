<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link rel="stylesheet" href="./css/Homepage.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <!-- navbar section start -->
    <section class="header">
        <div class="container-fluid cont_nav" style="height: 84px;">
            <ul class="nav nav-pills justify-content-end content_nav">
                <li class="logo my-3">
                    <img src="./aset/logo.png" alt="" style="height: 54px; width: 178px;margin-right: 1400px;">
                </li>
                <li class="nav-item dropdown my-3">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Tipe Kost</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="./listPutra.jsp">Putra</a></li>
                        <li><a class="dropdown-item" href="./listPutri.jsp">Putri</a></li>
                        <li><a class="dropdown-item" href="./listCampur.jsp">Campur</a></li>
                    </ul>
                </li>
                <li class="nav-item my-3 d-flex align-items-center">
                    <button onclick="window.location.href='${pageContext.request.contextPath}/login'" class="btn btn-primary me-3">
                        Masuk
                    </button>
                    <button onclick="window.location.href='${pageContext.request.contextPath}/register/pencari'" class="btn btn-primary">
                        Registrasi Pencari Kost
                    </button>
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
                            <h1>MAU CARI KOST DAERAH TELKOM UNIVERSITY ?</h1>
                            <h2><b>Dapatkan Informasi dan Langsung Sewa di KOST-IN</h2></b>
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
            <h1>Daftar Kost yang Tersedia</h1>
        </div>
        <div class="container my-5">
            <div class="row">
                <div class="col-4 desc_kost my-3">
                    <img src="./aset/kost1.jpg" alt="">
                    <button class="my-3">
                        <b>Umayah 1</b>
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
                        <b>Umayah 2</b>
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
                        <b>HJ Didi</b>
                    </button>
                    <div class="d-flex flex-column">
                        <p class="m-0">Khusus Putra</p>
                        <p class="m-0">PGA</p>
                        <p>Rp 1.100.000 / bulan</p>
                    </div>
                </div>
                <div class="col-4 desc_kost my-3">
                    <img src="./aset/kost4.jpg" alt="">
                    <button class="my-3">
                        <b>Wisma Elang</b>
                    </button>
                    <div class="d-flex flex-column">
                        <p class="m-0">Khusus Putri</p>
                        <p class="m-0">Ciganitri</p>
                        <p>Rp 1.100.000 / bulan</p>
                    </div>
                </div>
                <div class="col-4 desc_kost my-3">
                    <img src="./aset/kost5.jpg" alt="">
                    <button class="my-3">
                        <b>Wisma Darul Ilmi</b>
                    </button>
                    <div class="d-flex flex-column">
                        <p class="m-0">Khusus Campur</p>
                        <p class="m-0">Sukapura</p>
                        <p>Rp 1.100.000 / bulan</p>
                    </div>
                </div>
                <div class="col-4 desc_kost my-3">
                    <img src="./aset/kost6.jpg" alt="">
                    <button class="my-3">
                        <b>Kost Apik</b>
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
                        <div class="col-1">
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
