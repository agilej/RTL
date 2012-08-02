package me.donnior.showcase.entity;

public class User {

	private String login;
	private String email;
	private int id;
	
	public User(int id, String login, String eamil) {
		this.id = id;
		this.login = login;
		this.email = eamil;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getLogin() {
		return login;
	}

	public int getId() {
		return id;
	}
}
