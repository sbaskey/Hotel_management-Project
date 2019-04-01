<?php
session_start();
$cid=$_SESSION["username"];
$conn=mysqli_connect("localhost","root","sachin1998","hotel_manage");
@$id=$_POST["id"];
@$rt=$_POST["rt"];
$sql="select * from room where hotel_id='".$id."' and room_type='".$rt."' and occupied='NO'";
$result=mysqli_query($conn,$sql);
echo '<html>
<head>
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<form action="book.php" method="POST">
<h2>'.$rt.' rooms</h2>
<input type="hidden" name="id" value="'.$id.'">
<select id="rn">';
while($row=mysqli_fetch_assoc($result))
{
	echo '<option>'.$row["room_no"].'</option>';
}
echo '</select>
<input type="submit" class="btn btn-link" name="sub" value="Book">
</form>
<div class="btn-group"><center><a href="logout.php"><input type="button" class="btn btn-default" value="Log Out"></a></center></div>
</body>
</html>';
?>
