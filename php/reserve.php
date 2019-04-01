<?php
session_start();
echo '<html>
<head>
<title>Find Hotels</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="jumbotron"><center><h1>Find Hotels</h1></center></div>
<div class="container-fluid">
<center>
<form class="form-horizontal" action="reserve1.php" method="POST">
<div class="form-group">
<label class="col-md-3 control-label">Location: </label>
<label class="col-md-2"><select name="t1" class="form-control">
<option>Jamshedpur</option>
<option>Mumbai</option>
</select></label>
<label class="col-md-3 control-label">Check-in Date</label><label class="col-md-2 control-label"><input type="text" class="form-control" name="t2" placeholder="yyyy-mm-dd"></label>
<label class="col-md-3 control-label">Check-Out Date</label><label class="col-md-2 control-label"><input type="text" class="form-control" name="t3" placeholder="yyyy-mm-dd"></label>
<label class="col-md-3 control-label">Room Type</label><label class="col-md-2 control-label"><select name="t4" class="form-control">
<option>1 bedded</option>
<option>2 bedded</option>
</label>
</div>
<div class="form-group">
<center><label class="col-md-12 control-label"><input type="submit" class="btn btn-default" value="Search" name="sub"><label><center>
</div>
</form>
</center>
<div class="btn-group"><center><a href="logout.php"><input type="button" class="btn btn-default" value="Log Out"></a></center></div>
</div>
</body>
</html>';
