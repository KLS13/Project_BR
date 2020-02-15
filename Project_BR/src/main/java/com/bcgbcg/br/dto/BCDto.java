package com.bcgbcg.br.dto;

public class BCDto {
	private int MON,TUE,WEN,TUR,FRI,SAT,SUN;

	public BCDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BCDto(int mON, int tUE, int wEN, int tUR, int fRI, int sAT, int sUN) {
		super();
		MON = mON;
		TUE = tUE;
		WEN = wEN;
		TUR = tUR;
		FRI = fRI;
		SAT = sAT;
		SUN = sUN;
	}

	public int getMON() {
		return MON;
	}

	public void setMON(int mON) {
		MON = mON;
	}

	public int getTUE() {
		return TUE;
	}

	public void setTUE(int tUE) {
		TUE = tUE;
	}

	public int getWEN() {
		return WEN;
	}

	public void setWEN(int wEN) {
		WEN = wEN;
	}

	public int getTUR() {
		return TUR;
	}

	public void setTUR(int tUR) {
		TUR = tUR;
	}

	public int getFRI() {
		return FRI;
	}

	public void setFRI(int fRI) {
		FRI = fRI;
	}

	public int getSAT() {
		return SAT;
	}

	public void setSAT(int sAT) {
		SAT = sAT;
	}

	public int getSUN() {
		return SUN;
	}

	public void setSUN(int sUN) {
		SUN = sUN;
	}

}
