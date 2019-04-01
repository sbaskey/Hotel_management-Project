<?php
session_start();
$t0=$_REQUEST["var"];
$conn=mysqli_connect("localhost","root","sachin1998","hotel_manage");
$sql="select count(*) as count_room,room_type from room where hotel_id='".$t0."' and occupied='NO' group by room_type";
$result=mysqli_query($conn,$sql);
$count=mysqli_num_rows($result);
echo '<html>
<head>
<title>'.$t0.'</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>';
echo '<h2>Rooms</h2>';
echo '<div class="table-responsive">';
echo '<table border="1" class="table table-hover table-striped">';
echo '<tr>';
if($count>0)
{
while($row=mysqli_fetch_assoc($result))
{
	echo '<td>'.$row["room_type"].'<br>';
	echo '<form action="rooms.php" method="POST">';
	echo '<input type="hidden" name="id" value="'.$t0.'">';
	echo '<input type="hidden" name="rt" value="'.$row["room_type"].'">';
	echo 'No. of available rooms = '.$row["count_room"].'<br>';
	echo '<input type="submit" class="btn btn-link" name="sub" value="BOOK"></td>';
}
echo '</form>';
}
else
{
	echo '<div>No rooms available</div>';
}
echo '</tr></table></div>';
$sql1="select distinct(facility_name) from facility where hotel_id='".$t0."'";
$result1=mysqli_query($conn,$sql1);
echo '<h2>Services</h2>';
while($row1=mysqli_fetch_assoc($result1))
{
	echo $row1["facility_name"];
	echo '<br>';
}
echo '<div class="btn-group"><a href="logout.php"><input type="button" class="btn btn-default" value="Log Out"></a></div>';
echo '</body></html>';
?>
