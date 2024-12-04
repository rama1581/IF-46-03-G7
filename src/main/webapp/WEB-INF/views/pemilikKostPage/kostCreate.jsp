<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menambahkan Kost Baru</title>
    <link rel="stylesheet" href="/css/datakos.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<section>
    <div class="sidebar">
        <div class="image">
            <img src="/aset/Logo copy.png" alt="">
        </div>
        <ul class="nav">
            <span style="font-weight: bold;">
                Data Kost
            </span><br><br>
        </ul>
    </div>
</section>

<section>
    <form action="${pageContext.request.contextPath}/edit/kost/create" method="post" contentType="application/json">
        <div class="main">
            <span style="font-size: x-large; font-weight: bolder; margin-left: 285px; margin-top: 25px;">
                Silakan lengkapi data kos
            </span>
            <h2>Lengkapi data kos agar penyewa lebih mengetahui spesifikasi kos yang Anda sewakan</h2><br>
    
            <span style="font-size: x-large; font-weight: bolder; margin-left: 285px; margin-top: 25px;">
                Nama Kos
            </span>
            <h2>Saran: Kos (spasi) nama kos</h2>
            <div class="form mb-3 my-1">
                <input class="form-control" type="text" id="name" name="name" required>
            </div><br>
    
            <h1>Disewakan untuk putra/putri/campur</h1>
            <h2>Pilih tipe kos yang sesuai</h2>
            <div class="form-check form-check-inline">
                <input type="checkbox" id="allowedMale" name="allowedMale">
                <label for="allowedMale">Putra :</label>
            </div>
            <div class="form-check form-check-inline">
                <input type="checkbox" id="allowedFemale" name="allowedFemale">
                <label for="allowedFemale">Putri :</label>
            </div>
    
            <span style="font-size: x-large; font-weight: bolder; margin-left: 285px; margin-top: 25px;">
                Alamat kos
            </span>
            <h2>Saran: Tulis lengkap mulai dari nama jalan, RT/RW, Kecamatan, Kabupaten, Provinsi (tambahkan
                patokan agar kos mudah ditemukan)</h2>
            <textarea class="form-control mb-3 mx-1" style="height: 100px; width: 450px; margin-left: 295px;" id="address" name="address" required></textarea><br>
    
            <button type="submit" class="btn btn-link no-border" style="margin-left: 1300px; background-color: #00BBB4; color: black; text-decoration: none;">Lanjutkan</button>

        </div>
    </form>
    
</section>
</body>
</html>