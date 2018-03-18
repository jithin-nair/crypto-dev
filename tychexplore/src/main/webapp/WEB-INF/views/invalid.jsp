<%-- 
    Document   : invalid
    Created on : 18 Mar, 2018, 8:50:41 PM
    Author     : Jithin
--%>

<%-- 
    Document   : search
    Created on : 8 Mar, 2018, 9:13:15 PM
    Author     : Jithin
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


        <!-- VENDOR CSS -->
        <link rel="stylesheet" href="${contextPath}/resources/styles/bootstrap.min.css">
        <link rel="stylesheet"
              href="${contextPath}/resources/font-awesome/css/font-awesome.min.css">
        <style type="text/css">
            .custom-link-color{
                color:whitesmoke;
            }
        </style>
    </head>
    <body>

        <!-- WRAPPER -->
        <div id="wrapper">

            <nav class="navbar navbar-fixed-top bg-primary" >
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="${contextPath}"> <img
                                src="${contextPath}/resources/images/logo.png" alt="TychExplore Logo">
                        </a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li><a href="${contextPath}" class="custom-link-color">Home</a></li>
                        <li><a href="#" class="custom-link-color">Pools</a></li>
                        <li><a href="#" class="custom-link-color">API</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <div class="navbar-form navbar-left">
                                <div class="form-group">
                                    <span class="label label-warning" id="bWarning"></span>
                                    <input class="form-control mr-sm-2" type="text" name="query" id="query"
                                           placeholder="Search by block hash/height" style="width: 600px;">
                                </div>
                                <button class="btn btn-success" id="search" name="search" type="button">Search</button>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>


        </div>
        <!-- END WRAPPER -->
        <div class="container" style="margin-top:60px">
            <c:if test="${not empty message}">
                <div class="jumbotron">      
                    <div class="alert alert-danger" id="error-alert">
                        <div class="text-center">
                            <i class="fa fa-exclamation-triangle" aria-hidden="true" style="font-size: 75px;"></i>
                            <h1>Oops...</h1>
                            <p>${message}</p>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </body>
</html>


