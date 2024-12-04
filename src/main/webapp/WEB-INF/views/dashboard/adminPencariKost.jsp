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

    <!-- section pencari kost start -->
    <section>
        <div class="container my-3"> 
            <div class="text" style="font-size: 20px; margin-left: 280px;">
                <h1>Daftar User</h1>
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
                    <th scope="col">Username</th>
                    <th scope="col">Email</th>
                    <th scope="col">Password</th>
                    <th scope="col">No HP</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="pencariKost" items="${pencariKosts}">
                    <tr>
                        <th scope="row">${pencariKost.pencariKost_id}</th>
                        <td>${pencariKost.user.username}</td>
                        <td>${pencariKost.user.email}</td>
                        <td>${pencariKost.user.password}</td>
                        <td>${pencariKost.user.phoneNumber}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
    <!-- section pencari kost end -->
    
</body>
</html>