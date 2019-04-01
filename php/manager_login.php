<?php
error_reporting(~E_WARNING);
echo '<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>';
echo '<div class="jumbotron"><center><h1>Login</h1></center></div>';
echo '<div class="container"><center>';
echo '<form class="form-horizontal" action="#" method="POST">';
echo '<div class="form-group">';
echo '<label class="col-md-2 control-label">Manager ID</label><label class="col-md-10"><input type="text" class="form-control" name="t1"></label>';
echo '</div>';
echo '<div class="form-group">';
echo '<label class="col-md-2 control-label">Password</label><label class="col-md-10"><input type="password" class="form-control" name="t2"></label>';
echo '</div>';
echo '<div class="form-group">';
echo '<label><input type="submit" class="btn btn-default" value="Login" name="sub"></label>';
echo '</div>';
echo '</form>';
echo '</center>';
echo '</div></div></body></html>';
if(isset($_POST["sub"]))
{
	$id=$_POST["t1"];
	$pass=$_POST["t2"];
	$conn=mysqli_connect("localhost",$id,$pass,"batch");
	if(!($conn))
	{
		die("Incorrect id or password");
	}
	if($conn)
	{
		session_start();
		$_SESSION["username"] = $id;
		$_SESSION["password"] = $pass;
		header('location:manager_welcome.php');
	}
}
?>
