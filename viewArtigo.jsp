<%-- 
    Document   : viewArtigo
    Created on : 09/06/2013, 02:55:58
    Author     : daniel
--%>

<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    
    <head>
        <title>Artigo</title>
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
            
            <!--Apresentação Artigo com todos os campos e valores multivalorados-->
            <div class="well" style="background-color: #fbfbfb">
                <!--VERIFICA SE ARTIGO FOI ENCONTRADO E EXIBE MENSAGEM OU ARTIGO-->
                <% ArtigoBean artigo = new ArtigoBean();
                   artigo = (ArtigoBean) request.getAttribute("artigo");
                   JournalBean journal = artigo.getJournal();
                   List<AuthorBean> authors = artigo.getAuthors();
                   List<PublicationTypeBean> publications = artigo.getPublicationTypes();
                   List<ChemicalBean> chemicals = artigo.getChemicals();
                   List<KeyWordBean> keys = artigo.getKeys();
                   List<MeshHeadingBean> meshs = artigo.getMeshs();
                           
                    if (artigo.getArticleid() == null) {
                %>
                <h4> Resultado não encontrado. Tente novamente.</h4>
                <% } else {%>   
                <b class="pre-titles">ID:</b><p class="idArtigo"><%=artigo.getArticleid()%></p> 
                <b class="pre-titles">Date:</b><p class="idArtigo"><%=artigo.getArticleDate()%></p>
                <b class="pre-titles">Status:</b><p class="idArtigo"><%=artigo.getPublicationStatus()%></p>
                <br>
                <p class="titleArtigo"><%=artigo.getTitle()%></p>
                <p class="informacoes"><%=artigo.getAffiliation()%></p>
                <b class="pre-titles">Volume:</b><p class="idArtigo"><%=artigo.getVolume()%></p> 
                <b class="pre-titles">Pagination:</b><p class="idArtigo"><%=artigo.getPagination()%></p>
                <b class="pre-titles">Issue:</b><p class="idArtigo"><%=artigo.getIssue()%></p>
                <hr>
                <b class="pre-titles">ISSN:</b><p class="idArtigo"><%=journal.getISSN()%></p>
                <b class="pre-titles">Abrev:</b><p class="idArtigo"><%=journal.getAbreviation()%></p>
                <p class="informacoes"><%=journal.getTitle()%></p>
                <hr>
                <b class="pre-titles">Authors:</b>
                <p class="informacoes">
                    <%        
                    if(authors!=null){
                    AuthorBean author = new AuthorBean();
                    for(int i=0; i<authors.size(); i++) {
                         author = authors.get(i);
                    %>
                    "<%=author.getInitials()%>, <%=author.getForename()%> <%=author.getLastname()%>"
                    <%}
                    } else { %>* <% }
                    %>
                </p>
                <hr>
                <b class="pre-titles">Publication Types:</b>
                <p class="informacoes">
                    <%
                    if(publications!=null){
                    PublicationTypeBean publication = new PublicationTypeBean();
                    for(int i=0; i<publications.size(); i++) {
                         publication = publications.get(i);
                    %>
                    "<%=publication.getTypeName()%>"
                    <%}
                    }else { %>
                      *  
                    <%}
                    %>
                </p>
                <b class="pre-titles">Chemicals:</b>
                <p class="informacoes">
                    <%
                    if(chemicals!=null){
                    ChemicalBean chemical = new ChemicalBean();
                    for(int i=0; i<chemicals.size(); i++) {
                         chemical = chemicals.get(i);
                    %>
                    "<%=chemical.getChemicalName()%>"
                    <%}
                    }else { %>
                      *  
                    <%}
                    %>
                </p>
                <b class="pre-titles">Key Words:</b>
                <p class="informacoes">
                    <%
                    if(keys!=null){
                    KeyWordBean key = new KeyWordBean();
                    for(int i=0; i<keys.size(); i++) {
                         key = keys.get(i);
                    %>
                    "<%=key.getKeyWordName()%>"
                    <%}
                    }else { %>
                      *  
                    <%}
                    %>
                </p>
                <b class="pre-titles">Meshs:</b>
                <p class="informacoes">
                    <%
                    if(meshs!=null){
                    MeshHeadingBean mesh = new MeshHeadingBean();
                    for(int i=0; i<meshs.size(); i++) {
                         mesh = meshs.get(i);
                    %>
                    "<%=mesh.getDescriptionName()%>"
                    <%}
                    }else { %>
                      *  
                    <%}
                    %>
                </p>
                <!--MOSRA BOTOES DE EDICAO E DELECAO CASO SEJA USUARIO LOGADO-->
                <% if (login != null) {%>
                <div class="acoes">
                    <form id ="formDel" method="post" action="RecebeArtigo">
                        <input name="id" type="hidden" value="<%=artigo.getArticleid()%>"/>  
                        <input name="acao" type="hidden" value="deletar"/>
                        <button class="btn btn-danger" type="submit">Deletar</button>
                    </form>
                </div>      
                <%
                        }
                    }
                %>
            </div>

            <hr>
            <footer>
                <p>&copy; Grupo 13</p>
            </footer>

        </div> <!-- /container -->
    </body>
</html>

