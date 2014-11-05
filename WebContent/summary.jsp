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

    <title>Event</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/navbar-fixed-top.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    
    <%String id = request.getParameter("id"); %>
        <script>
function goBack() {
    window.history.back();
}

function selectBook(i){
	// set yes to selected
	window.location.href = "book.jsp?id="+<%=id%>;
}
</script>

 <style>
    
    .optionYes {
    	color:white;
    	background-color:#78E853;
    }
    
    .optionNo {
    	color:white;
    	background-color: #D11919;
    }
    
	.optionHeader{
		margin-top:1em;
	}

    </style>


<!-- for testing of event list -->
<% 
/*
	session.setAttribute("user", "Lim Beh");
	
 	JSONObject a = new JSONObject();
	a.put("eventTitle", "Let's Kick Ball");
	a.put("eventDate", "28th October 2014");
	a.put("eventTime", "12-3 pm");
	a.put("eventLocation", "Jurong Football Club");
	a.put("eventType", "Futsal");
	a.put("numberOfMems", 10);
	a.put("members","Tim, Jane, Abigal, Michelle, Terry, Robin Van Persie, Rooney, Messi, Ronaldo, Gerrard, Fanti Ahmad, justin bieber");
	
	JSONObject b = new JSONObject();
	JSONArray options   = new JSONArray();
	
	JSONObject o1 = new JSONObject();
	o1.put("eventDate", "20th Oct 14");
	o1.put("eventTime", "7-9 pm");
	o1.put("eventLocation", "Kith cafe");
	o1.put("eventType", "Dinner");
	o1.put("yes","");
	o1.put("no","Lim Bu,Lim Beh");
	
	JSONObject o2 = new JSONObject();
	o2.put("eventDate", "30th Oct 14");
	o2.put("eventTime", "7-8 pm");
	o2.put("eventLocation", "49 Seats");
	o2.put("eventType", "Dinner");
	o2.put("yes","Lim Beh, Lim Bu");
	o2.put("no","");
	
	
	options.put(o1);
	options.put(o2);
	
	b.put("eventTitle", "Dinner meetup");
	b.put("numberOfMems", 3);
	b.put("members","Lim Beh, Lim Bu");
	b.put("options",options);
	
	
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



  </head>
  
  <body>
    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
        
<a class="navbar-brand" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left"></span>Back</a>

        </div>        
      </div>
    </div>


	
	
	
    	<% 
    			
		       	String query = request.getQueryString();
		       	String lastChar = ""+ query.charAt(query.length()-1);
       			int index = Integer.parseInt(lastChar);
	     		JSONArray jArray = (JSONArray) session.getAttribute("jsonArray");
	     		
	     		JSONObject json = jArray.getJSONObject(index);
		    	String eventTitle = json.getString("eventTitle");
		  		JSONArray jsonOptions = json.getJSONArray("options");
		  		String user = (String)session.getAttribute("user");
		  		
		  		%>
		  		
		  		<div class="container-fluid">
		  		
		  		<% for(int i=0; i<jsonOptions.length(); i++){ 
		  			
		  			JSONObject option = jsonOptions.getJSONObject(i);
		  			
					String eventDate = option.getString("eventDate");
					String eventTime = option.getString("eventTime");
					String eventLocation = option.getString("eventLocation");
					 
					String yes = option.getString("yes");  
		  			String no = option.getString("no");
		  			
		  			
		  			int yesCount = 0;
		  			int noCount = 0;
		  			
		  			
		  			if(yes.contains(",")){
		  				yesCount = yes.split(",").length;
		  			} else {
		  				if(yes.length()>0){
		  					yesCount = 1;
		  				}
		  			}
		  			
		  			if(no.contains(",")){
		  				noCount = no.split(",").length;
		  			} else {
		  				if(no.length()>0){
		  					noCount = 1;
		  				}
		  			}
		  			
		  		%>
		  		
		  		<div class="row">
		  			<div class="col-xs-12 optionHeader"><%= eventLocation %></div>
		  			<div class="col-xs-5 optionDateTime"><%= eventDate %></br><%= eventTime %></div>
		  			<div class="col-xs-2 optionYes">YES</br><%=yesCount %></div>
		  			<div class="col-xs-2 optionNo">NO</br><%=noCount %></div>
		  			<% if (session.getAttribute("book")==null) { %>
		  			<div class="col-xs-3 optionBook" onclick="selectBook(<%=i%>)">BOOK</div>  
		  			<% } %>			
		  		</div>
		  		
		  		
		  		<% }%>
		  				  		
		  		</div>
		  		
		  		
    	

		  
		  
		  		
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>