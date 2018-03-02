<%-- 
    Document   : index
    Created on : 15 Feb, 2018, 9:16:57 PM
    Author     : jithin
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
        src="resources/scripts/jquery-1.11.1.min.js"></script>
        <!-- add the bootstrap script -->
        <script src="resources/scripts/bootstrap.min.js"></script>
        <!-- add the jQWidgets framework -->
        <script type="text/javascript" src="resources/jqwidgets/jqxcore.js"></script>
        <!-- add one or more widgets -->
        <script type="text/javascript" src="resources/jqwidgets/jqxdata.js"></script>
        <script type="text/javascript" src="resources/jqwidgets/jqxbuttons.js"></script>
        <script type="text/javascript" src="resources/jqwidgets/jqxscrollbar.js"></script>
        <script type="text/javascript" src="resources/jqwidgets/jqxlistbox.js"></script>
        <script type="text/javascript"
        src="resources/jqwidgets/jqxdropdownlist.js"></script>
        <script type="text/javascript" src="resources/jqwidgets/jqxdatatable.js"></script>
        <script type="text/javascript" src="resources/jqwidgets/jqxpanel.js"></script>
        <script type="text/javascript"
        src="resources/jqwidgets/jqxradiobutton.js"></script>
        <script type="text/javascript" src="resources/jqwidgets/jqxinput.js"></script>
        <script type="text/javascript" src="resources/jqwidgets/jqxchart.core.js"></script>
        <script type="text/javascript" src="resources/jqwidgets/jqxdraw.js"></script>

        <script src="resources/js/common.js"></script>

        <!-- VENDOR CSS -->
        <link rel="stylesheet" href="resources/styles/bootstrap.min.css">
        <link rel="stylesheet"
              href="resources/font-awesome/css/font-awesome.min.css">

        <!-- add the jQWidgets base styles and one of the theme stylesheets -->
        <link rel="stylesheet" href="resources/jqwidgets/styles/jqx.base.css"
              type="text/css" />
        <link rel="stylesheet"
              href="resources/jqwidgets/styles/jqx.darkblue.css" type="text/css" />
    </head>
    <body>

        <!-- WRAPPER -->
        <div id="wrapper">

            <nav class="navbar" style="background-color: #2FA4E7;">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="/tychexplore"> <img
                                src="resources/images/logo.png" alt="TychExplore Logo">
                        </a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Pools</a></li>
                        <li><a href="#">API</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <form class="navbar-form navbar-left" action="/action_page.php">
                                <div class="form-group">
                                    <input class="form-control mr-sm-2" type="text"
                                           placeholder="Search by block hash/height" style="width: 600px;">
                                </div>
                                <button class="btn btn-success" type="submit">Search</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </nav>


        </div>
        <!-- END WRAPPER -->
        <div class="container">
            <div id='chartContainer' style="width:100%; height:500px"></div>
            <div id="table"></div>
        </div>

    </body>
</html>
