<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<div id='tabelaServico'>
<table cellpadding="0" cellspacing="0" border="00"
											class="table table-striped table-bordered datatables dataTable"
											id="example" aria-describedby="example_info">
											<thead>
												<tr role="row">
													<th class="sorting_asc" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-sort="ascending"
														aria-label="Rendering engine: activate to sort column descending"
														style="width: 75px;">Código</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="Browser: activate to sort column ascending"
														style="width: 100px;">Quantidade</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="Engine version: activate to sort column ascending"
														style="width: 250px;">Descrição</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="Platform(s): activate to sort column ascending"
														style="width: 250px;">Valor Unitário</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="Platform(s): activate to sort column ascending"
														style="width: 250px;">Valor Total</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="example" rowspan="1" colspan="1"
														aria-label="Platform(s): activate to sort column ascending"
														style="width: 50px;">Opções</th>

												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<c:forEach items="${baixaConsulta.consultaServicos}" var="consultaServico" varStatus="i">
													<tr  class="gradeA">
														<td class=" sorting_1">${consultaServico.servico.id}</td>
														<td class=" ">${consultaServico.quantidade}</td>
														<td class=" ">${consultaServico.servico.nome}</td>
														<td class=" ">R$ <fmt:formatNumber minFractionDigits="2" value="${consultaServico.servico.valor}"/></td>
														<td class=" ">R$ <fmt:formatNumber minFractionDigits="2" value="${consultaServico.total}"/></td>
														<td><a href="javascript:removerItem('${i.count}')" class="btn btn-default btn-xs"><i class="fa fa-times"></i> Remover</a> </td>
													</tr>
													
												</c:forEach>

											</tbody>
											<tfooter>
												<tr  class="gradeA">
													<td class=" sorting_1"></td>
													<td class=" "></td>
													<td class=" "></td>
													<td class=" ">Total</td>
													<td class=" ">R$ <fmt:formatNumber minFractionDigits="2" value="${baixaConsulta.total}"/></td>
													<td></td>
												</tr>												
											</tfooter>
										</table>
</div>