	var submit = false;

$(document).ready(function(){
	//esconde as msgs de erro
	$("#erroNome").fadeOut(0);
	$("#erroEmailc").fadeOut(0);
	$("#erroSenhac").fadeOut(0);
	$("#erroConfSenha").fadeOut(0);
	var filtroNome 	= /^(([a-zA-Z])(\s)*)+$/;
	var filtroEmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var filtroSenha = /^[a-zA-Z0-9]{6,12}$/;

	//verificação de nome
	$("#inputName").focusout(function(){
		if ($("#inputName").val().match(filtroNome) === null) {
			$("#erroNome").fadeIn("slow");
			$("#divName").addClass("error");
                        submit=false;
		} else {
			$("#erroNome").fadeOut("slow");
			$("#divName").removeClass("error");
			$("#divName").addClass("success");
                        submit=true;
		}
	});

	//verificação de e-mail
	$("#inputEmailc").focusout(function(){
		if ($("#inputEmailc").val().match(filtroEmail) === null) {
			$("#erroEmailc").fadeIn("slow");
			$("#divEmailc").addClass("error");
                        submit=false;
		} else {
			$("#erroEmailc").fadeOut("slow");
			$("#divEmailc").removeClass("error");
			$("#divEmailc").addClass("success");
                        submit=true;
		}
	});

	//verificacao da senha
	$("#inputSenhac").focusout(function() {
		if ($("#inputSenhac").val().match(filtroSenha) === null) {
			//msg erro
			$("#erroSenhac").fadeIn("slow");
			$("#divSenhac").addClass("error");
                        submit=false;
		} else {
			$("#erroSenhac").fadeOut("slow");
			$("#divSenhac").removeClass("error");
			$("#divSenhac").addClass("success");
                        submit=true;
		}
	});

	//verificacao da senha
	$("#inputConfSenha").keyup(function() {
		if ($("#inputConfSenha").val().match($("#inputSenha").val()) === null) {
			//msg erro
			$("#erroConfSenha").fadeIn("slow");
			$("#divConfSenha").addClass("error");
                        submit=false;
		} else {
			$("#erroConfSenha").fadeOut("slow");
			$("#divConfSenha").removeClass("error");
			$("#divConfSenha").addClass("success");
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
