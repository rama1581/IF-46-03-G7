<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profil - KOST-IN</title>
    <link rel="stylesheet" href="editprofil.css">
</head>
<body class="edit-profil-page">
    <header>
        <div class="header-container">
            <img class="logo" src="assets/logo.png" alt="KOST-IN Logo">
            <h1>Edit Profil</h1>
        </div>
    </header>
    
    <main>
        <div class="form-container">
            <form action="editProfilServlet" method="POST" enctype="multipart/form-data">
                <!-- Nama Lengkap -->
                <div class="form-group">
                    <label for="namaLengkap">Nama Lengkap</label>
                    <input type="text" id="namaLengkap" name="namaLengkap" value="<%= request.getAttribute("namaLengkap") %>" required>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="<%= request.getAttribute("email") %>" required>
                </div>

                <!-- No Telepon -->
                <div class="form-group">
                    <label for="noTelepon">No Telepon</label>
                    <input type="text" id="noTelepon" name="noTelepon" value="<%= request.getAttribute("noTelepon") %>" required>
                </div>

                <!-- Foto Profil -->
                <div class="form-group">
                    <label for="fotoProfil">Foto Profil</label>
                    <input type="file" id="fotoProfil" name="fotoProfil">
                </div>

                <!-- Tombol Simpan -->
                <div class="form-group button-container">
                    <button type="submit">Simpan Perubahan</button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>
