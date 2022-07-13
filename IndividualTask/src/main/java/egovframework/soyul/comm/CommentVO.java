package egovframework.soyul.comm;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

import egovframework.com.cmm.ComDefaultVO;


public class CommentVO extends ComDefaultVO implements Serializable {

	private String commentId;
	private String commentRegisterId;
	private String commentContent;
	private Date commentRegisterDate;
	private String boardId;
	
	
	
	//Getters and Setters
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getCommentRegisterId() {
		return commentRegisterId;
	}
	public void setCommentRegisterId(String commentRegisterId) {
		this.commentRegisterId = commentRegisterId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentRegisterDate() {
		return commentRegisterDate;
	}
	public void setCommentRegisterDate(Date commentRegisterDate) {
		this.commentRegisterDate = commentRegisterDate;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String reviewId) {
		this.boardId = reviewId;
	}
	
	
}
