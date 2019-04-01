<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="jumbotron"><center><h1>Sign Up</h1></center></div>
<div class="container">
<center>
<form class="form-horizontal" action="#" method="POST">
<div class="form-group">
<label class="col-md-2 control-label">Name:</label>
<label class="col-md-10"><input type="text" class="form-control" placeholder="Enter Name" name="t1"></label>
</div>
<div class="form-group">
<label class="col-md-2 control-label">Mobile Number:</label>
<label class="col-md-10"><input type="text" class="form-control" placeholder="Enter Mobile Number" name="t2"></label>
</div>
<div class="form-group">
<label class="col-md-2 control-label">Email:</label>
<label class="col-md-10"><input type="email" class="form-control" placeholder="Enter Email" name="t3"></label>
</div>
<div class="form-group">
<label class="col-md-2 control-label">Address:</label>
<label class="col-md-10"><input type="text" class="form-control" placeholder="Enter Address" name="t4"></label>
</div>
<div class="form-group">
<label class="col-md-2 control-label">Password:</label>
<label class="col-md-10"><input type="password" class="form-control" placeholder="Enter Password" name="t5"></label>
</div>
<div class="form-group">
<label class="col-md-12"><input type="submit" class="btn btn-default" value="Sign Up" name="sub"></label>
</div>
</form>
</center>
</div>
</body>
</html>
<?php
$t0=$_REQUEST["var"];
$conn=mysqli_connect("localhost","root","sachin1998","hotel_manage");
@$name=$_POST["t1"];
@$mob=$_POST["t2"];
@$mail=$_POST["t3"];
@$add=$_POST["t4"];
@$pass=$_POST["t5"];
if(isset($_POST["sub"]))
{
	$sql="insert into customer values('".$t0."','".$name."','".$mob."','".$mail."','".$add."','".$pass."')";
	if(mysqli_query($conn,$sql))
	{
		header('location:login.php');
	}
	else
	{
		echo "Error";
	}
}
?>
