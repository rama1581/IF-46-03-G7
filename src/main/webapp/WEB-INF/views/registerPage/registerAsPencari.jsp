<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/register.css" />    
    <!-- <link rel="stylesheet" href="./css/register.css" /> -->
</head>
<body>
    <!-- navbar section start -->
    <section class="header">
        <div class="container-fluid cont_nav" style="height: 125px;">
            <div class="row">
                <div class="col-4 my-2">
                        <img src="/aset/logo.png" alt="" style="margin-left: 100px; margin-top: 0px;">
                </div>
                <div class="col-4">
                    <p>&nbsp;</p>
                </div>
                <div class="col-4">
                    <ul class="nav nav-pills justify-content-end content_nav">
                        <li class="nav-item dropdown my-3">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Tipe Kost</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/listputra.html">Putra</a></li>
                            <li><a class="dropdown-item" href="#">Putri</a></li>
                            <li><a class="dropdown-item" href="#">Campur</a></li>
                        </ul>
                        </li>
                        <li class="nav-item my-3">
                            <button onclick="window.location.href='${pageContext.request.contextPath}/login'" class="btn btn-primary">
                                Masuk
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- navbar section end -->
    
    <!-- regist section start -->
    <section class="content">
        <div class="container-fluid ActivityPage" style="margin-top: 25px;">
            <div class="row justify-content-center align-item-center ">
                <div class=" col-5">
                    <h1 class="my-2"><b>Daftar Akun Pencari Kost</b></h1>
                </div>
                <div class="col-5">
                    <div id="hasAcc" class="col-10 form-text">
                    </div>
                    </h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <form method="post" action="/register/pencari" contentType="application/json" onsubmit="return validateRegistrationForm();">
                    <div class="regist" style="margin-top: 100px;">
                        <div class="mb-3 my-4">
                            <label for="username" class="form-label" style="font-size: 20px;">Username</label>
                            <input type="name" class="form-control" id="username" name="username">
                        </div>
                        <div class="mb-3">
                            <label for="phoneNumber" class="form-label" style="font-size: 20px;">Phone number</label>
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label" style="font-size: 20px;">Email</label>
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label" style="font-size: 20px;">Password</label>
                            <input type="password" class="form-control" id="password" name="password">
                        </div>
                        <div id="hasAcc" class="form-text" style="font-size: 20px;">
                            Sudah punya akun KOST-IN? <a href="${pageContext.request.contextPath}/login" class="link-offset-1"><u>Masuk Disini</u></a>
                        </div>                    
                        <div class="notifbox">
                            <button href="${pageContext.request.contextPath}/login" type="submit" class="btn btn-primary my-2">Daftar</button>
                            <c:if test="${isAccountAlreadyExist}">
                                <div class="error-container">
                                    <div id="emailExistsBox" class="error-box hidden">
                                        <span class="error-message">Email sudah terdaftar.</span>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </form>
            </div>
            <div class="registpage col-6" style="margin-top: 50px;">
                <img src="/aset/regist.png" alt="">
            </div>

            <script>
                function validateRegistrationForm() {
                    var username = document.getElementById('username').value;
                    var phoneNumber = document.getElementById('phoneNumber').value;
                    var email = document.getElementById('email').value;
                    var password = document.getElementById('password').value;
            
                    if (!username || !phoneNumber || !email || !password) {
                        alert('Mohon isi semua data sebelum mendaftar!');
                        return false; // Mencegah pengiriman formulir
                    }
                    return true; // Lanjutkan pengiriman formulir jika semua data sudah diisi
                }

            </script>
        </div>
    </section>
    <!-- regist section end -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>