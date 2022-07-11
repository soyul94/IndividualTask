package egovframework.soyul.review;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

import egovframework.com.cmm.ComDefaultVO;


public class ReviewVO extends ComDefaultVO implements Serializable {

	//게시판 ID
	private String reviewId;
	//게시물명
	private String reviewSj;
	//피부타입
	private String skinType;
	//리뷰 제퓸
	private String reviewProduct;
	//게시물 내용
	private String reviewCn;
	//조회수
	private int inqireCo;
	//등록자IP
	private String creatIp;
	//공지여부
	private String noticeAt;
	//공개여부
	private String othbcAt;
	//사용여부
	private String useAt;
	//첨부파일ID
	private String atchFileId;
	//최초등록시점
	private Date frstRegistPnttm;
	//최초등록자ID
	private String frstRegisterId;
	//최종수정시점
	private Date lastUpdtPnttm;
	//최종수정자ID
	private String lastUpdusrId;
	//사용자ID
	private String userId;
	//관리자여부
	private String mngAt;
	
	
	
	//Getters and Setters
	
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getReviewSj() {
		return reviewSj;
	}
	public void setReviewSj(String reviewSj) {
		this.reviewSj = reviewSj;
	}
	public String getSkinType() {
		return skinType;
	}
	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}
	public String getReviewProduct() {
		return reviewProduct;
	}
	public void setReviewProduct(String reviewProduct) {
		this.reviewProduct = reviewProduct;
	}
	public String getReviewCn() {
		return reviewCn;
	}
	public void setReviewCn(String reviewCn) {
		this.reviewCn = reviewCn;
	}
	public int getInqireCo() {
		return inqireCo;
	}
	public void setInqireCo(int inqireCo) {
		this.inqireCo = inqireCo;
	}
	public String getCreatIp() {
		return creatIp;
	}
	public void setCreatIp(String creatIp) {
		this.creatIp = creatIp;
	}
	public String getNoticeAt() {
		return noticeAt;
	}
	public void setNoticeAt(String noticeAt) {
		this.noticeAt = noticeAt;
	}
	public String getOthbcAt() {
		return othbcAt;
	}
	public void setOthbcAt(String othbcAt) {
		this.othbcAt = othbcAt;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public Date getFrstRegistPnttm() {
		return frstRegistPnttm;
	}
	public void setFrstRegistPnttm(Date frstRegistPnttm) {
		this.frstRegistPnttm = frstRegistPnttm;
	}
	public String getFrstRegisterId() {
		return frstRegisterId;
	}
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}
	public Date getLastUpdtPnttm() {
		return lastUpdtPnttm;
	}
	public void setLastUpdtPnttm(Date lastUpdtPnttm) {
		this.lastUpdtPnttm = lastUpdtPnttm;
	}
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMngAt() {
		return mngAt;
	}
	public void setMngAt(String mngAt) {
		this.mngAt = mngAt;
	}
	

}
