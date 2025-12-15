<html>
<head>
	<title>Staff Login</title>
	<style>
		body {
			background-color: black;
			color: white;
			text-align: center;
		}
	</style>
</head>
<body>
	<h1>Staff Login</h1>
	<form action="login.php" method="post">
		<label for="username">Username (Your Staff ID):</label><br>
		<input type="text" id="username" name="username"><br>
		<label for="password">Password:</label><br>
		<input type="password" id="password" name="password"><br><br>
		<input type="submit" value="Submit">
	</form> 
</body>
</html>
<?php
include_once 'db_connect.php';
if(isset($_POST['username']) && isset($_POST['password'])) {
	$username = $_POST['username'];
	$password = $_POST['password'];
	
	// Check if the username and password match a record in the Account table
	$sql = "SELECT * FROM Account WHERE STAFF_ID = '$username' AND ACC_Password = '$password'";
	$result = $conn->query($sql);
	
	if($result->num_rows > 0) {
		// Successful login
		session_start();
		$_SESSION['logged_in'] = true;
		$_SESSION['username'] = $username;
		header('Location: MemberInfo.php');
	} else {
		// Invalid login
		echo "Invalid username or password";
	}
}
?>