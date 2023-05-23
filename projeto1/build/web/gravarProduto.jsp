<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="cabecalho.jsp"/>
<div class="card">
    <div class="card-header text-center">
        <h1>Gravar Produto</h1>
    </div>
    <div class="card-body">
        <form action="GravarProduto" method="post">
            <div class="row">
                <div class="col-6">
                    <label for="codigoProduto">Código:</label>
                    <input type="text" id="codigoProduto" class="form-control" name="codigoProduto" value="${produto.codigoproduto == 0 ? "" : produto.codigoproduto}" readonly />
                </div>
                <div class="col-6">
                    <label for="nomeProduto">Nome: </label>
                    <input type="text" id="nomeProduto" class="form-control" name="nomeProduto" value="${produto.nomeproduto}" />
                </div>
            </div>
                <div class="row">
                    <div class = "col-12">
                        <label for="codigoMarca">Marca:</label>
                    <select id="codigoMarca" name="codigoMarca" class="form-control" required>
                        <option value="">Selecione...</option>
                        <c:forEach var="marca" items="${marcas}">
                            <option value="${marca.codigomarca}" ${marca.codigomarca == produto.marca.codigomarca ? "selected" : ""}>${marca.nomemarca}</option>
                        </c:forEach>
                    </select>
                    </div>
                </div>
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-success">Cadastrar</button>
                    <a href="ListarProduto" class="btn btn-secondary">Voltar</a>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="rodape.jsp"/>
