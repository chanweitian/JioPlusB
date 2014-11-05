<audio src="../audio/vibration.mp3" autoplay loop>
</audio>

<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0;">
    <title>Notification</title>
  	<!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../css/navbar-fixed-top.css" rel="stylesheet">
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
		    	You have been invited to 'Let's Kick Ball' on 1 December, 10am-2pm at Cage @ Clementi. Tap here to respond now!
			</td></tr>
		</table>
    
    </div>
</body>
</html>