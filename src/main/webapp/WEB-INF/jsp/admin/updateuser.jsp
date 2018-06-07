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
                    <li class="active"><a href="/admin/viewusers">Przeglądaj użytkowników</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Wyloguj</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <div class="row">

                <div class="col-md-8 col-md-offset-2">
                    <form role="form" method="POST" action="/admin/save-user">
                        <input type="hidden" name="userID" value="${user.userID}"/>
                        <legend class="text-center">Edycja roli</legend>
                        <fieldset>
                            <div class="form-group col-md-12">
                                <label for="role">Rola</label>
                                <select class="form-control" name="role">
                                    <option value=2>Recenzent</option>
                                    <option value=3>Użytkownik</option>
                                </select>
                            </div>


                        </fieldset>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary">
                                    Zapisz
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