package com.javalec.ex03;	

 public class BoardDTO {	
	String name;	
	String date;	
	String title;	
	String content;	
	int count;	
	String FileName;	
		
		
	public String getFileName() {	
		return FileName;	
	}	
	public void setFileName(String fileName) {	
		FileName = fileName;	
		System.out.println(FileName);	
	}	
	public int getCount() {	
		return count;	
	}	
	public void setCount(int count) {	
		this.count = count;	
	}	
	public String getName() {	
		return name;	
	}	
	public void setName(String name) {	
		this.name = name;	
	}	
	public String getDate() {	
		return date;	
	}	
	public void setDate(String date) {	
		this.date = date;	
	}	
	public String getTitle() {	
		return title;	
	}	
	public void setTitle(String title) {	
		this.title = title;	
	}	
	public String getContent() {	
		return content;	
	}	
	public void setContent(String content) {	
		this.content = content;	
	}	
		
		
}