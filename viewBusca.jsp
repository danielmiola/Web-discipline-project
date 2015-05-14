<%-- 
    Document   : viewArtigo
    Created on : 09/06/2013, 02:55:58
    Author     : daniel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.ArtigoBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    
    <head>
        <title>Resultado da busca</title>
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
            <%
                String busca = (String) request.getAttribute("busca");
                int tipo = Integer.parseInt(request.getAttribute("tipo").toString());
            %>
            <div class="well">
                <form class="busca" method="post" action="RecebeArtigo">
                    <div class="input-append">
                        <br>
                        <input class="input-xxlarge" id="appendedDropdownButtons" type="text" name="parametro" value="<%=busca%>">
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
                                <li><input type="radio" name="tipoBusca" value="1" <% if (tipo == 1) {%> checked <%}%> >Title</li>
                                <li><input type="radio" name="tipoBusca" value="2" <% if (tipo == 2) {%> checked <%}%>>Mesh Terms</li>
                                <li><input type="radio" name="tipoBusca" value="3" <% if (tipo == 3) {%> checked <%}%>>Keywords</li>
                            </ul>
                        </div>
                    </div>
                </form>
            </div>

            <!--CASO NENHUM RESULTADO SEJA OBTIDO EXIBE MENSAGEM, SENAO GERA DIVS COM ID, DATA E TITULO DOS ARTIGOS BUSCADOS-->
            <%
                int nPaginas = Integer.parseInt(request.getAttribute("nPaginas").toString());
                nPaginas++;
                int pagina = Integer.parseInt(request.getAttribute("pagina").toString());
                pagina++;
                List<ArtigoBean> artigos = new ArrayList<ArtigoBean>();
                artigos = (List<ArtigoBean>) request.getAttribute("listArtigos");

                if (artigos.isEmpty()) {
            %>
            <h4> Resultados não encontrados. Tente novamente.</h4>
            <% } else {
            %><div class="pagination" style="text-align: center"><ul>
                    <%
                        if(pagina!=1){ 
                    %>
                    <li><a href="http://localhost:8080/Projeto2/RecebeArtigo?action=busca&parametro=<%=busca%>&tipo=<%=tipo%>&pagina=<%=(pagina-2)%>"><<</a></li>
                        <% }
                            for (int i = 1; ( (i <nPaginas) && (i <= 12)); i++) {
                                if (pagina == i ) {
                        %>
                    <li><a style="background-color: #f5f5f5"><%=i%></a></li>
                        <%
                        } else {
                        %>
                    <li><a href="http://localhost:8080/Projeto2/RecebeArtigo?action=busca&parametro=<%=busca%>&tipo=<%=tipo%>&pagina=<%=(i-1)%>"><%=i%></a></li>
                        <%
                                }
                            }
                            if ( (pagina!=12)&&(pagina!=(nPaginas-1))){
                        %>
                    <li><a href="http://localhost:8080/Projeto2/RecebeArtigo?action=busca&parametro=<%=busca%>&tipo=<%=tipo%>&pagina=<%=pagina%>">>></a></li><% } %>
                </ul>
                <%if(nPaginas>=12){%>
                <p class="refine">*Caso não encontre o desejado em 12 paginas refine sua busca.</p><%}%>
            </div><% 
                            for (Iterator iterator = artigos.iterator(); iterator.hasNext();) {
                                ArtigoBean artigo = (ArtigoBean) iterator.next();
                    %> 
            <div class="well well-small" onclick="direciona(<%=artigo.getArticleid()%>)"> 
                <b class="pre-titles">ID:</b><p class="idArtigo"><%=artigo.getArticleid()%></p> 
                <b class="pre-titles">Date:</b><p class="idArtigo"><%=artigo.getArticleDate()%></p>
                <br>
                <p class="titleArtigo"><%=artigo.getTitle()%></p>
                <p class="informacoes"><%=artigo.getAffiliation()%></p>
                <p class="informacoes"></p>

                <!--MOSTRA BOTOES DE EDIÇÂO E DELEÇÂO CASO SEJA USUARIO LOGADO -->
                <% if (login != null) {%>
                <div class="acoes">
                    <form id ="formDel" method="post" action="RecebeArtigo">
                        <input name="id" type="hidden" value="<%=artigo.getArticleid()%>"/>  
                        <input name="acao" type="hidden" value="deletar"/>
                        <button class="btn btn-danger" type="submit">Deletar</button>
                    </form>
                </div>
                <%}%>        
            </div>
            <%
                }
            %>
            <div class="pagination" style="text-align: center"><ul>
                    <%
                        if(pagina!=1){ 
                    %>
                    <li><a href="http://localhost:8080/Projeto2/RecebeArtigo?action=busca&parametro=<%=busca%>&tipo=<%=tipo%>&pagina=<%=(pagina-2)%>"><<</a></li>
                        <% }
                            for (int i = 1; ( (i <nPaginas) && (i <= 12)); i++) {
                                if (pagina == i ) {
                        %>
                    <li><a style="background-color: #f5f5f5"><%=i%></a></li>
                        <%
                        } else {
                        %>
                    <li><a href="http://localhost:8080/Projeto2/RecebeArtigo?action=busca&parametro=<%=busca%>&tipo=<%=tipo%>&pagina=<%=(i-1)%>"><%=i%></a></li>
                        <%
                                }
                            }
                            if ( (pagina!=12)&&(pagina!=(nPaginas-1))){
                        %>
                    <li><a href="http://localhost:8080/Projeto2/RecebeArtigo?action=busca&parametro=<%=busca%>&tipo=<%=tipo%>&pagina=<%=pagina%>">>></a></li><% } %>
                </ul>
                <%if( nPaginas>=12){%>
                <p class="refine">*Caso não encontre o desejado em 12 paginas refine sua busca.</p><%}%>
            </div>
                    <%
                        }
                    %> 
            <hr>
            <footer>
                <p>&copy; Grupo 13</p>
            </footer>

        </div> <!-- /container -->
        
        <script type="text/javascript">
                function direciona(x) {
                    var s = "http://localhost:8080/Projeto2/RecebeArtigo?action=exibe&id=" + x;
                    window.location.href = s;
                }
        </script>
    </body>
</html>

