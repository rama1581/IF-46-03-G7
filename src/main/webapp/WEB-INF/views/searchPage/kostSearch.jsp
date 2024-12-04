<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>searchkost</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/kostList.css"/>
</head>
<body>

    <!-- navbar section start -->
    <section class="header">
        <div class="container-fluid cont_nav" style="height: 84px;">
            <ul class="nav nav-pills justify-content-end content_nav">
                <li class="logo my-3">
                    <a href="/">
                        <img src="/aset/logo.png" alt="">
                    </a>
                </li>
                <li class="nav-item dropdown my-3">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Tipe Kost</a>
                <ul class="dropdown-menu" >
                    <li><a class="dropdown-item" style="text-align: left;" href="./listPutra.jsp">Putra</a></li>
                    <li><a class="dropdown-item" style="text-align: left;" href="./listPutri.jsp">Putri</a></li>
                    <li><a class="dropdown-item" style="text-align: left;" href="./listCampur.jsp">Campur</a></li>
                </ul>
                </li>
                <li class="nav-item my-3">
                    <a class="nav-link" href="">
                        <img src="/aset/notification.png" alt="Icon Notif" style="width: 30px;"/>
                    </a>
                </li>
                <li class="nav-item dropdown2 my-3">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
                        <img src="/aset/ikonuser.png" alt="Icon User" style="width: 30px; margin-bottom: 10px;"/>
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
    
    <!-- searchbar section start -->
    <section>
        <div class="search-container">
            <div class="search-bar">
                <div class="search-input-container">
                    <form action="/kost/search" method="get">
                        <input type="text" class="search-input" placeholder="Cari kost impian Anda di sini!" name="query">
                        <label class="filter-label">
                            <input type="checkbox" name="allowedMale" <c:if test="${allowedMale}">checked</c:if>> Laki-Laki
                        </label>
                        <label class="filter-label">
                            <input type="checkbox" name="allowedFemale" <c:if test="${allowedFemale}">checked</c:if>> Perempuan
                        </label>
                        <button type="submit" class="search-button">
                            <img src="/aset/search1.png" alt="Search Icon">
                        </button>
                    </form>
                </div>
            </div> 
            <!-- <div class="filter-options">
                <label class="filter-label">
                    <input type="checkbox" name="allowedMale" checked> Male
                </label>
                <label class="filter-label">
                    <input type="checkbox" name="allowedFemale" checked> Female
                </label>
            </div> -->
        </div>
    </section>
    
    <!-- searchbar section end -->

    
    <c:forEach var="kost" items="${kosts}">
        <div class="kost-item my-3" style="margin-left: 700px;">
        <!-- Display attributes of kost -->
            <p>Kost ID: ${kost.kost_id}</p>
            <p>Name: ${kost.name}</p>
            <p>Address: ${kost.address}</p>
            <p>Allowed Male: ${kost.allowedMale}</p>
            <p>Allowed Female: ${kost.allowedFemale}</p>

            <!-- Link to redirect to /kost/search/{clicked_kost_id} -->
            <a href="<c:url value='/kost/${kost.kost_id}' />" class="kost-link">View Details</a>
        </div>
    </c:forEach> 

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
    <script>
        function logoutAndRedirect() {
            window.location.href = '${pageContext.request.contextPath}/logout';
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
