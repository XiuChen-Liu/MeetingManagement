<?php
require "conn.php";
$users_IDD = "10616049";
if($conn)
{  
	$sql = "SELECT users.users_name,confs.confs_Name,confs.roomID,confs.startTime,confs.topic FROM confs,attendees,users WHERE attendees.staffId ='" .$users_IDD. "'  AND confs.confs_Id = attendees.confs_Id AND confs.charId = users_staffId";
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