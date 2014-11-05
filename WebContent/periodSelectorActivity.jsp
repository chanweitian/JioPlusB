<%@page import="org.json.JSONObject"%>
<%
JSONObject newEvent = (JSONObject) session.getAttribute("newEvent");
newEvent.put("eventType", request.getParameter("eventType"));
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Period Selector</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/navbar-fixed-top.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
function goBack() {
    window.history.back();
}

function goNext() {
	if (document.getElementById("morning").style.opacity == "0.5"||document.getElementById("afternoon").style.opacity == "0.5"||document.getElementById("evening").style.opacity == "0.5"||document.getElementById("night").style.opacity == "0.5"||document.getElementById("lateNight").style.opacity == "0.5") {
		window.location.href = "invite.jsp";
	} else {
		alert("Please select a period");
	}
}
</script>
  </head>

  <body>
    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
          <div class="navbar-header">
<a class="navbar-brand" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left"></span>Back</a>
<a class="navbar-brand pull-right" onclick="goNext()">Next<span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>  
        </div>  
        </div>        
      </div>
    </div>
<div class="container"><h2>What time is your activity?</h2>
</div>

<span class="glyphicon glyphicon glyphicon-info-sign"></span> You can select more than one option.

<img style="float:left" src="images/morning.png" width="160" height="130" onclick="morningChecked()" id="morning">
<script>	
function morningChecked() {
	if (document.getElementById("morning").style.opacity == "0.5") {
		document.getElementById("morning").style.opacity = "1";
	} else {
		document.getElementById("morning").style.opacity = "0.5";
	}
}
</script>

<img style="float:left" src="images/afternoon.png" width="160" height="130" onclick="afternoonChecked()" id="afternoon">
<script>	
function afternoonChecked() {
	if (document.getElementById("afternoon").style.opacity == "0.5") {
		document.getElementById("afternoon").style.opacity = "1";
	} else {
		document.getElementById("afternoon").style.opacity = "0.5";
	}
}
</script>

<img style="float:left" src="images/evening.png" width="160" height="130" onclick="eveningChecked()" id="evening">
<script>	
function eveningChecked() {	
	if (document.getElementById("evening").style.opacity == "0.5") {
		document.getElementById("evening").style.opacity = "1";
	} else {
		document.getElementById("evening").style.opacity = "0.5";
	}
}
</script>

<img style="float:left" src="images/night.png" width="160" height="130" onclick="nightChecked()" id="night">
<script>	
function nightChecked() {	
	if (document.getElementById("night").style.opacity == "0.5") {
		document.getElementById("night").style.opacity = "1";
	} else {
		document.getElementById("night").style.opacity = "0.5";
	}
}
</script>

<img style="float:left" src="images/lateNight.png" width="320" height="142" onclick="lateNightChecked()" id="lateNight">
<script>	
function lateNightChecked() {	
	if (document.getElementById("lateNight").style.opacity == "0.5") {
		document.getElementById("lateNight").style.opacity = "1";
	} else {
		document.getElementById("lateNight").style.opacity = "0.5";
	}
}
</script>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
