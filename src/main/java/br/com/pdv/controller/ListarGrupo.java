package br.com.pdv.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.pdv.dao.GrupoUsuarioDAO;
import br.com.pdv.model.GrupoUsuario;

@WebServlet("/listaGrupo")
public class ListarGrupo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
	 

 }
}
