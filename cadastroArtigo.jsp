<%-- 
    Document   : cadastroArtigo
    Created on : 28/05/2013, 22:21:11
    Author     : daniel
--%>

<%@page import = "model.UsuarioBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <!--<script src="js/vendor/jquery-1.9.1.min.js"></script> -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Cadastro de Artigo</title>

        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script> 
        <script src="js/cadastroArtigo.js"></script>



        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.css">

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>
        <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script>

        </script>
    </head>
    <%//recupera a sessao
        HttpSession s = request.getSession(false);
        UsuarioBean login = null;
        if (s != null) {
            login = (UsuarioBean) s.getAttribute("Usuario");
        }
    %>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- This code is taken from http://twitter.github.com/bootstrap/examples/hero.html -->

        <!-- DIV DA BARRA DE NAVEGAÇÃO SUPERIOR -->
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li><a href="index.jsp">Página Principal</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Avançado <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="cadastroUsuario.jsp">Cadastrar usuário</a></li>
                                    <li><a href="cadastroArtigo.jsp">Cadastrar artigos</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!--FORMULARIO DE LOGIN DE USUARIO-->
                        <form class="navbar-form pull-right" method="post" action="ValidaLogin">
                            <% if (login != null) {%>
                            <div class="login"> Bem Vindo <%= login.getEmail()%> </div>
                            <input type="hidden" value="logout" name="tipo"/>                                
                            <button type="submit" class="btn">Sair <b class="icon-remove"></b></button>
                                <% } else {%>
                            <input class="span2" type="text" placeholder="Email" name="email">
                            <input class="span2" type="password" placeholder="Senha" name="senha">
                            <input type="hidden" value="login" name="tipo">
                            <button type="submit" class="btn">Entrar <b class="icon-user"></b></button>
                                <%}%>
                        </form>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <!--DIV PRINCIPAL DA PAGINA-->
        <div class="container">
            <h3>Cadastro de Artigos</h3>
            <div class="hero-unit">
                <!--FORMULARIO DE CADASTRO DE ARTIGOS-->

                <form class="form-horizontal" onsubmit="return checkArtigo();" method="post" action="RecebeArtigo">
                    <!-- Inserindo ID -->
                    <div class="control-group">
                        <div class="controls">
                            <span class="help-inline">* Campos Obrigatórios.</span>
                        </div>
                    </div>

                    <!--ID-->
                    <div class="control-group" id="divID">
                        <label class="control-label" for="inputID"><i class="red">*</i>ID:</label>
                        <div class="controls">
                            <input class="input-large" type="text" id="inputID" placeholder="Número ID do artigo" name="id">
                            <span class="help-inline" id="erroID">Insira um ID(Apenas números).</span>
                        </div>
                    </div>

                    <!--TITLE-->
                    <div class="control-group" id="divTitle">
                        <label class="control-label" for="inputTitle"><i class="red">*</i>Title:</label>
                        <div class="controls">
                            <input class="input-xxlarge" type="text" id="inputTitle" placeholder="Título do artigo" name="title">
                            <span class="help-inline" id="erroTitle">Insira um título.</span>
                        </div>
                    </div>

                    <!--INPUT JOURNAL -->
                    <div class="control-group" >
                        <label class="control-label" for="inputJournal"><i class="red">*</i>Journal:</label>
                        <div class="controls" >             
                            <input class="input-xlarge" id="inputJournal" placeholder="Journal" name="journal">
                            <span class="help-inline" id="erroJournal">Insira um Journal.</span>
                            <div id="checkjournal" data-value="1" style="visibility: hidden" ></div>
                        </div>
                    </div>

                    <!--PUBLICATION STATUS-->
                    <div class="control-group" id="divStatus">
                        <label class="control-label" for="inputStatus"><i class="red">*</i>Publication Status:</label>
                        <div class="controls">
                            <select name="publicationStatus">
                                <option value="epublish">epublish</option>
                                <option value="ppublish">ppublish</option>
                                <option value="aheadofprint">aheadofprint</option>
                            </select>
                        </div>
                    </div>

                    <!--PAGNATION-->
                    <div class="control-group">
                        <label class="control-label" for="inputPagination">Pagination:</label>
                        <div class="controls">
                            <input class="input-xlarge" type="text" id="inputPagination" placeholder="Número das páginas" name="pagination">
                        </div>
                    </div>

                    <!--VOLUME-->
                    <div class="control-group">
                        <label class="control-label" for="inputVolume">Volume:</label>
                        <div class="controls">
                            <input class="input-xlarge" type="text" id="inputVolume" placeholder="Volume" name="volume">
                        </div>
                    </div>

                    <!--DATe-->
                    <div class="control-group">
                        <label class="control-label" for="inputData">Date:</label>
                        <div class="controls">
                            <input type="date" id="inputDate" name="date">
                        </div>
                    </div>

                    <!--AFILIATION-->
                    <div class="control-group">
                        <label class="control-label" for="inputAffiliation">Afiliation:</label>
                        <div class="controls">
                            <input class="input-xlarge" type="text" id="inputAffiliation" placeholder="Afiliação" name="affiliation">
                        </div>
                    </div>

                    <!--ISSUE-->
                    <div class="control-group">
                        <label class="control-label" for="inputIssue">Issue:</label>
                        <div class="controls">
                            <input class="input-xlarge" type="text" id="inputIssue" placeholder="Issue" name="issue">
                        </div>
                    </div>

                    <hr>

                    <!-- INPUT DE AUTHOR -->
                    <div class="control-group" >
                        <label class="control-label" for="inputAuthor"><i class="red">*</i>Autor:</label>
                        <div class="controls" >             
                            <input class="input-xlarge" id="inputAuthor1" placeholder="Autor" name="Author1">
                            <span class="help-inline" id="erroAuthor">Insira um Autor.</span>
                            <div id ="inputAuthor">
                                <!-- aqui vão ser inseridos os campos de novos keyword -->
                            </div>        
                            <div id="checkAuthor" data-value="1" style="visibility: hidden" ></div>
                            <button type="button" onclick="autoAuthor();">Adicionar outro Autor neste Artigo</button>
                            <button type="button" onclick="addAuthor();">Adicionar um Autor no sistema </button>
                        </div>
                    </div>

                    <hr>

                    <!-- INPUT DE MESHHEAD -->
                    <div class="control-group" >
                        <label class="control-label" for="inputMeshHead"><i class="red">*</i>MeshHead:</label>
                        <div class="controls" >             
                            <input class="input-xlarge" id="inputMeshHead1" placeholder="MeshHead" name="MeshHead1">
                            <span class="help-inline" id="erroMeshHead">Insira um MeshHead.</span>
                            <div id ="inputMesh">
                                <!-- aqui vão ser inseridos os campos de novos Mesh -->
                            </div>        
                            <div id="checkMesh" data-value="1" style="visibility: hidden" ></div>
                            <button type="button" onclick="autoMesh();">Adicionar outro MeshHead neste Artigo</button>
                            <button type="button" onclick="addMesh();">Adicionar um MeshHead no sistema </button>
                        </div>
                    </div>

                    <hr>

                    <!-- INPUT DE CHEMICAL -->
                    <div class="control-group" >
                        <label class="control-label" for="inputChemical"><i class="red">*</i>Químico:</label>
                        <div class="controls" >             
                            <input class="input-xlarge" id="inputChemical1" placeholder="Químico" name="Chemical1">
                            <span class="help-inline" id="erroChemical">Insira um químico.</span>
                            <div id ="inputChemical">
                                <!-- aqui vão ser inseridos os campos de novos keyword -->
                            </div>        
                            <div id="checkChemical" data-value="1" style="visibility: hidden" ></div>
                            <button type="button" onclick="autoChemical();">Adicionar outro químico neste Artigo</button>
                            <button type="button" onclick="addChemical();">Adicionar um químico no sistema </button>
                        </div>
                    </div>

                    <hr>

                    <!-- INPUT DE KEYWORD -->
                    <div class="control-group" >
                        <label class="control-label" for="inputKeyword"><i class="red">*</i>Palavra-Chave:</label>
                        <div class="controls" >             
                            <input class="input-xlarge" id="inputKeyword1" placeholder="Palavra-chave" name="Keyword1">
                            <span class="help-inline" id="erroKeyword">Insira uma palavra-chave.</span>
                            <div id ="inputKeyword">
                                <!-- aqui vão ser inseridos os campos de novos keyword -->
                            </div>        
                            <div id="checkKey" data-value="1" style="visibility: hidden" ></div>
                            <button type="button" onclick="autoKey();">Adicionar outra palavra-chave neste Artigo</button>
                            <button type="button" onclick="addKey();">Adicionar uma palavra-chave no sistema </button>
                        </div>
                    </div>

                    <hr>                  

                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn btn-primary">Cadastrar</button>
                        </div>
                    </div>
                </form>

                <!-- POP UP DE CADASTRO DE MASHHEAD-->
                <div id="dialogM" title="Novo MeshHead">   
                    <h6>Todos os campos são obrigatórios</h6>
                    <form class="form-horizontal" onsubmit="return checkMesh();" method="post" action="RecebeMesh">
                        <div id="mesh"> 
                            <input class="input-xlarge" type ="text"id="inputNameM" placeholder="Nome do Assunto" name="meshname">
                            <span class="help-inline" id="erroCMesh">Insira um MeshHead - Apenas Letras.</span>
                            <div class="control-group"  style ="margin:10px;float:right;">
                                <div class="controls">
                                    <button type="submit" class="btn btn-primary">Cadastrar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- POP UP DE CADASTRO DE MASHHEAD
                <div id="dialog" title="Novo Journal">  
                  <h6>Todos os campos são obrigatórios</h6>
                  <form class="form-horizontal" onsubmit="//checkArtigo();" method="post" action="RecebeJournal">
                       <input class="input-xlarge" type ="text"id="inputISSN" placeholder="ISSN" >
                       <span class="help-inline" id="erroJournal">Insira um ISSN.</span>
                       <input class="input-xlarge" type ="text"id="inputTitle" placeholder="Título" >
                       <span class="help-inline" id="erroJournal">Insira um Título.</span>
                        <input class="input-xlarge" type ="text"id="inputTitle" placeholder="Descrição" >
                       <span class="help-inline" id="erroJournal">Insira uma descrição.</span>
                       <span class="help-inline" id="erroID">Insira um ID no Artigo.</span>
                        <div class="control-group">
                              <div class="controls">
                                  <button type="submit" class="btn btn-primary">Cadastrar</button>
                              </div>
                        </div>                             
                </div>-->

                <!-- POP UP DE CADASTRO DE KEYWORD-->
                <div id="dialogK" title="Nova Palavra-Chave">  
                    <h6>Todos os campos são obrigatórios</h6>
                    <form class="form-horizontal" onsubmit="return checkKey();" method="post" action="RecebeKey">
                        <input class="input-xlarge" type ="text" id="inputKeywordName" name="keywordname" placeholder="Nova Palavra-Chave" >
                        <span class="help-inline" id="erroPKey">Insira uma Palavra-Chave.</span> 

                        <div class="control-group" style ="margin:10px;float:right;">
                            <div class="controls">
                                <button type="submit" class="btn btn-primary">Cadastrar</button>
                            </div>
                        </div> 
                    </form>
                </div>
                <!-- POP UP DE CADASTRO DE QUÍMICO-->
                <div id="dialogC" title="Novo Químico">  
                    <h6>Todos os campos são obrigatórios</h6>
                    <form class="form-horizontal" onsubmit="return checkChemical();" method="post" action="RecebeChemical">
                        <input class="input-xlarge" type ="text" id="inputChemicalName" name="chemicalname" placeholder="Químico" >
                        <span class="help-inline" id="erroPChemical">Insira um Químico.</span> 

                        <div class="control-group"  style ="margin:10px;float:right;">
                            <div class="controls">
                                <button type="submit" class="btn btn-primary">Cadastrar</button>
                            </div>
                        </div>   
                    </form>
                </div>
                <!-- POP UP DE CADASTRO DE TIPO DE PUBICAÇÃO-->
                <div id="dialogP" title="Novo Tipo de Publicação">  
                    <h6>Todos os campos são obrigatórios</h6>
                    <form class="form-horizontal" onsubmit="return checkPub();" method="post" action="RecebePublication">
                        <input class="input-xlarge" type ="text" id="inputTypeName" name ="typename" placeholder="Tipo de Publicação" >
                        <span class="help-inline" id="erroPPublicationType">Insira um Tipo de Publicação.</span> 
                        <div class="control-group" style ="margin:10px;float:right;">
                            <div class="controls">
                                <button type="submit" class="btn btn-primary">Cadastrar</button>
                            </div>
                        </div>  
                    </form>
                </div>
                <!-- POP UP DE CADASTRO DE Autor-->
                <div id="dialogA" title="Novo Autor">  
                    <h6>Todos os campos são obrigatórios</h6>
                    <form class="form-horizontal" onsubmit="return checkAut();" method="post" action="RecebeAuthor">
                        <input class="input-xlarge" type ="text" id="inputForeName" placeholder="Primeiro Nome" name="forename" >
                        <span class="help-inline" id="erroPNome">Insira um Nome.</span> 
                        <input class="input-xlarge" type ="text" id="inputLastName" placeholder="Sobrenome" name="lastname">
                        <span class="help-inline" id="erroPSobrenome">Insira um Sobrenome.</span> 
                        <input class="input-xlarge" type ="text" id="inputInitials" placeholder="Initials" name="initials">
                        <span class="help-inline" id="erroPInic">Insira as Iniciais.</span> 
                        <div class="control-group" style ="margin:10px;float:right;">
                            <div class="controls">
                                <button type="submit" class="btn btn-primary">Cadastrar</button>
                            </div>
                        </div>  
                    </form>
                </div>
            </div>

            <hr>

            <footer>
                <p>&copy; Grupo 13</p>
            </footer>

        </div> 
    </body>

</html>