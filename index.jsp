<%-- 
    Document   : index
    Created on : 28/05/2013, 22:19:26
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    
    <head>        
        <title>PubMed Artigos</title>
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
            
            <!--FORMULARIO BUSCA-->
            <div class="hero-unit">
                <h2>Artigos Científicos PubMed</h2>
                <p class="apres">O National Center for
                    Biotechnology Information (NCBI) provê informações sobre genes e
                    sequências de proteínas, literaturas científicas, estruturas moleculares,
                    dentre outros recursos relacionados à área de biomedicina. No portal do
                    NCBI, existe a base de dados chamada PubMed que guarda atualmente
                    cerca de 22 milhões de artigos científicos em inglês.
                </p>
                
                <form class="busca" method="post" action="RecebeArtigo">
                    <div class="input-append">
                        <input class="input-xxlarge" id="appendedDropdownButtons" type="text" name="parametro">
                        <input type="hidden" value="buscar" name="acao">
                        <input type="hidden" value="0" name="pagina">
                        <button class="btn" type="submit"><b class="icon-search"></b> <strong>Busca</strong></button>
                        <div class="btn-group">
                            <button class="btn dropdown-toggle" data-toggle="dropdown">
                                Avançada
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" id="dropBusca">
                                <li><b>Tipo da Busca</b></li>
                                <li><input type="radio" name="tipoBusca" value="1" checked>Title</li>
                                <li><input type="radio" name="tipoBusca" value="2">Mesh Terms</li>
                                <li><input type="radio" name="tipoBusca" value="3">Keywords</li>
                            </ul>
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
