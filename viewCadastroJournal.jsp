<%-- 
    Document   : cadastroUsuario
    Created on : 28/05/2013, 22:21:46
    Author     : daniel
--%>

<%@page import="model.JournalBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    
    <head>
        <title>Cadastro de Journal</title>
        <%@include file="WEB-INF/jspf/head.jspf"%>
    </head>
    
    <!--RECUPERA SESSAO DO USUARIO-->
    <%@include file="WEB-INF/jspf/session.jspf"%>
    
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- DIV DA BARRA DE NAVEGAÇÃO SUPERIOR -->
        <%@include file="WEB-INF/jspf/nav.jspf"%>
        
        <div class="container">
            <h3>Cadastro de Journal</h3>
            <div class="hero-unit">
                <!--CASO USUARIO CADASTRADO JA EXISTA, EXIBE MENSAGEM....SENAO MOSTRA DADOS CADASTRADOS-->
                <% if (request.getAttribute("Existente").equals("1")) {%>
                <h3>Journal ja existente!</h3>
                <p>Tente novamente <a href="cadastroJournal.jsp"><button class="btn btn-primary">Cadastrar</button></a></p>
                <% } if(request.getAttribute("Existente").equals("0")) {
                    JournalBean journal = (JournalBean) request.getAttribute("JournalBean");
                %>
                <!--FORMULARIO APRESENTAÇÂO DE USUARIO-->
                <form class="form-horizontal">
                    <div class="control-group" id="divID">
                        <label class="control-label"><i class="red">*</i>ID:</label>
                        <div class="controls">
                            <i><%=journal.getNlmUniqueID()%></i>
                        </div>
                    </div>
                    <div class="control-group" id="divISSN">
                        <label class="control-label"><i class="red">*</i>ISSN:</label>
                        <div class="controls">
                            <i><%=journal.getISSN()%></i>
                        </div>
                    </div>
                        <div class="control-group" id="divTitle">
                        <label class="control-label"><i class="red">*</i>Title:</label>
                        <div class="controls">
                            <i><%=journal.getTitle()%></i>
                        </div>
                    </div>
                    <div class="control-group" id="divAbreviation">
                        <label class="control-label"><i class="red">*</i>Abreviation:</label>
                        <div class="controls">
                            <i><%=journal.getAbreviation()%></i>
                        </div>
                    </div>
                </form>
                <p><a href="cadastroJournal.jsp"><button class="btn btn-primary">Retornar</button></a></p>
                <% }%>
            </div>

            <hr>
            <footer>
                <p>&copy; Grupo 13</p>
            </footer>

        </div> <!-- /container -->
    </body>
</html>
