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
            
            <!--TRATA SE O LOGIN FOI DIGITADO CORRETAMENTE-->
            <%@include file="WEB-INF/jspf/erroLogin.jspf" %>
            
            <h3>Cadastro de Usuários</h3>
            <div class="hero-unit">
                <!--CASO USUARIO CADASTRADO JA EXISTA, EXIBE MENSAGEM....SENAO MOSTRA DADOS CADASTRADOS-->
                <% if (request.getAttribute("Existente").equals("1")) {%>
                <h3>Usuário ja existente!</h3>
                <p>Tente novamente <a href="cadastroUsuario.jsp"><button class="btn btn-primary">Cadastrar</button></a></p>
                <% } if(request.getAttribute("Existente").equals("0")) {
                    UsuarioBean usuario = (UsuarioBean) request.getAttribute("UsuarioBean");
                %>
                <!--FORMULARIO APRESENTAÇÂO DE USUARIO-->
                <form class="form-horizontal">
                    <div class="control-group" id="divName">
                        <label class="control-label" for="inputName"><i class="red">*</i>Nome:</label>
                        <div class="controls">
                            <i><%=usuario.getNome()%></i>
                        </div>
                    </div>
                    <div class="control-group" id="divEmail">
                        <label class="control-label" for="inputEmail"><i class="red">*</i>E-mail:</label>
                        <div class="controls">
                            <i><%=usuario.getEmail()%></i>
                        </div>
                    </div>                    
                </form>
                <p><a href="cadastroUsuario.jsp"><button class="btn btn-primary">Retornar</button></a></p>
                <% }%>
            </div>

            <hr>
            <footer>
                <p>&copy; Grupo 13</p>
            </footer>

        </div> <!-- /container -->
    </body>
</html>
