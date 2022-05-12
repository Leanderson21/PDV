package br.com.pdv.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeMBeanException;

import br.com.pdv.conexao.Conexao;
import br.com.pdv.model.GrupoUsuario;
import br.com.pdv.model.Usuario;

public class UsuarioDAO {

	public void save(Usuario user) {
	
		Connection conn = null;
		PreparedStatement pstm = null;
		String sql = "INSERT INTO usuario(nome,email,login,senha,fk_grupo) VALUES(?,?,?,?,?)";
		
		try {
			
			conn = Conexao.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, user.getNome());
			pstm.setString(2, user.getEmail());
			pstm.setString(3, user.getLogin());
			pstm.setString(4, user.getSenha());
			pstm.setInt(5, user.getFk_grupo());
			pstm.execute();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				
				if(conn != null) {
					conn.close();
				}
				
				if(pstm != null) {
					pstm.close();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
	
		}
	
	}
	

	public static Usuario getUsuariobyLogin(String login, String email, String nome) throws ClassNotFoundException{
		
		Usuario user_result = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rst = null;
		String sql = "SELECT * FROM usuario WHERE login = ? or email = ? or nome = ? ";
		
		try {
			
			conn = Conexao.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, login);
			pstm.setString(2, email);
			pstm.setString(3, nome);
			rst = pstm.executeQuery();
			
			while(rst.next()) {
				user_result = new Usuario();
				user_result.setLogin(rst.getString("login"));
				user_result.setNome(rst.getString("nome"));
				user_result.setEmail(rst.getString("email"));
			}
			
			
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}finally {
			
			try {
				
				if(conn != null) {
					conn.close();
				}
				
				if(pstm != null) {
					pstm.close();
				}
				
				if(rst != null) {
					rst.close();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
	
		}
		
		return user_result;
	}
	
	
	public static Usuario validarLogin(String login) throws ClassNotFoundException {
		
		Usuario user_result = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rst = null;
		String sql = "SELECT * FROM usuario WHERE login = ?";
		
		try {
			
			conn = Conexao.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, login);
			rst = pstm.executeQuery();
			
			while(rst.next()) {
				user_result = new Usuario();
				user_result.setLogin(rst.getString("login"));
				user_result.setSenha(rst.getString("senha"));
				user_result.setNome(rst.getString("nome"));
			}
			
			
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}finally {
			
			try {
				
				if(conn != null){
					conn.close();
				}
				
				if(pstm != null ) {
					pstm.close();
				}
				
				if(rst != null) {
					rst.close();
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}

		return user_result;
		
		
	}
	
	
	public List<Usuario> getUsuarios(){
	
	// Declarações
	Connection conn = null;
		PreparedStatement pstm = null;
			ResultSet rst = null;
		
				String sql = "Select usuario.nome, usuario.email, usuario.login, usuario.senha, grupo_usuario.nome_grupo From USUARIO join grupo_usuario on grupo_usuario.id_grupo = usuario.fk_grupo";
		
						List<Usuario> users = new ArrayList<Usuario>();
						
		
	// Preparando a consulta
		try {
			conn = Conexao.getConnection();
				pstm = conn.prepareStatement(sql);
					rst = pstm.executeQuery();
					
						while(rst.next()) {
							Usuario user = new Usuario();
				
			
								user.setNome(rst.getString("nome"));
								user.setEmail(rst.getString("email"));
								user.setLogin(rst.getString("login"));
								user.setSenha(rst.getString("senha"));
								user.setFk_nomeGrupo(rst.getString("nome_grupo"));
								users.add(user);
								
								}
					
			}catch(Exception e) {
				e.printStackTrace();
		}
// Retorno do método		
return users;		
	}
	
	
	public static List<Usuario> getPagination(String numeroPagina){
		
		List<Usuario> users = new ArrayList<Usuario>();
		
		Connection conn = null;
		
		PreparedStatement pstm = null;
		
		ResultSet rst = null;
		
		int start = 10;
		
		//lógica do offset
		
		if (numeroPagina == null) {
			numeroPagina = "0";
		}
		
		int offset = (Integer.parseInt(numeroPagina) * start) - start;
		
		//Lógica para buscar limite de usuários por página
		String sql = "Select usuario.nome, usuario.email, "
				+ "usuario.login, usuario.senha, grupo_usuario.nome_grupo From USUARIO "
				+ "join grupo_usuario on grupo_usuario.id_grupo = usuario.fk_grupo limit "
				+ ""+start+ " offset " +offset;
		
		
		try {
			
			conn = Conexao.getConnection();
			pstm = conn.prepareStatement(sql);
			rst = pstm.executeQuery();
			
			while(rst.next()) {
				Usuario user = new Usuario();
				user.setNome(rst.getString("nome"));
				user.setEmail(rst.getString("email"));
				user.setLogin(rst.getString("login"));
				user.setSenha(rst.getString("senha"));
				user.setFk_nomeGrupo(rst.getString("nome_grupo"));
				users.add(user);
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return users;
	}

	
	public static String ContarUsuario(){
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String sql = "SELECT COUNT(nome) FROM usuario";
		ResultSet rst = null;
		String resultado = null;
		
		try {
			conn = Conexao.getConnection();
			pstm = conn.prepareStatement(sql);
			rst = pstm.executeQuery();
			
			rst.next();
			
			resultado = rst.getString(1);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultado;
	
	}

}
