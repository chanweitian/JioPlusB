<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%
JSONObject newEvent = (JSONObject) session.getAttribute("newEvent");

String eventId = request.getParameter("eid");

if(!eventId.equals("null")){
	JSONArray jArray = (JSONArray) session.getAttribute("jsonArray");
	//System.out.println("Length of array"+jArray.length());
	int i = Integer.parseInt(eventId);
	newEvent = jArray.getJSONObject(i); 
}

JSONObject o1 = new JSONObject();
JSONArray options   = new JSONArray();

//System.out.println("Event Titel"+newEvent.get("eventTitle"));

try{
	options = newEvent.getJSONArray("options");
} catch(Exception e){
	System.out.println("No options yet");
}

o1.put("eventDate", request.getParameter("eventDate"));
o1.put("eventTime", request.getParameter("eventTime"));
o1.put("yes","Rachel");
o1.put("no","");
options.put(o1);
newEvent.put("options",options);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Meal Options Selector</title>
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
            $('.locationOptions').slick({});
			 $('.priceOptions').slick({

            });
			$('.cuisineOptions').slick({

            });
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
<div class="container"><h2>Where do you want to eat?</h2>
</div>
<div class="locationOptions">
        <div><img src="images/options/allLocations.png"></div>
        <div><img src="images/options/central.png"></div>
        <div><img src="images/options/north.png"></div>
        <div><img src="images/options/south.png"></div>
        <div><img src="images/options/east.png"></div>
        <div><img src="images/options/west.png"></div>
    </div>
    
    <div class="priceOptions">
        <div><img src="images/options/allPrices.png"></div>
        <div><img src="images/options/10.png"></div>
        <div><img src="images/options/20.png"></div>
        <div><img src="images/options/30.png"></div>
        <div><img src="images/options/31.png"></div>
    </div>
    
        <div class="cuisineOptions">
        <div><img src="images/options/allCuisines.png"></div>
        <div><img src="images/options/chinese.png"></div>
        <div><img src="images/options/indian.png"></div>
        <div><img src="images/options/italian.png"></div>
        <div><img src="images/options/japanese.png"></div>
        <div><img src="images/options/korean.png"></div>
        <div><img src="images/options/malay.png"></div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
