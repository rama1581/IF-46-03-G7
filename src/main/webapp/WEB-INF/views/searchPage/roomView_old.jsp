<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Room</title>
    <link rel="stylesheet" href="/css/Viewroom.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <!-- navbar section start -->
    <section class="header">
        <div class="container-fluid cont_nav" style="height: 84px;">
            <ul class="nav nav-pills justify-content-end content_nav">
                <li class="logo my-3">
                    <img src="../src/main/resources/static/aset/logo.png" alt="">
                </li>
                <li class="nav-item dropdown my-3">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Tipe Kost</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="./listPutra.jsp">Putra</a></li>
                    <li><a class="dropdown-item" href="./listPutri.jsp">Putri</a></li>
                    <li><a class="dropdown-item" href="./listCampur.jsp">Campur</a></li>
                </ul>
                </li>
                <li class="nav-item my-3">
                    <a class="nav-link" href="#">Chat</a>
                </li>
                <li class="nav-item dropdown2 my-3">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
                        <img src="../src/main/resources/static/aset/ikonuser.png" alt="Icon User" style="width: 30px;"/>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Edit Profil</a></li>
                        <li><a class="dropdown-item" href="#">Logout</a></li>
                    </ul>
                </li>
                
            </ul>
        </div>
    </section>
    <!-- navbar section end -->

    <!-- kos section start -->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Detail Kost</h2>
                </div>
            </div>

            <c:choose>
                <c:when test="${not empty rooms}">
                    <c:forEach var="room" items="${rooms}">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="image-zone">
                                    <img src="../src/main/resources/static/aset/kost2.png">
                                </div>
                            </div>
                                <div class="col-md-6">
                                    <div class="info-zone">
                                        <h3>Nomor kamar</h3>
                                        <p>${room.room_id}</p>
                                
                                        <h3>Lokasi</h3>
                                        <p><c:out value="${address}"/></p>
                                
                                        <h3>Fasilitas</h3>
                                        <ul>
                                            <li>${room.description}</li>
                                        </ul>
                                
                                        <h3>Harga</h3>
                                        <p>Rp. ${room.price}/bulan</p>
                                
                                        <a href="${pageContext.request.contextPath}/room/${room.room_id}/book" class="btn btn-primary">Pesan</a>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="row">
                        <div class="col-md-12">
                            <p>Maafkan kami, kost ini belum memiliki ruangan yang tersedia.</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
    <!-- kos section end -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
