<%-- 
    Document   : cadastroUsuario
    Created on : 28/05/2013, 22:21:46
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    
    <head>
        <title>Cadastro de Usuário</title>        
        <%@include file="WEB-INF/jspf/head.jspf"%>
        <script src="js/cadastroUsuario.js"></script>
    </head>
    
    <!--RECUPERA SESSAO DO USUARIO-->
    <%@include file="WEB-INF/jspf/session.jspf"%>
    
    <body>
        
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- DIV DA BARRA DE NAVEGAÇÃO SUPERIOR -->
        <%@include file="WEB-INF/jspf/nav.jspf"%>
        
        <!--DIV PRINCIPAL DA PAGINA-->
        <div class="container">
            
            <!--TRATA SE O LOGIN FOI DIGITADO CORRETAMENTE-->
            <%@include file="WEB-INF/jspf/erroLogin.jspf" %>
            
            <h3>Cadastro de Usuários</h3>
            <div class="hero-unit">
                <!--FORMULARIO DE CADASTRO DE USUARIO-->
                <form class="form-horizontal" method="post" action="RecebeUsuario" onsubmit="return check();">
                    <div class="control-group" id="divName">
                        <label class="control-label" for="inputName"><i class="red">*</i>Nome:</label>
                        <div class="controls">
                            <input class="input-xlarge" type="text" id="inputName" placeholder="Nome Completo" name="nome">
                            <span class="help-inline" id="erroNome">Insira um nome.</span>
                        </div>
                    </div>
                    <div class="control-group" id="divEmailc">
                        <label class="control-label" for="inputEmail"><i class="red">*</i>E-mail:</label>
                        <div class="controls">
                              <input class="input-xlarge" type="text" id="inputEmailc" placeholder="E-mail" name="email">
                              <span class="help-inline" id="erroEmailc">E-mail inválido.</span>
                        </div>
                    </div>
                    <div class="control-group" id="divSenhac">
                        <label class="control-label" for="inputSenha"><i class="red">*</i>Senha:</label>
                        <div class="controls">
                              <input class="input-xlarge" type="password" id="inputSenhac" placeholder="Senha" name="senha">
                              <span class="help-inline" id="erroSenhac">Insira uma senha maior que 6 dígitos.</span>
                        </div>
                    </div>
                    <div class="control-group" id="divConfSenha">
                        <label class="control-label" for="inputConfSenha"><i class="red">*</i>Confirma Senha:</label>
                        <div class="controls">
                              <input class="input-xlarge" type="password" id="inputConfSenha" placeholder="Confirme sua Senha">
                              <span class="help-inline" id="erroConfSenha">Senha não confere.</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                              <span class="help-inline">* Campos Obrigatórios.</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <input type="hidden" value="salvar" name="acao">
                            <button type="submit" class="btn btn-primary">Cadastrar</button>
                        </div>
                    </div>
                </form>
            </div>

            <hr>

            <footer>
                <p>&copy; Grupo 13</p>
            </footer>

        </div> <!-- /container -->
    </body>
</html>
