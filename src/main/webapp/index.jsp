<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Chamadas Bootstrap -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Chamadas JS -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Chamada CSS interno -->
<link href="estilos/estilo.css" rel="stylesheet">

<title>PDV TOMCAT</title>
  </head>
<body>

<%

String usuarioLogado = (String)session.getAttribute("usuario");
	if(usuarioLogado != null){
		response.sendRedirect("logado.jsp");
	}
%>

<div class="wrapper fadeInDown">

  <div class="row" id="formContent">
    <!-- Icone PDV -->
    <div class="fadeIn first mb-3">
      <img src="media/ICONE-PDV.jpg" width="100px;" />
    </div>

<!-- Formulário de Login! -->
<form action="logarUser" method="post">
<div class="mb-3">
  <label class="form-label alinhamento_label">Login</label>
  <input type="text" class="form-control form-control-lg" id="login"  name="login">
</div>

<div class="mb-3">
  <label class="form-label alinhamento_label">Senha</label>
  <input type="password" class="form-control form-control-lg" id="senha" name="senha">
</div>
      <input type="submit" class="fadeIn fourth " value="Entrar">
    </form>

  </div>
</div>
	<!-- Chamadas JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  </body>
</html>