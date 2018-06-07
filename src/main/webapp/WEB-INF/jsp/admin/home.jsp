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
                    <li class="active"><a href="/admin/viewusers">Przeglądaj użytkowników</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Wyloguj</a></li>
                </ul>
            </div>
        </nav>
        <div class="container text-center" id="newDiv">
            <c:if test="${param.success}">
                <label style="font-size: 20; color: #337AB7;">Dodano recenzenta!</label>
            </c:if>
            <h3>Nowe</h3>
            <hr>
            <div class="table">
                <table class="table table-striped table-bordered text-left">
                    <thead>
                        <col width="200">
                        <col width="300">
                        <col width="150">
                        <col width="130">
                        <col width="130">
                        <col width="80">
                        <col width="50">
                        <col width="60">
                        <tr>
                            <th>Tytuł</th>
                            <th>Opis</th>
                            <th>Autor</th>
                            <th>Kontakt</th>
                            <th>Afiliacja</th>
                            <th>Rec. (max. 2)</th>
                            <th>Przydziel</th>
                            <th>Usuń</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="article" items="${newarticleList}">
                            <tr>
                                <td>${article.title}</td>
                                <td>${article.description}</td>
                                <td>${article.authorname}</td>
                                <td>${article.contact}</td>
                                <td>${article.affiliation}</td>
                                <td>${fn:length(article.reviews)}</td>
                                <td class="text-center"><a href="/admin/addreviewers?id=${article.articleID}&articleID=${article.articleID}"><span class="glyphicon glyphicon-plus"></span></a></td>
                                <td class="text-center"><a href="/admin/deletearticle?articleID=${article.articleID}"><span class="glyphicon glyphicon-trash"></span></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <br>
            <h3>Recenzowane</h3>
            <hr>
            <div class="table">
                <table class="table table-striped table-bordered text-left">
                    <thead>
                        <col width="200">
                        <col width="300">
                        <col width="150">
                        <col width="130">
                        <col width="130">
                        <col width="80">
                        <col width="80">
                        <col width="60">
                        <tr>
                            <th>Tytuł</th>
                            <th>Opis</th>
                            <th>Autor</th>
                            <th>Kontakt do autora</th>
                            <th>Afiliacja</th>
                            <th>Rec nr.1</th>
                            <th>Rec nr.2</th>
                            <th>Anuluj</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="reviewarticle" items="${reviewarticleList}">
                            <tr>
                                <td>${reviewarticle.title}</td>
                                <td>${reviewarticle.description}</td>
                                <td>${reviewarticle.authorname}</td>
                                <td>${reviewarticle.contact}</td>
                                <td>${reviewarticle.affiliation}</td>
                                <c:forEach var="review" items="${reviewarticle.reviews}">
                                    <td>${review.reviewID}</td>
                                </c:forEach>
                                <td class="text-center"><a href="/admin/deletereview?articleID=${reviewarticle.articleID}"><span style="font-size:20px;" class="glyphicon glyphicon-remove"></span></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <br>
            <h3>Zakończone</h3>
            <hr>
            <div class="table">
                <table class="table table-striped table-bordered text-left">
                    <thead>
                        <col width="200">
                        <col width="300">
                        <col width="150">
                        <col width="130">
                        <col width="130">
                        <col width="80">
                        <col width="80">
                        <col width="60">
                        <tr>
                            <th>Tytuł</th>
                            <th>Opis</th>
                            <th>Autor</th>
                            <th>Kontakt do autora</th>
                            <th>Afiliacja</th>
                            <th>ID 1</th>
                            <th>ID 2</th>
                            <th>Anuluj</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="endarticle" items="${endarticleList}">
                            <tr>
                                <td>${endarticle.title}</td>
                                <td>${endarticle.description}</td>
                                <td>${endarticle.authorname}</td>
                                <td>${endarticle.contact}</td>
                                <td>${endarticle.affiliation}</td>
                                <c:forEach var="review" items="${endarticle.reviews}">
                                    <td>${review.user.userID}</td>
                                </c:forEach>
                                <td class="text-center"><a href="/admin/deletereview?articleID=${endarticle.articleID}"><span style="font-size:20px;" class="glyphicon glyphicon-remove"></span></a></td>
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