package br.com.pdv.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

	private static final String url = "jdbc:mysql://localhost:3306/pdv?autoReconnect=true&useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false";
	private static final String user = "Leanderson";
	private static final String password = "Ladraodepao@1";	

			public static Connection getConnection() throws ClassNotFoundException{
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection(url,user,password);
					return conn;
					
				}catch(SQLException e) {
					throw new RuntimeException(e);
			}
			
		}
		
		public static void main(String[] args) throws ClassNotFoundException, SQLException {
			Connection conn = getConnection();
				if(conn != null) {
					System.out.println("Conexão realizada com sucesso!");
						conn.close();
		}

	}

}

