<?php
require_once '../core/init.php';
require_once '../core/function.php';
if(isset($_POST['updateButton'])){
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
        $interview_date = $_POST['interview_date'];
        $applyBy =$_POST['applyBy'];
        $id = $_SESSION['id'];
        $update = "UPDATE internships 
                SET 
                    category = '$category',
                    location = '$location', 
                    duration = '$duration', 
                    stipend = '$stipend', 
                    positions = '$availablePosition', 
                    perks = '$perks', 
                    aboutCompany = '$aboutCompany', 
                    aboutInternship = '$aboutInternship', 
                    nameOfCompany = '$nameOfCompany', 
                    whoCanApply = '$whoCanApply', 
                    interview_date = '$interview_date',
                    applyBy = '$applyBy' 
                WHERE id = '$id'";

        $updated = $db->query($update);
        if($updated){
            $_SESSION['updated'] = 'Successfully Updated !!!';
            unset($_SESSION['id']);
            header('location: insert.php');
        }else{
            echo $db->error;
        }
}