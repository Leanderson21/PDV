package br.com.pdv.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.pdv.dao.UsuarioDAO;
import br.com.pdv.model.Usuario;



@WebServlet("/listar")
public class ListarUsuariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	public ListarUsuariosServlet() {
		super();
	}
          
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException {

		//Lógica para exibir os items de paginação
				UsuarioDAO dao = new UsuarioDAO();
				
				String quantidade = dao.ContarUsuario();
				
				Double cont_por_page = 6.0;
				Double numero = Double.parseDouble(quantidade);
				
				Double result = numero/cont_por_page;
				
				System.out.println(result);
				
				if(!(result % 2 == 0)) {
					Double resultado = (double)new Double(result).intValue() + 1;
					System.out.println(resultado);
					request.setAttribute("resultado_pagina", resultado);
					}
		
		// Lógica para exibir a lista
		String valor = request.getParameter("pag");
		
		if(valor == null) {
		valor = "1";
		}	
		
		List<Usuario> users = UsuarioDAO.getPagination(valor);
	
		RequestDispatcher rd = request.getRequestDispatcher("List_Users.jsp");
		request.setAttribute("lista", users);
		rd.forward(request, response);
		
		
		
		
		
		
		
		
		
		
		
		}
		
		
		
	}
	

