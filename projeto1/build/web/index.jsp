<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="cabecalho.jsp"/>
<c:if test="${mensagem != null}">
    <div class="alert alert-primary text-center" role="alert">
        ${mensagem}
    </div>
</c:if>
<div class="card w-25 mx-auto my-5">
    <div class="card-header text-center">
        <h1>Login</h1>
    </div>
    <div class="card-body">
        <form action="EfetuarLogin" method="POST">
            <div class="row">
                <div class="col-12">
                    <label for="cpfUsuario">CPF:</label>
                    <input type="text" class="form-control" id="cpfUsuario" 
                           name="cpfUsuario" placeholder="Informe o CPF"/>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label for="senhaUsuario">Senha:</label>
                    <input type="password" class="form-control" id="senhaUsuario" 
                           name="senhaUsuario" placeholder="Informe a senha"/>
                </div>
            </div>
          <!--<div class="row mt-3">
                <div class="col-12">
                    <label for="perfilUsuario">Perfil:</label>
                    <select id="perfilUsuario" name="perfilUsuario" class="form-control">
                        <option value="">Selecione...</option>
                        <option value="Paciente">Paciente</option>
                        <option value="Médico">Médico</option>
                    </select>
                </div>
            </div>-->
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-success">Acessar</button>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="rodape.jsp"/>