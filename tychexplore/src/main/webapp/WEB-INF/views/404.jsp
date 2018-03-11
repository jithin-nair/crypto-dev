<%-- 
    Document   : 404
    Created on : 11 Mar, 2018, 8:31:00 PM
    Author     : jithin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <title>TychExplore : TycheCash Block Explorer</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <!-- add the jQuery script -->
        <script type="text/javascript"
        src="${contextPath}/resources/scripts/jquery-1.11.1.min.js"></script>
        <!-- add the bootstrap script -->
        <script src="${contextPath}/resources/scripts/bootstrap.min.js"></script>
        <link rel="stylesheet" href="${contextPath}/resources/styles/bootstrap.min.css">
        <link rel="stylesheet"
              href="${contextPath}/resources/font-awesome/css/font-awesome.min.css">
    </head>
    <body>
        <style type="text/css">
            .error-template {padding: 40px 15px;text-align: center;}
            .error-actions {margin-top:15px;margin-bottom:15px;}
            .error-actions .btn { margin-right:10px; }
        </style>

        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col-md-12">
                        <div class="error-template">
                            <h1>Oops!</h1>
                            <h2>
                                404 Not Found</h2>
                            <div class="error-details">
                                Sorry, an error has occured, Requested page not found!
                            </div>
                            <div class="error-actions">
                                <a href="${contextPath}" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>
                                    Take Me Home </a><a href="${contextPath}" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-envelope"></span> Contact Support </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
