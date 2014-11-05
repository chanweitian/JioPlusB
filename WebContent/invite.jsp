
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Invite</title>

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
    
<style>
#resultTable {
    display: none;
}
</style>

    <script>
function goBack() {
    window.history.back();
}
function goNext() {
	if (arr.length==0) {
		alert("Please invite at least one contact");
	} else {
		window.location.href = "chooseTime.jsp?invitees=" + arr.toString();
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
<div class="container"><h2>Who do you want to invite?</h2>
</div>

<table class="table"><tr><td>
<div class="input-group">
	<input type="text" class="form-control" id="name" placeholder="Search contacts" oninput="myFunction()">
	<div class="input-group-btn">
		<button type="button" class="btn btn-default" onclick="myFunction()">
			<span class="glyphicon glyphicon-search"></span>
		</button>
	</div>
</div>
</td></tr></table>


<script>
var arr = [];

function myFunction() {	
	var input = document.getElementById("name").value;
	if (input == "") {
		document.getElementById("inviteTable").style.display = "table";
		document.getElementById("resultTable").style.display = "none";
	} else {
		var names = ["Yasmin", "Ashly", "Letha", "Randell", "Jennifer", "Maegan", "Tamela", "Kortney", "Rory", "Melody", "Nydia", "Ariel", "Camelia", "Frederick", "Daniel"];	
		var count = 1;
		
		document.getElementById("inviteTable").style.display = "none";
		document.getElementById("resultTable").style.display = "table";
		
		var table = document.getElementById("resultTable");
		var numRows = table.rows.length;
		for (var i=1; i<numRows; i++) {
			table.deleteRow(1);
		}
		
		for (x in names) {
			var name = names[x];
			if (name.toLowerCase().indexOf(input.toLowerCase()) == 0) {
				var row = table.insertRow(count);
				count++;
				var cell = row.insertCell(0);
				cell.innerHTML = name;
				
				var createClickHandler = 
					function(c) 
					{
						return function() { 
							document.getElementById("inviteTable").style.display = "table";
							document.getElementById("resultTable").style.display = "none";
							document.getElementById("name").value = "";
							
							var iTable = document.getElementById("inviteTable");
							var iNumRows = iTable.rows.length;
							var exist = false;
							
							for (var j=1; j<iNumRows; j++) {
								if (iTable.rows[j].cells[0].innerHTML == c.innerHTML) {
									exist = true;
								}
							}
							if (!exist) {
								var iRow = iTable.insertRow(iNumRows);
								var iCell = iRow.insertCell(0);
								iCell.innerHTML = c.innerHTML;
								arr.push(c.innerHTML);
								
								var iCreateClickHandler = 
									function(ic) 
									{
										return function() { 
											var newTable = document.getElementById("inviteTable");
											var newNumRows = newTable.rows.length;
												for (var k=1; k<newNumRows; k++) {
													if (newTable.rows[k].cells[0].innerHTML == ic.innerHTML) {
														newTable.deleteRow(k);
														var index = arr.indexOf(ic.innerHTML);
														arr.splice(index,1);
													}
												}
										 };
									};
	
								iCell.onclick = iCreateClickHandler(iCell);
								
							}
						};
					};
	
				cell.onclick = createClickHandler(cell);
			}
		}
	}
}
</script>

<table id="inviteTable" class="table table-bordered">
	<tr>
	<th>Invitees</th>
	</tr>
</table>

<table id="resultTable" class="table table-bordered">
	<tr>
	<th>Search Results</th>
	</tr>
</table>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
