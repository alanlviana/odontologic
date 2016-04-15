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
						<li><a href="<c:url value='/paciente/list'/>">Paciente</a></li>
						<li class="active">Cadastro de Paciente</li>
					</ol>

					<h1>Cadastro de Paciente</h1>
					<div class="options">
						<div class="btn-toolbar">
							<!-- Toolbar aqui -->
						</div>
					</div>
				</div>
				<div class="container">

					<div class="row">
						<div class="col-md-12">
								<form action="<c:url value='/paciente/save'/>" method="post" class='form-horizontal' accept-charset="UTF-8">

									<c:forEach var="error" items="${errors}">
										<div class="alert alert-dismissable alert-danger">
							     			${error.message}
										</div>
									</c:forEach>

									<!-- Id -->
									<input type="hidden" name="paciente.id" value="${paciente.id}" />
									<input type="hidden" name="paciente.endereco.id" value="${paciente.endereco.id}" />

									<!-- Dados Pessoais -->
									<div class="panel panel-info">
       									<div class="panel-heading">
            								<h4>Dados Pessoais</h4>
        								</div>
        								<div class="panel-body collapse in">
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.nome">Nome</label>
                								<div class="col-sm-6">
                    								<input type="text" class="form-control" placeholder="insira o nome do paciente" 
                    								name="paciente.nome" id="paciente.nome" value="${paciente.nome}">
                								</div>
            								</div>
            
           									<div class="form-group">
               									<label class="col-sm-3 control-label" for="paciente.sexo">Sexo</label>
               									<div class="col-sm-6">
                   									<select class="form-control" name="paciente.sexo" id="paciente.sexo" value="${paciente.sexo}">
                       									<option value="false" disabled
                       									<c:if test='${paciente.sexo == null}'>selected</c:if>
                       									>Selecione o sexo do paciente</option>
                       									<option value="MASCULINO"
                       									<c:if test='${paciente.sexo == "MASCULINO"}'>selected</c:if>
                       									>Masculino</option>
                       									<option value="FEMININO"
                       									<c:if test='${paciente.sexo == "FEMININO"}'>selected</c:if>
                       									>Feminino</option>
                   									</select>
               									</div>
           									</div>
            
           									<div class="form-group">
               									<label class="col-sm-3 control-label" for="paciente.dataNascimento">Data de Nascimento</label>
               									<div class="col-sm-6">
                   									<input type="text" class="form-control datepicker" name='paciente.dataNascimento' 
                   									id='paciente.dataNascimento' value="<fmt:formatDate value="${paciente.dataNascimento.time}" />">
               									</div>
           									</div>
            									
           									<!-- Estado Civil 
            									
           									<div class="form-group">
               									<label class="col-sm-3 control-label">Estado Civil</label>
               									<div class="col-sm-6">
                   									<select class="form-control" id="paciente.estadoCivil">
                       									<option value="false" disabled selected>Selecione o estado civil do paciente</option>
                       									<option value="s">Solteiro(a)</option>
                       									<option value="c">Casado(a)</option>
                       									<option value="d">Divorciado(a)</option>
                       									<option value="v">Viúvo(a)</option>
                   									</select>
               									</div>
           									</div>  --> 
       									</div>
  									</div>

									<!-- Documentos -->
									<div class="panel panel-info">
        								<div class="panel-heading">
            								<h4>Documentos</h4>
        								</div>
        								<div class="panel-body collapse in">
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.rg">RG</label>
                								<div class="col-sm-6">
                    								<input type="text" class="form-control mask" data-inputmask="'mask':'99.999.999-*'" 
                    								placeholder="insira o RG do paciente" id="paciente.rg" name="paciente.rg" value="${paciente.rg}">
                								</div>
                								<div class="col-sm-3"><p class="help-block">xx.xxx.xxx-x</p></div>
            								</div>
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.cpf">CPF</label>
                								<div class="col-sm-6">
                    								<input type="text" class="form-control mask" data-inputmask="'mask':'999.999.999-99'" 
                    								placeholder="insira o CPF do paciente" id="paciente.cpf" name="paciente.cpf" value="${paciente.cpf}">
                								</div>
                								<div class="col-sm-3"><p class="help-block">xxx.xxx.xxx-xx</p></div>
            								</div>
        								</div>
    								</div>
    								
    								<!-- Endereço -->
    								<div class="panel panel-info">
        								<div class="panel-heading">
            								<h4>Endereço</h4>
        								</div>
        								<div class="panel-body collapse in">
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.endereco.cep">CEP</label>
                								<div class="col-sm-6">
                    								<input type="text" class="form-control mask" data-inputmask="'mask':'99999-999'" 
                    								placeholder="insira o CEP do logradouro" id="paciente.endereco.cep" 
                    								name="paciente.endereco.cep" value="${paciente.endereco.cep}">
                								</div>
                								<div class="col-sm-3"><p class="help-block">xxxxx-xxx</p></div>
            								</div>
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.endereco.cidade.estado.id">Estado</label>
                								<div class="col-sm-6">
                    								<select class="form-control" name="paciente.endereco.cidade.estado.id"
													id="paciente.endereco.cidade.estado.id">
													<c:forEach items="${estadoList}" var="estado">
														<option value="${estado.id}"
														<c:if test="${paciente.endereco.cidade.estado.id == estado.id}">selected</c:if>
														>${estado.nome}</option>
													</c:forEach>
												</select>
                								</div>
            								</div>
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.endereco.cidade.id">Cidade</label>
                								<div class="col-sm-6">
                    								<select class="form-control" name="paciente.endereco.cidade.id" 
                    								id="paciente.endereco.cidade.id" value="${paciente.endereco.cidade.id}">
													<c:forEach items="${cidadeList}" var="cidade">
														<option value="${cidade.id}"
														<c:if test="${paciente.endereco.cidade.id == cidade.id}">selected</c:if>
														>${cidade.nome}</option>
													</c:forEach>
												</select>
                								</div>
            								</div>
            
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.endereco.bairro">Bairro</label>
                								<div class="col-sm-6">
                    								<input type="text" class="form-control" id="paciente.endereco.bairro" 
                    								name="paciente.endereco.bairro" placeholder="insira o bairro do logradouro"
                    								value="${paciente.endereco.bairro}">
                								</div>
            								</div>
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.endereco.rua">Logradouro</label>
                								<div class="col-sm-5">
                    								<input type="text" class="form-control" id="paciente.endereco.rua" 
                    								name="paciente.endereco.rua" placeholder="logradouro"
                    								value="${paciente.endereco.rua}">
                								</div>
                								<div class="col-sm-1">
                    								<input type="text" class="form-control" maxlength="5" 
                    								placeholder="número" id="paciente.endereco.numero" name="paciente.endereco.numero"
                    								value="${paciente.endereco.numero}">
                								</div>
            								</div>
        								</div>
    								</div>
    								
    								<!-- Formas de Contato -->
    								<div class="panel panel-info">
        								<div class="panel-heading">
            								<h4>Formas de Contato</h4>
        								</div>
        								<div class="panel-body collapse in">
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.telefoneResidencial">Telefone Residencial</label>
                								<div class="col-sm-6">
                    								<input type="text" class="form-control mask" data-inputmask="'mask':'(99) 9999-9999'" 
                    								placeholder="insira o telefone residencial do paciente" id="paciente.telefoneResidencial"
                    								name="paciente.telefoneResidencial" value="${paciente.telefoneResidencial}">
                								</div>
                								<div class="col-sm-3"><p class="help-block">(xx) xxxx-xxxx</p></div>
            								</div>
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.telefoneCelular">Telefone Celular</label>
                								<div class="col-sm-6">
                    								<input type="text" class="form-control mask" data-inputmask="'mask':'(99) 99999-9999'" 
                    								placeholder="insira o telefone celular do paciente" id="paciente.telefoneCelular"
                    								name="paciente.telefoneCelular" value="${paciente.telefoneCelular}">
                								</div>
                								<div class="col-sm-3"><p class="help-block">(xx) xxxxx-xxxx</p></div>
            								</div>
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.email">Email</label>
                								<div class="col-sm-6">
                    								<input type="email" class="form-control" id="paciente.email" 
                    								placeholder="insira o email do paciente" name="paciente.email"
                    								value="${paciente.email}">
                								</div>
                								<div class="col-sm-3"><p class="help-block">exemplo@exemplo.com.br</p></div>
            								</div>
        								</div>
    								</div>
    								
    								<!-- Informações Médicas -->
    								<div class="panel panel-info">
        								<div class="panel-heading">
            								<h4>Informações Médicas</h4>
        								</div>
        								<div class="panel-body collapse in">
        									
            								
            								<div class="form-group">
                								<label class="col-sm-3 control-label" for="paciente.convenio.id">Convênio</label>
                								<div class="col-sm-6">
                    								<select class="form-control" name='paciente.convenio.id'
													id='paciente.convenio.id' value="${paciente.convenio.id}">
														<c:forEach items="${convenioList}" var="convenio">
															<option value="${convenio.id}"
															<c:if test="${paciente.convenio.id == convenio.id}">selected  </c:if>
															>${convenio.nome}</option>
														</c:forEach>
													</select>
                								</div>
            								</div>
        								</div>
    								</div>
										<!-- Rodapé do Panel (Enviar/Cancelar) -->
										<div class="panel-footer">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
													<div class="btn-toolbar">
														<button class="btn-info btn">Salvar</button>
														<a href="<c:url value="/paciente/list" />"class="btn-default btn">Cancelar</a>
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
src='${pageContext.request.contextPath}/util/required'
></script>	
<!-- Fim - Scritps Essenciais -->

<!-- Inicio - Scripts Especificos -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/locales/jquery.datepicker.pt-br.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/plugins/form-inputmask/jquery.inputmask.bundle.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/paciente.form.js"></script>


<!-- Fim - Scripts Especificos -->
<c:import url="/WEB-INF/jsp/util/notificacao.jsp" />
</body>
</html>