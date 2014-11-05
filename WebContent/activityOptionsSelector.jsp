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

    <title>Activity Options Selector</title>
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/navbar-fixed-top.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="slick/slick.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $('.locationOptions').slick();
			$('.activityOptions').slick();
        });
    </script>
    

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
	window.location.href = "chooseLocation.jsp";
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
<div class="container"><h2>What do you want to do?</h2>
</div>
    <div class="locationOptions">
        <div><img src="images/options/allLocations.png"></div>
        <div><img src="images/options/central.png"></div>
        <div><img src="images/options/north.png"></div>
        <div><img src="images/options/south.png"></div>
        <div><img src="images/options/east.png"></div>
        <div><img src="images/options/west.png"></div>
    </div>
    
    <div class="activityOptions">
        <div><img src="images/options/allSports.png"></div>
        <div><img src="images/options/archery.png"></div>
        <div><img src="images/options/bowling.png"></div>
        <div><img src="images/options/cricket.png"></div>
        <div><img src="images/options/futsal.png"></div>
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
