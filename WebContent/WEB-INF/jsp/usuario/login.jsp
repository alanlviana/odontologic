<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt">
<head>
<meta charset="utf-8">
<title>Odontologic</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Sistema Odontologic">
<meta name="author" content="Odontologic Team">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/img/favicon.ico">

<!-- <link href="${pageContext.request.contextPath}/assets/less/styles.less" rel="stylesheet/less" media="all"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/styles.min.css?=113">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/SansPro.css">

<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/less.js"></script> -->
</head>
<body class="focusedform">

	<div class="verticalcenter">
		<img
			src="${pageContext.request.contextPath}/assets/img/odontologic.png"
			alt="Logo" class="brand" />
		<div class="panel panel-primary">
			<div class="panel-body">
				<h4 class="text-center" style="margin-bottom: 25px;">Realize o
					login para iniciar</h4>
				<form action="<c:url value='/usuario/logar' />" method="post"
					class="form-horizontal">
					<input type="hidden" name="url" value="${url}">

					<div class="form-group">
						<label for="email" class="control-label col-sm-4"
							style="text-align: left;">Usuário</label>
						<div class="col-sm-8">
							<input type="text" class="form-control"
								name="usuario.nomeUsuario" id="usuario.nomeUsuario"
								placeholder="Usuário" value="administrador" autofocus>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="control-label col-sm-4"
							style="text-align: left;">Senha</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" name="usuario.senha"
								id="password" value="administrador" placeholder="Senha">
						</div>
					</div>
					<c:forEach var="error" items="${errors}">
						<div class="alert alert-dismissable alert-danger">
							<strong>Ops!</strong> ${error.message}
						</div>
					</c:forEach>
					<c:if test="${configuracao}">
   						<div class="alert alert-dismissable alert-danger">
							<strong>
								<a href="<c:url value='/config' />" >Clique aqui para iniciar validação do sistema!</a>
							</strong> 
						</div>
					</c:if>
					
					
					<div class="clearfix"></div>
					<input type="submit" class="btn btn-primary btn-block"
						value="Entrar">
				</form>
			</div>
		</div>
	</div>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/js/jqueryui-1.10.3.min.js'></script>		

	<c:import url="/WEB-INF/jsp/util/notificacao.jsp" />
	
</body>


</html>