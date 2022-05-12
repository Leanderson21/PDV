<%@ page pageEncoding="UTF-8"%>   
 <%@ page import= "java.sql.Connection, br.com.pdv.dao.*, br.com.pdv.model.*, br.com.pdv.conexao.*, java.util.*" %>   
<!DOCTYPE html>
<html>
<head>
<title>Gerenciador de Tarefas</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

<!-- Chamadas css -->
<link rel="stylesheet" href="css/style.css">
	
<!-- Chamadas Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Chamadas JS -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="js/jquery.mask.min.js"></script>
<script src="js/jquery-3.2.1.min.js"></script>
  
</head>

<body>

<%
String usuario = (String)session.getAttribute("usuario");

if(usuario == null){
	response.sendRedirect("index.jsp");
}
%>

<!--Menu principal NAV-->
<div class="wrapper d-flex align-items-stretch">
	<nav id="sidebar">
		<div class="custom-menu">
			<button type="button" id="sidebarCollapse" class="btn btn-primary">
         			<i class="fa fa-bars"></i>
       		</button>
     			</div>
	<div class="p-4">
	   <ul class="list-unstyled components mb-5">
	        	<%
				if(usuario != null){
					out.println("Bem vindo <b>" +usuario+"</b>");
					}
				%>
	   <!--Item de menu Home--> 
         <li class="nav-item">
             <a class="nav-link text-truncate" href="#"><i class="fa fa-home"></i> <span class="d-none d-sm-inline">Home</span></a>
         </li>
                
       <!--dropdown usuários-->  
		 <li class="nav-item">
	          <a class="nav-link collapsed text-truncate" href="#submenu1" data-toggle="collapse" data-target="#submenu1"><i class="fa fa-table"></i> <span class="d-none d-sm-inline">Usuários</span></a>
	     	  			<ul class="flex-column pl-2 nav">
	     	  	<div class="collapse" id="submenu1" aria-expanded="false">
			     		<li class="nav-item">
			                <a class="nav-link text-truncate" href="cadastro_usuario.jsp"><i class="fa fa-user"></i> <span class="d-none d-sm-inline">Novo usuário</span></a>
			             </li>
		              	<li class="nav-item">
		              		<a class="nav-link text-truncate" href="listar"><i class="fa fa-group"></i> <span class="d-none d-sm-inline">Lista de usuários</span></a>
	             		</li> 
            		</div>
	        	</ul>
         	</li>
        </ul>
	</div>
</nav>	

  <!-- Page Content  --> 
<div id="content" class="p-4 p-md-5 pt-5">

  <!--Tirulo da tarefa--> 
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item active" aria-current="page"> <span class="fa fa-user-plus mr-3"></span>Cadastrar usuários</li>
		  </ol>
		</nav>
		
 <!--Forumulário principal-->     
<div class="container">

<form action="salvarUsuario" method="post" id="salvarUser">

	<div class="row">

		<div class="col-6">
		    <label class="mt-2" for="autoSizingInput">Nome</label>
		    <input type="text" class="form-control form-control-lg" id="nome" name="nome">
		</div>
		    <div class="col-6">
		    <label class="mt-2" for="autoSizingInput">Email</label>
		    <input type="email" class="form-control form-control-lg" id="email" placeholder="name@example.com" name="email">
		    </div>
		</div>
    
		<div class="row">
			<div class="col-6">
		    	<label class="mt-2" for="autoSizingInput">Login</label>
		    	<input type="text" class="form-control form-control-lg" id="login"  name="login">
			</div>
		    <div class="col-6 ">
		    	<label class="mt-2" for="autoSizingInput">Senha</label>
		     	<input type="password" class="form-control form-control-lg" id="senha" name="senha">
		    </div>
		</div>

<!-- Chamando a tabela de grupos de usuários-->	
<%   
GrupoUsuarioDAO dao = new GrupoUsuarioDAO();
	List<GrupoUsuario> user = dao.getGrupo();
%>
<label class="mt-2" for="autoSizingSelect">Grupo</label>
  
		<select name="grupo" id="grupo" class="form-select col-3" id="autoSizingSelect">
		   <option selected>Escolha...</option>
			<% for(GrupoUsuario list_gp_user : user ){ %>
		 		<option value="<%= list_gp_user.getId_grupo() %>"> <%= list_gp_user.getNome() %> </option>
			<%}%>
		</select>
		
<!-- Botão de envio do formulário-->
	  <div>
	    <button type="submit" class="btn btn-success mt-4">Salvar</button>
	  </div>
  
</form>

</div>
</div>  
  
	<!-- Chamadas JS -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    
</body>
</html>