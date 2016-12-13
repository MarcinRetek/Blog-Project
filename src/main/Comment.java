package main;

import java.util.Calendar;

public class Comment {

	private String author;
	private Calendar date;
	private String message;
	
	public Comment(String author, Calendar date, String message) {
		super();
		this.author = author;
		this.date = date;
		this.message = message;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Calendar getDate() {
		return date;
	}

	public void setDate(Calendar date) {
		this.date = date;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
