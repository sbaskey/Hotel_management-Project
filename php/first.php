<html>
<head>
<title>Find Hotels</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="jumbotron"><center><h1>Find Hotels</h1></center></div>
<div class="container">
<center>
<form class="form-horizontal" action="#" method="POST">
<div class="form-group">
<label class="col-md-2 control-label">Location: </label>
<label class="col-md-10"><select name="t1" class="col-md-10 form-control">
<option>Bhubaneswar</option>
<option>Goa</option>
<option>Hyderabad</option>
<option>Kolkata</option>
<option>Mumbai</option>
</select></label>
</div>
<div class="form-group">
<input type="submit" class="btn btn-default" value="Search" name="sub">
</div>
</form>
</center>
<div class="btn-group"><center><a href="logout.php"><input type="button" class="btn btn-default" value="Log Out"></a></center></div>
</div>
</body>
</html>
<?php
if(isset($_POST["sub"]))
{
	session_start();
	$val=$_POST["t1"];
	header('location:location_hotel.php?var='.$val.'');
}
?>