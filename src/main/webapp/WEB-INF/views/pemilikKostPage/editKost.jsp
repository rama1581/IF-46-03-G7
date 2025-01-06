<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Kost</title>
    <link rel="stylesheet" href="/css/datakos.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<section>
    <div class="sidebar" style="background-color: #070606; color: white;">
        <div class="image">
            <img src="/aset/Logo copy.png" alt="" style="width: 160px; height: auto;">
        </div>
        <ul class="nav">
            <span style="font-weight: bold;">Edit Data Kost</span><br><br>
        </ul>
    </div>

<section>
    <!-- Feedback Message -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <!-- Form untuk pengeditan data kost -->
    <form action="${pageContext.request.contextPath}/edit/kost/${kost.kost_id}" method="post">
        <div class="main">
            <span style="font-size: x-large; font-weight: bolder; margin-left: 285px; margin-top: 25px;">
                Silakan lengkapi data Kost
            </span>
            <h2>Lengkapi data Kost agar penyewa lebih mengetahui spesifikasi kost yang Anda sewakan</h2><br>

            <!-- Nama Kost -->
            <label for="name" style="font-size: x-large; font-weight: bolder; margin-left: 285px; margin-top: 25px;">
                Nama Kost
            </label>
            <h2>Saran: Kost (spasi) nama kost</h2>
            <div class="form mb-3 my-1">
                <input class="form-control" type="text" id="name" name="name" value="${kost.name}" placeholder="Masukkan nama kost" required>
            </div><br>

            <!-- Tipe Kost -->
            <h1>Disewakan untuk putra/putri/campur</h1>
            <h2>Pilih tipe kost yang sesuai</h2>
            <div class="form-check form-check-inline">
                <input type="checkbox" id="allowedMale" name="allowedMale" <c:if test="${kost.allowedMale}">checked</c:if>>
                <label for="allowedMale">Putra</label>
            </div>
            <div class="form-check form-check-inline">
                <input type="checkbox" id="allowedFemale" name="allowedFemale" <c:if test="${kost.allowedFemale}">checked</c:if>>
                <label for="allowedFemale">Putri</label>
            </div>

            <!-- Harga Kost -->
            <label for="price" style="font-size: x-large; font-weight: bolder; margin-left: 285px; margin-top: 25px;">
                Harga Kost (per bulan)
            </label>
            <h2>Masukkan harga kost (contoh: 500000 untuk Rp500.000)</h2>
            <div class="form mb-3 my-1">
                <input class="form-control" type="number" id="price" name="price" value="${kost.price}" placeholder="Contoh: 500000" required>
            </div><br>

            <!-- Alamat Kost -->
            <label for="address" style="font-size: x-large; font-weight: bolder; margin-left: 285px; margin-top: 25px;">
                Alamat Kost
            </label>
            <h2>Saran: Tulis lengkap mulai dari nama jalan, RT/RW, Kecamatan, Kabupaten, Provinsi</h2>
            <textarea class="form-control mb-3 mx-1" style="height: 100px; width: 450px; margin-left: 295px;" id="address" name="address" placeholder="Masukkan alamat lengkap" required>${kost.address}</textarea><br>

            <!-- Tombol Submit -->
            <div style="margin-left: 295px;">
                <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
            </div>
        </div>
    </form>
</section>
</body>
</html>
