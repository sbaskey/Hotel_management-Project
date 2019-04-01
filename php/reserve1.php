<?php
if(isset($_POST["sub"]))
{
	$local=$_POST["t1"];
	$checkin=$_POST["t2"];
	$checkout=$_POST["t3"];
	$roomtype=$_POST["t4"];
	$conn=mysqli_connect("localhost","root","sachin1998","hotel_manage");
	$sql="select distinct(hotel_id), hotel_name, hotel_addres from hotel natural join room where hotel_city='".$local."' and room_type='".$roomtype."'";
	$result=mysqli_query($conn,$sql);
	$count=mysqli_num_rows($result);
	echo '<html>
<head>
<title>Hotels at '.$local.'</title>
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
echo '<tr class="jumbotron"><th><center><h1>Hotel at '.$local.'</h1></center></th></tr>';
while($row=mysqli_fetch_assoc($result))
{
	
	echo '<tr><td>';
	echo '<form action="reserve2.php" method="POST">';
	echo '<input type="hidden" name="id" value="'.$row["hotel_id"].'">';
	echo '<tr><td><h2>&nbsp;&nbsp;<h2>'.$row["hotel_name"].'</h2><br>';
	echo '&nbsp;&nbsp;&nbsp;&nbsp;Address: '.$row["hotel_addres"].'<br>';
	$conn1=mysqli_connect("localhost","root","sachin1998","hotel_manage");
	$sql1="select facility_name from facility where hotel_id='".$row["hotel_id"]."'";
	$result1=mysqli_query($conn1,$sql1);
	echo '&nbsp;&nbsp;&nbsp;&nbsp;Services:';
	$row1=mysqli_fetch_assoc($result1);
	echo $row1["facility_name"];
	while($row1=mysqli_fetch_assoc($result1))
	{
		echo " , ";
		echo  $row1["facility_name"];
	}
	echo '&nbsp;&nbsp;&nbsp;&nbsp<input type="submit" class="btn btn-link" name="sub1" value="Check Availability"><br>';
	echo '</form>';
	echo '</td></tr>';
}
echo '</table>';
echo '</div>';

	echo '<div><center><a href="logout.php"><input type="button" class="btn btn-default" value="Log Out"></a></center></div>';

echo '
</body>
</html>';
}
?>
