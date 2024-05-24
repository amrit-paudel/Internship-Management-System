<?php 
	require_once 'core/init.php';
	if(isset($_SESSION['logged_in'])){
		echo "Bad Request";
		die();
	}
	require_once 'includes/header.php';
?>
<div class="container pl-3 col-xl-6" style="margin-top: 65px;">
	<div class="card">
		<div class="card-header">
			<h2 class="p-0 h2-responsive text-primary">Login here!</h2>
		</div>
		<form action="" method="post">
			<div class="card-body">
				<div class="md-form form-sm">
					<label for="email" class="" style="font-size: 23px;color:black"><b>Email</b></label><br>
					<input type="text" id="email" class="form-control form-control-sm" name="email" placeholder = 'Enter your college email' required>
				</div>
				<div class="md-form form-sm">
					<label for="password" class="" style="font-size: 18px;color:black">Password</label><br>
					<input type="password" id="password" class="form-control form-control-sm" name="password" required>
				</div>
				<div class=" pb-3">
					
					<div class="float-left">
						<p style="color: grey;">Don't have an account? <a href="register.php">Register now</a></p>
					</div>
				</div>
			</div>			
			<div class="card-footer">
				<div class="float-left">
					<button type="submit" name="login" class="btn  btn-primary" style="border-radius: 10em;background: #1c2a48;margin-left:0; margin-bottom:20px;">Login</button>
				</div>
			</div>
		</form>
		<?php 
			if(isset($_POST['login'])){
				$email = $_POST['email'];
				$password = $_POST['password'];

				$sql = "SELECT * FROM customers WHERE password = '$password' AND email = '$email'";
				$runSql = $db->query($sql);
				$check_customer = mysqli_num_rows($runSql);
				if($check_customer == 0){
					echo "<script>alert('Your password or email is incorrect, please try again!')</script>";
					exit();
				}
				// $ip = getIp();				
				if($check_customer > 0){
					$_SESSION['email'] = $email;
					$_SESSION['logged_in'] = TRUE;
						echo "<script>alert('You logged in successfully!')</script>";
						echo "<script>window.open('index.php','_self')</script>";
				}else{
					$_SESSION['email'] = $email;
					echo "<script>alert('You logged in successfully!')</script>";
					echo "<script>window.open('cart.php','_self')</script>";
				}
			}
		?>
	</div>
</div>

<?php
	include 'includes/footer.php';
?>