package com.web.blog.entities;

import java.security.NoSuchAlgorithmException;

import com.web.blog.helpers.Encryptor;

public class User {
	private int id;
	private String First_Name;
	private String Last_Name;
	private String Gender;
	private String Email;
	private String Password;
	private String About;
	private String Picture;

//	Constructors
	public User(int id, String first_Name, String last_Name, String gender, String email, String password,
			String about ,String picture) {
		super();
		this.id = id;
		First_Name = first_Name;
		Last_Name = last_Name;
		Gender = gender;
		Email = email;
		Password = password;
		About = about;
		Picture = picture;
	}

	public User() {
		super();
	}

	public User(String first_Name, String last_Name, String gender, String email, String password, String about , String picture) throws NoSuchAlgorithmException {
		super();
		First_Name = first_Name;
		Last_Name = last_Name;
		Gender = gender;
		Email = email;
		Password = Encryptor.Hash(password);
		About = about;
		if(About.length() == 0)
		About = "Hey! I am a Blogger.";
		Picture = picture;
		if(Picture.length() == 0)
		Picture = "default.jpeg";
	}

public User(String email, String password) throws Exception {
		super();
		Email = email;
		Password = Encryptor.Hash(password);
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
		if(about.length() == 0)
			About = "Hey! I am a Blogger.";
		else About = about;
	}

	public String getPicture() {
		return Picture;
	}

	public void setPicture(String picture) {
		Picture = picture;
	}

}
