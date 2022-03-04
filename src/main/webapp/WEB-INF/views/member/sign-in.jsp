<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Groupware</title>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/sign-in.css">
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
<!-- <script type="text/javascript" src="resources/assets/js/jquery.min.js"></script> -->
<script type="text/javascript" src="js/sign-in.js"></script>
</head>
<body>

			<form class = "form-signin" action="" method="post" name="form-signin">
			  <h2><span class="entypo-login"><i class="fa fa-sign-in"></i></span> Login</h2>
			  <button class="submit"><span class="entypo-lock"><i class="fa fa-lock"></i></span></button>
			  <span class="entypo-user inputUserIcon">
			     <i class="fa fa-user"></i>
			   </span>
			  <input type="text" class="user" placeholder="ursername"/>
			  <span class="entypo-key inputPassIcon">
			     <i class="fa fa-key"></i>
			   </span>
			  <input type="password" class="pass"placeholder="password"/>
			</form>



</body>
</html>