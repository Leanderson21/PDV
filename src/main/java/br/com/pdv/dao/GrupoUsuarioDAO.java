package br.com.pdv.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.pdv.conexao.Conexao;
import br.com.pdv.model.GrupoUsuario;

public class GrupoUsuarioDAO {

	
	public List<GrupoUsuario> getGrupo() throws Exception{
		
		List<GrupoUsuario> gp  = new ArrayList<GrupoUsuario>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rst = null;
		String sql = "Select * from grupo_usuario";
		
		
		try {
			
			conn = Conexao.getConnection();
			pstm = conn.prepareStatement(sql);
			rst = pstm.executeQuery();
			
			while(rst.next()) {
				GrupoUsuario grupo = new GrupoUsuario();
				grupo.setId_grupo(rst.getInt("id_grupo"));
				grupo.setNome(rst.getString("nome_grupo"));
				gp.add(grupo);
			}
			
			
		}catch(SQLException e) {
			throw new Exception(e);
		}
		
		
		return gp;
		
		
	}
	
	
	
	
}
