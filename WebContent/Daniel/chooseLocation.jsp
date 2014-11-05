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

String eventType = newEvent.getString("eventType"); 
%>
<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Welcome</title>
    <link rel="stylesheet" type="text/css" href="../slick/slick.css"/>
  	<link href="../css/bootstrap.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="../slick/slick.min.js"></script>

     <script>
    function goBack() {
        window.history.back();
    }

    function goNext(eventType) {
        var current = $('.welcomeSlides').slickCurrentSlide();
        
        var location = "";
        
		if (eventType=="Meal") {
	        if(current ==0){
	            location = "Ippudo Mandarin Gallery";
	        } else if(current == 1){
	            location = "Kiseki";
	        } else if (current == 2){
	            location = "Mikuni";
	        }
	    } else {
	    	if(current ==0){
	            location = "Cage@Clementi";
	        } else if(current == 1){
	            location = "Jurong Stadium";
	        } else if (current == 2){
	            location = "NTU Guild House";
	        }
	    }
        window.location.href = "eventConfirmation.jsp?location="+location;
    }
    </script>
  	<style>
	.slick-dots li button:before{
		color: white !important;
	}
	
	.slick-prev{
		left: 0px !important;
	}
	.slick-next{ 
	    right: 0px !important;
	}
	
	.slick-dots{
		bottom: 0px !important;
		
	}
	</style>
	

    <script type="text/javascript">
        $(document).ready(function(){
            $('.welcomeSlides').slick({
            	arrows: true,
            	infinite: false
            });
        });
    </script>


    </head>
    <body>

 <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
<a class="navbar-brand" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left"></span>Back</a>
<a class="navbar-brand pull-right" onclick="goNext()">Next<span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>        
      </div>
    </div>

	<br /><br />
	
    <div class="welcomeSlides">
        <% if (eventType.equals("Meal")) { %>
        <div><img src="../images/Restaurant1.png"><img src="../images/Restaurant1.png"></div>
        <div><img src="../images/Restaurant2.png"><img src="../images/Restaurant2.png"></div>
        <div><img src="../images/Restaurant3.png"><img src="../images/Restaurant3.png"></div>
        <% } else { %>
        	<div><img src="../images/Location1.png"><img src="../images/Location1.png"></div>
            <div><img src="../images/Location2.png"><img src="../images/Location2.png"></div>
            <div><img src="../images/Location3.png"><img src="../images/Location3.png"></div>
        <% }
        %>
    </div>
    
    </body>
</html>