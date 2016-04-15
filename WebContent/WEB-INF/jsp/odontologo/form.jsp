<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="pt">
<head>
<meta charset="utf-8">
<title>Odontologic</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Sistema Odontologic">
<meta name="author" content="Odontologic Team">

<!-- <link href="${pageContext.request.contextPath}/assets/less/styles.less" rel="stylesheet/less" media="all">  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/styles.min.css?=113">
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/charts-flot/excanvas.min.js"></script>
	<![endif]-->

<!-- The following CSS are included as plugins and can be removed if unused-->

<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/assets/plugins/codeprettifier/prettify.css' />
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/assets/plugins/form-toggle/toggles.css' />
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/assets/js/jqueryui.css' />
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/assets/plugins/form-tokenfield/bootstrap-tokenfield.css' />
<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/less.js"></script> -->




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
						<li><a href="<c:url value='/odontologo/list'/>">Odontólogo</a></li>
						<li class="active">Cadastro de Odontólogo</li>
					</ol>
					<h1>Odontológo</h1>
				</div>
				<div class="container">

					<div class="row">
						<div class="col-md-12">
							
								<form action="<c:url value='/odontologo/save'/>" method="post"
									class='form-horizontal' enctype="multipart/form-data">


									<c:forEach var="error" items="${errors}">
										<div class="alert alert-dismissable alert-danger">
							     			${error.message}
										</div>
									</c:forEach>

									<input type="hidden" name="odontologo.id"
										value="${odontologo.id}" /> <input type="hidden"
										name="odontologo.endereco.id"
										value="${odontologo.endereco.id}" />


									<!-- Dados Pessoais-->
									<div class="panel panel-green">
										<div class="panel-heading">
											<h4>Dados Pessoais</h4>
										</div>
										<div class="panel-body collapse in">

											<div class="form-group">
												<label class="col-sm-3 control-label" for="odontologo.nome">Nome</label>
												<div class="col-sm-6">
													<input type="text" class="form-control"
														placeholder="insira o nome do odontólogo"
														id="odontologo.nome" name="odontologo.nome"
														value="${odontologo.nome}">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label" for="odontologo.sexo">Sexo</label>
												<div class="col-sm-6">
													<select class="form-control" name="odontologo.sexo"
														id="odontologo.sexo" value="${odontologo.sexo}">
														<option value="false" disabled
															<c:if test='${odontologo.sexo == null}'>selected</c:if>>Selecione
															o sexo do paciente</option>
														<option value="M"
															<c:if test='${odontologo.sexo == "M"}'>selected</c:if>>Masculino</option>
														<option value="F"
															<c:if test='${odontologo.sexo == "F"}'>selected</c:if>>Feminino</option>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label"
													for="odontologo.dataNascimento">Data de Nascimento</label>
												<div class="col-sm-6">
													<input type="text" class="form-control datepicker"
														name='odontologo.dataNascimento'
														id='odontologo.dataNascimento'
														value="<fmt:formatDate value="${odontologo.dataNascimento.time}" />">
												</div>
											</div>

										</div>
									</div>

									<!-- Documentos -->
									<div class="panel panel-green">
										<div class="panel-heading">
											<h4>Documentos</h4>
										</div>
										<div class="panel-body collapse in">

											<div class="form-group">
												<label class="col-sm-3 control-label" for="odontologo.rg">RG</label>
												<div class="col-sm-6">
													<input type="text" class="form-control mask"
														data-inputmask="'mask':'99.999.999-*'"
														placeholder="insira o RG do paciente" id="odontologo.rg"
														name="odontologo.rg" value="${odontologo.rg}">
												</div>
												<div class="col-sm-3">
													<p class="help-block">xx.xxx.xxx-x</p>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label" for="odontologo.cpf">CPF</label>
												<div class="col-sm-6">
													<input type="text" class="form-control mask"
														data-inputmask="'mask':'999.999.999-99'"
														placeholder="insira o CPF do paciente" id="odontologo.cpf"
														name="odontologo.cpf" value="${odontologo.cpf}">
												</div>
												<div class="col-sm-3">
													<p class="help-block">xxx.xxx.xxx-xx</p>
												</div>
											</div>

										</div>
									</div>

									<!-- Endereço -->
									<div class="panel panel-green">
										<div class="panel-heading">
											<h4>Endereço</h4>
										</div>
										<div class="panel-body collapse in">

											<div class="form-group">
												<label class="col-sm-3 control-label"
													for="odontologo.endereco.cep">CEP</label>
												<div class="col-sm-6">
													<input type="text" class="form-control mask"
														data-inputmask="'mask':'99999-999'"
														placeholder="insira o CEP do logradouro"
														id="odontologo.endereco.cep"
														name="odontologo.endereco.cep"
														value="${odontologo.endereco.cep}">
												</div>
												<div class="col-sm-3">
													<p class="help-block">xxxxx-xxx</p>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label"
													for="odontologo.endereco.cidade.estado.id">Estado</label>
												<div class="col-sm-6">
													<select class="form-control"
														name="odontologo.endereco.cidade.estado.id"
														id="odontologo.endereco.cidade.estado.id">
														<c:forEach items="${estadoList}" var="estado">
															<option value="${estado.id}"
																<c:if test="${odontologo.endereco.cidade.estado.id == estado.id}">selected</c:if>>${estado.nome}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label"
													for="odontologo.endereco.cidade.id">Cidade</label>
												<div class="col-sm-6">
													<select class="form-control"
														name="odontologo.endereco.cidade.id"
														id="odontologo.endereco.cidade.id"
														value="${odontologo.endereco.cidade.id}">
														<c:forEach items="${cidadeList}" var="cidade">
															<option value="${cidade.id}"
																<c:if test="${odontologo.endereco.cidade.id == cidade.id}">selected</c:if>>${cidade.nome}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label"
													for="odontologo.endereco.bairro">Bairro</label>
												<div class="col-sm-6">
													<input type="text" class="form-control"
														id="odontologo.endereco.bairro"
														placeholder="insira o bairro do logradouro"
														name="odontologo.endereco.bairro"
														value="${odontologo.endereco.bairro}">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label"
													for="odontologo.endereco.rua">Logradouro</label>
												<div class="col-sm-5">
													<input type="text" class="form-control"
														id="odontologo.endereco.rua" placeholder="logradouro"
														name="odontologo.endereco.rua"
														value="${odontologo.endereco.rua}">
												</div>
												<div class="col-sm-1">
													<input type="text" class="form-control" 
													placeholder="número" id="odontologo.endereco.numero"
													name="odontologo.endereco.numero" value="${odontologo.endereco.numero}">
												</div>
											</div>

										</div>
									</div>

									<!-- Formas de Contato -->
									<div class="panel panel-green">
										<div class="panel-heading">
											<h4>Formas de Contato</h4>
										</div>
										<div class="panel-body collapse in">

											<div class="form-group">
												<label class="col-sm-3 control-label"
													for="odontologo.telefoneResidencial">Telefone
													Residencial</label>
												<div class="col-sm-6">
													<input type="text" class="form-control mask"
														data-inputmask="'mask':'(99) 9999-9999'"
														placeholder="insira o telefone residencial do paciente"
														id="odontologo.telefoneResidencial"
														name="odontologo.telefoneResidencial"
														value="${odontologo.telefoneResidencial}">
												</div>
												<div class="col-sm-3">
													<p class="help-block">(xx) xxxx-xxxx</p>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label"
													for="odontologo.telefoneCelular">Telefone Celular</label>
												<div class="col-sm-6">
													<input type="text" class="form-control mask"
														data-inputmask="'mask':'(99) 99999-9999'"
														placeholder="insira o telefone celular do paciente"
														id="odontologo.telefoneCelular"
														name="odontologo.telefoneCelular"
														value="${odontologo.telefoneCelular}">
												</div>
												<div class="col-sm-3">
													<p class="help-block">(xx) xxxxx-xxxx</p>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label" for="odontologo.email">Email</label>
												<div class="col-sm-6">
													<input type="email" class="form-control"
														placeholder="insira o email do paciente"
														id="odontologo.email" name="odontologo.email"
														value="${odontologo.email}">
												</div>
												<div class="col-sm-3">
													<p class="help-block">exemplo@exemplo.com.br</p>
												</div>
											</div>

										</div>
									</div>

									<!-- Informações Profissionais -->
									<div class="panel panel-green">
										<div class="panel-heading">
											<h4>Informações Profissionais</h4>
										</div>
										<div class="panel-body collapse in">

											<div class="form-group">
												<label class="col-sm-3 control-label" for="odontologo.cro">CRO</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="odontologo.cro"
														placeholder="insira a cro do odontologo"
														name="odontologo.cro" value="${odontologo.cro}">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label"
													for="odontologo.especialidade">Especialidade</label>
												<div class="col-sm-6">
													<input type="text" class="form-control"
														placeholder="insira a especialidade do odontólogo"
														id="odontologo.especialidade"
														name="odontologo.especialidade"
														value="${odontologo.especialidade}">
												</div>
											</div>
										</div>
									</div>
									<!-- Rodapé do Panel (Enviar/Cancelar) -->
									<div class="panel-footer">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<div class="btn-toolbar">
													<button class="btn-green btn">Salvar</button>
													<a href="<c:url value="/odontologo/list" />"
														class="btn-default btn">Cancelar</a>
												</div>
											</div>
										</div>
									</div>
								</form>



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
		src="${pageContext.request.contextPath}/assets/js/locales/jquery.datepicker.pt-br.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/plugins/form-tokenfield/bootstrap-tokenfield.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/plugins/form-jasnyupload/fileinput.js"></script>



	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/plugins/form-inputmask/jquery.inputmask.bundle.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/odontologo.form.js"></script>


	<!-- Fim - Scripts Especificos -->
<c:import url="/WEB-INF/jsp/util/notificacao.jsp" />
</body>
</html>