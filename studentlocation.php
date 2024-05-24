<?php 
  // session_start();
  require_once 'core/init.php';  
  require_once 'includes/header.php'; 
  $sql = "SELECT * from student_location";
  $data = $db->query($sql);
  $data = $data->fetch_all(MYSQLI_ASSOC);
  $key =0;
  echo '<h3 class="h2 text-center text-primary " style = "margin:30px; font-size:45px; margin-top:40px;" > Current Interns
  </h2>';
  ?>



<div class = "container-fluid">
  <div class="">
    <div class="card-body table-responsive">
      <table class="table table-striped table-bordered" style="display: table;">
        <thead>
          <th class="text-center"><h5 class="h5-responsive"><b>SN</b></h5></th>
          <th class="text-center"><h5 class="h5-responsive"><b>Name of Students</b></h5></th>
          <th class="text-center"><h5 class="h5-responsive"><b>IOE Email</b></h5></th>
          <th class="text-center"><h5 class="h5-responsive"><b>Name of Company</b></h5></th>
          <th class="text-center"><h5 class="h5-responsive"><b>Location</b></h5></th>
          <th class="text-center"><h5 class="h5-responsive"><b>Category</b></h5></th>
          <th class="text-center"><h5 class="h5-responsive"><b>Duration</b></h5></th>
        </thead>
       <?php foreach($data as $data){
         $key++;?>
        <tr>
                <td class="text-center"><?=$key;?></td>
                
                <td class="text-center"><?=$data['name'];?></td>
                <td class="text-center"><?=$data['email'];?></td>
                <td class="text-center"><?=$data['company'];?></td>
                <td class="text-center"><?=$data['address'];?></td>
                <td class="text-center"><?=$data['category'];?></td>
                <td class="text-center"><?=$data['duration'];?></td>
          <tbody>
            
  <?php }?>