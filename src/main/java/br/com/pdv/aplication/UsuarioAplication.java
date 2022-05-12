package br.com.pdv.aplication;

import java.util.List;

import br.com.pdv.dao.*;
import br.com.pdv.dao.UsuarioDAO;
import br.com.pdv.model.GrupoUsuario;
import br.com.pdv.model.Usuario;

public class UsuarioAplication {

	public static void main(String[] args) throws ClassNotFoundException {
		
		
		UsuarioDAO dao = new UsuarioDAO();
		
		String quantidade = dao.ContarUsuario();
		
		Double cont_por_page = 6.0;
		Double numero = Double.parseDouble(quantidade);
		
		Double result = numero/cont_por_page;
		
		System.out.println(result);
		
		
		if(!(result % 2 == 0)) {
			Double resultado = (double)new Double(result).intValue() + 1;
			System.out.println(resultado);
			for(int i=1; i<= resultado; i++) {
				System.out.println(i);
			}
		}
		
		
	}

}
