<?php
include 'includes/htmlheader.php';
?>

<!doctype html>
<html>
<head>
<title>Login</title>
    <style> 
        body{
            
    margin-top: 100px;
    margin-bottom: 100px;
    margin-right: 150px;
    margin-left: 80px;
    background-color: azure ;
    color: palevioletred;
    font-family: verdana;
    font-size: 100%;
    background: #eee url("../images/background.png");      
    
        }
            h1 {
    color: indigo;
    font-family: verdana;
    font-size: 100%;
}
        h3 {
    color: indigo;
    font-family: verdana;
    font-size: 100%;
}
  html,body{
    position: relative;
    height: 100%;
}
.login-container{
    position: relative;
    width: 300px;
    margin: 80px auto;
    padding: 20px 40px 40px;
    text-align: center;
    background: #fff;
    border: 1px solid #ccc;
}
   
 
.login-container::before,.login-container::after{
    content: "";
    position: absolute;
    width: 100%;height: 100%;
    top: 3.5px;left: 0;
    background: #fff;
    z-index: -1;
    -webkit-transform: rotateZ(4deg);
    -moz-transform: rotateZ(4deg);
    -ms-transform: rotateZ(4deg);
    border: 1px solid #ccc;
}
.login-container::after{
    top: 5px;
    z-index: -2;
    -webkit-transform: rotateZ(-2deg);
     -moz-transform: rotateZ(-2deg);
      -ms-transform: rotateZ(-2deg);
}
        label{
            font-size: 14px;
        }
        .error-msg{
            color: red;
        }
    </style>
</head>
<body>
  
    <h2><p style="text-align:right;"><a href="register.php">Register</a> | <a href="login.php">Login</a></p></h2>
    <br><br><br><br>
    <div class="login-container">
     <center><h4>Sign in to your workspace URL</h4></center>
         <br>
<img src="../images/logo.png">
        <br><br><br><br>
  <?php
    global $error;
if(isset($_POST["submit"])){

if(!empty($_POST['url'])) {
	$url=$_POST['url'];

	$con=mysql_connect('localhost','root','') or die(mysql_error());
	mysql_select_db('slack') or die("cannot select DB");
$query=mysql_query("SELECT * FROM workspace WHERE url='".$url."'");
    $numrows=mysql_num_rows($query);
    //echo $numrows;
	if($numrows!=0)
	{
	while($row=mysql_fetch_assoc($query))
	{
	$dbwkurl=$row['url'];
	$dbwk_id=$row['wk_id'];
	}
	if($url == $dbwkurl)
	{
	session_start();
	$_SESSION['wkurl']=$dbwkurl;
    $_SESSION['wkid']=$dbwk_id;
	/* Redirect browser */
	    header("Location: login.php");
	}
	} else {
	echo "Invalid workspace url!";
   // header("Location:wklogin.php");
	}

} else {
	echo "Please enter your workspace url!";
}
}
?>
 <br><br>    
<form action="" method="POST">
 <input type="text" class="form-control" name="url" placeholder="slack url"><br />
     <label>.slack.com</label>
    <br><br> <br>
<input type="submit" value="Login" class="btn" name="submit" />
</form>



</body>
</html>
