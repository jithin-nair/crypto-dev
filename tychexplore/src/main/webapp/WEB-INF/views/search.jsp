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
        <!-- add the jQWidgets framework -->
        <script type="text/javascript" src="${contextPath}/resources/jqwidgets/jqxcore.js"></script>
        <!-- add one or more widgets -->
        <script type="text/javascript" src="${contextPath}/resources/jqwidgets/jqxdata.js"></script>
        <script type="text/javascript" src="${contextPath}/resources/jqwidgets/jqxbuttons.js"></script>
        <script type="text/javascript" src="${contextPath}/resources/jqwidgets/jqxscrollbar.js"></script>
        <script type="text/javascript" src="${contextPath}/resources/jqwidgets/jqxlistbox.js"></script>
        <script type="text/javascript"
        src="${contextPath}/resources/jqwidgets/jqxdropdownlist.js"></script>
        <script type="text/javascript" src="${contextPath}/resources/jqwidgets/jqxdatatable.js"></script>
        <script type="text/javascript" src="${contextPath}/resources/jqwidgets/jqxpanel.js"></script>
        <script type="text/javascript"
        src="${contextPath}/resources/jqwidgets/jqxradiobutton.js"></script>
        <script type="text/javascript" src="${contextPath}/resources/jqwidgets/jqxinput.js"></script>
        <script type="text/javascript" src="${contextPath}/resources/jqwidgets/jqxchart.core.js"></script>
        <script type="text/javascript" src="${contextPath}/resources/jqwidgets/jqxdraw.js"></script>

        <script src="${contextPath}/resources/js/common.js"></script>


        <!-- VENDOR CSS -->
        <link rel="stylesheet" href="${contextPath}/resources/styles/bootstrap.min.css">
        <link rel="stylesheet"
              href="${contextPath}/resources/font-awesome/css/font-awesome.min.css">

        <!-- add the jQWidgets base styles and one of the theme stylesheets -->
        <link rel="stylesheet" href="${contextPath}/resources/jqwidgets/styles/jqx.base.css"
              type="text/css" />
        <link rel="stylesheet"
              href="${contextPath}/resources/jqwidgets/styles/jqx.darkblue.css" type="text/css" />

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
                        <li><a href="${contextPath}" class="custom-link-color"><i class="fa fa-home"></i> Home </a></li>
                        <li><a href="http://tychecash.net/#network" class="custom-link-color" target="_blank">
                                <i class="fa fa-cloud"></i> Pools </a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <div class="navbar-form navbar-left">
                                <div class="form-group">
                                    <span class="label label-warning" id="bWarning"></span>
                                    <input class="form-control mr-sm-2" type="text" name="query" id="query"
                                           placeholder="Search by block hash/height" style="width: 600px;">
                                </div>
                                <button class="btn btn-success" id="search" name="search" type="button">
                                    <i class="fa fa-search"></i> Search
                                </button>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>


        </div>
        <!-- END WRAPPER -->
        <div class="container" style="margin-top:60px;margin-bottom:30px;">
            <c:if test="${not empty message}">
                <div class="row">
                    <div class="col-md-12">
                        <div class="alert alert-danger" id="error-alert">
                            <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>Oops!!</strong> ${message}
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary" style="height:300px">
                        <div class="panel-body">
                            <span class="label label-info" id="bSearchLabel">Latest Block Status</span>
                            <table class="table table-bordered" style="width:100%">
                                <tr>
                                    <th style="width: 30%;color: #336a80;">Height</th>
                                    <td style="color: #2d5768;"><b><span id="bHeight">${bHeight}</span></b></td>
                                </tr>
                                <tr>
                                    <th style="width: 30%;color: #336a80;">Hash</th>
                                    <td style="color: #2d5768;word-break: break-all;">
                                        <span id="bHash" class="label label-success">${bHash}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="width: 30%;color: #336a80;">Found</th>
                                    <td style="color: #2d5768;"><b><span id="bFound">${bFound}</span></b></td>
                                </tr>
                                <tr>
                                    <th style="width: 30%;color: #336a80;">Difficulty</th>
                                    <td style="color: #2d5768;"><b><span id="bDifficulty">${bDifficulty}</span></b></td>
                                </tr>
                                <tr>
                                    <th style="width: 30%;color: #336a80;">Reward</th>
                                    <td style="color: #2d5768;"><b><span id="bReward">${bReward}</span></b>
                                        &nbsp;<small class="label label-warning">TYCH</small></td>
                                </tr>
                                <tr>
                                    <th style="width: 30%;color: #336a80;">Status</th>
                                    <td style="color: #2d5768;"><b><span id="bStatus">${bStatus}</span></b></td>
                                </tr>
                                <tr>
                                    <th style="width: 30%;color: #336a80;">Previous</th>
                                    <td style="color: #2d5768;word-break: break-all;">
                                        <i>
                                            <a id="bPrevious" class="label label-info" href="${contextPath}/block/${bPrevious}">${bPrevious}</a> 
                                        </i>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div id='chartContainer' style="height:300px;width:100%;"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div id="table"></div>
                </div>
            </div>
        </div>

        <footer class="footer navbar-fixed-bottom navbar-inverse" style="color: whitesmoke;">
            <div class="container-fluid">
                <span class="pull-left">
                    <i class="fa fa-copyright"></i> 2018 <a href="http://tyche.cash" target="_blank"><strong>TycheCash</strong></a>
                </span>
                <span class="pull-right"><i class="fa fa-github"></i>
                    <a href="https://github.com/jithin-nair/crypto-dev" target="_blank"><strong>TychExplore</strong></a>
                </span>
            </div>
        </footer>

    </body>
    <script>
        $(document).ready(function () {

            var totalPages = 0;

            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "/tychexplore/getTotalPages?_=" + new Date().getTime(),
                dataType: 'json',
                success: function (data) {
                    totalPages = data;
                },
                error: function (e) {
                    console.log("ERROR: ", e);
                },
                complete: function (jqXHR, textStatus) {

                    var url = "/tychexplore/getGraphData";
                    // prepare the data
                    var source = {
                        datatype: "json",
                        datafields: [{
                                name: 'height',
                                type: 'int',
                                map: 'height'
                            }, {
                                name: 'hash',
                                type: 'string',
                                map: 'hash'
                            }, {
                                name: 'difficulty',
                                type: 'int',
                                map: 'difficulty'
                            }, {
                                name: 'reward',
                                type: 'string',
                                map: 'reward'
                            }, {
                                name: 'timestamp',
                                type: 'string',
                                map: 'timestamp'
                            }, {
                                name: 'orphan_status',
                                type: 'string',
                                map: 'orphan_status'
                            }],
                        id: 'id',
                        url: url,
                        root: 'blockHeaders'
                    };

                    var toolTipCustomFormatFn = function (dataSource) {
                        return function (value, itemIndex, serieGroup, group, categoryValue, categoryAxis) {
                            var timestamp = dataSource.records[itemIndex].timestamp;
                            var height = dataSource.records[itemIndex].height;
                            var difficulty = dataSource.records[itemIndex].difficulty;
                            return "Height: " + height + "</br>Difficulty: " + difficulty + "</br>Found: " + new Date(timestamp * 1000).toLocaleDateString();
                        }
                    };

                    var dataAdapter = new $.jqx.dataAdapter(source);

                    // prepare jqxChart settings
                    var settings = {
                        title: "Difficulty Graph",
                        description: "Difficulty vs Height",
                        toolTipFormatFunction: toolTipCustomFormatFn(dataAdapter),
                        enableAnimations: true,
                        showLegend: true,
                        padding: {left: 15, top: 5, right: 20, bottom: 5},
                        titlePadding: {left: 10, top: 0, right: 0, bottom: 10},
                        source: dataAdapter,
                        xAxis:
                                {
                                    dataField: 'height',
                                    valuesOnTicks: true
                                },
                        colorScheme: 'scheme02',
                        seriesGroups:
                                [
                                    {
                                        alignEndPointsWithIntervals: false,
                                        type: 'splinearea',
                                        series: [
                                            {dataField: 'difficulty', displayText: 'difficulty', opacity: 0.7}
                                        ]
                                    }
                                ]
                    };
                    // setup the chart
                    $('#chartContainer').jqxChart(settings);

                }
            });



            $("#search").click(function () {
                $.ajax({
                    type: "GET",
                    contentType: "application/json",
                    url: "/tychexplore/getBlockBySearch?query=" + $("#query").val() + "&_=" + new Date().getTime(),
                    dataType: 'json',
                    success: function (data) {
                        var json = data;
                        if (json.result == null) {
                            $("#bWarning").text("No Result Found");
                            window.setTimeout(function () {
                                $("#bWarning").text("");
                            }, 3000);
                        } else {
                            $("#bHeight").text(json.result.block_header.height);
                            $("#bHash").text(json.result.block_header.hash);
                            $("#bFound").text(new Date(json.result.block_header.timestamp * 1000).toGMTString());
                            $("#bDifficulty").text(json.result.block_header.difficulty);
                            $("#bReward").text(json.result.block_header.reward);
                            $("#bStatus").text((json.result.block_header.orphan_status === true) ? 'Orphaned' : 'Not Orphaned');
                            $("#bPrevious").text(json.result.block_header.prev_hash);
                            $("#bPrevious").attr("href", json.result.block_header.prev_hash);
                            $("#bSearchLabel").text("Search Result");
                        }
                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                    }
                });
            });


        });

        //Converts timestamp from server side to GMT String equivalent
        $("#bFound").text(new Date($("#bFound").text() * 1000).toGMTString());

    </script>
</html>

