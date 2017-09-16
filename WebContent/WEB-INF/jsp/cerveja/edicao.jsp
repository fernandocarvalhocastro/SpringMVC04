<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tag:template title="Editar cerveja">
	<c:url var="action" value="/cerveja/editar"></c:url>
	<form:form action="${action}" method="post" commandName="cerveja">
		<form:hidden path="codigo" />
		<div class="form-group">
			<form:label path="nome">Nome</form:label>
			<form:input path="nome" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="preco">Preço</form:label>
			<form:input path="preco" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="tipo">Tipo</form:label>
			<form:input path="tipo" cssClass="form-control"/>
		</div>
		<input type="submit" value="Salvar" class="btn btn-primary"/>
	</form:form>
</tag:template>