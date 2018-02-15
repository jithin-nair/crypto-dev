<%-- 
    Document   : index
    Created on : 15 Feb, 2018, 9:16:57 PM
    Author     : jithin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- add the jQuery script -->
    <script type="text/javascript" src="resources/scripts/jquery-1.11.1.min.js"></script>	
    <!-- add the jQWidgets framework -->
    <script type="text/javascript" src="resources/jqwidgets/jqxcore.js"></script>
    <!-- add one or more widgets -->
    <script type="text/javascript" src="resources/jqwidgets/jqxbuttons.js"></script>
    <!-- add the jQWidgets base styles and one of the theme stylesheets -->
    <link rel="stylesheet" href="resources/jqwidgets/styles/jqx.base.css" type="text/css" />
    <link rel="stylesheet" href="resources/jqwidgets/styles/jqx.darkblue.css" type="text/css" />
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#myButton").jqxButton({ width: '120px', height: '35px', theme: 'darkblue'});
        });
    </script>
	
    <input type="button" value="Click Me" id='myButton'/>
</body>
</html>
