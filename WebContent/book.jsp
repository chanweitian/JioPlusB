<%session.setAttribute("book","true"); %>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Booking Confirmation</title>
    
     <!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.css" rel="stylesheet">
	    <!-- Custom styles for this template -->
	    <link href="css/navbar-fixed-top.css" rel="stylesheet">
	    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
	    
	    <script>
			function goBack() {
    			window.history.back()
			}
					
		</script>
		
		<!-- for testing of event list -->
		  <%-- <% JSONObject a = new JSONObject();
			a.put("eventTitle", "Let's Kick Ball");
			a.put("eventDate", "28th October 2014");
			a.put("eventTime", "12-3 pm");
			a.put("eventLocation", "Jurong Football Club");
			a.put("eventType", "Futsal");
			a.put("eventAddress","2 Jurong East St 21 Singapore 609517");
			a.put("numberOfMems", 10); 
			a.put("members","Tim,Jane,Abigal,Michelle,Terry,Robin Van Persie,Rooney,Messi,Ronaldo,Gerrard,Fanti Ahmad,justin bieber");
			session.setAttribute("newEvent", a);
			%> --%>
		
	
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
        	<a class="btn btn-default customized-navbar-btn" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left"></span>Back</a>
			<a class="navbar-brand pull-right" href="home.jsp">Home    <span class="glyphicon glyphicon-home"></span></a>
        </div>        
      </div>
    </div>
 
    	<% if (null == session.getAttribute("jsonArray")) { %>
    			<h3> oops something went wrong here.</h3>
    	<% } else {
    			JSONArray jArray = (JSONArray) session.getAttribute("jsonArray");
    			int id = 0;
    			try {
    				id = Integer.parseInt(request.getParameter("id"));
    			} catch (NumberFormatException e) {
    				e.printStackTrace();
    			}
	     		JSONObject json = jArray.getJSONObject(id);
     			String eventTitle = json.getString("eventTitle");
				String eventType = json.getString("eventType"); 
				JSONArray jsonOptions = json.getJSONArray("options");
				JSONObject option = jsonOptions.getJSONObject(1);
				String eventDate = option.getString("eventDate");
				String eventTime = option.getString("eventTime");
				String eventLocation = option.getString("eventLocation");
	     		%>
	     		<div class="container">
	     			<div class="customized-row">
		     			<% if (eventType.equals("Meal")) { %>
							<img class="img-rounded" alt="Rounded Image" src="images/Meal.png" height="20%" width="100%" >
						<% } else { %>
							<img class="img-rounded" alt="Rounded Image" src="images/Activity.png" height="20%" width="100%" >
						<% } %>
		     		</div> 
	     		</div>
	     		
	     		
	     		
	     		<div class = "customized-container-fluid">	
		     		<div class="row"> 
		     			 <div class="col-xs-8 col-md-3 pull-left">
		     			 	<span class="glyphicon glyphicon-info-sign"></span>
		     				<font size="4"><strong> <%=eventTitle %></strong></font>
		     			 </div>
		     			 
		     			  <div class="col-xs-4 col-md-3">
		     			 	<font size="3" color="grey"><center><%=eventType %></center></font>
		     			 </div>	     			
		     		</div>
		     		
		     		<div class="row"> 
		     			  <div class="col-xs-12 col-md-12">
		     			 	<font size="3" ><%=eventDate %></font>
		     			 </div>	     			
		     		</div>
		     		
		     		<div class="row"> 
		     			  <div class="col-xs-12 col-md-1 ">
		     			 	<font size="3" ><%=eventTime %></font>
		     			 </div>	     			
		     		</div>
		    				     		
		    		<br />
		    		
		     		<%
		     			String eventAddress = "81 Victoria St, 188065";
		     		%>
		     		
		     		<div class="row"> 
		     			  <div class="col-xs-12 col-md-1 ">
		     			 	<font size="3" ><%=eventLocation %></font>
		     			 </div>	     			
		     		</div>
		     		
		     		<div class="row"> 
		     			  <div class="col-xs-8 col-md-1 ">
		     			 	<font size="3" ><%= eventAddress %></font>
		     			 </div>	     			
		     		</div>
		    		
		    		<br /><br />
		    		
		    		<div class="row"> 
		     			  <div class="col-xs-8 col-md-1 ">
		     			 	<font size="3" >Reservation & Booking has been made</font>
		     			 </div>	     			
		     		</div>
       
			<% } %>	

</body>
</html>