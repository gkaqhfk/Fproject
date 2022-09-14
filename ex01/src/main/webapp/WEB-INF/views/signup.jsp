<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<title>Signup</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	</head>
	<body>
		<div class="container">
			<main>
				<div class="py-5 text-center">
					<h2>Sign in</h2>
				</div>
				<div class="row g-5">
					<form id="signInForm" enctype="multipart/form-data">
						<div class="row mb-3">
							<label for="username" class="col-sm-2 col-form-label">username</label>
							<div class="col-sm-10">
								<div class="row row-cols-lg-auto g-3 align-items-center">
									<div class="col-12">
										<input type="text" class="form-control" name="username" id="username" />
									</div>
									<div class="col-12">
										<button type="button" class="btn btn-primary" id="checkButton">check</button>
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-3">
							<label for="password" class="col-sm-2 col-form-label">password</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="password" id="password" />
							</div>
						</div>
						<div class="row mb-3">
							<label for="file" class="col-sm-2 col-form-label">file</label>
							<div class="col-sm-10">
								<input class="form-control" type="file" id="file" />
							</div>
						</div>
						<button type="button" class="btn btn-primary" id="signInButton">Sign in</button>
					</form>
				</div>
			</main>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
		<script src="/resources/js/jQuery.serializeObject.js"></script>
		<script>
			$(function() {
				$('#checkButton').click(function() {
					const data = {
						username: $('#username').val()
					};
					$.get({
						url: '/signup/is-duplicated-username',
						data: data
					}).done(function(data) {
						console.log(data);
					});
				});
				$('#signInButton').click(function() {
					const data = new FormData();
					const form = $('#signInForm').serializeObject();
					const file = $('#file')[0].files[0];
					data.append('form', new Blob([JSON.stringify(form)], { type: "application/json" }));
					data.append('file', file);
					$.post({
						url: '/signup',
						data: data,
						processData: false,
						contentType: false
					}).done(function(data) {
						console.log(data);
					});
				});
			});
		</script>
	</body>
</html>
