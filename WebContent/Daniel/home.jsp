  <%@page contentType="text/html; charset=UTF-8"%>
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

    <title>Home</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../css/navbar-fixed-top.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    
    <!-- for testing of event list -->
		 <%    		
    		
    
		 /* JSONObject a = new JSONObject();
			a.put("eventTitle", "Let's Kick Ball");
			a.put("eventDate", "28th October 2014");
			a.put("eventTime", "12-3 pm");
			a.put("eventLocation", "Jurong Football Club");
			a.put("eventType", "Futsal");
			a.put("numberOfMems", 10);
			a.put("members","Tim, Jane, Abigal, Michelle, Terry, Robin Van Persie, Rooney, Messi, Ronaldo, Gerrard, Fanti Ahmad, justin bieber");
			
			JSONObject b = new JSONObject();
			b.put("eventTitle", "Dinner meetup");
			b.put("eventDate", "20th October 2014");
			b.put("eventTime", "7-9 pm");
			b.put("eventLocation", "Kith cafe");
			b.put("eventType", "Dinner");
			b.put("numberOfMems", 3);
			b.put("members","Lim Beh, Lim Bu");
			
			JSONObject c = new JSONObject();
			c.put("eventTitle", "Avengers 2!");
			c.put("eventDate", "10th October 2014");
			c.put("eventTime", "12-5 pm");
			c.put("eventLocation", "The Cathay");
			c.put("eventType", "Movie");
			c.put("numberOfMems", 2);
			c.put("members","Brad Pitt");
			
			JSONArray jArray = new JSONArray();
			jArray.put(a);
			jArray.put(b);
			jArray.put(c);
			
			session.setAttribute("jsonArray", jArray);
  			*/
  		%>  
  		
  		
  		<!-- testing for data -->
  			<%
  			JSONArray jArray = (JSONArray) session.getAttribute("jsonArray");
  			if (jArray==null) {
  				jArray = new JSONArray();
  				session.setAttribute("jsonArray", jArray);
  			}
  			%>
  		
  		<!--  check whether user has confirmed event in eventConfirmation page -->
  		<%
  			if (null == session.getAttribute("confirm")){
  				
  			} else {
	  			String value = session.getAttribute("confirm").toString();
	  			if (value.equals("true")) {
	  				if (null == session.getAttribute("newEvent")) {
	  					
	  				}else {
		  				JSONObject newEvent = (JSONObject) session.getAttribute("newEvent");
		  				
		  				if(newEvent.getJSONArray("options").length()==1){
		  					jArray.put(newEvent);
		  				}
		  				session.removeAttribute("confirm");
		  				session.removeAttribute("newEvent");
	  				}	
	  			}
  			}	
  		%>
  		

<script>
function pass(val) {
	var value = val
	window.location = 'eventView.jsp?id='+val
}
</script>

  </head>


<body>
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
        	<a class="navbar-brand"><span class="glyphicon glyphicon-th-list"></span></a>
			<!-- <button class="btn btn-default customized-navbar-btn"><span class="glyphicon glyphicon-th-list"></span></button> -->
			<a class="navbar-brand pull-right" href="titleCreation.jsp">New    <span class="glyphicon glyphicon-plus"></span></a>
        </div>        
      </div>
    </div>
    	
    
    <div class="container">
    	<%
    		if (null == session.getAttribute("jsonArray")) { %>
    			<h3 class="center-block">You currently have no events!</h3>			    
    	<% 	} else {
    			if  (jArray.length() == 0) { %>
    					<h3>You currently have no events!</h3>		
    	<% 		} else { %>
    	
    				<table class="table table-bordered">
    	
    	<% 			for (int i =0; i<jArray.length(); i++) {
    					JSONObject json = jArray.getJSONObject(i);
    					String members = json.getString("members");
    					if (members.contains("Daniel")) {
	    					JSONArray options = json.getJSONArray("options");
	    					String eventTitle = json.getString("eventTitle");
	    					String eventType = json.getString("eventType"); 
	    					
	    					int numberOfMems = json.getInt("numberOfMems"); 
				  			%>
	    					
	    					<tr id="<%=i %>" onclick="pass(this.id)"><td>
							<strong><%=eventTitle%></strong><br />
							<%
							if (options.length()==1) { 
								JSONObject o1 = options.getJSONObject(0);
								String eventDate = o1.getString("eventDate");
		    					String eventTime = o1.getString("eventTime");
		    					String eventLocation = o1.getString("eventLocation");
		    					String yes = o1.getString("yes");  
					  			String no = o1.getString("no");
					  			boolean voteYes = false;
					  			if(yes.contains("Daniel")){
					  				voteYes = true;
					  			}
								boolean voteNo = false;
					  			if(no.contains("Daniel")){
					  				voteNo = true;
					  			}
					  			boolean responded = false;
					  			if (voteYes||voteNo) {
					  				responded = true;
					  			}
							%>
								<%=eventType %><br />
								<%=eventDate %><br />
								<%=eventTime %><br />
								<%=eventLocation %><br />
								<%=numberOfMems%> invitees<br />
								<% if (responded) { %>
									<%="<span class='label label-info'>Responded</span>" %>
								<% } else { %>
									<%="<span class='label label-warning'>Awaiting Your Response</span>" %>
								<% } %>
							<% } else {
								boolean responded = false;
								for (int j=0; j<options.length(); j++) {
									JSONObject o = options.getJSONObject(j);
			    					String yes = o.getString("yes");  
						  			String no = o.getString("no");
						  			boolean voteYes = false;
						  			if(yes.contains("Daniel")){
						  				voteYes = true;
						  			}
									boolean voteNo = false;
						  			if(no.contains("Daniel")){
						  				voteNo = true;
						  			}
						  			if (voteYes||voteNo) {
						  				responded = true;
						  			}
								}
							%>
								<%=eventType %><br />
								<%=numberOfMems%> invitees<br />
								<%=options.length() %> options available<br />
								<% if (responded) { %>
									<%="<span class='label label-info'>Responded</span>" %>
								<% } else { %>
									<%="<span class='label label-warning'>Awaiting Your Response</span>" %>
								<% }
							} %>
									
							</td></tr>
					<% } %>
    	<% 			} %> 	
					</table>
    	<% 		}
    		}
    	%>	
    	
    
    </div>
</body>
</html>