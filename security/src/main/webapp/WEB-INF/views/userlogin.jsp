<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><%@include file="./base.jsp"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>user login</title>
<!-- Include jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Include jQuery Validation plugin -->
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/static/images/OU2FpL.jpg');
            background-size: cover;
        }
    </style>
</head>
<body>

<div class="container mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3" style="font-family: 'Arial', sans-serif; color: #4CAF50; text-shadow: 2px 2px #000000;">USER LOGIN</h1>
				
				<c:if test="${not empty msg}">
				<h5 class ="text-danger">${msg }</h5>
				<c:remove var ="msg"/>
				</c:if>
				
				
				
<form id="form" action = "userlogin" method = post>




 <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
              
               
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>

  <div class="container text-center">
  <a href="${pageContext.request.contextPath }/" class="btn btn-primary">BACK</a>
  <button type="submit" class="btn btn-primary">LOGIN</button>
</div>
</form>
<script>
    $(document).ready(function() {
    	$.validator.addMethod("customEmail", function(value, element) {
            return this.optional(element) || /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/ .test(value);
          
        },);
        $("#form").validate({
            rules: {
                
                email: {
                    required: true,
                    email: true,
                    customEmail: true
                },
                password: {
                    required: true,
                    minlength: 6
                }
            },
            messages: {
                
                email: {
                    required: "Please enter your email",
                    email: "Please enter a valid email address",
                    customEmail: "Please enter a valid email address."
                },
                password: {
                    required: "Please enter a password",
                    minlength: "Your password must be at least 6 characters long"
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });

    </script>
</div></div>
</div>


</body>
</html>