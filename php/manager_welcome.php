<?php
session_start();
echo '
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="jumbotron"><center><h1>Welcome</h1></center></div>
<div class="container">
<div class="btn-group btn-group-justified">
<div class="btn-group">
<a href="#"><input type="button" class="btn btn-default" value="Employee Details"></a>
</div>
<div class="btn-group">
<a href="#"><input type="button" class="btn btn-default" value="Food Order"></a>
</div>
<div class="btn-group">
<a href="manager_login.php"><input type="button" class="btn btn-default" value="Log Out"></a>
</div>
</div>
</div>
</div>
</body>
</html>';
?>
