package com.web.blog.entities;

public class User {
	private int id;
	private String First_Name;
	private String Last_Name;
	private String Gender;
	private String Email;
	private String Password;
	private String About;

//	Constructors
	public User(int id, String first_Name, String last_Name, String gender, String email, String password,
			String about) {
		super();
		this.id = id;
		First_Name = first_Name;
		Last_Name = last_Name;
		Gender = gender;
		Email = email;
		Password = password;
		About = about;
	}

	public User() {
		super();
	}

	public User(String first_Name, String last_Name, String gender, String email, String password, String about) {
		super();
		First_Name = first_Name;
		Last_Name = last_Name;
		Gender = gender;
		Email = email;
		Password = password;
		About = about;
	}

//	Getters And Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirst_Name() {
		return First_Name;
	}

	public void setFirst_Name(String first_Name) {
		First_Name = first_Name;
	}

	public String getLast_Name() {
		return Last_Name;
	}

	public void setLast_Name(String last_Name) {
		Last_Name = last_Name;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getAbout() {
		return About;
	}

	public void setAbout(String about) {
		About = about;
	}

}
