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
  </head>
<body>

<%

String usuario = (String)session.getAttribute("usuario");

if(usuario == null){
	response.sendRedirect("index.jsp");
}

%>

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
	        <ul class="list-unstyled components ">
	        
	        		<li class=" mb-4">
	        	
                    <a class="text-truncate" href="DeslogarUsuario"><i class="fa fa-power-off"></i> <span class="">Deslogar</span> 
					</a>
              
                    </li>
                
	   <!--Item de menu Home--> 
                <li class="nav-item mt-4">
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
		
 <!--Forumulário principal-->     


</div>
</div>    
		
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>