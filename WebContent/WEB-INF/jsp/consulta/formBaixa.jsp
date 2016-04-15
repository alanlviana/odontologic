<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Odontologic</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Sistema Odontologic">
<meta name="author" content="Odontologic Team">

<!-- Import de CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/styles.min.css?=113">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/styles.css?=121">
<link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath}/assets/css/SansPro.css">
<link rel='stylesheet' type='text/css' 
	href='${pageContext.request.contextPath}/assets/plugins/form-select2/select2.css' /> 
<link
	href='${pageContext.request.contextPath}/assets/demo/variations/default.css'
	rel='stylesheet' type='text/css' media='all' id='styleswitcher'>
<link
	href='${pageContext.request.contextPath}/assets/demo/variations/default.css'
	rel='stylesheet' type='text/css' media='all' id='headerswitcher'>
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/assets/plugins/codeprettifier/prettify.css' />
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/assets/plugins/form-toggle/toggles.css' />
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/assets/js/jqueryui.css' />
<link rel='stylesheet' type='text/css' 
	href='${pageContext.request.contextPath}/assets/plugins/jqueryui-timepicker/jquery.ui.timepicker.css' />
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/assets/plugins/form-daterangepicker/daterangepicker-bs3.css' />
<link rel='stylesheet' type="text/css"
	href='${pageContext.request.contextPath}/assets/plugins/form-datepicker/css/datepicker.css'/>	
<link rel='stylesheet' type="text/css"
	href='${pageContext.request.contextPath}/assets/plugins/form-datepicker/css/datepicker3.css'/>	
</head>

<body class=" ">


	<c:import url="/WEB-INF/jsp/util/headerbar.jsp" />

	<c:import url="/WEB-INF/jsp/util/banner.jsp" />

	<div id="page-container">

		<!-- BEGIN SIDEBAR -->
		<c:import url="/WEB-INF/jsp/util/page-leftbar.jsp" />
		<!-- END RIGHTBAR -->

		<!-- BEGIN RIGHTBAR -->
		<c:import url="/WEB-INF/jsp/util/page-rightbar.jsp" />
		<!-- END RIGHTBAR -->
		<div id="page-content">
			<div id='wrap'>

				<div id="page-heading">
					<ol class="breadcrumb">
						<li>Cadastro</li>
						<li><a href="<c:url value='/consulta/list'/>">Consulta</a></li>
						<li><a href="<c:url value='/consulta/form?consulta.id=${consulta.id}'/>">Cadastro de Consulta</a></li>
						<li class="active">Baixa de Consulta</li>
					</ol>

					<h1>Baixa de Consulta</h1>
					<div class="options">
						<div class="btn-toolbar">
							<!-- Toolbar aqui -->
						</div>
					</div>
				</div>
				<div class="container">

					<div class="row">
						<div class="col-md-12">
								
								<div class='form-horizontal'>
	
									<!-- Id -->
									<input type="hidden" id="consulta_id" name="consulta.id" value="${consulta.id}" />
									<input type="hidden" name="consulta.statusConsulta" value="${consulta.statusConsulta}" />
									
									<div class="panel panel-success">
       									<div class="panel-heading">
            								<h4>Dados da Consulta</h4>
        								</div>
        								
        								<div class="panel-body collapse in">
            								<div class="form-group">            								
												<label class="col-sm-3 control-label" for="datepicker">Data da Consulta</label>
												<div class="col-sm-2">
													<input type="text" class="form-control" value='<fmt:formatDate pattern="dd/MM/yyyy - HH:mm" value="${consulta.inicio}"/> - <fmt:formatDate pattern="HH:mm" value="${consulta.fim}"/>' readonly>
												</div>
												<label class="col-sm-1 control-label" for="odontologo_id">Odontólogo</label>
												<div class="col-sm-3">
													<input type='text' class="form-control" id='odontologo_id' name='consulta.odontologo.id' style="width:100%" value="${consulta.odontologo.nome}" class="" readonly>
												</div>
											</div>
            								<div class="form-group">
												<label class="col-sm-3 control-label" for="convenio_id">Convênio</label>
												<div class="col-sm-2">
													<input type='text' class="form-control" id='convenio_id' name='consulta.convenio.id' value="${consulta.convenio.nome}" style="width:100%" class="" readonly>
												</div>
												<label class="col-sm-1 control-label" for="paciente_id">Paciente</label>
                								<div class="col-sm-3">
                    								<input type='text' class="form-control"id='paciente_id' name='consulta.paciente.id' style="width:100%" value="${consulta.paciente.nome}" class="" readonly>
                								</div>
											</div>
										</div>
            						</div>
            						<div class="panel panel-success">
										<div class="panel-heading">
											<h4>Serviços da Consulta</h4>
										</div>
										<div class="panel-body collapse in">
											<div class="form-group">
												<form action="<c:url value='/consulta/adicionarServico'/>" method="post" id="addServico">
												<div class="col-sm-1">
													<input type="text" class="form-control" placeholder="Quantidade.." name="quantidade">
												</div>
												<div class="col-sm-4">
													<input type='hidden' id='servico_id' name='servico.id' style="width:100%" class="">
												</div>
												<div class="col-sm-2">
													<input type="text" class="form-control" id="servico_valor" placeholder="Valor.." readonly>
												</div>
												<div class="col-sm-2">
													<input type="submit" class="btn btn-success" value="Adicionar Serviço"> 
												</div>
												</form>
											</div>
											
										
											<c:import url="/WEB-INF/jsp/consulta/tabelaServico.jsp"/>
										
										</div>
									</div>
										
										<!-- Rodapé do Panel (Enviar/Cancelar) -->
										<div class="panel-footer">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
													<div class="btn-toolbar">
														<a href="<c:url value="/consulta/finalizarBaixa" />"
															class="btn-success btn">Salvar</a>
														<a href="<c:url value="/consulta/cancelarBaixa" />"
															class="btn-default btn">Cancelar</a>
													</div>
												</div>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- container -->
			</div>
			<!--wrap -->
		</div>
		<!-- page-content -->

		<c:import url="/WEB-INF/jsp/util/footer.jsp" />

	</div>
	<!-- page-container -->

<!-- Inicio - Scritps Essenciais -->
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
	src='${pageContext.request.contextPath}/assets/js/placeholdr.js'></script>
<script type='text/javascript'
	src='${pageContext.request.contextPath}/assets/js/application.js'></script>
<script type='text/javascript'
	src='${pageContext.request.contextPath}/assets/demo/demo.js'></script>
<script type="text/javascript"
	src='${pageContext.request.contextPath}/util/required'></script>	
<!-- Fim - Scritps Essenciais -->

<!-- Inicio - Scripts Especificos -->
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/assets/plugins/form-select2/select2.min.js"></script> 
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/assets/plugins/form-select2/select2_locale_pt-BR.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/locales/jquery.datepicker.pt-br.js"></script>
<!-- <script type="text/javascript" 
	src="${pageContext.request.contextPath}/assets/plugins/form-datepicker/js/locales/bootstrap-datepicker.pt-BR.js"></script> -->
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/assets/plugins/form-datepicker/js/bootstrap-datepicker.js"></script>
<script type='text/javascript' 
	src='${pageContext.request.contextPath}/assets/plugins/jqueryui-timepicker/jquery.ui.timepicker.min.js'></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/plugins/form-inputmask/jquery.inputmask.bundle.min.js"></script>	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/consulta.formBaixa.js"></script>
<!-- Fim - Scripts Especificos -->
<c:import url="/WEB-INF/jsp/util/notificacao.jsp" />
</body>
</html>