package egovframework.soyul.orders;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

import egovframework.com.cmm.ComDefaultVO;


public class OrdersVO extends ComDefaultVO implements Serializable {

	private String orderId;
	private String ordererId;
	private String ordererName;
	private String recipientAddress;
	private String recipientDetailAddress;
	private String recipientPhone;
	private String requestTerm;
	private String orderProductFirst;
	private String orderProductMiddle;
	private String orderProductLast;
	private String orderProducPackage;
	private String orderAmount;
	private String reviewCheak;
	private String orderApproval;
	private String orderState;
	
	
	
	//Getters and Setters
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrdererId() {
		return ordererId;
	}
	public void setOrdererId(String ordererId) {
		this.ordererId = ordererId;
	}
	public String getOrdererName() {
		return ordererName;
	}
	public void setOrdererName(String ordererName) {
		this.ordererName = ordererName;
	}
	public String getRecipientAddress() {
		return recipientAddress;
	}
	public void setRecipientAddress(String recipientAddress) {
		this.recipientAddress = recipientAddress;
	}
	public String getRecipientDetailAddress() {
		return recipientDetailAddress;
	}
	public void setRecipientDetailAddress(String recipientDetailAddress) {
		this.recipientDetailAddress = recipientDetailAddress;
	}
	public String getRecipientPhone() {
		return recipientPhone;
	}
	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}
	public String getRequestTerm() {
		return requestTerm;
	}
	public void setRequestTerm(String requestTerm) {
		this.requestTerm = requestTerm;
	}
	public String getOrderProductFirst() {
		return orderProductFirst;
	}
	public void setOrderProductFirst(String orderProductFirst) {
		this.orderProductFirst = orderProductFirst;
	}
	public String getOrderProductMiddle() {
		return orderProductMiddle;
	}
	public void setOrderProductMiddle(String orderProductMiddle) {
		this.orderProductMiddle = orderProductMiddle;
	}
	public String getOrderProductLast() {
		return orderProductLast;
	}
	public void setOrderProductLast(String orderProductLast) {
		this.orderProductLast = orderProductLast;
	}
	public String getOrderProducPackage() {
		return orderProducPackage;
	}
	public void setOrderProducPackage(String orderProducPackage) {
		this.orderProducPackage = orderProducPackage;
	}
	public String getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}
	public String getReviewCheak() {
		return reviewCheak;
	}
	public void setReviewCheak(String reviewCheak) {
		this.reviewCheak = reviewCheak;
	}
	public String getOrderApproval() {
		return orderApproval;
	}
	public void setOrderApproval(String orderApproval) {
		this.orderApproval = orderApproval;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	


}
