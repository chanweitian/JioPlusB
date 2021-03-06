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
    <link rel="stylesheet" type="text/css" href="slick/slick_custom.css"/>
  	<link href="css/bootstrap.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="slick/slick.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

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
	
	.panel{
		margin-bottom: 0px !important;
		position: relative;
	}
	
	
	#infoButton{
		width: 14px;
		z-index: 99;
		position: absolute;
		right: 10px;
		top: 75px;
	}
	
	.white, .white a {
  color: #fff;
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
<!-- <a class="navbar-brand pull-right" onclick="goNext('<%= eventType %>')">Next<span class="glyphicon glyphicon-chevron-right"></span></a> -->
        </div>        
      </div>
    </div>

	<br /><br />
	
	
	 
	<div id="accordion">
	<% if (eventType.equals("Meal")) { %>
		 <div class="panel">
		 
		 <a href="eventConfirmation.jsp?location=Ippudo">
		 <img src="images/Ippudo.png">
		 </a>
		<div id = "infoButton" data-toggle="collapse" data-target="#pic1" data-parent="#accordion">
				<span class="glyphicon glyphicon-info-sign white"></span>
		</div> 
		<div id="pic1" class="collapse "><img src="images/RestaurantFull3.png"></div>
		</div>
		
		 <div class="panel">
		 <a href="eventConfirmation.jsp?location=Kiseki">
		 <img src="images/Kiseki.png">
		 </a>
		<div id = "infoButton" data-toggle="collapse" data-target="#pic2" data-parent="#accordion">
				<span class="glyphicon glyphicon-info-sign white"></span>
		</div> 
		<div id="pic2" class="collapse "><img src="images/RestaurantFull3.png"></div>
		</div>
		
		
		 <div class="panel">
		 <a href="eventConfirmation.jsp?location=Mikuni">
		 <img src="images/Mikuni.png">
		 </a>
		<div id = "infoButton" data-toggle="collapse" data-target="#pic3" data-parent="#accordion">
				<span class="glyphicon glyphicon-info-sign white"></span>
		</div> 
		<div id="pic3" class="collapse "><img src="images/RestaurantFull3.png"></div>
		</div>
		
	 <% } else { %>
	 
	 <div class="panel">
		 
		 <a href="eventConfirmation.jsp?location=Cage@Clementio">
		 <img src="images/Cage_Clementi.png">
		 </a>
		<div id = "infoButton" data-toggle="collapse" data-target="#pic1" data-parent="#accordion">
				<span class="glyphicon glyphicon-info-sign white"></span>
		</div> 
		<div id="pic1" class="collapse "><img src="images/Location3Full.png"></div>
		</div>
		
		 <div class="panel">
		 <a href="eventConfirmation.jsp?location=Jurong Stadium">
		 <img src="images/Jurong_Stadium.png">
		 </a>
		<div id = "infoButton" data-toggle="collapse" data-target="#pic2" data-parent="#accordion">
				<span class="glyphicon glyphicon-info-sign white"></span>
		</div> 
		<div id="pic2" class="collapse "><img src="images/Location3Full.png"></div>
		</div>
		
		
		 <div class="panel">
		 <a href="eventConfirmation.jsp?location=NTU Guild House">
		 <img src="images/NTU_Guild.png">
		 </a>
		<div id = "infoButton" data-toggle="collapse" data-target="#pic3" data-parent="#accordion">
				<span class="glyphicon glyphicon-info-sign white"></span>
		</div> 
		<div id="pic3" class="collapse "><img src="images/Location3Full.png"></div>
		</div>
	 

        <% }
        %>

	

	</div>
    
    </body>
</html>