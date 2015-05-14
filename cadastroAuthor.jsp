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
        <title>Cadastro de Author</title>        
        <%@include file="WEB-INF/jspf/head.jspf"%>
        <script src="js/cadastroAuthor.js"></script>
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
            
            <h3>Cadastro de Author</h3>
            <div class="hero-unit">
                <!--FORMULARIO DE CADASTRO DE USUARIO-->
                <form class="form-horizontal" method="post" action="RecebeAuthor" onsubmit="return check();">
                    <div class="control-group" id="divForename">
                        <label class="control-label" for="inputForename"><i class="red">*</i>Nome:</label>
                        <div class="controls">
                            <input class="input-xlarge" type="text" id="inputForename" placeholder="Forename" name="forename">
                            <span class="help-inline" id="erroForename">Insira um nome.</span>
                        </div>
                    </div>
                    <div class="control-group" id="divLastname">
                        <label class="control-label" for="inputLastname"><i class="red">*</i>Sobrenome:</label>
                        <div class="controls">
                              <input class="input-xlarge" type="text" id="inputLastname" placeholder="Lastname" name="lastname">
                              <span class="help-inline" id="erroLastname">Insira um sobrenome.</span>
                        </div>
                    </div>
                    <div class="control-group" id="divInitials">
                        <label class="control-label" for="inputInitials"><i class="red">*</i>Iniciais:</label>
                        <div class="controls">
                              <input class="input-xlarge" type="text" id="inputInitials" placeholder="Initials" name="initials">
                              <span class="help-inline" id="erroInitials">Insira as iniciais.</span>
                        </div>
                    </div>                    
                    <div class="control-group">
                        <div class="controls">
                              <span class="help-inline">* Campos Obrigatórios.</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
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
