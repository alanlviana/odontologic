<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="pt">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
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
						<li><a href="<c:url value="/convenio/list"/>">Convênio</a></li>
						<li class="active">Cadastro de Convênio</li>
					</ol>
					<h1>Cadastro de Convênio</h1>
				</div>

				<div class="container">

					<form action="<c:url value='/convenio/save'/>"
						class="form-horizontal row-border">

						<c:forEach var="error" items="${errors}">
							<div class="alert alert-dismissable alert-danger">
							     ${error.message}
							</div>
						</c:forEach>
						
						
						<input type="hidden" name="convenio.id" value="${convenio.id}" />
						<input type="hidden" name="convenio.endereco.id"
							value="${convenio.endereco.id}" />

						<!-- Dados do Convênio-->
						<div class="panel panel-purple">
							<div class="panel-heading">
								<h4>Dados do Convênio</h4>
							</div>
							<div class="panel-body collapse in">

								<div class="form-group">
									<label class="col-sm-3 control-label" for="convenio.nome">Razão Social</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"
											placeholder="insira o nome fantasia do convenio"
											id="convenio.nome" name="convenio.nome"
											value="${convenio.nome}">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label"
										for="convenio.codConvenio">Código do Convênio</label>
									<div class="col-sm-6">
										<input type="text" class="form-control mask"
											placeholder="insira o código do convênio"
											id="convenio.codConvenio" name="convenio.codConvenio"
											value="${convenio.codConvenio}">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label"
										for="convenio.registroANS">Registro ANS</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"
											placeholder="insira o registro ANS do convenio"
											id="convenio.registroANS" name="convenio.registroANS"
											value="${convenio.registroANS}">
									</div>
								</div>
							</div>
						</div>

						<!-- Endereço -->
						<div class="panel panel-purple">
							<div class="panel-heading">
								<h4>Endereço</h4>
							</div>
							<div class="panel-body collapse in">

								<div class="form-group">
									<label class="col-sm-3 control-label"
										for="convenio.endereco.cep">CEP</label>
									<div class="col-sm-6">
										<input type="text" class="form-control mask"
											data-inputmask="'mask':'99999-999'"
											placeholder="insira o CEP do logradouro"
											id="convenio.endereco.cep" name="convenio.endereco.cep"
											value="${convenio.endereco.cep}">
									</div>
									<div class="col-sm-3">
										<p class="help-block">xxxxx-xxx</p>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label"
										for="convenio.endereco.cidade.estado.id">Estado</label>
									<div class="col-sm-6">
										<select class="form-control"
											id="convenio.endereco.cidade.estado.id">
											<c:forEach items="${estadoList}" var="estado">
												<option value="${estado.id}"
													<c:if test="${convenio.endereco.cidade.estado.id == estado.id}">selected</c:if>>${estado.nome}</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label"
										for="convenio.endereco.cidade.id">Cidade</label>
									<div class="col-sm-6">
										<select class="form-control"
											name="convenio.endereco.cidade.id"
											id="convenio.endereco.cidade.id"
											value="${convenio.endereco.cidade.id}">
											<c:forEach items="${cidadeList}" var="cidade">
												<option value="${cidade.id}"
													<c:if test="${convenio.endereco.cidade.id == cidade.id}">selected</c:if>>${cidade.nome}</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label"
										for="convenio.endereco.bairro">Bairro</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"
											id="convenio.endereco.bairro"
											placeholder="insira o bairro do logradouro"
											name="convenio.endereco.bairro"
											value="${convenio.endereco.bairro}">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label"
										for="convenio.endereco.rua">Logradouro</label>
									<div class="col-sm-5">
										<input type="text" class="form-control"
											id="convenio.endereco.rua" placeholder="logradouro"
											name="convenio.endereco.rua" value="${convenio.endereco.rua}">
									</div>
									<div class="col-sm-1">
										<input type="text" class="form-control" placeholder="número"
											id="convenio.endereco.numero" name="convenio.endereco.numero"
											value="${convenio.endereco.numero}">
									</div>
								</div>

							</div>
						</div>

						<!-- Formas de Contato -->
						<div class="panel panel-purple">
							<div class="panel-heading">
								<h4>Formas de Contato</h4>
							</div>
							<div class="panel-body collapse in">

								<div class="form-group">
									<label class="col-sm-3 control-label" for="convenio.telefone">Telefone
										Comercial</label>
									<div class="col-sm-6">
										<input type="text" class="form-control mask"
											data-inputmask="'mask':'(99) 9999-9999'"
											placeholder="insira o telefone residencial do convenio"
											id="convenio.telefone" name="convenio.telefone"
											value="${convenio.telefone}">
									</div>
									<div class="col-sm-3">
										<p class="help-block">(xx) xxxx-xxxx</p>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label" for="convenio.site">Site</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"
											placeholder="insira o site do convenio" id="convenio.site"
											name="convenio.site" value="${convenio.site}">
									</div>
									<div class="col-sm-3">
										<p class="help-block">www.exemplo.com.br</p>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label" for="convenio.email">Email</label>
									<div class="col-sm-6">
										<input type="email" class="form-control"
											placeholder="insira o email do convenio" id="convenio.email"
											name="convenio.email" value="${convenio.email}">
									</div>
									<div class="col-sm-3">
										<p class="help-block">exemplo@exemplo.com.br</p>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3">
									<div class="btn-toolbar">
										<button class="btn-purple btn">Salvar</button>
										<a href="<c:url value="/convenio/list" />"
											class="btn-default btn">Cancelar</a>
									</div>
								</div>
							</div>
						</div>
					</form>


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
		src="${pageContext.request.contextPath}/assets/plugins/form-inputmask/jquery.inputmask.bundle.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/convenio.form.js"></script>
	<!-- Fim - Scripts Especificos -->
<c:import url="/WEB-INF/jsp/util/notificacao.jsp" />
</body>
</html>