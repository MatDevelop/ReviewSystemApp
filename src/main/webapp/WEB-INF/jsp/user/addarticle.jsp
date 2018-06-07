<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html lang="pl">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ReviewSystem</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
</head>
<body>
    <div id="container">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/">ReviewSystem</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/user/viewarticles">Przeglądaj artykuły</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Wyloguj</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row text-center">

                <div class="col-md-6 col-md-offset-3">
                    <form role="form" method="POST" action="addarticle" enctype="multipart/form-data">

                        <fieldset>
                            <legend>Dane autora</legend>

                            <div class="form-group col-md-12">
                                <label for="first_name">Autor/Autorzy</label>
                                <input type="text" class="form-control" name="authorname" placeholder="Autor/Autorzy" value="${article.authorname}" maxlength="100" required >
                            </div>

                            <div class="form-group col-md-12">
                                <label for="">Kontakt</label>
                                <input type="text" class="form-control" name="contact" placeholder="Kontakt" value="${article.contact}" maxlength="100" >
                            </div>

                            <div class="form-group col-md-12">
                                <label for="adres">Adres</label>
                                <input type="text" class="form-control" name="authoraddress" placeholder="Adres" value="${article.authoraddress}" maxlength="100" >
                            </div>

                            <legend class="text-center">Afiliacje</legend>
                            <div class="form-group col-md-12 text-center">
                                <select class="form-control" name="affiliation" value="${article.affiliation}">
                                    <option>Wydział Budownictwa, Architektury i Inżynierii Środowiska</option>
                                    <option>Wydział Technologii i Inżynierii Chemicznej</option>
                                    <option>Instytut Matematyki i Fizyki</option>
                                    <option>Wydział Inżynierii Mechanicznej</option>
                                    <option>Wydział Rolnictwa i Biotechnologii</option>
                                    <option>Wydział Telekomunikacji, Informatyki i Elektrotechniki</option>
                                    <option>Wydział Hodowli i Biologii Zwierząt</option>
                                    <option>Wydział Zarządzania</option>
                                </select>
                            </div>
                            <legend class="text-center">Dane artykułu</legend>

                            <div class="form-group col-md-12">
                                <label for="title">Tytuł artykułu</label>
                                <input type="text" class="form-control" name="title" placeholder="Tytuł pracy" value="${article.title}" maxlength="254" required >
                            </div>
                            <div class="form-group col-md-12">
                                <label for="description">Opis artykułu</label>
                                <input type="text" class="form-control" name="description" placeholder="Opis pracy" value="${article.description}" maxlength="254">
                            </div>
                            <div class="form-group col-md-12">
                                <label for="keywords">Słowa kluczowe</label>
                                <input type="text" class="form-control" name="keywords" placeholder="Słowa kluczowe" value="${article.keywords}" maxlength="150">
                            </div>
                            <div class="form-group col-md-6 text-left">
                                <label>Plik PDF</label>
                                <input type="file" accept=".pdf"  name="pdffile" required>
                            </div>
                            <div class="form-group col-md-6 text-left">
                                <label>Plik WORD</label>
                                <input type="file" accept=".doc" name="docfile">
                            </div>




                        </fieldset>

                        <br>
                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary" style="width: 200px;">
                                    Dodaj
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>





    </div>
    <!--Copyright-->
        <div class="footersettings">
            © 2018 Copyright: Mateusz Brugier
        </div>
    <!--/.Copyright-->

</body>
</html>