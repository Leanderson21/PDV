<%@ page pageEncoding="UTF-8"%>   
 <%@ page import= "java.sql.Connection, br.com.pdv.dao.*, br.com.pdv.controller.*, br.com.pdv.model.*, br.com.pdv.conexao.*, java.util.*" %>   
<!DOCTYPE html>
<html>
<head>
  	<title>Gerenciador de Tarefas</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style.css">
	
	<!-- Chamadas Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	
  </head>
<body>

<!--Menu principal-->
<div class="wrapper d-flex align-items-stretch">

<nav id="sidebar">
<div class="custom-menu">
					<button type="button" id="sidebarCollapse" class="btn btn-primary">
	          <i class="fa fa-bars"></i>
	          <span class="sr-only">Toggle Menu</span>
	        </button>
        </div>
		<div class="p-4">
	        <ul class="list-unstyled components mb-5">
	        
	   <!--Item de menu Home--> 
                <li class="nav-item">
                    <a class="nav-link text-truncate" href="#"><i class="fa fa-home"></i> <span class="d-none d-sm-inline">Home</span></a>
                </li>
                
        <!--dropdown usuários-->  
		   <li class="nav-item">
	          <a class="nav-link collapsed text-truncate" href="#submenu1" data-toggle="collapse" data-target="#submenu1"><i class="fa fa-table"></i> <span class="d-none d-sm-inline">Usuários</span></a>
	          <div class="collapse" id="submenu1" aria-expanded="false">
	          <ul class="flex-column pl-2 nav">
	           <li class="nav-item">
	                <a class="nav-link text-truncate" href="cadastro_usuario.jsp"><i class="fa fa-home"></i> <span class="d-none d-sm-inline">Novo usuário</span></a>
	             </li>
	              <li class="nav-item">
	              	<a class="nav-link text-truncate" href="listar"><i class="fa fa-home"></i> <span class="d-none d-sm-inline">Lista de usuários</span></a>
             	</li> 
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
		    <li class="breadcrumb-item active" aria-current="page"> <span class="fa fa-plus-circle mr-3"></span>Lista de Usuários</li>
		  </ol>
		</nav>
		
		<form action="salvarUsuario" method="post" >
    
<div class="row">
<div class="col-1">
  <label class="form-label alinhamento_label">Nome</label>
  </div>
</div>
  <input type="text" class="form-control form-control-lg" id="nome" name="nome">


<div class="row ">
<div class="col-1 mt-2">
  <label class="form-label alinhamento_label ">Email</label>
  </div>
</div>
  <input type="email" class="form-control form-control-lg" id="email" placeholder="name@example.com" name="email">


<div class="row">
<div class="col-1 mt-2">
  <label class="form-label alinhamento_label">Login</label>
   </div>
</div>
  <input type="text" class="form-control form-control-lg" id="login"  name="login">

<div class="row">
<div class="col-1 mt-2">
  <label class="form-label alinhamento_label">Senha</label>
  </div>
</div>
  <input type="password" class="form-control form-control-lg" id="senha" name="senha">

 
	<!-- Chamando a tabela de grupos de usuários-->	
	<%   
	GrupoUsuarioDAO dao = new GrupoUsuarioDAO();
	List<GrupoUsuario> user = dao.getGrupo();
  	%>
<div class="row">
<div class="col-1 mt-2">
  		<label class="form-label alinhamento_label" >Grupo</label>
  </div>
</div>
		<select id="grupo" name="grupo" class="form-select form-select-lg mb-1 select_grupo_user"  >
		<option id="grupo" value="" >-----</option>
		<% for(GrupoUsuario list_gp_user : user ){ %>
		  <option value="<%= list_gp_user.getId_grupo() %>"> <%= list_gp_user.getNome() %> </option>
		<%} %>
		</select>

      <button type="submit" class="btn btn-success btn-lg mb-2 mt-2">Salvar</button>
	
    </form>
		
		


</div>
</div>    
		
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>


