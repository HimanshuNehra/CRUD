<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
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
				<h1 class="text-center mb-3" style="font-family: 'Arial', sans-serif; color: #4CAF50; text-shadow: 2px 2px #000000;">Change product detail</h1>
				
				<form id="productForm" action="${pageContext.request.contextPath}/handle-product" method="post" >
				
				

              <input type="hidden" value="${product.pid}" name="pid"	/>
		             <div class="form-group">
						<label for="name">Product Name</label> <input type="text"
							class="form-control" id="name" name="name" 
							placeholder="Enter the product name here" 
							value="${product.name }"
							>
					</div>
					
					<div class="form-group">
						<label for="description">Product Description</label> <textarea
							class="form-control" id="description" name="description"
							placeholder="Enter the product description here">${product.description}
							</textarea>
					</div>
					
					<div class="form-group">
						<label for="price">Product price</label> <input type="text"
							class="form-control" id="price" name="price"
							placeholder="Enter the product price here" 
							value ="${product.price}"
							>
					</div>
					<div class="container text-center">
					<a href="${pageContext.request.contextPath }/addback" class="btn btn-outline-warning">Back</a>
					
					
					<button type="submit" class="btn btn-primary">update</button>
					
					</div>
					
				</form>
			<script>
    $(document).ready(function() {
    	
    	$.validator.addMethod("alpha", function(value, element) {
	        return this.optional(element) || /^[a-zA-Z\s]+$/.test(value);
	    }, );
    	
        $("#productForm").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 3,
                    alpha: true
                },
                description: {
                    required: true,
                    minlength: 10
                },
                price: {
                    required: true,
                    number: true,
                    max: 1000000
                }
            },
            messages: {
                name: {
                    required: "Please enter the product name",
                    minlength: "Name must be at least 3 characters long",
                    alpha:"Please enter a valid name"
                },
                description: {
                    required: "Please enter the product description",
                    minlength: "Description must be at least 10 characters long"
                },
                price: {
                    required: "Please enter the product price",
                    number: "Please enter a valid number for the price",
                    max: "Price must be less than 1,000,000"
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