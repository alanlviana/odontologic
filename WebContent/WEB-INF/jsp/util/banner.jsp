<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="navbar navbar-inverse navbar-fixed-top" role="banner">
        <a id="leftmenu-trigger" class="tooltips" data-toggle="tooltip" data-placement="right" title="Alternar Sidebar"></a>
        <!-- <a id="rightmenu-trigger" class="tooltips" data-toggle="tooltip" data-placement="left" title="Alternar Infobar"></a> -->

        <div class="navbar-header pull-left">
            <a class="navbar-brand" href="<c:url value='/'/>"></a>
        </div>

        <ul class="nav navbar-nav pull-right toolbar">
        	<li class="dropdown">
        		<a href="#" class="dropdown-toggle username" data-toggle="dropdown"><span class="hidden-xs">${autenticacaoUsuario.usuario.nome}  <i class="fa fa-caret-down"></i></span><img src="<c:url value='/assets/demo/avatar/dangerfield.png'/>" alt="Dangerfield" /></a>
        		<ul class="dropdown-menu userinfo arrow">
        			<li class="username">
                        <a href="#">
        				    <div class="pull-left"><img src="<c:url value='/assets/demo/avatar/dangerfield.png'/>" alt="Jeff Dangerfield"/></div>
        				    <div class="pull-right"><h5>Olá, ${autenticacaoUsuario.usuario.nome}!</h5><small>Entrou como <span>${autenticacaoUsuario.usuario.nomeUsuario}</span></small></div>
                        </a>
        			</li>
        			<li class="userlinks">
        				<ul class="dropdown-menu">
        					<li><a href="<c:url value='/usuario/form?usuario.id=${autenticacaoUsuario.usuario.id}'/>">Conta <i class="pull-right fa fa-cog"></i></a></li>
        					<li><a href="#">Ajuda <i class="pull-right fa fa-question-circle"></i></a></li>
        					<li class="divider"></li>
        					<li><a href="<c:url value='/usuario/logout'/>" class="text-right">Sair</a></li>
        				</ul>
        			</li>
        		</ul>
        	</li>
			<li>
                <a href="#" id="headerbardropdown"><span><i class="fa fa-level-down"></i></span></a>
            </li>
		</ul>
    </header>
