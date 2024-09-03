<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="./base.jsp"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
<title>LogIn</title>
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
				<h1 class="text-center mb-3" style="font-family: 'Arial', sans-serif; color: #4CAF50; text-shadow: 2px 2px #000000;">USER SIGN UP</h1>
				
				<c:if test="${not empty msg }">
				<h5 class="text-success">${msg }</h5>
				<c:remove var="msg"/>
				</c:if>
				
				<c:if test="${not empty msg3}">
				<h5 class ="text-danger">${msg3 }</h5>
				<c:remove var ="msg3"/>
				</c:if>
				
				<c:if test="${not empty msg4}">
				<h5 class ="text-danger">${msg4 }</h5>
				<c:remove var ="msg4"/>
				</c:if>
				
          <form id="myForm" action = "Home" method = post>
  
            <div class="form-group">
                <label for="username" >Name:</label>
                <input type="text" class="form-control" id="username" name="username"  value="${user.username }" required>
            </div>
          
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email"  value="${user.email }" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password"  value="${user.password }" required>
                

            </div>
            <div class="form-group" >
            <tr><td>Status:</td><td>  
             <input type="radio" name="admin" value="1" />Active  
             <input type="radio" name="admin" value="2" />Deactive</td></tr>  
            
            </div>
            
            <c:if test="${not empty msg7}">
				<h5 class ="text-danger">${msg7 }</h5>
				<c:remove var ="msg7"/>
				</c:if>
					
            <button type="submit" class="btn btn-primary btn-block" >Submit</button>
            
            <a href="${pageContext.request.contextPath }/addback" class="btn btn-outline-danger btn-block">Back</a>
        
    </form>
    <script>
    $(document).ready(function() {
    	
    	$.validator.addMethod("alpha", function(value, element) {
	        return this.optional(element) || /^[a-zA-Z\s]+$/.test(value);
	    }, );
    	$.validator.addMethod("customEmail", function(value, element) {
            return this.optional(element) || /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/ .test(value);
          
        },);
	
    	
        $("#myForm").validate({
            rules: {
                username: {
                    required: true,
                    minlength: 3,
                    alpha: true
                },
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
                username: {
                    required: "Please enter your name",
                    minlength: "Your name must consist of at least 3 characters",
                    alpha: "Please enter the valid name"
                },
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
    </div>
    </div>
    </div>
    </body>
    </html>
        
        
        
        
        
        
        