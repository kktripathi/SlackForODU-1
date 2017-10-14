<?php

	function confirm_query($result_set) {
		if (!$result_set) {
			die("Database query failed.");
		}
	}

	function redirect_to($new_location) {
	  	header("Location: " . $new_location);
	  	exit;
	}

	function verify_input($data) {
		global $connection;
  		$data = htmlspecialchars($data);
  		$data = mysql_real_escape_string($data);
  		return $data;
    }
    function verify_in($data) {
		global $connection;
  		$data = mysql_real_escape_string($data);
  		return $data;
    }
	
	function verify_output($data) {
  		//$data = stripcslashes($data);
  		$data = htmlspecialchars_decode($data);
  		return $data;
    }
    function verify_out($data) {

  		$data = stripcslashes($data);
  		return $data;
    }

?>