<?php
require_once '../core/init.php';
require_once '../core/function.php';
if(isset($_POST['updateButton'])){
    $name = sanitize($_POST['name']);
    $category = sanitize($_POST['category']);
    $address = sanitize($_POST['address']);
    $email = sanitize($_POST['email']);
    $company = sanitize($_POST['company']);
    $duration = sanitize($_POST['duration']);
    $id = $_SESSION['id'];
        $update = "UPDATE student_location 
                SET 
                    category = '$category',
                    address = '$address', 
                    email = '$email', 
                    company = '$company', 
                    name = '$name' ,
                    duration = '$duration'
                WHERE id = $id";

        $updated = $db->query($update);
        if($updated){
            $_SESSION['updated'] = 'Successfully Updated !!!';
            unset($_SESSION['id']);
            header('location: studentLocation.php');
        }else{
            echo $db->error;
        }
}