<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import= "java.sql.Connection, br.com.pdv.dao.*, br.com.pdv.model.*, br.com.pdv.conexao.*, java.util.*" %>   
    
<!DOCTYPE html>
<html>
<head>

<!-- Boootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Boootstrap js 1-->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<div class="container">
<table class="table table-sm ">
  <thead>
    <tr class="bg-primary">
      <th scope="col">Nome</th>
      <th scope="col">Email</th>
      <th scope="col">Login</th>
      <th scope="col">Senha</th>
      <th scope="col">grupo</th>
    </tr>
  </thead>
  
  <% UsuarioDAO dao = new UsuarioDAO();
  		List<Usuario> users = dao.getUsuarios();
  			for(Usuario user_list: users){	
  %>
  
  <tbody>
    <tr>
      <td><%= user_list.getNome()%></td>
      <td><%= user_list.getEmail()%></td>
      <td><%= user_list.getLogin()%></td>
      <td><%= user_list.getSenha()%></td>
      <td><%= user_list.getFk_nomeGrupo()%></td>
    </tr>
  </tbody>
  <%}%>
</table>
</div>

<!-- Boootstrap js 2-->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>