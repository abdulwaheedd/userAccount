<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP</title>
    <style>
            #container{
                width:1024px;
                height: 600px;
                margin:20px auto;
                text-align: center;
                border: 5px outset #ddd;
    			padding:5px;
            }
        </style>
</head>
<body>
<div id="container">
		<h1>User CRUD Operation using Spring Boot & Jquery Ajax<h1>
		<input type="text" id="userid" placeholder="User Id" disabled="disabled" />
        <input type="text" id="fname" placeholder="Firstname" />
        <input type="text" id="lname" placeholder="Lirstname" />
        <input type="date" id="dob" placeholder="dob" />
        <input type="email" id="email" placeholder="Email" />
        <br />
        <button id="btnSaveUser">Save User</button>
        <button id="btnEditUser">Edit User</button>
        <button id="btnUpdateUser">Update User</button>
        <button id="btnListUser">List User</button>
        <button id="btnListUserById">List User By Id</button>
        <button id="btnDeleteUserById">Delete User By Id</button>
        <hr />
        <h1>User List</h1>
        <div id="result"></div>
</div>
<script src="jquery-3.1.1.min.js"></script>
<script>
        $(function(){
			$.ajax({
			   url: "http://localhost:8080/api/users",
			   type: "GET",
			   success: function (result) {
					if(result !=null && result !=''){
						let output = "<table style='width:100%;border-collapse: collapse;' border='1'><tr><th>Id</th><th>Fname</th><th>Lname</th><th>Dob</th><th>Email</th></tr>";
						$.each(result, function(index, value){
							output +="<tr><td>"+value.id+"</td><td>"+value.firstname+"</td><td>"+value.lastname+"</td><td>"+value.dob+"</td><td>"+value.email+"</td></tr>";
						});
					   output +="</table>";
					   $("#result").html(output);
				   }
				},
				error: function(xhr, status, error) {
					if(xhr !=null && xhr !=''){
						var err = JSON.parse(xhr.responseText);
						alert(err.message);
					}
				}
			});
			$("#btnEditUser").click(function(){
				$('#userid').prop("disabled", false);
			});
			$("#btnDeleteUserById").click(function(){
				let id = $("#userid").val();

				$.ajax({
				   url: "http://localhost:8080/api/users/"+id,
				   type: "DELETE",
				   success: function (result) {
					   alert(result);
					    window.location = window.location.href;
					},
					error: function(xhr, status, error) {
					  var err = JSON.parse(xhr.responseText);
					  alert(err.message);
					}
				 });
			});
			$("#btnListUserById").click(function(){
				let id = $("#userid").val();

				$.ajax({
				   url: "http://localhost:8080/api/users/"+id,
				   type: "GET",
				   success: function (result) {
					   let output = "<table style='width:100%;border-collapse: collapse;' border='1'><tr><th>Id</th><th>Fname</th><th>Lname</th><th>Dob</th><th>Email</th></tr>";
						output +="<tr><td>"+result.id+"</td><td>"+result.firstname+"</td><td>"+result.lastname+"</td><td>"+result.dob+"</td><td>"+result.email+"</td></tr>";
					   output +="</table>";
					   $("#result").html(output);
					},
					error: function(xhr, status, error) {
					  var err = JSON.parse(xhr.responseText);
					  alert(err.message);
					  console.log(err.message);
					}
				 });
			});
			$("#btnListUser").click(function(){
				$.ajax({
				   url: "http://localhost:8080/api/users",
				   type: "GET",
				   success: function (result) {
						let output = "<table style='width:100%;border-collapse: collapse;' border='1'><tr><th>Id</th><th>Fname</th><th>Lname</th><th>Dob</th><th>Email</th></tr>";

						$.each(result, function(index, value){
							output +="<tr><td>"+value.id+"</td><td>"+value.firstname+"</td><td>"+value.lastname+"</td><td>"+value.dob+"</td><td>"+value.email+"</td></tr>";
						});
					   output +="</table>";
					   $("#result").html(output);
					},
					error: function(xhr, status, error) {
					  var err = JSON.parse(xhr.responseText);
					  alert(err.message);
					}
				 });
			});
			$("#btnSaveUser").click(function(){
				let fname = $("#fname").val();
				let lname = $("#lname").val();
				let dob = $("#dob").val();
				let email = $("#email").val();
				$.ajax({
				   url: "http://localhost:8080/api/users",
				   type: "POST",
				   dataType: "json",
				   contentType: "application/json; charset=utf-8",
				   data: JSON.stringify({ firstname: fname,lastname: lname,dob: dob, email: email }),
				   success: function (result) {
					   if(result !=null || result !=''){
					        alert("User has been saved");
                            window.location = window.location.href;
					   }
					},
					error: function(xhr, status, error) {
					  var err = JSON.parse(xhr.responseText);
					  alert(err.message);
					}
				 });
			});
			$("#btnUpdateUser").click(function(){
				let id = $("#userid").val();
				let fname = $("#fname").val();
				let lname = $("#lname").val();
				let dob = $("#dob").val();
				let email = $("#email").val();
				$.ajax({
				   url: "http://localhost:8080/api/users/"+id,
				   type: "PUT",
				   dataType: "json",
				   contentType: "application/json; charset=utf-8",
				   data: JSON.stringify({ firstname: fname,lastname: lname,dob: dob, email: email }),
				   success: function (result) {
					   if(result !=null || result !=''){
                            alert("User has been updated");
                            window.location = window.location.href;
                       }
					},
					error: function(xhr, status, error) {
					  var err = JSON.parse(xhr.responseText);
					  alert(err.message);
					}
				 });
			});
        });

    </script>
</body>
</html>