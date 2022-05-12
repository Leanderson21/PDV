package br.com.pdv.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.pdv.dao.UsuarioDAO;
import br.com.pdv.model.Usuario;

@WebServlet("/logarUser")
public class LoginUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		try {
			
		Usuario user_valid_login = UsuarioDAO.validarLogin(login);
		
		if(user_valid_login != null && user_valid_login.getSenha().equals(senha)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("usuario", user_valid_login.getNome());
			RequestDispatcher rd = request.getRequestDispatcher("logado.jsp");
			rd.forward(request, response);
	
		}else if(user_valid_login == null){
			
			request.setAttribute("erro", "Erro ao tentar realizar o login");
			RequestDispatcher rd = request.getRequestDispatcher("index.jps");
			rd.forward(request, response);
			
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
