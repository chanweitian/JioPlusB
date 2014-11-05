<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%

JSONObject newEvent = (JSONObject) session.getAttribute("newEvent");

String eventId = request.getParameter("eid");
if(eventId != null){
	JSONArray jArray = (JSONArray) session.getAttribute("jsonArray");
	int i = Integer.parseInt(eventId);
	newEvent = jArray.getJSONObject(i); 
} else {
	String invitees = request.getParameter("invitees");
	String members = invitees.replaceAll(",", ", ") + ", Rachel";
	newEvent.put("members", members);
	String[] arr = invitees.split(",");
	newEvent.put("numberOfMems", arr.length);
}
String eventType = newEvent.getString("eventType");

session.setAttribute("newEvent",newEvent);

%>

<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Choose A Timing</title>
    
  	<link href="css/bootstrap.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


     <script>
    function goBack() {
        window.history.back();
    }

    function goNext(eventType) {
        var current = $('.welcomeSlides').slickCurrentSlide();
        
        var eventDate = "";
        var eventTime = "";

        if (eventType=="Meal") {
	        if(current ==0){
	        	eventDate = "28 Oct 2014";
	        	eventTime = "6:00PM-9:00PM";
	        } else if(current == 1){
	        	eventDate = "03 Nov 2014";
	        	eventTime = "8:00PM-10:00PM";
	        } else if (current == 2){
	        	eventDate = "10 Nov 2014";
	        	eventTime = "5:30PM-8:00PM";
	        } else if (current == 3){
	        	eventDate = "20 Nov 2014";
	        	eventTime = "7:00PM-9:30PM";
	        }
        } else {
        	if(current ==0){
	        	eventDate = "01 Dec 2014";
	        	eventTime = "10:00AM-2:00PM";
	        } else if(current == 1){
	        	eventDate = "05 Dec 2014";
	        	eventTime = "12:00PM-3:00PM";
	        } else if (current == 2){
	        	eventDate = "06 Dec 2014";
	        	eventTime = "8:00AM-11:00AM";
	        } else if (current == 3){
	        	eventDate = "17 Dec 2014";
	        	eventTime = "10:00AM-1:00PM";
	        }
        }
        
        if (eventType=="Meal") {
        	window.location.href = "mealOptionsSelector.jsp?eid=<%=eventId%>&eventDate=" + eventDate + "&eventTime=" + eventTime;
        } else {
        	window.location.href = "activitySelector.jsp?eid=<%=eventId%>&eventDate=" + eventDate + "&eventTime=" + eventTime;
        }
    }
    </script>

    

    </head>
    <body>

 <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
<a class="navbar-brand" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left"></span>Back</a>
<!-- <a class="navbar-brand pull-right" onclick="goNext('<%= eventType %>')">Next<span class="glyphicon glyphicon-chevron-right"></span></a> -->
        </div>        
      </div>
    </div>

	<br /><br />
	<div class="container"><h2>When do you want to go?</h2></div>
	
    <div class="welcomeSlides">
    	<% if (eventType.equals("Meal")) { %>
	        <a href="mealOptionsSelector.jsp?eid=<%=eventId%>&eventDate=28 Oct 2014&eventTime=6:00PM-9:00PM">
  				<img style="float:left" src="images/NewWeatherTemplate.png" width="320" height="130" >
			</a>
	        <a href="mealOptionsSelector.jsp?eid=<%=eventId%>&eventDate=28 Oct 2014&eventTime=6:00PM-9:00PM">
  				<img style="float:left" src="images/NewWeatherTemplate.png" width="320" height="130" >
			</a>
			<a href="mealOptionsSelector.jsp?eid=<%=eventId%>&eventDate=28 Oct 2014&eventTime=6:00PM-9:00PM">
  				<img style="float:left" src="images/NewWeatherTemplate.png" width="320" height="130" >
			</a>
			<a href="mealOptionsSelector.jsp?eid=<%=eventId%>&eventDate=28 Oct 2014&eventTime=6:00PM-9:00PM">
  				<img style="float:left" src="images/NewWeatherTemplate.png" width="320" height="130" >
			</a>
	    <% } else { %>
	    	<a href="mealOptionsSelector.jsp?eid=<%=eventId%>&eventDate=28 Oct 2014&eventTime=6:00PM-9:00PM">
  				<img style="float:left" src="images/NewWeatherTemplate.png" width="320" height="130" >
			</a>
			<a href="mealOptionsSelector.jsp?eid=<%=eventId%>&eventDate=28 Oct 2014&eventTime=6:00PM-9:00PM">
  				<img style="float:left" src="images/NewWeatherTemplate.png" width="320" height="130" >
			</a>
			<a href="mealOptionsSelector.jsp?eid=<%=eventId%>&eventDate=28 Oct 2014&eventTime=6:00PM-9:00PM">
  				<img style="float:left" src="images/NewWeatherTemplate.png" width="320" height="130" >
			</a>
			<a href="mealOptionsSelector.jsp?eid=<%=eventId%>&eventDate=28 Oct 2014&eventTime=6:00PM-9:00PM">
  				<img style="float:left" src="images/NewWeatherTemplate.png" width="320" height="130" >
			</a>
	    <% } %>
    </div>
    </body>
</html>
