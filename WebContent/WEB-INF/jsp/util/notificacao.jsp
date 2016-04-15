<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type='text/javascript'
		src='${pageContext.request.contextPath}/assets/js/jquery.noty.packaged.min.js'></script>

<c:if test="${notificacao != null}">		
	<script type="text/javascript">
		$(function(){
			var timeout = ${notificacao.timeout};
			var modal = ${notificacao.modal};
			noty({text: '${notificacao.text}',layout:'${notificacao.layout}',type:'${notificacao.type}',timeout: timeout ,modal:modal});
		});
		
	</script>
</c:if>