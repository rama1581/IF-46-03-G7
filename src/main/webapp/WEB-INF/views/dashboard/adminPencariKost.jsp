<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar User</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/approvalkost2.css">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="image">
            <img src="/aset/Logo copy.png" alt="Logo">
        </div>
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/kost">
                    <img src="/aset/pemilik.png" alt="Pemilik Kost"> Kost
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/booking">
                    <img src="/aset/pembayaran.png" alt="Pembayaran"> Booking
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/pencariKost">
                    <img src="/aset/pencari.png" alt="Pencari Kost"> Pencari Kost
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="/aset/out.png" alt="Logout"> Logout
                </a>
            </li>
        </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <br><br>
        <h1>Daftar User</h1>
        <div class="search-box">
            <form>
                <input type="text" placeholder="Search User">
                <button type="submit">Go</button>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>No HP</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="pencariKost" items="${pencariKosts}">
                    <tr>
                        <td>${pencariKost.pencariKost_id}</td>
                        <td>${pencariKost.user.username}</td>
                        <td>${pencariKost.user.email}</td>
                        <td>${pencariKost.user.password}</td>
                        <td>${pencariKost.user.phoneNumber}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
