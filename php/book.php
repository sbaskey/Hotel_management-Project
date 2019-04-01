<?php
session_start();
$conn=mysqli_connect("localhost","root","sachin1998","hotel_manage");
if(isset($_POST["sub"]))
{
	@$hid=$_POST["id"];
@$rn=$_POST["rn"];
@$cid=$_SESSION["username"];
echo '<form method="POST" action="#" >
<p>booking id<input type="text" id="bi"></p>
<p>booking type<input type="text" id="bt"></p>
<p>booking date<input type="text" id="bd" placeholder="yyyy/mm/dd"></p>
<p><input type="submit" name="sub1" value="book"></p>
</form>';
echo '<div class="btn-group"><center><a href="logout.php"><input type="button" class="btn btn-default" value="Log Out"></a></center></div>';
if(isset($_POST["sub1"]))
{
	$bi=$_POST["bi"];
$bd=$_POST["bd"];
$bt=$_POST["bt"];
$sql="insert into booking values('".$bi."','".$hid."','".$rn."','".$cid."','".$bt."','".$bd."')";
if(mysqli_query($conn,$sql))
{
	echo 'Booked';
}
}
}

?>
