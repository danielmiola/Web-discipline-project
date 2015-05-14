$(document).ready(function(){
	
	//esconde as msgs de erro
	$("#erroEmail").fadeOut(0);
        $("#erroSenha").fadeOut(0);
	

});
  function CheckAndSubmit () {
            //Verifica se o e-mail corresponde a REGEX 
            //e se a senha tem pelo menos 6 dígitos
            // e não faz o submit até todos os campos estiverem preenchidos
            var filtroEmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            //verificação de nome
            //$("#loginForm").onsubmit(function(){
            var senha = document.getElementById ("inputSenha");
            if (senha.value.length < 6) {
                $("#erroSenha").fadeIn("slow");
		$("#divSenha").addClass("error");                
                return false;
            }else{
               $("#erroSenha").fadeOut(0);
            }

	   if ($("#inputEmail").val().match(filtroEmail) === null) {
			$("#erroEmail").fadeIn("slow");
			$("#divEmail").addClass("error");
                        return false;
          }else{
              	$("#erroEmail").fadeOut(0);
          }
         return true;
}

