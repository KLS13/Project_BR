package com.bcgbcg.br.dao;

import java.util.ArrayList;

import com.bcgbcg.br.dto.UserDto;

public interface UserDao {
	
	public ArrayList<UserDto> user();
	public UserDto login(String uId_, String uPassword);
	public int loginCount(String uId_, String uPassword);
	public UserDto logout();
	public UserDto chekcPw(String uPassword);
	public void create(String uName, String uId_, String uPassword,String uPhone, String uBirthday ,String uEmail, String uAddress, String uGenre );
	public int find(int uIdx);
	public int modify(String uPassword, String uPhone, String uEmail, String uAddress, String uGenre, String uId_);
	public int delete(String uId_, String uPassword);
	public int changePw(String uPassword, String uId_);
	public UserDto find(String uName, String uEMail);
	public UserDto idCheck(String uId_);
	public UserDto searchUserInfo(String uId_, String uName);
	
}
