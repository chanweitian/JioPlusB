<%@page import="org.json.JSONObject"%>
  <%@page import="org.json.JSONArray"%>
<audio src="../audio/vibration.mp3" autoplay loop>
</audio>

<%
JSONArray jArray = (JSONArray) session.getAttribute("jsonArray");
JSONObject json = jArray.getJSONObject(0);
JSONArray jsonOptions = json.getJSONArray("options");
JSONObject option = jsonOptions.getJSONObject(0);
String no = option.getString("no");
no = no + ",Frederick";
option.put("no", no);
option = jsonOptions.getJSONObject(1);
String yes = option.getString("yes");
yes = yes + ",Frederick";
option.put("yes", yes);
%>
<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0;">
    <title>Notification</title>
  	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/navbar-fixed-top.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>

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
			<a class="navbar-brand pull-right" href="home.jsp">Home    <span class="glyphicon glyphicon-home"></span></a>
        </div>        
      </div>
    </div>
    	
    
    <div class="container">
    	<table class="table table-bordered">
    		<tr id="0" onclick="pass(this.id)"><td>
		    	All responses to the event 'Let's Kick Ball' has been received. Tap here to confirm the booking now!
			</td></tr>
		</table>
    
    </div>
</body>
</html>