//redireciona para o servlet por get o id do artigo que deseja visualizar
function direciona(x) {
    
    var s = "http://localhost:8080/Projeto2/RecebeArtigo?id="+x;
    window.location.href=s;
}