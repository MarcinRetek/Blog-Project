<%@page import="main.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.DataServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Header -->
<jsp:include page="header.jsp">
	<jsp:param value="indexScripts.js" name="jsFile"/>
</jsp:include>

<!-- Get the list of articles -->
<% ArrayList<Article> articleList = DataServlet.getBlogList(); %>

<!-- The carousel -->
		<div id ="mainCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#mainCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#mainCarousel" data-slide-to="1"></li>
				<li data-target="#mainCarousel" data-slide-to="2"></li>
			</ol>
			
			<div class="carousel-inner" role="listbox">
			    <div class="item active">
			        <div class="jumbotron" id="carouselJumbo0">
				        <div class="container">
				        	<a href="viewArticle.jsp?id=0">
				        	<h1>Headline: <%=articleList.get(0).getTitle() %></h1>
				        	<h3>Click to read more >></h3>
				        	</a>
				        </div>
			        </div>
			    </div>
			    <div class="item">
			    	<div class="jumbotron" id="carouselJumbo1">
				        <div class="container">
				        <a href="viewArticle.jsp?id=1">
				        	<h1>Headline: <%=articleList.get(1).getTitle() %></h1>
				        	<h3>Click to read more >></h3>
				        </div>
			        </div>
			    </div>
			    <div class="item">
			    	<div class="jumbotron" id="carouselJumbo2">
				        <div class="container">
				        <a href="viewArticle.jsp?id=2">
				        	<h1>Headline: <%=articleList.get(2).getTitle() %></h1>
				        	<h3>Click to read more >></h3>
				        </div>
			        </div>
			    </div>    
  			</div>
  			
  			<a class="left carousel-control" href="#mainCarousel" role="button" data-slide="prev">
		    	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    	<span class="sr-only">Previous</span>
		  	</a>
		  	<a class="right carousel-control" href="#mainCarousel" role="button" data-slide="next">
		    	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		   		<span class="sr-only">Next</span>
		 	</a>
		</div>
	<!-- Large article column -->
    <div class="container">
        
        <div class="row">
            <div class="col-md-8" id="bigOne">
            	<% for(int i = 0; i < 3; i++ ){%> 
            	
            	<a href="viewArticle.jsp?id=<%=articleList.get(i).getId() %>">
	            	<div class="article ">
	                    <img src="images/<%=i %>-small.jpg" class="img-responsive">
	                    <h2><%=articleList.get(i).getTitle() %></h2>
	                    <p id="bigOneArticle<%=i %>"><%=articleList.get(i).getContent() %></p>
	                </div>
                </a>
                
                <div class="clear"></div>
            	<%}%>
            </div>
    <!-- Sidebar -->
            <div class="col-md-4" id="smallOne">
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
    <!-- Second Jumbotron -->
        <div class="jumbotron" id="specialFeature">
        	<div class="container">
        		<a href="viewArticle.jsp?id=3">
		        	<h1>Feature: <%=articleList.get(3).getTitle() %></h1>
		        	<h3>Click to read more >></h3>
	        	</a>
	        </div>
        </div>
    <div class="container">
    <!-- Feature articles -->
        <div class="row" id="bottomOne">
            	<% for(int i = 3; i < 6; i++ ){%> 
            	<div class="col-md-4 ">
            		<a href="viewArticle.jsp?id=<%=articleList.get(i).getId() %>">
		            	<div class="article ">
		                    <img src="images/<%=i %>-small.jpg" class="img-responsive">
		                    <h2><%=articleList.get(i).getTitle() %></h2>
		                    <p id="bottomOneArticle<%=i %>"><%=articleList.get(i).getContent() %></p>
		                </div>
	                </a>
                </div>
            	<%}%>
        </div>
    </div>
    
<%@include file="footer.jsp"%>


</body>

</html>
