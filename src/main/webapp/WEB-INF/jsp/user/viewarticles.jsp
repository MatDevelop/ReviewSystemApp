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
                    <li class="active"><a href="/user/addarticle">Dodaj artykuł</a></li>
                    <li class="active"><a href="/user/viewarticles">Przeglądaj artykuły</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Wyloguj</a></li>
                </ul>
            </div>
        </nav>

        <div class="container text-center" id="articleDiv">
            <c:if test = "${param.addingerror == true}">
                <h4 class="text-left" style="color: #337AB7;">Dodano artykuł. Proszę czekać na przydzielenie recenzentów.</h4>
            </c:if>
            <c:if test = "${param.addingerror == false}">
                <h4 class="text-left" style="font-size: 20; color: #FF1C19;">Ups! Coś poszło nie tak.</h4>
            </c:if>
            <h3>Moje artykuły</h3>
            <hr>
            <br>
            <h4>Oczekujące</h4>
            <hr>
            <div class="table">
                <table class="table table-striped table-bordered text-left">
                    <thead>
                        <col width="200">
                        <col width="300">
                        <col width="200">
                        <col width="130">
                        <col width="130">
                        <tr>
                            <th>Tytuł</th>
                            <th>Opis</th>
                            <th>Słowa kluczowe</th>
                            <th>Recenzja nr.1</th>
                            <th>Recenzja nr.2</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="article" items="${waitingarticleList}">
                            <tr>
                                <td>${article.title}</td>
                                <td>${article.description}</td>
                                <td>${article.keywords}</td>
                                <c:if test="${empty article.reviews}">
                                    <td class="text-center">Przydzielanie recenzenta...</td>
                                    <td class="text-center">Przydzielanie recenzenta...</td>
                                </c:if>
                                <c:forEach var="review" items="${article.reviews}">
                                    <c:if test = "${fn:length(review.pdffile) > 0}">
                                        <td class="text-center"><a href="getPdf?id=${review.reviewID}"><span style="font-size:25px;" class="glyphicon glyphicon-download"></span></a></td>
                                    </c:if>
                                    <c:if test = "${fn:length(review.pdffile) == 0}">
                                        <td class="text-center">Recenzja w toku...</td>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${fn:length(article.reviews) == 1}">
                                    <td class="text-center">Przydzielanie recenzenta...</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <br><br>
            <h4>Zrecenzowane</h4>
            <hr>
            <div class="table">
                <table class="table table-striped table-bordered text-left">
                    <thead>
                        <col width="200">
                        <col width="300">
                        <col width="200">
                        <col width="130">
                        <col width="130">
                        <tr>
                            <th>Tytuł</th>
                            <th>Opis</th>
                            <th>Słowa kluczowe</th>
                            <th>Recenzja nr.1</th>
                            <th>Recenzja nr.2</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="article" items="${endedarticleList}">
                            <tr>
                                <td>${article.title}</td>
                                <td>${article.description}</td>
                                <td>${article.keywords}</td>
                                <c:forEach var="review" items="${article.reviews}">
                                    <td class="text-center"><a href="getPdf?id=${review.reviewID}"><span style="font-size:25px;" class="glyphicon glyphicon-download"></span></a></td>
                                </c:forEach>
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