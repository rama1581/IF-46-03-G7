<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
</head>
<body>
    <!-- navbar section start -->
    <section class="header">
        <div class="container-fluid cont_nav" style="height: 130px;">
            <ul class="nav nav-pills justify-content-end content_nav">
                <li class="logo my-3">
                    <img src="./aset/logo.png" alt="">
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
                    <button onclick="window.location.href='${pageContext.request.contextPath}/login'" class="btn btn-primary">
                        Masuk
                    </button>
                </li>
            </ul>
        </div>
    </section>
    <!-- navbar section end -->

    <!-- login section start -->
    <section class="content">
        <div class="container-fluid ActivityPage" style="margin-top: 50px;">
            <div class="row justify-content-center align-item-center ">
                <div class=" col-5">
                    <h1 class="my-2"><b>Masuk ke KOST-IN</b></h1>
                </div>
                <div class="col-5">
                    <div id="hasAcc" class="col-10 form-text">
                    </div>
                </div>            
            </div>
        </div>

        <div class="row">
            <form method="post" action="/login" contentType="application/json" onsubmit="return validateLoginForm();">
                <div class="login1" style="margin-top: 50px;">
                <div class="mb-3 my-4">
                    <label for="email" class="form-label" style="font-size: 20px;">Email</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label" style="font-size: 20px;">Kata Sandi</label>
                    <input type="password" class="form-control" id="password" name ="password" placeholder="Minimal 8 karakter">
                </div>
                <div id="hasAcc" class="form-text" style="font-size: 20px;">
                    Belum punya akun KOST-IN?
                    <!-- Trigger Modal -->
                    <a  href="#" data-bs-toggle="modal" data-bs-target="#loginGolivin">Daftar Sekarang</a> 
                </div>                
                <div>
                    <a1 href="${pageContext.request.contextPath}/lupakatasandi" class="link-offset-1" style="font-size: 20px;"><u>Lupa Kata Sandi</u></a1>
                </div>
                    <button type="submit" class="btn btn-primary my-3" style="font-size: 20px;">
                        Masuk
                    </button>
                    <div class="error-container">
                        <c:if test="${isPasswordIncorrect}">
                            <div id="wrongPasswordBox" class="error-box hidden">
                                <span class="error-message">Password salah.</span>
                            </div>
                        </c:if>
                        <c:if test="${isUserNonexistent}">
                            <div id="noAccountBox" class="error-box hidden">
                                <span class="error-message">Tidak ada akun dengan email ini.</span>
                            </div>
                        </c:if>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- login section end -->
    
    <!-- Modal Section start -->
    <div class="modal login" id="loginGolivin" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content login">
                <div class="modal-header title">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
            <div class="modal-body">

                <div class="row header">
                    <h1>Daftar KOST-IN</h1>
                    <a>Saya ingin daftar sebagai</a>
                </div>

                <div class="row item justify-content-center">
                    <button class="kost_btn" onclick="registerAsPencari()">
                        <img src="./1.png" alt="">
                        Pencari Kost
                    </button>
                </div>

                <div class="row item justify-content-center my-3">
                    <button class="kost_btn" onclick="registerAsPemilik()">
                        <img  src="./2.png" alt="">
                        Pemilik Kost
                    </button>
                </div>
                
            </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Section end -->
    

    <script>
        function validateLoginForm() {
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;
    
            if (!email || !password) {
                alert('Mohon isi kedua kolom dengan informasi login Anda.');
                return false; // Mencegah pengiriman formulir
            }
            return true; // Lanjutkan pengiriman formulir jika kedua kolom sudah diisi
        }
    </script>
    

    
    <script>
        function registerAsPencari() {
            window.location.href = '${pageContext.request.contextPath}/register/pencari';
        }
    
        function registerAsPemilik() {
            window.location.href = '${pageContext.request.contextPath}/register/pemilik';
        }
    </script>

    <!-- footer section start -->
    <section>
        <div class="container-fluid footer_cont" style="margin-top: 95px;">
            <div class="row">
                <div class="col-4 description p-5">
                    <img class="mx-2" src="./aset/logobawah.png" alt="">
                    <p class="mx-2 my-3"> KOST-IN memanfaatkan teknologi untuk berkembang<br>
                        menjadi website yang memudahkan calon anak kos<br>
                        di wilayah Telkom University untuk booking properti kos<br> 
                        dan juga melakukan pembayaran kos.</p>
                </div>
                <div class="col-5">
                    <p>&nbsp;</p>
                </div>
                <div class="col-3 contact p-4">
                    <a>Hubungi Kami</a>
                    <div class="row my-2">
                        <div class="col-2">
                            <img src="./aset/pesan.png" alt="">
                        </div>
                        <div class="col-6 email">
                            <a href="#"><u>info@kostin.com</u></a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2 ">
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