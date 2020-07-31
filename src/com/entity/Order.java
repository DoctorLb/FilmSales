package com.entity;

public class Order {

	private int orderId;   //订单号（自增）
	private UserInfo userId = new UserInfo();
	private Ticket ticketId = new Ticket();
	private int count;     //购票数量
	private double orderMoney; //总价
	private String orderTime;  //订单时间
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public UserInfo getUserId() {
		return userId;
	}
	public void setUserId(UserInfo userId) {
		this.userId = userId;
	}
	public Ticket getTicketId() {
		return ticketId;
	}
	public void setTicketId(Ticket ticketId) {
		this.ticketId = ticketId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(double orderMoney) {
		this.orderMoney = orderMoney;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	
}
