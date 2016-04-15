<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/styles.css?=121">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/SansPro.css">


<link
	href='${pageContext.request.contextPath}/assets/demo/variations/default.css'
	rel='stylesheet' type='text/css' media='all' id='styleswitcher'>

<link
	href='${pageContext.request.contextPath}/assets/demo/variations/default.css'
	rel='stylesheet' type='text/css' media='all' id='headerswitcher'>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
<!--[if lt IE 9]>
        <link rel="stylesheet" href="assets/css/ie8.css">
		<script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
        <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
	<![endif]-->

<!-- The following CSS are included as plugins and can be removed if unused-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/plugins/datatables/dataTables.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/plugins/codeprettifier/prettify.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/plugins/form-toggle/toggles.css">

<!-- <script type="text/javascript" src="assets/js/less.js"></script> -->

</head>

<body class="">



	<c:import url="/WEB-INF/jsp/util/headerbar.jsp" />


	<c:import url="/WEB-INF/jsp/util/banner.jsp" />


	<div id="page-container">

		<c:import url="/WEB-INF/jsp/util/page-leftbar.jsp" />
		<c:import url="/WEB-INF/jsp/util/page-rightbar.jsp" />




		<div id="page-content">
			<div id="wrap">
				<div id="page-heading">
					<ol class="breadcrumb">
						<li>Cadastro</a></li>
						<li class="active">Odontólogo</li>
					</ol>

					<h1>Odontólogo</h1>
					<div class="options">
						<div class="btn-toolbar">
							<a href="<c:url value='/odontologo/form'/>" class='btn btn-green'>Incluir</a>
						</div>
					</div>
				</div>


				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-green">
								<div class="panel-heading">
									<h4>Lista de Odontólogos</h4>
								</div>
								<div class="panel-body collapse in">
									<div id="example_wrapper" class="dataTables_wrapper"
										role="grid">
										<div class="row">
											<div class="col-xs-3 col-xs-offset-9">
												<div class="dataTables_filter" id="example_filter">
													<form action="<c:url value='/odontologo/list'/>" method="post" id="form_filtro">
														<div class="input-group">
															<input type="text" aria-controls="example"
																class="form-control" placeholder="Pesquisar..." name="filtro"
																value="${filtro}">
															<div class="input-group-btn">
																<a href="javascript: $('#form_filtro').submit();" class="btn btn-green"><i class="fa fa-search"></i></a>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
										<table cellpadding="0" cellspacing="0" border="0"
											class="table table-striped table-bordered datatables dataTable"
											id="example" aria-describedby="example_info">
											<thead>
												<tr role="row">
													<th class="sorting_asc" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-sort="ascending"
														aria-label="Rendering engine: activate to sort column descending"
														style="width: 75px;">Código</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="Browser: activate to sort column ascending"
														style="width: 250px;">Nome</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="Platform(s): activate to sort column ascending"
														style="width: 250px;">CPF</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="Engine version: activate to sort column ascending"
														style="width: 125px;">Telefone</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="CSS grade: activate to sort column ascending"
														style="width: 100px;">Opções</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<c:forEach items="${odontologoList}" var="odontologo">
													<tr class="gradeA">

														<td class=" sorting_1">${odontologo.id}</td>
														<td class=" ">${odontologo.nome}</td>
														<td class=" ">${odontologo.cpf}</td>
														<td class="center ">${odontologo.telefoneCelular}</td>
														<td class="center "><a
															href="<c:url value='/odontologo/form?odontologo.id=${odontologo.id}'/>"
															class="btn btn-green btn-xs"><i class="fa fa-edit"></i> Editar</a> <a
															href="<c:url value='/odontologo/delete?odontologo.id=${odontologo.id}'/>"
															class="btn btn-default btn-xs"><i class="fa fa-times"></i> Excluir</a></td>

													</tr>
												</c:forEach>

											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- container -->
			</div>
		</div>
		<!-- page-content -->

		<c:import url="/WEB-INF/jsp/util/footer.jsp" />

	</div>
	<!-- page-container -->

	<!--
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

<script>!window.jQuery && document.write(unescape('%3Cscript src="assets/js/jquery-1.10.2.min.js"%3E%3C/script%3E'))</script>
<script type="text/javascript">!window.jQuery.ui && document.write(unescape('%3Cscript src="assets/js/jqueryui-1.10.3.min.js'))</script>
-->

	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/js/jqueryui-1.10.3.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/js/bootstrap.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/js/enquire.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/js/jquery.cookie.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/js/jquery.nicescroll.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/codeprettifier/prettify.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/easypiechart/jquery.easypiechart.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/sparklines/jquery.sparklines.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/form-toggle/toggle.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/fullcalendar/fullcalendar.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/form-daterangepicker/daterangepicker.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/form-daterangepicker/moment.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/charts-flot/jquery.flot.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/charts-flot/jquery.flot.resize.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/charts-flot/jquery.flot.orderBars.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/pulsate/jQuery.pulsate.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/js/placeholdr.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/js/application.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/demo/demo.js'></script>

<c:import url="/WEB-INF/jsp/util/notificacao.jsp" />
</body>
</html>