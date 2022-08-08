package com.jsp.techblog.entities;

public class Message {
	private String contant;
	private String type;
	private String cssClass;
	public Message(String contant, String type, String cssClass) {
		super();
		this.contant = contant;
		this.type = type;
		this.cssClass = cssClass;
	}
	public String getContant() {
		return contant;
	}
	public void setContant(String contant) {
		this.contant = contant;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	
	

}
