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
                    <li class="active"><a href="/admin/home">Przeglądaj artykuły</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Wyloguj</a></li>
                </ul>
            </div>
        </nav>

        <div class="container text-center" id="usersDiv">
            <h3>Recenzenci</h3>
            <hr>
            <div class="table">
                <table class="table table-striped table-bordered text-left">
                    <thead>
                        <col width="50">
                        <col width="200">
                        <col width="200">
                        <col width="150">
                        <col width="130">
                        <col width="130">
                        <col width="50">
                        <tr>
                            <th>Id</th>
                            <th>Email</th>
                            <th>Imię</th>
                            <th>Nazwisko</th>
                            <th>Stopień naukowy</th>
                            <th>Miejsce pracy</th>
                            <th>Edytuj rolę</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="reviewer" items="${reviewerList}">
                            <tr>
                                <td>${reviewer.userID}</td>
                                <td>${reviewer.email}</td>
                                <td>${reviewer.name}</td>
                                <td>${reviewer.surname}</td>
                                <td>${reviewer.degree}</td>
                                <td>${reviewer.workplace}</td>
                                <td><a href="/admin/update-user?id=${reviewer.userID}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>


            <h3>Użytkownicy</h3>
            <hr>
            <div class="table">
                <table class="table table-striped table-bordered text-left">
                    <thead>
                        <col width="50">
                        <col width="200">
                        <col width="200">
                        <col width="150">
                        <col width="130">
                        <col width="130">
                        <col width="50">
                        <tr>
                            <th>Id</th>
                            <th>Email</th>
                            <th>Imię</th>
                            <th>Nazwisko</th>
                            <th>Stopień naukowy</th>
                            <th>Miejsce pracy</th>
                            <th>Edytuj rolę</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <td>${user.userID}</td>
                                <td>${user.email}</td>
                                <td>${user.name}</td>
                                <td>${user.surname}</td>
                                <td>${user.degree}</td>
                                <td>${user.workplace}</td>
                                <td><a href="/admin/update-user?id=${user.userID}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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