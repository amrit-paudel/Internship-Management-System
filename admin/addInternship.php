<?php
require_once '../core/init.php';
require_once './includes/header.php';
if(!isset($_SESSION['admin_logged_in'])){
    header('location: login.php');
}
echo ' <div class="ml-5 pl-5">
 <a href="insert.php" class="btn btn-primary btn-sm"><i class="fas fa-arrow-circle-left">Back</i></a>
</div>

<div class=" col-md-10 container my-4 card">
    <h3 class="text-center mt-5 card-header">Add New Internship Field</h3>
    <form action="addInternship.php" method="POST" onsubmit="confirmBox("inserted new")">
        <div class="form-group card-body">
            <label for="exampleFormControlInput1">Name Of Company :</label>
            <input type="text" class="form-control" name="nameOfCompany">
        </div>
        <div class="form-group card-body">
            <label for="exampleFormControlInput1">Category :</label>
            <input type="text" class="form-control" name="category">
        </div>
        <div class="form-group card-body">
            <label for="exampleFormControlInput1">Location :</label>
            <input type="text" class="form-control" name="location">
        </div>
        <div class="form-group card-body">
            <label for="exampleFormControlInput1">Duration :</label>
            <input type="text" class="form-control" name="duration">
        </div>
        <div class="form-group card-body">
            <label for="exampleFormControlInput1">Stipend :</label>
            <input type="text" class="form-control" name="stipend">
        </div>
        <div class="form-group card-body">
            <label for="exampleFormControlInput1">Available Position :</label>
            <input type="text" class="form-control" name="availablePosition">
        </div>
        
        <div class="form-group card-body">
            <label for="exampleFormControlInput1">Perks :</label>
            <input type="text" name="perks" class="form-control">
        </div>
        <div class="form-group card-body">
            <label for="exampleFormControlTextarea1">About Company :</label>
            <textarea class="form-control" name="aboutCompany" rows="6" style="resize:none;"></textarea>
        </div>
        <div class="form-group card-body">
            <label for="exampleFormControlTextarea1">About Internship :</label>
            <textarea class="form-control" name="aboutInternship" rows="6" style="resize:none;"></textarea>
        </div>
        <div class="form-group card-body">
            <label for="exampleFormControlTextarea1">Who Can Apply :</label>
            <textarea class="form-control" name = "whoCanApply" rows="6" style="resize:none;"></textarea>
        </div>
        <div class="form-group card-body">
            <label for="exampleFormControlTextarea1">Interview Date :</label>
            <input type = "date" class="form-control" name = "interview_date" rows="6" style="resize:none;">
        </div>
        <div class="form-group card-body">
            <label for="exampleFormControlTextarea1">Deadline :</label>
            <input type = "date" class="form-control" name = "applyBy" rows="6" style="resize:none;">
        </div>
        <div class="form-group card-body">
            <label for="exampleFormControlTextarea1">Add website Link :</label>
            <input type = "url" class="form-control" name = "url" rows="6" style="resize:none;">
        </div>
        <div class="form-group card-body">
            <button type = "submit"  class="btn btn-primary font-weight-bold insert" name = "buttonSubmit">Add</button>
        </div>
    </form>
    
</div>';

    if(isset($_POST['buttonSubmit'])){
        $nameOfCompany = sanitize($_POST['nameOfCompany']);
        $category = sanitize($_POST['category']);
        $location = sanitize($_POST['location']);
        $duration = (int)sanitize($_POST['duration']);
        $stipend = (int)sanitize($_POST['stipend']);
        $availablePosition = (int)sanitize($_POST['availablePosition']);
        $perks = sanitize($_POST['perks']);
        $aboutCompany = sanitize($_POST['aboutCompany']);
        $aboutInternship = sanitize($_POST['aboutInternship']);
        $whoCanApply = sanitize($_POST['whoCanApply']);
        $interview_date = sanitize($_POST['interview_date']);
        $applyBy = sanitize($_POST['applyBy']);
        $url = sanitize($_POST['url']);
        
        $insertIntern = "INSERT INTO internships (`category`,`aboutCompany`,`nameOfCompany`,`aboutInternship`,`location`,`perks`,`duration`,`stipend`,`positions`,`whoCanApply`,`interview_date`,`applyBy`,`url`) values('$category','$aboutCompany','$nameOfCompany','$aboutInternship','$location','$perks','$duration','$stipend','$availablePosition','$whoCanApply','$interview_date','$applyBy','$url')";
        $query = $db->query($insertIntern);
        if($query){
            $_SESSION['added'] = 'New Internship Successfully added !!!';
        }
        else{
            $_SESSION['failed'] = '*Fail to add' . $db->error;
        }
        echo"
            <script>
                window.location.href = 'insert.php';
                </script>";
    }
 ?>
