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
						<li>Administração</a></li>
						<li><a href=<c:url value='/usuario/list'/>>Usuário</a></li>
						<li class="active">Cadastro de Usuário</li>
					</ol>

					<h1>Usuário</h1>
					<div class="options">
						<div class="btn-toolbar">
							<!-- Toolbar aqui -->
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-brown">
								<div class="panel-heading">
									<h4>Cadastro de Usuário</h4>
									<div class="options"></div>
								</div>
								<div class="panel-body">
									<form action="<c:url value='/usuario/save'/>" method="post"
										class='form-horizontal' accept-charset="UTF-8">

										<c:forEach var="error" items="${errors}">
											<div class="alert alert-dismissable alert-danger">
											     ${error.message}
											</div>
										</c:forEach>

										<!-- Id -->
										<input type="hidden" name="usuario.id" value="${usuario.id}" />
										
										<!-- Tipo de Usuario -->
										<div class="form-group">
											<label class="col-sm-3 control-label" for="usuario.tipoUsuario">Tipo de Usuário</label>
											<div class="col-sm-6">
												<div class='radio'>
													<label>
														<input type="radio" name='usuario.tipoUsuario' value='ATENDENTE'
														<c:if test='${usuario.tipoUsuario == "ATENDENTE"}'>checked</c:if>
														<c:if test='${usuario.tipoUsuario == null}'>checked</c:if>
														/>Atendente
													</label>	
												</div>
												<div class='radio'>
													<label>
														<input type="radio" name='usuario.tipoUsuario' value='ADMINISTRADOR'
														<c:if test='${usuario.tipoUsuario == "ADMINISTRADOR"}'>checked</c:if>
														/>Administrador
													</label>
												</div>
												
											</div>
										</div>
										
										<!-- Nome de Usuário -->
										<div class="form-group">
											<label class="col-sm-3 control-label" for="usuario.nomeUsuario">Nome de Usuário</label>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													placeholder="insira o nome de usuário"
													name="usuario.nomeUsuario" id="usuario.nomeUsuario"
													value="${usuario.nomeUsuario}">
											</div>
										</div>
										
										<!-- Nome -->
										<div class="form-group">
											<label class="col-sm-3 control-label" for="usuario.nome">Nome</label>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													placeholder="insira o nome do usuário"
													name="usuario.nome" id="usuario.nome"
													value="${usuario.nome}">
											</div>
										</div>
										
										<!-- Senha -->
										<div class="form-group">
											<label class="col-sm-3 control-label" for="usuario.senha">Senha</label>
											<div class="col-sm-6">
												<div class="input-group">
													<input type="password" class="form-control"
														<c:if test='${usuario.id != 0}'>readonly</c:if>
														placeholder="insira a senha do usuário"
														name="usuario.senha" id="usuario.senha"
														value="${usuario.senha}">
													<div id="btnBuscaPaciente" class="input-group-btn">
                    									<a href="<c:url value="/usuario/formPassword?usuario.id=${usuario.id}"/>" class="btn btn-brown"><i class="fa fa-lock"></i></a>
                    								</div>
                    							</div>
											</div>
										</div>

										<!-- Rodapé do Panel (Enviar/Cancelar) -->
										<div class="panel-footer">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
													<div class="btn-toolbar">
														<button class="btn-brown btn">Salvar</button>
														<a href="<c:url value="/usuario/list" />"
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
		src="${pageContext.request.contextPath}/js/usuario.form.js"></script>


	<!-- Fim - Scripts Especificos -->
	<c:import url="/WEB-INF/jsp/util/notificacao.jsp" />
</body>
</html>