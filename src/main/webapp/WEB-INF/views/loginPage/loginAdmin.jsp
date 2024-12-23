<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking list</title>
    <link rel="stylesheet" href="/css/loginAdmin.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

     <!-- login section start -->
     <section>
        <div class="logo my-2" style="margin-top: 300px;">
            <img src="/aset/logo.png" alt="">
        </div>

        <div class="row">
            <form action="/login" method="post"> <!-- Set action to your Spring Controller endpoint -->
                <div class="login1">
                    <div class="mb-3 my-4">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" style="width: 500px;"> <!-- Add the name attribute -->
                    </div>
                    <div class="mb-3">
                        <label for="pass" class="form-label">Kata Sandi</label>
                        <input type="password" class="form-control" id="pass" name="password" placeholder="Minimal 8 karakter" style="width: 500px;"> <!-- Add the name attribute -->
                    </div>
                    <button type="submit" class="btn btn-primary my-2">Masuk</button>
                    <div id="warningMessage" class="text-danger" style="display: none;">Silahkan isi data terlebih dahulu.</div>

                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            const emailInput = document.getElementById('Email');
                            const passInput = document.getElementById('pass');
                            const loginButton = document.querySelector('.btn-primary'); // Memilih tombol "Masuk"
                            const warningMessage = document.getElementById('warningMessage');
                    
                            emailInput.addEventListener('input', function() {
                                checkInputs();
                            });
                    
                            passInput.addEventListener('input', function() {
                                checkInputs();
                            });
                    
                            loginButton.addEventListener('click', function(event) {
                                if (emailInput.value.trim() === '' || passInput.value.trim() === '') {
                                    event.preventDefault(); // Mencegah pengiriman formulir
                                    warningMessage.style.display = 'block'; // Menampilkan peringatan
                                } else {
                                    warningMessage.style.display = 'none'; // Menyembunyikan peringatan jika semua input valid
                                }
                            });
                    
                            function checkInputs() {
                                if (emailInput.value.trim() === '' || passInput.value.trim() === '') {
                                    warningMessage.style.display = 'block'; // Menampilkan peringatan
                                } else {
                                    warningMessage.style.display = 'none'; // Menyembunyikan peringatan jika semua input valid
                                }
                            }
                        });
                    </script>
                </div>
            </form>
        </div>
    </section>
    <!-- login section end -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>
