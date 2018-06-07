﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/formstyle.css"/>
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
                    <li><a href="registration"><span class="glyphicon glyphicon-edit"></span> Rejestracja</a></li>
                </ul>
            </div>
        </nav>

        <div class="container top100">
            <br>
            <div class="row">
                <p style="font-size: 20; color: #337ab7; text-align: center;">${successMessage}</p>
                <form class="form-signin" action="login" method="POST">
                    <h2 class="form-signin-heading">Zaloguj się</h2>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Adres email" required autofocus>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Hasło" required>
                    <button class="btn btn-lg btn-primary btn-block" name="Submit" value="Login" type="Submit">Zaloguj się</button>
                    <br>
                    <c:if test="${param.error}">
                        <div align="center">
                            <p style="font-size: 20; color: #FF1C19;">Wprowadzone hasło lub email jest nieprawidłowe!</p>
                        </div>
                    </c:if>
                </form>

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