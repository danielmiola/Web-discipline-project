	var submit = false;

$(document).ready(function(){
	//esconde as msgs de erro
	$("#erroForename").fadeOut(0);
	$("#erroLastname").fadeOut(0);
	$("#erroInitials").fadeOut(0);
	var filtro = /^(([a-zA-Z0-9_\.\-])(\s)*)+$/;

	//verificação de nome
	$("#inputForename").focusout(function(){
		if ($("#inputForename").val().match(filtro) === null) {
			$("#erroForename").fadeIn("slow");
			$("#divForename").addClass("error");
                        submit=false;
		} else {
			$("#erroForename").fadeOut("slow");
			$("#divForename").removeClass("error");
			$("#divForename").addClass("success");
                        submit=true;
		}
	});

	//verificação de sobrenome
	$("#inputLastname").focusout(function(){
		if ($("#inputLastname").val().match(filtro) === null) {
			$("#erroLastname").fadeIn("slow");
			$("#divLastname").addClass("error");
                        submit=false;
		} else {
			$("#erroLastname").fadeOut("slow");
			$("#divLastname").removeClass("error");
			$("#divLastname").addClass("success");
                        submit=true;
		}
	});

	//verificacao da initials
	$("#inputInitials").focusout(function() {
		if ($("#inputInitials").val().match(filtro) === null) {
			//msg erro
			$("#erroInitials").fadeIn("slow");
			$("#divInitials").addClass("error");
                        submit=false;
		} else {
			$("#erroInitials").fadeOut("slow");
			$("#divInitials").removeClass("error");
			$("#divInitials").addClass("success");
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
