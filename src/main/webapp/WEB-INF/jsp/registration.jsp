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
    <link rel="stylesheet" href="static/css/style.css"/>
	<link rel="stylesheet" href="static/css/formstyle.css"/>
</head>
<body>
    <div id="container">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/">ReviewSystem</a>
                </div>
                <ul class="nav navbar-nav">
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login"><span class="glyphicon glyphicon-user"></span> Zaloguj się</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
                <div class="row">

                    <div class="col-md-8 col-md-offset-2">
                        <form role="form" method="POST" action="registration">

                            <legend class="text-center">Rejestracja</legend>
                            <c:if test="${emailerror}">
                                    <p style="font-size: 20; color: #FF1C19;">Ten adres e-mail jest już zarejestrowany!</p>
                            </c:if>
                            <fieldset>
                                <legend>Account Details</legend>

                                <div class="form-group col-md-6">
                                    <label for="name">Imię *</label>
                                    <input type="text" class="form-control" name="name" placeholder="Imię" value="${user.name}" maxlength="50" required autofocus>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="surname">Nazwisko *</label>
                                    <input type="text" class="form-control" name="surname" placeholder="Nazwisko" value="${user.surname}" maxlength="50" required>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="">Email *</label>
                                    <input type="email" class="form-control" name="email" id="" placeholder="Email" value="${user.email}" maxlength="50" required>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="password">Hasło *</label>
                                    <input type="password" class="form-control" name="password" placeholder="Hasło" value="${user.password}" minlength="6" maxlength="20" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="degree">Stopień naukowy</label>
                                    <input type="text" class="form-control" name="degree" placeholder="Stopień naukowy" value="${user.degree}" maxlength="50">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="workplace">Miejsce pracy</label>
                                    <input type="text" class="form-control" name="workplace" placeholder="Miejsce pracy" value="${user.workplace}" maxlength="50">
                                </div>
                                <div class="form-group col-md-6">
                                    * Wymagane pola

                                </div>


                            </fieldset>


                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" required>
                                            I accept the <a href="#">terms and conditions</a>.*
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary">
                                        Zarejestruj
                                    </button>
                                    <a href="/login">Masz konto? Zaloguj się!</a>
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