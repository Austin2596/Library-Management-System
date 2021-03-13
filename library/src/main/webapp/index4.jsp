<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app='angularModule'>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
 -->
 <!-- <script src="lib/angular.js"></script> -->
  <script src="C:\Users\goaus\eclipse-workspace\Exam\library\src\main\resources\lib\angular.js"></script>
     <script src="C:\Users\goaus\eclipse-workspace\Exam\library\src\main\resources\js\app.js"></script>
        <script src="C:\Users\goaus\eclipse-workspace\Exam\library\src\main\resources\directives\channel-logo.js"></script> 
                 <script src="C:\Users\goaus\eclipse-workspace\Exam\library\src\main\resources\controller\index-controller.js"></script> 
        
    
  
 
<head>
<meta charset="ISO-8859-1">
<title>AngularJs</title>
</head>
<body>

<!-- <input type="text" ng-model="name">
<h1>{{name}}</h1>
 <channel-logo size="small">
</channel-logo>  -->

 <div ng-controller="IndexController">
<form ng-submit="postData()">
<input type="text" ng-model="userName">
<input type="submit" value="submit">





</form>
</div>

</body>
</html>