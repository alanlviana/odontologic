<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="pt">
<head>
<meta charset="utf-8">
<title>Odontologic</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Sistema Odontologic">
<meta name="author" content="Odontologic Team">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/styles.css?=121">
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/SansPro.css">
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/assets/plugins/form-select2/select2.css' /> 

<link rel='stylesheet' type='text/css' media='all' id='styleswitcher'
	href='${pageContext.request.contextPath}/assets/demo/variations/default.css'>
	
<link rel='stylesheet' type='text/css' media='all' id='headerswitcher'
	href='${pageContext.request.contextPath}/assets/demo/variations/default.css'>
	
<link rel='stylesheet' type='text/css' 
	href='${pageContext.request.contextPath}/assets/plugins/form-select2/select2.css'/>
	 
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/plugins/datatables/dataTables.css">
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/plugins/codeprettifier/prettify.css">
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/plugins/form-toggle/toggles.css">
	
<link rel='stylesheet' type='text/css' 
	href='${pageContext.request.contextPath}/assets/plugins/form-daterangepicker/daterangepicker-bs3.css' />

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
						<li>Cadastro</li>
						<li class="active">Consulta</li>
					</ol>
					<h1>Consulta</h1>
					<div class="options">
						<div class="btn-toolbar">
							<a href="<c:url value='/consulta/form'/>" class='btn btn-success'>Incluir</a>
						</div>
					</div>
				</div>

				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-success">
								<div class="panel-heading">
									<h4>Lista de Consultas</h4>
								</div>
								
								<div class="panel-body collapse in">
									<div id="example_wrapper" class="dataTables_wrapper"
										role="grid">
										<div class="row">
											
											
											<div class="col-xs-12">
											
											<form action="<c:url value='/consulta/list'/>" method="post" id="form_filtro">
											
											<div class="col-xs-3">
												<div class="form-group">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                										<input class="form-control daterangepicker2" 
                										id="filtro_data">
                									</div>
                								</div>
                							</div>
											
											<div class="col-xs-3">
												<input type='hidden' id='odontologo_id' name='odontologo.id' style="width:100%" value="${odontologo_id}">
											</div>
											
											<div class="col-xs-2">
                    							<select class="form-control" name="consultorio.id"
													id="consulta_consulorio_id">
														<option value="" >Todas os Consultórios</option>
														<c:forEach items="${consultorioList}" var="consultorio">
															<option value="${consultorio.id}"
																<c:if test="${consultorio.id == consultorio_id}">selected</c:if>
															>${consultorio.descricao}</option>
														</c:forEach>
												</select>
                							</div>
											<div class="col-xs-2">
												<select class="form-control" name="status">
													
			
													<option value="AGENDADA"
														<c:if test='${status == "AGENDADA"}'>selected</c:if>	
													>Consultas Agendadas</option>
													<option value="EFETUADA"
														<c:if test='${status == "EFETUADA"}'>selected</c:if>
													>Consultas Efetuadas</option>
													<option value="CANCELADA"
														<c:if test='${status == "CANCELADA"}'>selected</c:if>
													>Consultas Canceladas</option>
												</select>
											</div>
											<div class="col-xs-2">
												<div class="dataTables_filter horizontal" id="example_filter">
													<div class="input-group"  style="width:100%; ">
														<input type="submit" aria-controls="example" class="btn btn-success" value="Filtrar"  style="width:100%;">
													</div>
												</div>
											</div>
											
											</form>
											</div> <!-- fim div teste -->
											
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
														aria-label="Engine version: activate to sort column ascending"
														style="width: 125px;">Data</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="Browser: activate to sort column ascending"
														style="width: 150px;">Paciente</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="Platform(s): activate to sort column ascending"
														style="width: 150px;">Odontólogo</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="Engine version: activate to sort column ascending"
														style="width: 100px;">Consultório</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="CSS grade: activate to sort column ascending"
														style="width: 125px;">Opções</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<c:forEach items="${consultaList}" var="consulta">
													<tr  class="gradeA">

														<td class=" sorting_1">${consulta.id}</td>
														<td class=" "> <fmt:formatDate value="${consulta.inicio}" pattern="dd/MM/yyyy - HH:mm" /> - <fmt:formatDate value="${consulta.fim}" pattern="HH:mm" /> </td>
														<td class=" ">${consulta.paciente.nome}</td>
														<td class=" ">${consulta.odontologo.nome}</td>
														<td class=" ">${consulta.consultorio.descricao}</td>
														<td class="center" style="text-align:center;">
															<a href="<c:url value='/consulta/form?consulta.id=${consulta.id}'/>"
															class="btn btn-default btn-success btn-xs"><i class="fa fa-edit"></i> Editar</a> 
															<c:if test='${consulta.statusConsulta == "AGENDADA"}'>
<a href="<c:url value='/consulta/cancelar?consulta.id=${consulta.id}'/>"
															class="btn btn-default btn-xs"><i class="fa fa-times"></i> Cancelar</a>
															</c:if>
															<c:if test='${consulta.statusConsulta == "AGENDADA"}'>
																<a href="<c:url value='/consulta/formBaixa?consulta.id=${consulta.id}'/>"
															class="btn btn-default-alt btn-xs"><i class="fa fa-arrow-down"></i> Baixar</a>
															</c:if>
															
													</td>
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
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/assets/plugins/form-datetimepicker/locales/bootstrap-datetimepicker.pt-BR.js"></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/form-daterangepicker/daterangepicker.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/plugins/form-daterangepicker/moment.min.js'></script>
	<script type='text/javascript' 
		src='${pageContext.request.contextPath}/assets/plugins/form-datepicker/js/bootstrap-datepicker.js'></script>
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
		<script type="text/javascript"
	src='${pageContext.request.contextPath}/util/required'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/js/consulta.list.js'></script>
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/assets/plugins/form-select2/select2.min.js"></script> 
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/assets/plugins/form-select2/select2_locale_pt-BR.js"></script>
	
	<c:import url="/WEB-INF/jsp/util/notificacao.jsp" />
</body>
</html>