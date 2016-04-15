<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
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
						<li>Listagem</li>
						<li><a href="<c:url value='/receber/list'/>">Conta a Receber</a></li>
						<li class="active">Detalhes da Conta a Receber</li>
					</ol>

					<h1>Detalhes da Conta a Receber</h1>
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
									<input type="hidden" value="${receber.id}" />
									
									<div class="panel panel-inverse">
       									<div class="panel-heading">
            								<h4>Dados da Consulta</h4>
        								</div>
									
										<div class="panel-body collapse in">
            								<div class="form-group">
												<label class="col-sm-3 control-label" for="datepicker">Data da Consulta</label>
												<div class="col-sm-3">
													<input type="text" class="form-control" value='<fmt:formatDate pattern="dd/MM/yyyy - HH:mm" value="${receber.consulta.inicio}"/> - <fmt:formatDate pattern="HH:mm" value="${receber.consulta.fim}"/>' readonly>
												</div>
												<label class="col-sm-1 control-label" for="paciente_id">Paciente</label>
                								<div class="col-sm-3">
                    								<input type='text' class="form-control"id='paciente_id' style="width:100%" value="${receber.consulta.paciente.nome}" class="" readonly>
                								</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label" for="odontologo_id">Odontólogo</label>
												<div class="col-sm-3">
													<input type='text' class="form-control" id='odontologo_id' style="width:100%" value="${receber.consulta.odontologo.nome}" class="" readonly>
												</div>
												<label class="col-sm-1 control-label" for="convenio_id">Convênio</label>
												<div class="col-sm-3">
													<input type='text' class="form-control" id='convenio_id' value="${receber.consulta.convenio.nome}" style="width:100%" class="" readonly>
												</div>
											</div>
											<div class="form-group">
											<label class="col-sm-3 control-label" for="consultorio_id">Consultório</label>
                								<div class="col-sm-3">
                    								<input type='text' class="form-control" id='consultorio_id' style="width:100%" value="${receber.consulta.consultorio.descricao}" class="" readonly>
                								</div>
                								<label class="col-sm-1 control-label" for="valorTotal">Valor Total</label>
                								<div class="col-sm-3">
                    								<input type='text' class="form-control" id='valorTotal' style="width:100%" value='R$ <fmt:formatNumber minFractionDigits="2" value="${receber.valorTotal}"/>' readonly>
                								</div>
											</div>
											<br>
											<div class="form-group">
												<table cellpadding="0" cellspacing="0" border="00"
												class="table table-striped table-bordered datatables dataTable"
												id="example" aria-describedby="example_info">
													<thead>
														<tr role="row">
															<th class="sorting_asc" role="columnheader" tabindex="0"
															aria-controls="example" rowspan="1" colspan="1"
															aria-sort="ascending"
															aria-label="Rendering engine: activate to sort column descending"
															style="width: 30px;">Código</th>
															<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="example" rowspan="1" colspan="1"
															aria-label="Browser: activate to sort column ascending"
															style="width: 30px;">Quantidade</th>
															<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="example" rowspan="1" colspan="1"
															aria-label="Engine version: activate to sort column ascending"
															style="width: 220px;">Descrição</th>
															<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="example" rowspan="1" colspan="1"
															aria-label="Platform(s): activate to sort column ascending"
															style="width: 110px;">Valor Unitário</th>
															<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="example" rowspan="1" colspan="1"
															aria-label="Platform(s): activate to sort column ascending"
															style="width: 110px;">Valor Total</th>
														</tr>
													</thead>
													<tbody role="alert" aria-live="polite" aria-relevant="all">
														<c:forEach items="${receber.consulta.servicos}" var="consultaServico" varStatus="i">
															<tr  class="gradeA">
																<td class=" sorting_1">${consultaServico.servico.id}</td>
																<td class=" ">${consultaServico.quantidade}</td>
																<td class=" ">${consultaServico.servico.nome}</td>
																<td class=" ">R$ <fmt:formatNumber minFractionDigits="2" value="${consultaServico.servico.valor}"/></td>
																<td class=" ">R$ <fmt:formatNumber minFractionDigits="2" value="${consultaServico.total}"/></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
										<!-- Rodapé do Panel (Enviar/Cancelar) -->
										<div class="panel-footer">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
													<div class="btn-toolbar">
														<a href="<c:url value="/receber/list" />"
															class="btn-default btn">Voltar</a>
													</div>
												</div>
											</div>
										</div>
								</div>
							</div>
						</div>
				</div><!-- container -->
			</div><!--wrap -->
		</div><!-- page-content -->
		<c:import url="/WEB-INF/jsp/util/footer.jsp" />
	</div><!-- page-container -->

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