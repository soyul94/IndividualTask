package egovframework.soyul.member;

import egovframework.com.cmm.ComDefaultVO;

public class MemberVO extends ComDefaultVO{

	//Serializable하는 클래스 마다 달라야한다
	private static final long serialVersionUID = -4255594107023139972L;

	/** 이전비밀번호 - 비밀번호 변경시 사용*/
    private String oldPassword = "";

    //아이디
    private String emplyrId;
    //비밀번호
    private String password;
    //이름
    private String userNm;
    //성별
    private String sexdstnCode;
    //주민등록번호
    private String ihidnum;
    //비밀번호 힌트
    private String passwordHint;
    //비밀번호 힌트 정답
    private String passwordCnsr;
    //핸드폰번호
    private String mbtlnum;
    //우편번호
    private String zip;
    //주소
    private String houseAdres;
    //상세주소
    private String detailAdres;
    //이메일주소
    private String emailAdres;
    //고유 아이디
    private String esntlId="";  
    //사용자 상태 코드
    private String emplyrSttusCode;
    // 가입 일자
    private String sbscrbDe;
    //회원등급
	private String userGrade;
	//회원의 선호도
	private String userFavorite;
	
	
	private String lockAt;
	public String getLockAt() {return lockAt;}
	public void setLockAt(String lockAt) {this.lockAt = lockAt;}
	
	/**
	 * oldPassword attribute 값을  리턴한다.
	 * @return String
	 */
	public String getOldPassword() {
		return oldPassword;
	}
	/**
	 * oldPassword attribute 값을 설정한다.
	 * @param oldPassword String
	 */
	
	
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getEmplyrId() {
		return emplyrId;
	}
	public void setEmplyrId(String emplyrId) {
		this.emplyrId = emplyrId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getSexdstnCode() {
		return sexdstnCode;
	}
	public void setSexdstnCode(String sexdstnCode) {
		this.sexdstnCode = sexdstnCode;
	}
	public String getIhidnum() {
		return ihidnum;
	}
	public void setIhidnum(String ihidnum) {
		this.ihidnum = ihidnum;
	}
	public String getPasswordHint() {
		return passwordHint;
	}
	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}
	public String getPasswordCnsr() {
		return passwordCnsr;
	}
	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}
	public String getMbtlnum() {
		return mbtlnum;
	}
	public void setMbtlnum(String mbtlnum) {
		this.mbtlnum = mbtlnum;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getHouseAdres() {
		return houseAdres;
	}
	public void setHouseAdres(String houseAdres) {
		this.houseAdres = houseAdres;
	}
	public String getDetailAdres() {
		return detailAdres;
	}
	public void setDetailAdres(String detailAdres) {
		this.detailAdres = detailAdres;
	}
	public String getEmailAdres() {
		return emailAdres;
	}
	public void setEmailAdres(String emailAdres) {
		this.emailAdres = emailAdres;
	}
	public String getEsntlId() {
		return esntlId;
	}
	public void setEsntlId(String esntlId) {
		this.esntlId = esntlId;
	}
	public String getEmplyrSttusCode() {
		return emplyrSttusCode;
	}
	public void setEmplyrSttusCode(String emplyrSttusCode) {
		this.emplyrSttusCode = emplyrSttusCode;
	}
	public String getSbscrbDe() {
		return sbscrbDe;
	}
	public void setSbscrbDe(String sbscrbDe) {
		this.sbscrbDe = sbscrbDe;
	}
	public String getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}
	public String getUserFavorite() {
		return userFavorite;
	}
	public void setUserFavorite(String userFavorite) {
		this.userFavorite = userFavorite;
	}
	
	
	
	
}	
	
	