<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<tag:template title="Lista de Cerveja">

<c:if test="${msg!=null}">
	<div class="alert alert-success">${msg}</div>
</c:if>
	<h1>Lista de Cerveja</h1>
	<table class="table">
		<tr>
			<th>Nome</th>
			<th>Preço</th>
			<th>Tipo</th>
			<th></th>
		</tr>
		<c:forEach items="${lista }" var="c">
			<tr>
				<td>${c.nome }</td>
				<td>${c.preco }</td>
				<td>${c.tipo }</td>
				<td>
					<c:url var="link" value="/cerveja/editar/${c.codigo}"></c:url>
					<a href="${link}" class="btn btn-primary">Editar
					<span class="oi oi-pencil"></span></a>

					<button onclick="idExcluir.value = ${c.codigo}" type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">Apagar</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Deseja excluir?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Deseja remover o item?
      </div>
      <div class="modal-footer">
      <c:url var="action" value="/cerveja/excluir"></c:url>
      <form action="${action}" method="post">
      	<input type="hidden" id="idExcluir" name="codigo">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
        <button type="submit" class="btn btn-primary">Sim</button>
      </form>
      </div>
    </div>
  </div>
</div>
</tag:template>