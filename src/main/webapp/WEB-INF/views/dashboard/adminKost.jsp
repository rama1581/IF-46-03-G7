<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Kost</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/approvalkost.css">
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
                    <img src="/aset/pemilik.png" alt="Icon"> Kost
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/booking">
                    <img src="/aset/pembayaran.png" alt="Icon"> Booking
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard/pencariKost">
                    <img src="/aset/pencari.png" alt="Icon"> Pencari Kost
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <img src="/aset/out.png" alt="Icon"> Logout
                </a>
            </li>
        </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <br><br>
        <h1>Daftar Kost</h1>
        <div class="search-box">
            <form>
                <input type="text" placeholder="Search Kost">
                <button type="submit">Go</button>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nama Kost</th>
                    <th>Pemilik</th>
                    <th>Kategori</th>
                    <th>No HP</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="kost" items="${kosts}">
                    <tr>
                        <td>${kost.kost_id}</td>
                        <td>${kost.name}</td>
                        <td>${kost.pemilikKost.user.username}</td>
                        <td>
                            <c:choose>
                                <c:when test="${kost.allowedMale}">
                                    <c:choose>
                                        <c:when test="${kost.allowedFemale}">
                                            Putra & Putri
                                        </c:when>
                                        <c:otherwise>
                                            Putra
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    Putri
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${kost.pemilikKost.user.phoneNumber}</td>
                        <td>
                            <form action="/dashboard/kost/${kost.kost_id}" method="post">
                                <select name="approved">
                                    <option value="true"  <c:if test="${kost.approved}">selected</c:if>>Disetujui</option>
                                    <option value="false" <c:if test="${!kost.approved}">selected</c:if>>Ditolak</option>
                                </select>
                                <button type="submit" class="save-changes-button" onclick="saveChanges()">Simpan</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script>
        function saveChanges() {
            var form = document.getElementById('approvalForm');
            form.submit();
        }
    </script>

    
</body>
</html>
