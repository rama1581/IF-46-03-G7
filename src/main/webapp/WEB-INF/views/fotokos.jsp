<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>foto kos</title>
    <link rel="stylesheet" href="../src/main/resources/static/css/fotokos.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
    <!-- side bar -->
    <section>
        <div class="sidebar">
            <div class="image">
                <img src="../src/main/resources/static/aset/Logo copy.png" alt="">
            </div>
            <ul class="nav">
                <span>
                    Data kos
                </span><br><br>
            </ul>
        </div>
    </section>
    <!-- side bar -->

    <!-- Main -->
    <section>
        <div class="main-content">
        <div class="container">
            <div class="row">
            <div class="col-md-12">
                <span style="font-size: x-large; font-weight: bolder; margin-left: 1px; margin-top: 25px;">
                    Pasang Foto Terbaik Kos Anda
                </span>
                <h2>Foto menarik adalah hal pertama yang penyewa perhatikan</h2>
            </div>
            </div>
        </div>

        <!-- Foto bagunan Start -->
        <div class="container">
            <div class="row">
            <div class="col-md-12">
                <span style="font-size: x-large; font-weight: bolder; margin-left: 1px; margin-top: 25px;">
                    Foto Bangunan Kos
                </span>
                <h2>Foto horizontal akan terlihat lebih bagus untuk foto utama kos Anda</h2><br>
                <div class="preview-images-zone">
                    <div class="preview-image preview-show-1">
                        <div class="image-cancel" data-no="1">x</div>
                        <div class="image-zone"><img id="pro-img-1" src="../src/main/resources/static/aset/Img_box_fill@3x.png"></div>
                        <div class="tools-edit-image"><a href="javascript:void(0)" data-no="1" class="btn btn-light btn-edit-image">edit</a></div>
                        <fieldset class="form-group">
                            <a href="javascript:void(0)" onclick="$('#pro-image').click()">+Tambah foto bangunan kos</a>
                            <input type="file" id="pro-image" name="pro-image" style="display: none;" class="form-control" multiple>
                        </fieldset>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <!-- Foto bagunan End -->

        <!-- Foto Dalam kamar Start -->
        <div class="container">
            <div class="row">
            <div class="col-md-12">
                <span style="font-size: x-large; font-weight: bolder; margin-left: 1px; margin-top: 25px;">
                    Foto Dalam kamar
                </span>
                <h2>Foto tiap sudut dalam kamar agar penyewa lebih mengerti bagian dalam kamar kos</h2><br>
                <div class="preview-images-zone">
                    <div class="preview-image preview-show-1">
                        <div class="image-cancel" data-no="1">x</div>
                        <div class="image-zone"><img id="pro-img-1" src="../src/main/resources/static/aset/Img_box_fill@3x.png"></div>
                        <div class="tools-edit-image"><a href="javascript:void(0)" data-no="1" class="btn btn-light btn-edit-image">edit</a></div>
                        <fieldset class="form-group">
                            <a href="javascript:void(0)" onclick="$('#pro-image').click()">+Tambah foto bangunan kos</a>
                            <input type="file" id="pro-image" name="pro-image" style="display: none;" class="form-control" multiple>
                        </fieldset>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <!-- Foto Dalam kamar End -->
        </div>
    </section>
    <!-- Main end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>