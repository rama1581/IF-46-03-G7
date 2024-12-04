<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>approval kost</title>
    <link rel="stylesheet" href="/css/approvalpembayaran.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
</head>
<body>
    
    <!-- section navbar start -->
    <section>
        <div class="sidebar">
            <div class="image">
                <img src="/aset/Logo copy.png" alt="">
            </div>
            <ul class="nav">
                <li>
                    <a href="${pageContext.request.contextPath}/dashboard/kost" style="color: black; text-decoration: none;">
                        <img src="/aset/pemilik.png" alt="approvalkos" style="vertical-align: middle; margin-right: 10px;">
                        <span>Kost</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/dashboard/booking" style="color: black; text-decoration: none; margin-left: 7px;">
                        <img src="/aset/pembayaran.png" alt="payment" style="vertical-align: middle; margin-right: 14px;">
                        <span>Booking</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/dashboard/pencariKost" style="color: black; text-decoration: none;">
                        <img src="/aset/pencari.png" alt="pencarikos" style="vertical-align: middle; margin-right: 14px;">
                        <span>Pencari Kost</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/logout" style="color: black; text-decoration: none;">
                        <img src="/aset/out.png" alt="pencarikos" style="vertical-align: middle; margin-right: 24px;">
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
    </section>
    <!-- section navbar end -->

    <!-- section approval pembayaran start -->
    <section>
        <div class="container my-3"> 
            <div class="text" style="font-size: 20px; margin-left: 280px;">
                <h1>Daftar Pembayaran</h1>
            </div>
            <form>
                <div class="search">
                    <!-- <span class="search-icon material-symbols-outlined">search</span> -->
                    <input class="search-input" type="search" placeholder="Search User">
                    <button type="submit" class="search-button">Go</button>
                </div>
            </form>
        </div>

        <table class="table">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nama Pencari</th>
                    <th scope="col">Email</th>
                    <th scope="col">Nama Kost</th>
                    <th scope="col">Tanggal masuk</th>
                    <th scope="col">Tanggal keluar</th>
                    <th scope="col">Total Pembayaran</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <th scope="row">1</th>
                        <td>${booking.pencariKost.user.username}</td>
                        <td>${booking.pencariKost.user.email}</td>
                        <td>${booking.room.kost.name}</td>
                        <td>${booking.entryDate.date} ${booking.entryDate.month + 1} ${booking.entryDate.year + 1900}</td>
                        <td>${booking.exitDate.date} ${booking.exitDate.month + 1} ${booking.exitDate.year + 1900}</td>
                        <td>${booking.payment.amount}</td>
                        <td>
                            <form action="/dashboard/booking/${booking.booking_id}" method="post">

                                <select class="custom-select" name="paymentStatus">
                                    <option value="awaiting payment"   <c:if test="${booking.payment.status eq 'awaiting payment'}"   >selected</c:if> >awaiting payment</option>
                                    <option value="paid"     <c:if test="${booking.payment.status eq 'paid'}"     >selected</c:if> >Paid</option>
                                    <option value="confirmed"<c:if test="${booking.payment.status eq 'confirmed'}">selected</c:if> >Confirmed</option>
                                </select>

                                <button type="submit" class="save-changes-button" onclick="saveChanges()" style="background-color: #00BBB4; color: #ffffff; font-family: 'Poppins', sans-serif; border-radius: 10px; border-color: #00BBB4;">
                                    Simpan perubahan
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
    <!-- section approval pembayaran end -->
    <script>
        function saveChanges() {
            var form = document.getElementById('approvalForm');
            form.submit();
        }
    </script>
</body>
</html>