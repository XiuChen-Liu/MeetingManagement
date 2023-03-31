<?php
require "conn.php";
$users_IDD = "10616049";

if($conn)
{  
	$sql = "SELECT confs.confs_name,confs.startTime,attendees.attendType FROM confs,attendees WHERE attendees.staffId ='" .$users_IDD. "'  AND confs.confs_Id = attendees.confs_Id";
	$result = mysqli_query($conn,$sql);
	if(mysqli_num_rows($result) > 0)
	{
		while($row = mysqli_fetch_assoc($result))
		{
			$output[] = $row;
		}
	}
	echo json_encode($output,JSON_UNESCAPED_UNICODE);
}
?>