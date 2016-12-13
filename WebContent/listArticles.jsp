<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="main.ArticleType"%>
<%@page import="main.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.DataServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	
	String selectedType = request.getParameter("category");
	
	String title = "";
	
	switch(selectedType){
	case "NEWS":
		title = "News";
		break;
	case "FEATURE":
		title = "Features";
		break;
	case "NOTICE":
		title = "Notices";
		break;
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Header -->
<jsp:include page="header.jsp">
	<jsp:param value="listScripts.js" name="jsFile"/>
</jsp:include>

<div class="container">
<h1>All <%=title %></h1>
        
        <!-- Listing of selected articles -->
        <div class="list">
            <% for(int i = 0; i < DataServlet.blogList.size(); i++ ) {
				if(DataServlet.blogList.get(i).getType().toString().equals(selectedType)) {
					//Set default image for all new articles
				    int imgId = i;
				    if(i > 11){
				    	imgId = 11;
				    }
			%> 
			<a href="viewArticle.jsp?id=<%=i %>">
   				<div class="article">
          			<img src="images/<%=imgId %>-small.jpg" class="img-responsive">
           			<h2><%=DataServlet.blogList.get(i).getTitle() %></h2>
           			<p id="listArticle"><%=DataServlet.blogList.get(i).getContent() %></p>
       			</div>
       		</a>
       		<div class="clear"></div>
   			<%}
			} %>
		</div>
</div>

<!-- footer -->
<%@include file="footer.jsp"%>


</body>

</html>