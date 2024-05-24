<?php
// session_start();
require_once 'core/init.php';
require_once 'includes/header.php';
?>

<?php
if (!isset($_SESSION['logged_in'])) {
    echo "<script>window.open('login.php','_self')</script>";
} else {
    echo "<script>window.open('','_self')</script>";
}
?>
<h3 class="h3 text-center text-danger">* Your Past Interviews<h3 class="h3 text-center text-danger">Appear Here :</h3>
</h3>
<?php
$email = $_SESSION['email'];
$currentDate = date('Y-m-d');
$sql = "SELECT applications.applied_at, applications.int_id, applications.status, internships.nameOfCompany, internships.location, internships.category, internships.interview_date FROM applications INNER JOIN customers on applications.cus_id = customers.id Inner join internships on applications.int_id = internships.id WHERE customers.email = '$email' AND internships.interview_date < '$currentDate' ";
$result = $db->query($sql);

$row = $result->fetch_all(MYSQLI_ASSOC);
// echo "<pre>";
// print_r($row);

echo '<div class = "container-fluid">
<div class="">
<div class="card-body table-responsive">
    <table class="table table-striped table-condensed" style="display: table; margin:0;">';
foreach ($row as $row) {
if($row['status'] == 'approved'){
?>
    

            <tr >
                <td class="text-primary" style="font-weight: 500;">You applied at Company '<b class="text-danger"><?php echo
                $row['nameOfCompany']?> </b>' on date <b class="text-danger"> <?php echo
                $row['applied_at']?> </b> and interviewed for post '<b class="text-danger"> <?php echo
                $row['category']?> </b>' on date <b class="text-danger"><?php echo
                $row['interview_date']?></b></td>
            </tr>
            


            <?php }} ?>
        </table>
    </div>
</div>