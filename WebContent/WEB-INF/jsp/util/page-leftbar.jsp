<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- BEGIN SIDEBAR -->
<nav id="page-leftbar" role="navigation">
	<!-- BEGIN SIDEBAR MENU -->
	<ul class="acc-menu" id="sidebar">
		<li id="search">
			<a href="javascript:;">
				<i class="fa fa-search opacity-control"></i>
			</a>
			<form>
				<input type="text" class="search-query"
					placeholder="Pesquisar...">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</li>
		<li class="divider"></li>
		<li>
			<a href="<c:url value='/'/>">
				<i class="fa fa-th"></i>
				<span>Dashboard</span>
			</a>
		</li>
		<li>
			<a href="javascript:;">
				<i class="fa fa-pencil"></i>
				<span>Cadastro</span>
			</a>

			<ul class="acc-menu">
				<li>
					<a href="<c:url value='/convenio/list'/>">
						<span>Convênio</span>
					</a>
				</li>
				<li>
					<a href="<c:url value='/receber/list'/>">
						<span>Conta a Receber</span>
					</a>
				</li>
				<li>
					<a href="<c:url value='/consulta/list'/>">
						<span>Consulta</span>
					</a>
				</li>
				<c:if
					test='${autenticacaoUsuario.usuario.tipoUsuario == "ADMINISTRADOR"}'>
					<li>
						<a href="<c:url value='/consultorio/list'/>">
							<span>Consultório</span>
						</a>
					</li>
				</c:if>
				<li>
					<a href="<c:url value='/paciente/list'/>">
						<span>Paciente</span>
					</a>
				</li>

				<c:if
					test='${autenticacaoUsuario.usuario.tipoUsuario == "ADMINISTRADOR"}'>

					<li>
						<a href="<c:url value='/odontologo/list'/>">
							<span>Odontólogo</span>
						</a>
					</li>
					<li>
						<a href="<c:url value='/servico/list'/>">
							<span>Serviço</span>
						</a>
					</li>
				</c:if>
			</ul>
		</li>

		<c:if
			test='${autenticacaoUsuario.usuario.tipoUsuario == "ADMINISTRADOR"}'>
			<li>
				<a href="javascript:;">
					<i class="fa fa-user"></i>
					<span>Administração</span>
				</a>
				<ul class="acc-menu">
					<li>
						<a href="<c:url value='/usuario/list'/>">
							<span>Usuário</span>
						</a>
					</li>
				</ul>
			</li>
		</c:if>

	</ul>
	<!-- END SIDEBAR MENU -->
</nav>
