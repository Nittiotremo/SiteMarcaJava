<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="cabecalho.jsp"/>
<div class="card text-center">
    <div class="card-header">
        <h1>Marca</h1>
        <hr/>
        <div class="row">
            <div class="col-12">
                <a href="NovaMarca" class="btn btn-primary">Nova Marca</a>
                <a href="${pageContext.request.contextPath}/home.jsp" class="btn btn-secondary">Voltar</a>
            </div>
        </div>
        <hr/>
        <c:if test="${mensagem != null}">
        <div class="alert alert-primary" role="alert">
            ${mensagem}
        </div>
        </c:if>
    </div>
    <div class="card-body">
        <table class="table">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="marca" items="${marcas}">
                    <tr>
                        <td>${marca.codigomarca}</td>
                        <td>${marca.nomemarca}</td>
                        <td><a class="btn btn-info" href="ConsultarMarca?codigoMarca=${marca.codigomarca}">Alterar</a>
                        <a class="btn btn-danger" href="ExcluirMarca?codigoMarca=${marca.codigomarca}">Excluir</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="rodape.jsp"/>