<?php                                                                                                                                                                              
session_start();
require "conn.php";

$user =$_POST["users_staffId"];
$password = $_POST["users_Password"];

if($conn)
{
	$sqlCheckUser = "SELECT * FROM users WHERE users_staffId LIKE '$user'";
	$usernameQuery = mysqli_query($conn,$sqlCheckUser);
	if(mysqli_num_rows($usernameQuery) > 0)
	{
		$sqlLogin = "SELECT * FROM users WHERE users_staffId LIKE '$user' AND users_Password LIKE '$password'";
		$loginQuery = mysqli_query($conn,$sqlLogin);
		if(mysqli_num_rows($loginQuery) > 0)
		{
			$_SESSION["users_staffId"] = $user;
			echo "Login Success";
		}	
		else
		{
			echo "Wrong Password";
		}
	}
	else
	{
		echo "This staffId is not registered";
	}
}
else
{
	echo "Connection Error";
} 
?>