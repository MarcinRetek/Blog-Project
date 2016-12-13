<%@page import="main.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.DataServlet"%>
<%@page import="java.util.Calendar"%>
<%@page import="main.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- header -->
<jsp:include page="header.jsp">
	<jsp:param value="articleScripts.js" name="jsFile"/>
</jsp:include>

<!-- get article data list, and use the data associated with the selected article -->
<%
	ArrayList<Article> articleList = DataServlet.getBlogList();

	int articleId = Integer.parseInt(request.getParameter("id"));

	String articleTitle = articleList.get(articleId).getTitle();
	String articleAuthor = articleList.get(articleId).getAuthor();
	String articleContent = articleList.get(articleId).getContent();

	//Get posted comment data for new comment
    String author = request.getParameter("authorName");
    Calendar date = Calendar.getInstance(); 
    String message = request.getParameter("messageBody");
    if(author != null && message != null ){
        
        if(!author.equals("") && !message.equals("")){
            articleList.get(articleId).getComments().add(new Comment(author, date, message));
        }
    }
    
    //Set default image for all new articles
    int imgId = articleId;
    if(articleId > 11){
    	imgId = 11;
    }
%>

	<!-- top jumbotron -->
    <div class="jumbotron" id="mainJumbo" style="background-image: url('images/<%=imgId %>-big.jpg');">
    </div>
    <div class="container">
        <div class="row">
        	<!-- the article -->
            <div class="col-sm-8" id="articleColumn">
            <div class="articleTitle"><h3><%=articleTitle %></h3></div>
            <div class="articleAuthor"><h4>By <%=articleAuthor %></h4></div>
            <div class="articleBody"><p><%=articleContent %></p></div>
            
            <!-- comment entry -->
             <form  action="viewArticle.jsp?id=<%=articleId%>" method="POST">
                        <input type="text" name="authorName" placeholder="Name/Lastname" required><br>
                        <textarea rows="1" cols="1" name="messageBody" placeholder="Add a public comment..." required></textarea><br>
                <button type="submit" value="Submit">Add comment</button>
                <button type="reset" value="Reset">Reset</button>
             </form>
             <div class="comments-list">
             
            <% for(int i = articleList.get(articleId).getComments().size()-1; i >= 0 ; i--){%>
            
            <!-- comment section -->
            <div class="comment-entry">
                <div class="content-author">
               		<span class="bold">
                    <%=articleList.get(articleId).getComments().get(i).getAuthor() %>
                    </span>
                    <%=articleList.get(articleId).getComments().get(i).getDate().getTime().toLocaleString() %>
                    
                </div>
            </div>
            <div class="content-text">
                <%=articleList.get(articleId).getComments().get(i).getMessage()%>
            </div>
                
            <%}%>
            </div>
            </div>
            <!-- sidebar -->
            <div class="col-sm-4" id="smallOne">
                <% for(int i = 6; i < 12; i++ ){%> 
                <a href="viewArticle.jsp?id=<%=articleList.get(i).getId() %>">
	                <div class="article ">
	                    <img src="images/<%=i %>-small.jpg" class="img-responsive">
	                    <h2><%=articleList.get(i).getTitle() %></h2>
	                    <p id="smallOneArticle<%=i %>"><%=articleList.get(i).getContent() %></p>
	                </div>
                </a>
                <%}%>
            </div>
        </div>
    </div>
<!-- footer -->
<%@include file="footer.jsp"%>


</body>

</html>
