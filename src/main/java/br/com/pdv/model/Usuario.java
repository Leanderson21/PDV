package br.com.pdv.model;

public class Usuario {
	
	// Atributos
	private int id;
	private String nome;
	private String email;
	private String login;
	private String senha;
	private String fk_nomeGrupo;
	private String quantidade;
	
	
	
	public String getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}
	public String getFk_nomeGrupo() {
		return fk_nomeGrupo;
	}
	public void setFk_nomeGrupo(String fk_nomeGrupo) {
		this.fk_nomeGrupo = fk_nomeGrupo;
	}
	private int fk_grupo;
	

	
	public int getFk_grupo() {
		return fk_grupo;
	}
	public void setFk_grupo(int fk_grupo) {
		this.fk_grupo = fk_grupo;
	}
	//Getters and Setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
}
