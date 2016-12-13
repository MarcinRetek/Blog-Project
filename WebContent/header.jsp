<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- CSS reset -->
    <link rel="stylesheet" href="CSS/reset.css">
    <!-- custom CSS -->
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <!-- Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,400italic,700italic|Fredoka+One' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,400italic,700italic|Fredoka+One' rel='stylesheet' type='text/css'>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- Custom JavaScript -->
    <script src="scripts/${param.jsFile}"></script>
    <title>Awesome Game News</title>
</head>

<body>



    <div class="container">
        <h1 id="title"><a href="index.jsp">Awesome Game News &star; </a></h1>
    </div>
        <!-- Menu bar -->
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
			  <div class="container">
			    <ul class="nav navbar-nav">
			      <li id="menuHome"><a href="index.jsp">Home</a></li>
			      <li id="menuNews"><a href="listArticles.jsp?category=NEWS">News</a></li>
			      <li id="menuFeatures"><a href="listArticles.jsp?category=FEATURE">Features</a></li> 
			      <li id="menuNotices"><a href="listArticles.jsp?category=NOTICE">Notices</a></li>
			      
			      <!-- User sensitive button -->
			      <%
			      if (session.getAttribute("admin") != null){
				   		if (session.getAttribute("admin").equals("true")){ %>
				  <li><a href="writeArticle.jsp">Write Article</a></li><% 
				   		}
				   	}%>
			    </ul>
			   
			    <ul class="nav navbar-nav navbar-right">
			    
			      <!-- User sensitive buttons -->
			        <%
				   if (session.getAttribute("admin") != null){ 
				   		if (session.getAttribute("admin").equals("true")){%>
				  <li><a href="logout?action=logout"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li><%
				   		}
				   	}else{
						%><li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Log in</a></li><%			
					}%>
					
			    </ul>
			  </div>
		  </div>
		</nav>

    </div>