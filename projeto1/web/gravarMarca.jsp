<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="cabecalho.jsp"/>
<div class="card">
    <div class="card-header text-center">
        <h1>Gravar Marca</h1>
    </div>
    <div class="card-body">
        <form action="GravarMarca" method="post">
            <div class="row">
                <div class="col-6">
                    <label for="codigoMarca">Código:</label>
                    <input type="text" id="codigoMarca" class="form-control" name="codigoMarca" value="${marca.codigomarca == 0 ? "" : marca.codigomarca}" readonly />
                </div>
                <div class="col-6">
                    <label for="nomeMarca">Nome: </label>
                    <input type="text" id="nomeMarca" class="form-control" name="nomeMarca" value="${marca.nomemarca}" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-success">Cadastrar</button>
                    <a href="ListarMarca" class="btn btn-secondary">Voltar</a>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="rodape.jsp"/>