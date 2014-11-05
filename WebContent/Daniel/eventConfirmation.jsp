  <%@page contentType="text/html; charset=UTF-8"%>
  <%@page import="org.json.JSONObject"%>
  <%@page import="org.json.JSONArray"%>
  
  <%
JSONObject newEvent = (JSONObject) session.getAttribute("newEvent");
String eventId = (String) session.getAttribute("eid");

if (eventId!=null) {
	JSONArray jArray = (JSONArray) session.getAttribute("jsonArray");
	int i = Integer.parseInt(eventId);
	newEvent = jArray.getJSONObject(i); 
}

JSONArray options = newEvent.getJSONArray("options");
JSONObject o1 = options.getJSONObject(0);
if (eventId!=null) {
	o1 = options.getJSONObject(1);
}

o1.put("eventLocation", request.getParameter("location"));
%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Event Confirmation</title>
    
     <!-- Bootstrap core CSS -->
	    <link href="../css/bootstrap.css" rel="stylesheet">
	    <!-- Custom styles for this template -->
	    <link href="../css/navbar-fixed-top.css" rel="stylesheet">
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
        	<a class="btn btn-default customized-navbar-btn" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left"></span>Change</a>
			<a class="btn btn-default customized-navbar-btn pull-right" href="home.jsp" onclick=<%session.setAttribute("confirm", "true"); session.removeAttribute("eid"); %>>Confirm    <span class="glyphicon glyphicon-thumbs-up"></span></a>
        </div>        
      </div>
    </div>
 
    	<% if (null == session.getAttribute("newEvent")) { %>
    			<h3> opps something went wrong here.</h3>
    	<% } else {
	    		JSONObject json = (JSONObject) session.getAttribute("newEvent");
	
	    		if (eventId!=null) {
	    			JSONArray jArray = (JSONArray) session.getAttribute("jsonArray");
	    			int i = Integer.parseInt(eventId);
	    			json = jArray.getJSONObject(i); 
	    		}
	
	    		JSONArray jsonOptions = newEvent.getJSONArray("options");
	    		JSONObject option = options.getJSONObject(0);
	    		if (eventId!=null) {
	    			option = options.getJSONObject(1);
	    		}

     			String eventTitle = json.getString("eventTitle");
				String eventType = json.getString("eventType"); 
				String eventDate = option.getString("eventDate");
				String eventTime = option.getString("eventTime");
				String eventLocation = option.getString("eventLocation");
	     		%>
	     		<div class="container">
	     			<div class="customized-row">
		     			<% if (eventType.equals("Meal")) { %>
							<img class="img-rounded" alt="Rounded Image" src="../images/Meal.png" height="20%" width="100%" >
						<% } else { %>
							<img class="img-rounded" alt="Rounded Image" src="../images/Activity.png" height="20%" width="100%" >
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
		     				    
		    		<%
						String members = json.getString("members"); 
						String[] memberList = members.split(",");
						int numberOfMems = memberList.length;
						
		    		%>
		    		
		    		<br />
		    		
					<div class="row"> 
		     			  <div class="col-xs-8 col-md-1 ">
		     			 	<font size="4" >Invitees</font>
		     			 	<span class="badge"><%=numberOfMems %></span>
		     			 </div>	     			
		     		</div>
		     				     		
		     		<div class="row">
		     		
		     			<%
		     				for (String name:memberList) {
		     			%>
				     		<div class="col-xs-4 col-md-1">
				            	<a href="#">
				                <img src="../images/stickman.png" class="img-circle" alt="Circular Image" width="80%" height="80%">
				           		 </a>
				           			<div>
				           				<font size="3"><center><%=name %></center></font>
				           			</div>
				           		 
				           	</div>	 
				         <% } %>
			        </div> 	
       
			<% } %>	

</body>
</html>