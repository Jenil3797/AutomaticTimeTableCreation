<?php
	session_start();

	$con=mysqli_connect('localhost','root','','atc');
	mysqli_select_db($con, 'atc');

	$enrno = $_POST['enrno'];
    $pass = $_POST['psw'];

    $s = "select * from student where std_enrno = '$enrno' && std_pass = '$pass'";

    $res=mysqli_query($con, $s);
    $num=mysqli_num_rows($res);

    if($num==0){
        echo "<script type='text/javascript'>alert('Invalid  Username or Password,Please try again!');
				  document.location='index.php'</script>";
    }
    else{
        $_SESSION['enrno']=$enrno;
        echo "<script type='text/javascript'>alert('Welcom');
				  document.location='std_prof.php'</script>";
    }
?>