<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<head>
	<meta charset="ISO-8859-1">
	<title>View Anime List</title>

	<link rel="stylesheet"
		  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
	<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
			src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

	<style>
		body {
			background-color: #f0f0f0; /* light gray background */
		}

		.container {
			background-color: #ffffff; /* white background */
			padding: 20px;
			border: 1px solid #dddddd;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		a {
			color: #ffffff; /* white color */
		}

		a:hover {
			color: #ffffff; /* white color */
			text-decoration: none;
		}

		.form-control {
			background-color: #ffffff; /* white background */
			border: 1px solid #cccccc;
			border-radius: 5px;
			padding: 10px;
		}

		.btn {
			background-color: #ff0000; /* red color */
			color: #ffffff; /* white color */
			border: none;
			border-radius: 5px;
			padding: 10px 20px;
		}

		.btn:hover {
			background-color: #cc0000; /* darker red color */
		}

		form {
			background-color: #f8f9fa;
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 4px 8px rgba(0,0,0,0.1);
		}

		.form-group label {
			color: #495057;
		}

		.table {
			border-radius: 8px;
			box-shadow: 0 4px 8px rgba(0,0,0,0.1);
		}

		th {
			background-color: #ff0000; /* red color */
			color: #ffffff; /* white color */
			border-radius: 8px 8px 0 0;
			padding: 10px;
		}

		td {
			padding: 10px;
		}

		.btn-block {
			width: 100%;
		}
	</style>

</head>
<body>

<div class="container">

	<h1 class="p-3"> Anime List</h1>

	<form:form>

		<table class="table table-bordered">
			<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Year</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			</thead>
			<tbody>

			<c:forEach var="anime" items="${animeList}">
				<tr>
					<td>${anime.id}</td>
					<td>${anime.name}</td>
					<td>${anime.year}</td>
					<td>
						<button type="button" class="btn btn-success">
							<a href="/editAnime/${anime.id}" style="color: #ffffff;">Edit</a>
						</button>
					</td>
					<td>
						<button type="button" class="btn btn-danger">
							<a href="/deleteAnime/${anime.id}" style="color: #ffffff;">Delete</a>
						</button>
					</td>
				</tr>

			</c:forEach>

			</tbody>
		</table>

	</form:form>

	<form:form action="/createPayment" method="post" class="mt-4">
		<div class="form-group">
			<label for="amount" class="font-weight-bold">Enter sum:</label>
			<input type="text" id="amount" name="amount" class="form-control" placeholder="Enter amount" required>
		</div>
		<button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
	</form:form>

</div>

<script src="https://cdn.jsdelivr.net/npm/web3/dist/web3.min.js"></script>
<script th:inline="javascript">
	window.onload = function () {

		var msg = "${message}";
		console.log(msg);
		if (msg == "Save Success") {
			Command: toastr["success"]("Anime added successfully!!")
		} else if (msg ==="Delete Success") {
			Command: toastr["success"]("Anime deleted successfully!!")
		} else if (msg === "Delete Failure") {
			Command: toastr["error"]("Some error occurred, couldn't delete user")
		} else if (msg === "Edit Success") {
			Command: toastr["success"]("Anime updated successfully!!")
		}

		toastr.options = {
			"closeButton": true,
			"debug": false,
			"newestOnTop": false,
			"progressBar": true,
			"positionClass": "toast-top-right",
			"preventDuplicates": false,
			"showDuration": "300",
			"hideDuration": "1000",
			"timeOut": "5000",
			"extendedTimeOut": "1000",
			"showEasing": "swing",
			"hideEasing": "linear",
			"showMethod": "fadeIn",
			"hideMethod": "fadeOut"
		}
	}

</script>
</body>

</html>