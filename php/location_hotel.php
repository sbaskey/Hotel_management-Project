<?php
session_start();
$t0=$_REQUEST["var"];
$conn=mysqli_connect("localhost","root","sachin1998","hotel_manage");
$sql="select * from hotel where hotel_city='".$t0."'";
$result=mysqli_query($conn,$sql);
echo '<html>
<head>
<title>Hotels at '.$t0.'</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>
<style>
tr:nth-child(even){background-color:pink}
tr:nth-child(odd){background-color:cyan}
</style>
</head>
<body>';
echo '<div class="table-responsive">';
echo '<table border="1" class="table table-hover">';
echo '<tr class="jumbotron"><th><center><h1>Hotel at '.$t0.'</h1></center></th></tr>';
while($row=mysqli_fetch_assoc($result))
{
	echo '<tr><td>';
	echo '<form action="#" method="POST">';
	echo '<input type="hidden" name="id" value="'.$row["hotel_id"].'">';
	echo '<tr><td><h2>&nbsp;&nbsp;<h2>'.$row["hotel_name"].'</h2><br>';
	echo '&nbsp;&nbsp;&nbsp;&nbsp;Address: '.$row["hotel_addres"].'<br>';
	echo '&nbsp;&nbsp;&nbsp;&nbsp<input type="submit" class="btn btn-link" name="sub" value="Check"><br>';
	echo '</form>';
	echo '</td></tr>';
}
echo '</table>';
echo '<div class="btn-group"><center><a href="logout.php"><input type="button" class="btn btn-default" value="Log Out"></a></center></div>';
if(isset($_POST["sub"]))
{
	$val=$_POST["id"];
	header('location:hotel_facilities.php?var='.$val.'');
}
echo '</div>';
echo '
</body>
</html>';
?>