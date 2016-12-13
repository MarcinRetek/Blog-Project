<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- header -->
<jsp:include page="header.jsp">
	<jsp:param value="loginScripts.js" name="jsFile"/>
</jsp:include>

<body>

	<!-- login form -->
	<div class="login">
		<div class="heading">
			<h2 class="head">Log in</h2>
					<form name="login" action="login.jsp" method="POST" accept-charset="utf-8">
    	
    					<div class="input-group">
        					<input type="text" id="form" name="username" placeholder="Username" required>
        				</div>
        				<div class="input-group">
        					<input type="password" id="form" name="password" placeholder="Password" required><br>
        				</div>
        					<button id="loginbutton" type="submit" value="Login">Log in</button>
    	
					</form>	
		</div>
		
		<!-- Super secure hard coded login technology -->
			<%  String username = request.getParameter("username");
				String password = request.getParameter("password");
				if(username != null && password != null ){

					if(username.equals("fire") && password.equals("fly")){
						session.setAttribute("admin", "true");
						String redirect = "index.jsp";
						response.sendRedirect(redirect);
						
					}else{%>
	         			 <div class="alert alert-danger">Invaild username or password.</div><%
					}
				} %>
		</div>
	<div class="push"></div>
	
<!-- footer -->
<%@include file="footer.jsp" %>

</body>
</html>