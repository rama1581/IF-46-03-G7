<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Tanggal</title>
    <link rel="stylesheet" href="/css/bookingDate.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
</head>
<body>
    <!-- navbar section start -->
    <section class="header">
        <div class="container-fluid cont_nav" style="height: 84px;">
            <ul class="nav nav-pills justify-content-end content_nav">
                <li class="logo my-3">
                    <img src="/aset/logo.png" alt="">
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
                    <a class="nav-link" href="#">Chat</a>
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

    <!-- Tanggal section start -->
        <section class="booking-section">
            <h2>Pilih Rentang Tanggal Sewa</h2>
            <form id="booking-form" action="${pageContext.request.contextPath}/booking/${booking_id}/payment" method="GET" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="entryDate">Tanggal Masuk:</label>
                    <input type="text" id="entryDate" name="entryDate" class="form-control" placeholder="Pilih tanggal" autocomplete="off" required>
                </div>
            
                <div class="form-group">
                    <label for="exitDate">Tanggal Keluar:</label>
                    <input type="text" id="exitDate" name="exitDate" class="form-control" placeholder="Pilih tanggal" autocomplete="off" required>
                </div>
            
                <div id="date-info">
                    <!-- Info tanggal akan ditampilkan di sini -->
                </div>
            
                <button type="submit" id="submitButton" class="btn btn-primary">Lanjutkan ke Pembayaran</button>
            </form>
        </section>
        <!-- Tanggal section end -->
        
        <!-- Masukkan semua script Anda di sini -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        
        <script>
            $(document).ready(function () {
                $('#entryDate, #exitDate').datepicker({
                    format: 'yyyy-mm-dd',
                    todayHighlight: true,
                    autoclose: true,
                    entryDate: new Date()
                });
        
            });
        
            function validateForm() {
                var entryDate = document.getElementById('entryDate').value;
                var exitDate = document.getElementById('exitDate').value;
        
                if (!entryDate || !exitDate) {
                    alert('Mohon isi kedua tanggal terlebih dahulu.');
                    return false; // Mencegah pengiriman formulir
                }
                return true; // Kirim formulir jika semua syarat terpenuhi
            }
        </script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
