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
						<li class="active">Cadastro de Consulta</li>
					</ol>

					<h1>Cadastro de Consulta</h1>
					<div class="options">
						<div class="btn-toolbar">
							<!-- Toolbar aqui -->
						</div>
					</div>
				</div>
				<div class="container">

					<div class="row">
						<div class="col-md-12">
							
								<form action="<c:url value='/consulta/save'/>" id="consulta_form" method="post" class='form-horizontal' accept-charset="UTF-8">

									<c:forEach var="error" items="${errors}">
										<div class="alert alert-dismissable alert-danger">
								    		${error.message}
										</div>
									</c:forEach>

									<!-- Id -->
									<input type="hidden" id="consulta_id" name="consulta.id" value="${consulta.id}" />
									<input type="hidden" name="consulta.statusConsulta" value="${consulta.statusConsulta}" />
									
									<div class="panel panel-success">
       									<div class="panel-heading">
            								<h4>Dados do Agendamento</h4>
        								</div>
        								
        								<div class="panel-body collapse in">
            								<div class="form-group">
												<label class="col-sm-3 control-label" for="datepicker">Data da Consulta</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="datepicker" value='<fmt:formatDate pattern="dd/MM/yyyy" value="${consulta.inicio}"/>' placeholder="data da consulta" required>
												</div>
											</div>
            								<div class="form-group">
												<label class="col-sm-3 control-label">Horário da Consulta</label>
												<div class="col-sm-3">
													<input type="text" class="form-control" id="timepicker" value='<fmt:formatDate pattern="HH:mm" value="${consulta.inicio}"/>' placeholder="hora do início da consulta" required>
												</div>
												<div class="col-sm-3">
													<input type="text" class="form-control" id="timepicker1" value='<fmt:formatDate pattern="HH:mm" value="${consulta.fim}"/>' placeholder="hora do fim da consulta" required >
												</div>
												
												<input type="hidden" name='consulta.inicio'  id='inicio'/>
												<input type="hidden" name='consulta.fim'  id='fim'/>
											</div>
            							</div>
  									</div>

									<!-- Dados da Consulta -->
									<div class="panel panel-success">
       									<div class="panel-heading">
            								<h4>Dados do Paciente</h4>
        								</div>
        								
        								<div class="panel-body collapse in">
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente_id">Nome</label>
                								<div class="col-sm-6">
                    								<!--input type="text" class="form-control" placeholder="insira o nome do paciente" 
                    								name="paciente.nome" id="paciente.nome" value="${paciente.nome}"-->
                    								<input type='hidden' id='paciente_id' name='consulta.paciente.id' style="width:100%" value="${consulta.paciente.id}" class="">
                								</div>
            								</div>
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.cpf">CPF</label>
                								<div class="col-sm-6">
                									<div class="input-group">
                										<input type="text" class="form-control mask" data-inputmask="'mask':'999.999.999-99'" 
                    									placeholder="insira o CPF do paciente" id="paciente_cpf" value="${paciente.cpf}">
                    									<div id="btnBuscaPaciente" class="input-group-btn">
                    										<a href="#" class="btn btn-success"><i class="fa fa-search"></i></a>
                    									</div>
                									</div>
                    								
                								</div>
                								<div class="col-sm-3"><p class="help-block">xxx.xxx.xxx-xx</p></div>
            								</div>
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.telefoneResidencial">Telefone Residencial</label>
                								<div class="col-sm-6">
                    								<input type="text" class="form-control mask" data-inputmask="'mask':'(99) 9999-9999'" 
                    								placeholder="Nenhum telefone residencial cadastrado para o paciente." id="paciente_telefoneResidencial"
                    								value="${paciente.telefoneResidencial}"
                    								disabled>
                								</div>
                								<div class="col-sm-3"><p class="help-block">(xx) xxxx-xxxx</p></div>
            								</div>
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente_telefoneCelular">Telefone Celular</label>
                								<div class="col-sm-6">
                    								<input type="text" class="form-control mask" data-inputmask="'mask':'(99) 99999-9999'" 
                    								placeholder="Nenhum telefone celular cadastrado para o paciente." id="paciente_telefoneCelular"
                    								name="paciente.telefoneCelular" value="${paciente.telefoneCelular}"
                    								disabled>
                								</div>
                								<div class="col-sm-3"><p class="help-block">(xx) xxxxx-xxxx</p></div>
            								</div>
            							</div>	
  									</div>
  									
  									<div class="panel panel-success">
       									<div class="panel-heading">
            								<h4>Dados do Odontólogo</h4>
        								</div>
        								
        								<div class="panel-body collapse in">
            								<div class="form-group">
												<label class="col-sm-3 control-label" for="odontologo_id">Nome</label>
												<div class="col-sm-6">
													<!-- input type="text" class="form-control"
														placeholder="insira o nome do paciente"
														id="odontologo.nome" name="odontologo.nome"
														value="${odontologo.nome}">
														 -->
													<input type='hidden' id='odontologo_id' name='consulta.odontologo.id' style="width:100%" value="${consulta.odontologo.id}" class="">
												</div>
											</div>
            								
            								<!-- div class="form-group">
												<label class="col-sm-3 control-label"
													for="odontologo.especialidade">Especialidade</label>
												<div class="col-sm-6">
													<input type="text" class="form-control"
														placeholder="insira a especialidade do odontólogo"
														id="odontologo_especialidade"
														value="${odontologo.especialidade}"
														disabled>
												</div>
											</div>
											 -->
            							</div>	
  									</div>

									<div class="panel panel-success">
										<div class="panel-heading">
											<h4>Dados do Convênio</h4>
										</div>
										
										<div class="panel-body collapse in">
											<div class="form-group">
												<label class="col-sm-3 control-label" for="convenio_id">Nome</label>
												<div class="col-sm-6">
													<input type='hidden'  id='convenio_id' name='consulta.convenio.id' value="${consulta.convenio.id}" style="width:100%" class="">
												</div>
											</div>
										</div>
									</div>
									
									<div class="panel panel-success">
										<div class="panel-heading">
											<h4>Dados do Consultório</h4>
										</div>
										
										<div class="panel-body collapse in">
											<div class="form-group">
                								<label class="col-sm-3 control-label" for="consulta_consulorio_id">Consultório</label>
                								<div class="col-sm-6">
                    								<input type='hidden' id='consultorio_id' name='consulta.consultorio.id' style="width:100%" value="${consulta.consultorio.id}" class="">
                    								<!-- 
                    								<select class="form-control" name="consulta.consultorio.id"
													id="consulta_consulorio_id">
													<c:forEach items="${consultorioList}" var="consultorio">
														<option value="${consultorio.id}">${consultorio.descricao}</option>
													</c:forEach>
													</select>
												 	-->
                								</div>
            								</div>
										</div>
									</div>
										
										<!-- Rodapé do Panel (Enviar/Cancelar) -->
										<div class="panel-footer">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
													<div class="btn-toolbar">
														<button class="btn-success btn">Salvar</button>
														<a href="<c:url value="/consulta/list" />"
															class="btn-default btn">Cancelar</a>
													</div>
												</div>
											</div>
										</div>
							</form>
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
	src="${pageContext.request.contextPath}/assets/plugins/form-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/assets/plugins/form-datepicker/js/locales/bootstrap-datepicker.pt-BR.js"></script>	

<script type='text/javascript' 
	src='${pageContext.request.contextPath}/assets/plugins/jqueryui-timepicker/jquery.ui.timepicker.min.js'></script>
<script type='text/javascript' 
	src='${pageContext.request.contextPath}/assets/plugins/jqueryui-timepicker/locales/jquery.ui.timepicker-pt-BR.js'></script>	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/plugins/form-inputmask/jquery.inputmask.bundle.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/consulta.form.js"></script>
<!-- Fim - Scripts Especificos -->
<c:import url="/WEB-INF/jsp/util/notificacao.jsp" />
</body>
</html>