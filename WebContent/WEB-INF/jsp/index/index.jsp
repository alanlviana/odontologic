<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
	<meta charset="utf-8">
	<title>Odontologic</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Sistema Odontologic">
	<meta name="author" content="Odontologic Team">

    <!-- <link href="assets/less/styles.less" rel="stylesheet/less" media="all">  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css?=121">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/SansPro.css">

	 
        <link href='${pageContext.request.contextPath}/assets/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='styleswitcher'> 
    
            <link href='${pageContext.request.contextPath}/assets/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='headerswitcher'> 
    
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
	<!--[if lt IE 9]>
        <link rel="stylesheet" href="assets/css/ie8.css">
		<script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
        <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
	<![endif]-->

	<!-- The following CSS are included as plugins and can be removed if unused-->

<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/assets/plugins/form-daterangepicker/daterangepicker-bs3.css' /> 
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/assets/plugins/fullcalendar/fullcalendar.css' /> 
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/assets/plugins/form-markdown/css/bootstrap-markdown.min.css' /> 
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/assets/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/assets/plugins/form-toggle/toggles.css' /> 

<!-- <script type="text/javascript" src="assets/js/less.js"></script> -->
</head>

<body class="">

	<c:import url="/WEB-INF/jsp/util/headerbar.jsp" />
	
	<c:import url="/WEB-INF/jsp/util/banner.jsp" />
    
    
    <div id="page-container">
        
    	<c:import url="/WEB-INF/jsp/util/page-leftbar.jsp" />    

<div id="page-content">
    <div id='wrap' style="min-height:inherit">
        <div class="container" id="logoContainer" style="min-height:inherit">
<!--         	<div class="row"> -->
<!--         		<div class="col-xs-7 col-xs-offset-2 well"> -->
<%--         			<img src="${pageContext.request.contextPath}/assets/img/odontologic.png" alt="Logo" > --%>
<!--         		</div> -->
<!--         	</div> -->
				<img id="logo" style="display: block; margin-left: auto; margin-right: auto; vertical-align: middle " src="${pageContext.request.contextPath}/assets/img/odontologic.png" />
        </div> <!-- container -->
    </div> <!--wrap -->
</div> <!-- page-content -->
 
    <c:import url="/WEB-INF/jsp/util/footer.jsp" />

</div> <!-- page-container -->

<!--
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

<script>!window.jQuery && document.write(unescape('%3Cscript src="assets/js/jquery-1.10.2.min.js"%3E%3C/script%3E'))</script>
<script type="text/javascript">!window.jQuery.ui && document.write(unescape('%3Cscript src="assets/js/jqueryui-1.10.3.min.js'))</script>
-->

<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/jqueryui-1.10.3.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/bootstrap.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/enquire.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/jquery.cookie.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/jquery.nicescroll.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/plugins/codeprettifier/prettify.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/plugins/easypiechart/jquery.easypiechart.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/plugins/sparklines/jquery.sparklines.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/plugins/form-toggle/toggle.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/plugins/fullcalendar/fullcalendar.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/plugins/form-daterangepicker/daterangepicker.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/plugins/form-daterangepicker/moment.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/plugins/charts-flot/jquery.flot.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/plugins/charts-flot/jquery.flot.resize.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/plugins/charts-flot/jquery.flot.orderBars.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/plugins/pulsate/jQuery.pulsate.min.js'></script> 
<%-- <script type='text/javascript' src='${pageContext.request.contextPath}/assets/demo/demo-index.js'></script>  --%>
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/placeholdr.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/assets/js/application.js'></script> 
<%-- <script type='text/javascript' src='${pageContext.request.contextPath}/assets/demo/demo.js'></script>  --%>

<script type='text/javascript' src='${pageContext.request.contextPath}/js/index.form.js'></script>
<c:import url="/WEB-INF/jsp/util/notificacao.jsp" />
</body>
</html>