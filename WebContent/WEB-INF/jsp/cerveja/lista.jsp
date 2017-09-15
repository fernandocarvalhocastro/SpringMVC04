<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<tag:template title="Lista de Cerveja">
	<h1>Lista de Cerveja</h1>
	<table class="table">
		<tr>
			<th>Nome</th>
			<th>Preço</th>
			<th>Tipo</th>
		</tr>
		<c:forEach items="${lista }" var="c">
			<tr>
				<td>${c.nome }</td>
				<td>${c.preco }</td>
				<td>${c.tipo }</td>
			</tr>
		</c:forEach>
	</table>
</tag:template>