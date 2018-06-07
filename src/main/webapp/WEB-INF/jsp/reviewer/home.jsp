<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Wyloguj</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <c:if test = "${param.addingerror == true}">
                <label style="font-size: 20; color: #337AB7;">Dodano recenzję.</label>
            </c:if>
            <c:if test = "${param.addingerror == false}">
                <label style="font-size: 20; color: #FF1C19;">Ups! Coś poszło nie tak.</label>
            </c:if>
        </div>
        <div class="container text-center" id="newDiv">
            <h3>Przydzielone artykuły</h3>
            <hr>
            <div class="table">
                <table class="table table-striped table-bordered text-left">
                    <thead>
                        <col width="200">
                        <col width="200">
                        <col width="150">
                        <col width="130">
                        <col width="110">
                        <col width="70">
                        <col width="70">
                        <col width="70">
                        <tr>
                            <th>Tytuł</th>
                            <th>Opis</th>
                            <th>Autor</th>
                            <th>Kontakt do autora</th>
                            <th>Afiliacja</th>
                            <th>Plik Pdf</th>
                            <th>Plik Word</th>
                            <th>Dodaj recenzję</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="article" items="${articlelist}">
                            <tr>
                                <td>${article.title}</td>
                                <td>${article.description}</td>
                                <td>${article.authorname}</td>
                                <td>${article.contact}</td>
                                <td>${article.affiliation}</td>
                                <td class="text-center"><a href="getPdf?id=${article.articleID}"><span style="font-size:25px;" class="glyphicon glyphicon-download"></span></a></td>
                                <c:if test = "${fn:length(article.docfile) > 0}">
                                    <td class="text-center"><a href="getDoc?id=${article.articleID}"><span style="font-size:25px;" class="glyphicon glyphicon-download"></span></a></td>
                                </c:if>
                                <c:if test = "${fn:length(article.docfile) == 0}">
                                    <td class="text-center">brak</td>
                                </c:if>
                                <td class="text-center"><a href="/reviewer/addreview?articleID=${article.articleID}"><span style="font-size:25px;" class="glyphicon glyphicon-upload"></span></a></td>
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