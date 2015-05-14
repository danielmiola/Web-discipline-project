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
        <title>Cadastro de Journal</title>
        <%@include file="WEB-INF/jspf/head.jspf"%>
        <script src="js/cadastroJournal.js"></script>
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
            
            <h3>Cadastro de Journal</h3>
            <div class="hero-unit">
                <!--FORMULARIO DE CADASTRO DE USUARIO-->
                <form class="form-horizontal" method="post" action="RecebeJournal" onsubmit="return check();">
                    <div class="control-group" id="divID">
                        <label class="control-label" for="inputID"><i class="red">*</i>ID:</label>
                        <div class="controls">
                            <input class="input-medium" type="text" id="inputID" placeholder="NlmUniqueID" name="ID">
                            <span class="help-inline" id="erroID">Insira um ID.</span>
                        </div>
                    </div>
                    <div class="control-group" id="divISSN">
                        <label class="control-label" for="inputISSN"><i class="red">*</i>ISSN:</label>
                        <div class="controls">
                              <input class="input-medium" type="text" id="inputISSN" placeholder="ISSN" name="ISSN">
                              <span class="help-inline" id="erroISSN">Insira um ISSN.</span>
                        </div>
                    </div>
                    <div class="control-group" id="divTitle">
                        <label class="control-label" for="inputTitle"><i class="red">*</i>Titulo:</label>
                        <div class="controls">
                              <input class="input-xxlarge" type="text" id="inputTitle" placeholder="Titulo" name="title">
                              <span class="help-inline" id="erroTitle">Insira as iniciais.</span>
                        </div>
                    </div>  
                    <div class="control-group" id="divAbreviation">
                        <label class="control-label" for="inputAbreviation">Abreviação:</label>
                        <div class="controls">
                              <input class="input-xxlarge" type="text" id="inputAbreviation" placeholder="Abreviação" name="abreviation">
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
