<%@ page language="java" isErrorPage="true" contentType="text/html; charset=UTF-8"
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
        
    	
        

<div id="page-content">
	<div id='wrap'>
		<div id="page-heading">
			<ol class="breadcrumb">
				<li><a href="index.htm">Dashboard</a></li>
				<li class="active">404</li>
			</ol>

			<h1>404</h1>
		</div>
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<p class="text-center">
						<span class="text-info" style="font-size:4em;">Ops!</span>
					</p>
					<p class="text-center">Nos parece que você virou em algum lugar errado</p>
					<p class="text-center"><%= exception %></p>
					
					<p class="text-center">Se você sabe que não está louco e acha que tudo isso é uma grande conspiração,</br>use o menu ao lado.</p>
				</div>
				<div class="col-md-4 col-md-offset-4">
					<form action="" class="form-inline">
						<div class="input-group">
							<label for="errsearch" class="sr-only">Search</label>
							<input type="text" class="form-control" id="errsearch" placeholder="Procurar...">
							<div class="input-group-btn">
								<a href="javascript: $('#form_filtro').submit();" class="btn btn-midnightblue"><i class="fa fa-search"></i></a>
							</div>
						</div>
					</form>
					<p class="text-center"><small><a href="#">Reportar erro?</a></small></p>
				</div>
			</div>

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

</body>
</html>