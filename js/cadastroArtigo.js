var submit = false;
var submitmesh = false;
var submitkey = false;
var submitchemical = false;
var submitP = false;

var submitAN = false;
var submitLN = false;
var submitInit = false;

$(document).ready(function(){

	
	//esconde as msgs de erro
	$("#erroTitle").fadeOut(0);
	$("#erroID").fadeOut(0);
	$("#erroJournal").fadeOut(0);
	$("#erroStatus").fadeOut(0);
        
        $("#erroCMesh").fadeOut(0);
        $("#erroPKey").fadeOut(0);
        $("#erroPChemical").fadeOut(0);
        $("#erroPPublicationType").fadeOut(0);
        $("#erroPNome").fadeOut(0);
        $("#erroPSobrenome").fadeOut(0);
        $("#erroPInic").fadeOut(0);



	
	var filtroVazio	= /^[a-zA-Z0-9]/;
        var filtroLetra =/^[a-zA-Z]/;
        var filtroNum = /^[0-9]/;
        
        $("#inputNameM").focusout(function(){
            if ($("#inputNameM").val().match(filtroLetra) === null) {
			$("#erroCMesh").fadeIn("slow");
                        submitmesh=false;
		} else {
			$("#erroCMesh").fadeOut("slow");
                        submitmesh=true;
                }
        });
        
        $("#inputKeywordName").focusout(function(){
            if ($("#inputKeywordName").val().match(filtroLetra) === null) {
			$("#erroPKey").fadeIn("slow");
                        submitkey=false;
		} else {
			$("#erroPKey").fadeOut("slow");
                        submitkey=true;
                }
        });
        
        $("#inputChemicalName").focusout(function(){
            if ($("#inputChemicalName").val().match(filtroVazio) === null) {
			$("#erroPChemical").fadeIn("slow");
                        submitchemical=false;
		} else {
			$("#erroPChemical").fadeOut("slow");
                        submitchemical=true;
                }
        });
        
       $("#inputTypeName").focusout(function(){
            if ($("#inputTypeName").val().match(filtroVazio) === null) {
			$("#erroPPublicationType").fadeIn("slow");
                        submitP=false;
		} else {
			$("#erroPPublicationType").fadeOut("slow");
                        submitP=true;
                }
        });
        
        $("#inputForeName").focusout(function(){
            if ($("#inputForeName").val().match(filtroLetra) === null) {
			$("#erroPNome").fadeIn("slow");
                        submitAN=false;
		} else {
			$("#erroPNome").fadeOut("slow");
                        submitAN=true;
                }
        });
        $("#inputLastName").focusout(function(){
            if ($("#inputLastName").val().match(filtroLetra) === null) {
			$("#erroPSobrenome").fadeIn("slow");
                        submitLN=false;
		} else {
			$("#erroPSobrenome").fadeOut("slow");
                        submitLN=true;
                }
        });
        $("#inputInitials").focusout(function(){
            if ($("#inputInitials").val().match(filtroLetra) === null) {
			$("#erroPInic").fadeIn("slow");
                        submitInit=false;
		} else {
			$("#erroPInic").fadeOut("slow");
                        submitInit=true;
                }
        });
       
	//verificação de title
	$("#inputTitle").focusout(function(){
		if ($("#inputTitle").val().match(filtroVazio) === null) {
			$("#erroTitle").fadeIn("slow");
			$("#divTitle").addClass("error");
                        submit=false;
		} else {
			$("#erroTitle").fadeOut("slow");
			$("#divTitle").removeClass("error");
			$("#divTitle").addClass("success");
                        submit=true;
                }
	});

	//verificação de ID
	$("#inputID").focusout(function(){
		if ($("#inputID").val().match(filtroNum) === null) {
			$("#erroID").fadeIn("slow");
			$("#divID").addClass("error");
                        submit = false;
		} else {
			$("#erroID").fadeOut("slow");
			$("#divID").removeClass("error");
			$("#divID").addClass("success");
                        submit=true;
		}
	});

	//verificacao da Journal
	$("#inputJournal").focusout(function() {
		if ($("#inputJournal").val().match(filtroVazio) === null) {
			//msg erro
			$("#erroJournal").fadeIn("slow");
			$("#divJournal").addClass("error");
                        submit = false;
		} else {
			$("#erroJournal").fadeOut("slow");
			$("#divJournal").removeClass("error");
			$("#divJournal").addClass("success");
                        submit = true;
		}
	});

	//verificacao da Status
	$("#inputStatus").focusout(function() {
		if ($("#inputStatus").val().match(filtroVazio) === null) {
			//msg erro
			$("#erroStatus").fadeIn("slow");
			$("#divStatus").addClass("error");
                        submit = false;
		} else {
			$("#erroStatus").fadeOut("slow");
			$("#divStatus").removeClass("error");
			$("#divStatus").addClass("success");
                        submit = true;
		}
	});
        
        //WEB-INF/jspf/erroLogin.jspf
        
    $("#inputJournal").autocomplete({source: "gets/getdata.jsp",minLength: 2});
    $("#inputMeshHead1").autocomplete({source:"gets/getMesh.jsp",minLength:2});
    $("#inputKeyword1").autocomplete({source:"gets/getkey.jsp",minLength:2});
    $("#inputChemical1").autocomplete({source:"gets/getChe.jsp",minLength:2});
    $("#inputPublicationType1").autocomplete({source:"gets/getPb.jsp",minLength:2});
    $("#inputAuthor1").autocomplete({source:"gets/getAut.jsp",minLength:2});

    $("#dialog").dialog({ autoOpen: false });
    $("#dialogM").dialog({ autoOpen: false });
    $("#dialogK").dialog({ autoOpen: false });
    $("#dialogC").dialog({ autoOpen: false });
    $("#dialogP").dialog({ autoOpen: false });
    $("#dialogA").dialog({ autoOpen: false });
   
    
    
});
function checkArtigo(){
            if (submit){
                return true;
            }
            alert("Ainda há campos não preenchidos corretamente!");
            return false;   
};
function checkMesh(){
            if (submitmesh){
                return true;
            }
            alert("Ainda há campos não preenchidos corretamente!");
            return false;   
};
function checkKey(){
            if (submitkey){
                return true;
            }
            alert("Ainda há campos não preenchidos corretamente!");
            return false;   
};
function checkChemical(){
            if (submitchemical){
                return true;
            }
            alert("Ainda há campos não preenchidos corretamente!");
            return false;   
};
function checkPub(){
            if (submitP){
                return true;
            }
            alert("Ainda há campos não preenchidos corretamente!");
            return false;   
};

function checkAut(){
            if (submitAN && submitLN && submitInit){
                return true;
            }
            alert("Ainda há campos não preenchidos corretamente!");
            return false;   
};
 function addjournal(){
             $("#dialog").dialog( "open");
             $("#dialog").css('opacity','1');
             $("#dialog").css('background','rgb(236, 190, 190)');
             $("#dialog").dialog({ position: { my: "left top", at: "left bottom", of: button } });
 };
 
 function autoMesh(){
     
            var value = $('#checkMesh').data('value');
            if(value < 5){
                value = value+1;
                $('#checkMesh').data('value',value);
           
                console.log(value);
                $('<input>') // Cria um elemento input
                .attr({ name: 'MeshHead'+value, id: "inputMeshHead"+value, placeholder: "MeshHead "+value})// Definindo atributos
                .addClass('input-xlager')
                .appendTo('#inputMesh')
                .css('margin','2px')
                .autocomplete({source: "gets/getMesh.jsp",minLength: 2}); // Adiciona ele ao elemento div com o id myDiv
                
            }else{
                alert('Número de Assuntos relacionados exedido');
            }
            
 };
 function addMesh(){
             $("#dialogM").dialog( "open");
             $("#dialogM").css('opacity','1');
             $("#dialogM").css('background','rgb(236, 190, 190)');
             $("#dialogM").dialog({ position: { my: "left top", at: "left bottom", of: button } });
 };
  function autoKey(){
     
            var value = $('#checkKey').data('value');
            if(value < 5){
                value = value+1;
                $('#checkKey').data('value',value);
           
                console.log(value);
                $('<input>') // Cria um elemento input
                .attr({ name: 'Keyword'+value, id: "inputKeyword"+value,placeholder:"Palavra-chave "+value})// Definindo atributos
                .addClass('input-xlager')
                .appendTo('#inputKeyword')
                .css('margin','2px')
                .autocomplete({source: "gets/getkey.jsp",minLength: 2}); // Adiciona ele ao elemento div com o id myDiv
                
            }else{
                alert('Número de Palavras-Chave relacionados exedido');
            }
            
 };
 function addKey(){
             $("#dialogK").dialog( "open");
             $("#dialogK").css('opacity','1');
             $("#dialogK").css('background','rgb(236, 190, 190)');
             $("#dialogK").dialog({ position: { my: "left top", at: "left bottom", of: button } });
 };
 
 function autoChemical(){
     
            var value = $('#checkChemical').data('value');
            if (value < 5) {
                value = value+1;
                $('#checkChemical').data('value',value);
           
                console.log(value);
                $('<input>') // Cria um elemento input
                .attr({ name: 'Chemical'+value, id: "inputChemical"+value,placeholder:"Químico "+value})// Definindo atributos
                .addClass('input-xlager')
                .appendTo('#inputChemical')
                .css('margin','2px')
                .autocomplete({source: "gets/getChe.jsp",minLength: 2}); 
                
            }else{
                alert('Número de Químicos relacionados exedido');
            }
            
 };
 function addChemical(){
             $("#dialogC").dialog( "open");
             $("#dialogC").css('opacity','1');
             $("#dialogC").css('background','rgb(236, 190, 190)');
             $("#dialogC").dialog({ position: { my: "left top", at: "left bottom", of: button } });
 };
   function autoPublication(){
            var value = $('#checkPublicationType').data('value');
            if (value < 5) {
                value = value+1;
                $('#checkPublicationType').data('value',value);
           
                console.log(value);
                $('<input>') // Cria um elemento input
                .attr({ name: 'PublicationType'+value, id: "inputPublicationType"+value, placeholder:"Tipo de Publicação "+value})// Definindo atributos
                .addClass('input-xlager')
                .appendTo('#inputPublicationType')
                .css('margin','2px')
                .autocomplete({source: "gets/getPb.jsp",minLength: 2}); // Adiciona ele ao elemento div com o id myDiv
            }else{
                alert('Número de Tipos de Publicação exedido');
            }
            
 };
 

  function addPublication(){
             $("#dialogP").dialog( "open");
             $("#dialogP").css('opacity','1');
             $("#dialogP").css('background','rgb(236, 190, 190)');
             $("#dialogP").dialog({ position: { my: "left top", at: "left bottom", of: button } });
 };
 
  function autoAuthor(){
            var value = $('#checkAuthor').data('value');
            if (value < 5) {
                value = value+1;
                $('#checkAuthor').data('value',value);
           
                console.log(value);
                $('<input>') // Cria um elemento input
                .attr({ name: 'Author'+value, id: "inputAuthor"+value, placeholder:"Autor "+value})// Definindo atributos
                .addClass('input-xlager')
                .appendTo('#inputAuthor')
                .css('margin','2px')
                .autocomplete({source: "gets/getAut.jsp",minLength: 2}); // Adiciona ele ao elemento div com o id myDiv
            }else{
                alert('Número de Autores exedido');
            }   
 };
 function addAuthor(){
             $("#dialogA").dialog( "open");
             $("#dialogA").css('opacity','1');
             $("#dialogA").css('background','rgb(236, 190, 190)');
             $("#dialogA").dialog({ position: { my: "left top", at: "left bottom", of: button } });
 };






        


