<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Pembayaran</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/approvalpembayaran.css">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="image">
            <img src="/aset/Logo copy.png" alt="Logo" class="logo">
        </div>
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/kost">
                    <img src="/aset/pemilik.png" alt="kost">
                    <span>Kost</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/booking">
                    <img src="/aset/pembayaran.png" alt="booking">
                    <span>Booking</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/pencariKost">
                    <img src="/aset/pencari.png" alt="pencariKost">
                    <span>Pencari Kost</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="/aset/out.png" alt="logout">
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <h1>Daftar Pembayaran</h1>

        <!-- Search Box -->
        <div class="search-box">
            <form>
                <input type="search" placeholder="Search User">
                <button type="submit" class="search-button">Go</button>
            </form>
        </div>

        <!-- Table -->
        <table>
            <thead>
                <tr>
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
                        <th scope="row">${booking.booking_id}</th>
                        <td>${booking.pencariKost.user.username}</td>
                        <td>${booking.pencariKost.user.email}</td>
                        <td>${booking.room.kost.name}</td>
                        <td>${booking.entryDate.date} ${booking.entryDate.month + 1} ${booking.entryDate.year + 1900}</td>
                        <td>${booking.exitDate.date} ${booking.exitDate.month + 1} ${booking.exitDate.year + 1900}</td>
                        <td>${booking.payment.amount}</td>
                        <td>
                            <form action="/dashboard/booking/${booking.booking_id}" method="post">
                                <select name="paymentStatus">
                                    <option value="awaiting payment" <c:if test="${booking.payment.status eq 'awaiting payment'}">selected</c:if>>Awaiting Payment</option>
                                    <option value="paid" <c:if test="${booking.payment.status eq 'paid'}">selected</c:if>>Paid</option>
                                    <option value="confirmed" <c:if test="${booking.payment.status eq 'confirmed'}">selected</c:if>>Confirmed</option>
                                </select>
                                <button type="submit">Simpan</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- section approval pembayaran end -->
    <script>
        function saveChanges() {
            var form = document.getElementById('approvalForm');
            form.submit();
        }
    </script>

    
    
</body>
</html>
