<?php
session_start();
echo '<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="jumbotron"><center><h1>Welcome</h1></center></div>
<div class="container">
<div class="btn-group btn-group-justified">
<div class="btn-group"><a href="first.php"><input type="button" class="btn btn-default" value="Book Now"></a></div>
<div class="btn-group"><a href="reserve.php"><input type="button" class="btn btn-default" value="Reserve"></a></div>
<div class="btn-group"><a href="logout.php"><input type="button" class="btn btn-default" value="Log Out"></a></div>
</div>
</div>
</body>
</html>';

?>
