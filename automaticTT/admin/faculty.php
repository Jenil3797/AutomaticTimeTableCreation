<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="std.css">
	<title>Faculty</title>
</head>
<body>
	<div class="nav">
      <div class="menuToggle"></div>
      <ul>
          <li class="list" style="--clr:#F28F8F;">
              <a href="ad_prof.php">
                  <span class="icon">
                    <ion-icon name="person-outline"></ion-icon>
                  </span>
                  <span class="text">Profile</span>
              </a>
          </li>
          <li class="list" style="--clr:#F28F8F;">
              <a href="department.php">
                  <span class="icon">
                      <ion-icon name="business-outline"></ion-icon>
                  </span>
                  <span class="text">Department</span>
              </a>
          </li>
          <li class="list" style="--clr:#F28F8F;">
              <a href="semester.php">
                  <span class="icon">
                    <ion-icon name="grid-outline"></ion-icon>
                  </span>
                  <span class="text">Semester</span>
              </a>
          </li>
          <li class="list" style="--clr:#F28F8F;">
              <a href="subject.php">
                  <span class="icon">
                    <ion-icon name="book-outline"></ion-icon>
                  </span>
                  <span class="text">Subject</span>
              </a>
          </li>
          <li class="list" style="--clr:#F28F8F;">
              <a href="student.php">
                  <span class="icon">
                    <ion-icon name="person-circle-outline"></ion-icon>
                  </span>
                  <span class="text">Student</span>
              </a>
          </li>
          <li class="list active" style="--clr:#F28F8F;">
              <a href="faculty.php">
                  <span class="icon">
                    <ion-icon name="people-circle-outline"></ion-icon>
                  </span>
                  <span class="text">Faculty</span>
              </a>
          </li>
          <li class="list" style="--clr:#F28F8F;">
              <a href="timetable.php">
                  <span class="icon">
                    <ion-icon name="calendar-outline"></ion-icon>
                  </span>
                  <span class="text">Time Table</span>
              </a>
          </li>
      </ul>
    </div>

    <div class="div">
      <h1 class="h1">Faculty</h1>
    </div>
      <a href="add_fac.php">
        <button type="button" class="btn">
          <span class="btnicon">
            <ion-icon name="add-outline"></ion-icon>
          </span>
          <span class="btntext">Add Faculty</span>
        </button>
      </a>
    <?php
      session_start();
      $con=mysqli_connect('localhost','root','','atc');

      $s="SELECT * FROM faculty";

      $q=mysqli_query($con, $s);
    ?>

    <div class="div">
      <table class="content-table">
        <thead>
        <tr>
          <th>Name</th>
          <th>Department</th>
          <th>Semester</th>
          <th>Subject</th>
          <th>Update</th>
          <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <?php
            while($n=mysqli_fetch_array($q)){
                $id=$n['fac_id'];
                $dep_id=$n['dep_id'];
                $sem_id=$n['sem_id'];
                $sub_id=$n['sub_id'];
                $d=mysqli_query($con, "SELECT * FROM department WHERE dep_id='$dep_id'");
                $dn=mysqli_fetch_assoc($d);
                $se=mysqli_query($con, "SELECT * FROM semester WHERE sem_id='$sem_id'");
                $sen=mysqli_fetch_assoc($se);
                $su=mysqli_query($con, "SELECT * FROM subject WHERE sub_id='$sub_id'");
                $sun=mysqli_fetch_assoc($su);
          ?>
          <td><?php echo $n['fac_name']?></td>
          <td><?php echo $dn['dep_name']?></td>
          <td><?php echo $sen['sem_name']?></td>
          <td><?php echo $sun['sub_name']?></td>
          <td>
            <a href="update_fac.php?ID=<?php echo $id; ?>">
              <button type="button" class="bttn1">
                <span class="btntext">Update</span> 
              </button>
            </a>
          </td>
          <td>
            <a href="del_fac.php?ID=<?php echo $id; ?>">
              <button type="button" class="bttn">
                <span class="btntext">Delete</span>
              </button>
            </a>
          </td>
        </tr>
        </tbody>
        <?php
          }
        ?>
      </table>
    </div>

</body>
</html>

<script>
	const menuToggle = document.querySelector('.menuToggle');
	const nav = document.querySelector('.nav');
	menuToggle.onclick=function(){
	nav.classList.toggle('open')
	}

	const list = document.querySelectorAll('.list');
	function activeLink(){
	  list.forEach((item) =>
	  item.classList.remove('active'));
	  this.classList.add('active');
	}
	list.forEach((item) =>
	item.addEventListener('click',activeLink))
</script>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>