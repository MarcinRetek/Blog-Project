package main;

import java.util.ArrayList;
import java.util.Calendar;

public class Article {
	private String title;
	private String author;
	private Calendar date;
	private String content;
	private ArticleType type;
	private int id;
	private ArrayList<Comment> comments = new ArrayList<>();
	
	public Article(String title, String author, Calendar date, String content, ArticleType type, int id) {
		this.title = title;
		this.author = author;
		this.date = date;
		this.content = content;
		this.type = type;
		this.id = id;
		this.comments = new ArrayList<Comment>();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public ArticleType getType() {
		return type;
	}

	public void setKind(ArticleType type) {
		this.type = type;
	}

	public int getId() {
		return id;
	}
	
	public ArrayList<Comment> getComments() {
		return comments;
	}

	public void addComment(Comment newcomment) {
		comments.add(newcomment);
	}
	
}
