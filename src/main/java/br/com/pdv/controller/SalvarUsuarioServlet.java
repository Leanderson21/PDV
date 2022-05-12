package br.com.pdv.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.pdv.dao.UsuarioDAO;
import br.com.pdv.model.Usuario;

@WebServlet("/salvarUsuario")
public class SalvarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	try {
		String nome  = request.getParameter("nome");
		String email = request.getParameter("email");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String grupo = request.getParameter("grupo");
		System.out.println(nome);
		System.out.println(email);
		System.out.println(login);
		System.out.println(senha);
		System.out.println(grupo);
		Usuario user_post = new Usuario();
		UsuarioDAO dao = new UsuarioDAO();
		
		user_post.setNome(nome);
		user_post.setEmail(email);
		user_post.setLogin(login);
		user_post.setSenha(senha);
		user_post.setFk_grupo(Integer.parseInt(grupo));
		
		Usuario user_valid = UsuarioDAO.getUsuariobyLogin(login, email, nome);
		
		if(user_valid == null){
			
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
		    out.println("alert('Salvo com sucesso');");
		    out.println("location='cadastro_usuario.jsp';");
		    out.println("</script>");
		    dao.save(user_post);
		    
		}else{
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
		    out.println("alert('usuário já existe, informe um usuário novo');");
		    out.println("location='cadastro_usuario.jsp';");
		    out.println("</script>");
			}
		
		}catch(Exception e) {
			e.printStackTrace();
	
		}

	}

}
