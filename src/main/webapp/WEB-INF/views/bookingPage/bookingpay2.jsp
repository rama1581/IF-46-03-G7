<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Tanggal</title>
    <!-- <link rel="stylesheet" href="/src/main/resources/static/css/book.css"/> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'poppins', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
    
        * {
            margin: 0;
            padding: 0;
            font-family: 'Poppins';
        }

        .cont_nav {
            top: 0;
            width: 100%;
            box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
        }

        .content_nav button {
            border-radius: 8px;
            background: #00BBB4;
            display: flex;
            width: 182.237px;
            height: 48px;
            padding: 8px 16.237px 10px 16px;
            justify-content: center;
            align-items: center;
            flex-shrink: 0;
            text-align: center;
            color: white;
            border: none;
            font-family: Poppins;
            font-size: 20px;
            font-style: normal;
            font-weight: 700;
            line-height: normal;
            letter-spacing: -0.33px;
        }

        .content_nav a {
            flex-shrink: 0;
            color: #9D9D9D;
            text-align: center;
            font-family: Poppins;
            font-size: 25px;
            font-style: normal;
            font-weight: 500;
            line-height: normal;
        }

        .logo {
            margin-right: 1470px;
            width: 178px;
            height: 54px;
        }
    
        .booking-section {
            margin: 20px;
        }

        .booking-section button{
        background-color: #00BBB4;
        border-color: #00BBB4;
        }
        
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    
        form h2 {
            color: #343a40;
        }
    
        .form-group {
            margin-bottom: 20px;
        }
    
        label {
            display: block;
            margin-bottom: 5px;
            color: #495057;
        }
    
        input.form-control {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
    
        #date-info {
            margin-top: 10px;
            color: #00BBB4;
        }
    
        #submitButton {
            margin-top: 20px;
        }
    
        .booking-pay-section {
            margin-top: 20px;
        }
    
        .payment-container {
            display: flex;
            justify-content: space-between;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    
        .left-section, .right-section {
            flex: 1;
        }
    
        .left-section h1, .right-section h2 {
            color: #343a40;
        }
    
        .durasi, .payment {
            margin-top: 10px;
            color: #495057;
        }
    
        .payment-method-option {
            margin-bottom: 10px;
        }
    
        .payment-method-option input {
            margin-right: 5px;
        }
    
        #subtotal, #total {
            font-weight: bold;
            color: #007bff;
        }
    
        .cancel-button, .continue-button {
            background-color: #00BBB4;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        .continue-form {
            position: fixed;
            bottom: 20px;
            left: 20px;
        }

        .continue-button {
            background-color: #00BBB4;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
    
    </style>
    
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

    <!-- Tanggal and Booking Pay section -->
    <section class="booking-section">
        <h2>Pilih Rentang Tanggal Sewa</h2>
        <form id="booking-form" action="${pageContext.request.contextPath}/booking/${booking_id}/payment" method="GET" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="start-date">Tanggal Masuk:</label>
                <input type="text" id="start-date" name="start-date" class="form-control" placeholder="Pilih tanggal" autocomplete="off" required>
            </div>
        
            <div class="form-group">
                <label for="end-date">Tanggal Keluar:</label>
                <input type="text" id="end-date" name="end-date" class="form-control" placeholder="Pilih tanggal" autocomplete="off" required>
            </div>
        
            <div id="date-info">
                <!-- Info tanggal dan durasi akan ditampilkan di sini -->
                <div id="duration-info"></div>
            </div>
            <button type="submit" id="submitButton" class="btn btn-primary" onclick="toggleBookingPay()">Lanjutkan ke Pembayaran</button>
        </form>

        <!-- Booking Pay start -->
        <div class="payment-container booking-pay-section" style="display: none;">
            <div class="left-section">
                <h1>Pembayaran</h1>
                <div class="durasi" style="font-size: 20px;">
                    <label for="paymentMethod">Durasi sewa kost:</label>
                </div>
                <c:out value="${start_date}"/> → <c:out value="${end_date}"/>
                
                <div class="payment" style="font-size: 20px;">
                    <label for="paymentMethod">Pilih metode pembayaran:</label>
                </div>
                
                <div class="payment-method-option">
                    <input type="radio" id="virtualAccount" name="paymentMethod" value="virtualAccount">
                    <label for="virtualAccount">Virtual Account</label>
                </div>
            
                <div class="payment-method-option">
                    <input type="radio" id="qris" name="paymentMethod" value="qris">
                    <label for="qris">QRIS</label>
                </div>
            </div>
            
    
            <div class="right-section">
                <h2>Detail Pembayaran</h2>
                <!-- Elemen untuk menampilkan metode pembayaran yang dipilih -->
                <p id="selectedPaymentMethod">Metode Pembayaran:</p>

            <script>
                // Dapatkan semua elemen radio button dengan name="paymentMethod"
                var radios = document.querySelectorAll('input[name="paymentMethod"]');

                // Tambahkan event listener untuk setiap radio button
                radios.forEach(function(radio) {
                    radio.addEventListener('change', function() {
                        if (this.checked) {
                            // Perbarui elemen dengan ID 'selectedPaymentMethod' dengan teks "Metode Pembayaran: " diikuti dengan teks dari radio button yang dipilih
                            document.getElementById('selectedPaymentMethod').innerText = "Metode Pembayaran: " + this.nextElementSibling.innerText;
                        }
                    });
                });
            </script>

    
                <p>Subtotal: <span id="subtotal">Rp <c:out value="${price}" /></span></p>
                <p>Biaya Administrasi: Rp 2500</p>
                <p>Total: <span id="total"> ${price + 2500} </span></p>
    
                <button class="cancel-button">Batalkan Pesanan</button>

                <form id="booking-form" action = "${pageContext.request.contextPath}/booking/${booking_id}/confirm" method="GET">
                    <button class="continue-button">Lanjutkan</button>
                </form>
            </div>
        </div>
        <!-- Booking Pay end -->
    </section>
    <!-- Tanggal and Booking Pay section end -->

    <!-- Masukkan semua script Anda di sini -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script>
        // Misalnya, menggunakan JavaScript untuk menambahkan teks ke dalam elemen
        var dateInfoElement = document.getElementById('date-info');
        var durationInfoElement = document.getElementById('duration-info');
    
        function updateDateAndDurationInfo() {
            var startDate = document.getElementById('start-date').value;
            var endDate = document.getElementById('end-date').value;
    
            if (startDate && endDate) {
                dateInfoElement.innerHTML = 'Informasi Tanggal: ' + startDate + ' - ' + endDate;
    
                // Hitung durasi sewa
                var durationInDays = Math.ceil((new Date(endDate) - new Date(startDate)) / (1000 * 60 * 60 * 24));
                durationInfoElement.innerHTML = 'Durasi Sewa: ' + durationInDays + ' hari';
            }
        }
    
        $(document).ready(function () {
            $('#start-date, #end-date').datepicker({
                format: 'yyyy-mm-dd',
                todayHighlight: true,
                autoclose: true,
                startDate: new Date()
            }).on('change', updateDateAndDurationInfo);
        });
    </script>
    <script>
        // Function to toggle visibility of Booking Pay section
        function toggleBookingPay() {
            var bookingPaySection = document.querySelector('.booking-pay-section');
            if (bookingPaySection.style.display === 'none') {
                bookingPaySection.style.display = 'block';
            } else {
                bookingPaySection.style.display = 'none';
            }
        }

        $(document).ready(function () {
            $('#start-date, #end-date').datepicker({
                format: 'yyyy-mm-dd',
                todayHighlight: true,
                autoclose: true,
                startDate: new Date()
            });
        });

        function validateForm() {
            var startDate = document.getElementById('start-date').value;
            var endDate = document.getElementById('end-date').value;

            if (!startDate || !endDate) {
                alert('Mohon isi kedua tanggal terlebih dahulu.');
                return false; // Mencegah pengiriman formulir
            }

            // Toggle Booking Pay section if validation passes
            toggleBookingPay();
            return true; // Kirim formulir jika semua syarat terpenuhi
        }
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script>
        function logoutAndRedirect() {
            window.location.href = '${pageContext.request.contextPath}/logout';
        }
    </script>
</body>
</html>
