

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<%@ page isELIgnored="false" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title> Registration Form</title>
</head>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1 style="background-color: #0078d7;">Menu</h1>

<br>


<!-- <a href="user.jsp">User Details</a> |   
<a href="AddBooks.jsp">Book Details </a>  -->
<%-- <div><%= request.getParameter("userId") %></div> --%>

<%
    if (request.getParameter("adminFlag")!=null && request.getParameter("adminFlag").equalsIgnoreCase("A")) {
       
         // out.println(request. getParameter("userId"));
    	   out.println("<div style='font-size:20px;color:green;background-color: #dbcccc;font-weight: bold;'><a href='user.jsp'>User Details</a> </div><br>");
           out.println("<div style='font-size:20px;color:green;background-color: #dbcccc;font-weight: bold;'><a href='AddBooks.jsp'>Book Details </a></div>");

    } else {
        //out.println("Hello <b>"+request. getParameter("name")+"</b>!");
     
        
        out.println("<div style='font-size:20px;color:green;background-color: #dbcccc;font-weight: bold;'><a href='UserAddBooks.jsp'>Book Details </a></div> ");


    }
%>

<div id="bckg">

</div>
<form align="right" name="form1" action="logout" method="post">
  <label class="logoutLblPos">
  <input name="submit2" type="submit" id="submit2" value="log out">
  </label>
</form>

<script>
function logout()
	{
		//$('#editPrice').val($('#editPrice').text());
//alert($('#editPrice').val());
//alert($('#editPrice').text());
alert("logout")
	 $.ajax(
			{url: "logout", 
				type:"POST",
				
				data:{
					
					
					
					
				}
			}).done(function(data){
		
	}); 
			
	
	}

</script>
<style>
.logoutLblPos{

   position:fixed;
   right:10px;
   top:5px;
}
#bckg
{
 background-image : url("https://collegeinfogeek.com/wp-content/uploads/2018/11/Essential-Books.jpg");


margin-top: 80px;
margin-left: 305px;
width: 979px;
height: 388px;
}
</style>
  </body>
  


</html>
 
 