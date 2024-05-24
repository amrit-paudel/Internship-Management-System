
<!DOCTYPE html>
<?php require_once 'includes/functions.php';
echo"<link href='../assets/sweetalert.min.css' rel='stylesheet' />
<script src='../assets/sweetalert.min.js'></script>";?>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Admin Panel</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="../css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="../css/style.css" rel="stylesheet">  
  
</head>
<style>
html body{
  background-color: #E0F8E6;
  z-index: 1;
}
a{
  margin: 10px;
  font-weight: 400;
}
</style>

<body>
  <header>
    <!--Navbar -->
    <?php 
            if(isset($_SESSION['admin_logged_in'])){
              echo "<nav class='mb-1 navbar navbar-expand-lg navbar-dark green' style='height: 70px; font-size:18px;'>
                
              <button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarSupportedContent-333'
        aria-controls='navbarSupportedContent-333' aria-expanded='false' aria-label='Toggle navigation'>
        <span class='navbar-toggler-icon'></span>
      </button>
      <div class='collapse navbar-collapse' id='navbarSupportedContent-333'>
        <ul class='navbar-nav mr-auto'>
          <li class='nav-item'>
            <a class='nav-link' href='index.php'><i class='fas fa-envelope'></i> Applications</a>
          </li>
          <li class='nav-item'>
          <a class='nav-link' href='insert.php'><i class='fas fa-calendar-check'></i> Current Internship</a>
          </li>
          
          <div class = ''>
          <li class='nav-item'><a href='studentLocation.php' class='nav-link' style='border-radius: 10em;'><i class='fas fa-hammer'></i> Students Working</a></li></div>
          <li class='nav-item'>
          <a class='nav-link' href='internship.php'><i class='fas fa-history'></i> History</a>
          </li>
          </ul>
              ";
              
              echo " <ul class='nav navbar-nav ml-auto'>";?>
              <li class='nav-item'><a href='logout.php' onclick = "return confirm('Are you sure want to log out?')" class='nav-link' style='border-radius: 10em;' style = 'text-align:right;'><i class='fas fa-sign-out-alt'></i><b> Logout</a></b></li>
              
              
           <?php }?>
            
            
          
        </nav>
    <!--/.Navbar -->
  </header>