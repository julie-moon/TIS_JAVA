package com.jbm.model1.vo;

import java.sql.Date;

import com.sun.jmx.snmp.Timestamp;

public class User {
	
	private int no;
	private String id, password, nickname, profile;
	private Date birthDate;
	private Timestamp regdate;
	
	public User() {
		
	}
	
	public User(String id, String password, String nickname, String profile, Date birthDate) {
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.profile = profile;
		this.birthDate = birthDate;
	}
	
	public User(String id, String password) {
		this.id = id;
		this.password = password;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
