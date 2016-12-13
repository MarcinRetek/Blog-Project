<%@page import="java.time.temporal.TemporalUnit"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="main.ArticleType"%>
<%@page import="main.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="main.DataServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Can't access this page if you're not logged in! -->
<%
	if(session.getAttribute("admin") != "true") {
		response.sendRedirect("index.jsp");
	}
%>

<!-- header -->
<jsp:include page="header.jsp">
	<jsp:param value="writeScripts.js" name="jsFile"/>
</jsp:include>

<!-- get posted data for new article -->
<%
String title = request.getParameter("articleTitle");
String author = request.getParameter("articleAuthor");
Calendar now = Calendar.getInstance();
String body = request.getParameter("articleBody");
System.out.println(body);
int id = DataServlet.blogList.size();	
%>

<div class="container">
	
	
	<div class="row">
		<div class="col-md-8">
	 
	 		<h1>
				New Article
			</h1>
			<!-- new article form -->
			<form id ="newArticleForm"action="#" method="post">
				<h2 class="formTitle">Title of article</h2>
				<input type="text" name="articleTitle" required>
				
				<h2 class="formTitle">Author</h2>
				<input type="text" name="articleAuthor" required>
				
				<h2 class="formTitle">Article Body</h2>
				<textarea name="articleBody" required wrap="hard"></textarea>
				
				
				<h2 class="formTitle">Article Type</h2>
				<select name="articleType" required>
		 			 <option value="NEWS">News</option>
		 			 <option value="NOTICE">Notice</option>
		 			 <option value="FEATURE">Feature</option>
				</select>
				
				<button type="submit">Publish</button>
			</form>
	 		
	 		<%
	 		
	 		//alert for incompatible browsers
	 		if(title == "" || author == "" || body == ""){
	 			%>
				<div class="alert alert-warning">
				Please fill in all fields.
				</div>
		     <%
		     
		     //new article submission
	 		} else {
	 		
				if(title != null && body != null){ //make sure SOMETHING is sent
					
					ArticleType type = parseArticleType(request.getParameter("articleType"));
					
					DataServlet.addArticle(title, author, body, type, id);
					%>
					<!-- article submitted alert -->
					<div class="alert alert-success">
					Article successfully published at <%=now.getTime().toLocaleString() %>.
					<a href="viewArticle.jsp?id=<%=id%>">View >></a>
					</div>
			     <%}
	 		}
	 		%>
	 		
		</div>
	</div>
	
	
</div>
<!-- footer -->
<%@include file="footer.jsp"%>

<!-- methods -->
<%!
private ArticleType parseArticleType(String input){
	switch(input){
	case "NEWS":
		return ArticleType.NEWS;
	case "NOTICE":
		return ArticleType.NOTICE;
	case "FEATURE":
		return ArticleType.FEATURE;
	default:
		return null;
	}
}
%>