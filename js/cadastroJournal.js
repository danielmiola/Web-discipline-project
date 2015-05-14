	var submit = false;

$(document).ready(function(){
	//esconde as msgs de erro
	$("#erroID").fadeOut(0);
	$("#erroISSN").fadeOut(0);
	$("#erroTitle").fadeOut(0);
	var filtro = /^(([a-zA-Z0-9_\.\-])(\s)*)+$/;

	//verificação de id
	$("#inputID").focusout(function(){
		if ($("#inputID").val().match(filtro) === null) {
			$("#erroID").fadeIn("slow");
			$("#divID").addClass("error");
                        submit=false;
		} else {
			$("#erroID").fadeOut("slow");
			$("#divID").removeClass("error");
			$("#divID").addClass("success");
                        submit=true;
		}
	});

	//verificação de issn
	$("#inputISSN").focusout(function(){
		if ($("#inputISSN").val().match(filtro) === null) {
			$("#erroISSN").fadeIn("slow");
			$("#divISSN").addClass("error");
                        submit=false;
		} else {
			$("#erroISSN").fadeOut("slow");
			$("#divISSN").removeClass("error");
			$("#divISSN").addClass("success");
                        submit=true;
		}
	});

	//verificacao da titulo
	$("#inputTitle").focusout(function() {
		if ($("#inputTitle").val().match(filtro) === null) {
			//msg erro
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

	
});
function check(){
            if (submit){
                return true;
            }
            alert("Ainda há campos não preenchidos corretamente");
            return false;   
        };
