<!DOCTYPE html>
<html lang="en">
<head>
  <title>AddBook</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/css/ui.jqgrid.min.css">
      <link rel='stylesheet' type='text/css' href='http://code.jquery.com/ui/1.10.3/themes/sunny/jquery-ui.css' />
    <link rel='stylesheet' type='text/css' href='http://www.trirand.com/blog/jqgrid/themes/ui.jqgrid.css' />

    <script type='text/javascript' src='http://www.trirand.com/blog/jqgrid/js/jquery-ui-custom.min.js'></script>        
    <script type='text/javascript' src='http://www.trirand.com/blog/jqgrid/js/i18n/grid.locale-en.js'></script>
    <script type='text/javascript' src='http://www.trirand.com/blog/jqgrid/js/jquery.jqGrid.js'></script>
     
   
</head>
<body>
 <div id="userForm" style="border:1px solid black;">
<div class="container" style="background-color:#ede5e3;margin-top:80px;">
  <div style='font-size:20px;color:green;background-color: #dbcccc;font-weight: bold;'><h2 style="font-size:20px;font-family: cursive;text-align:center">Add User</h2></div>

  
  <form >
  
    <div class="form-group">
      <label> User Name</label>
      <input type="text" class="form-control" id="userName"  name="userName" placeholder="Enter User Name" name="userName">
    </div>
    <div class="form-group">
      <label> Password</label>
      <input type="text" class="form-control" id="password" name="password" placeholder="Enter Password" name="password">
    </div>
    <div class="form-group">
      <label> Mail Id</label>
      <input type="text" class="form-control" id="emailId" name="emailId" placeholder="Enter Mail Id" name="emailId">
    </div>
     <div class="form-group">
      <label> Admin Flag</label>
<select name="adminFlag" id="adminFlag">
  <option value="A">Admin</option>
  <option value="N">Normal</option>
 
</select>    </div>
 
     <div class="col-xs-6 previous">
    <button type="submit" class="btn btn-primary" style="margin-left:473px;" onclick="addUser()">ADD</button>
    </div>
    <div class="col-xs-4 next">
    <button type="submit" class="btn btn-secondary" onclick="GetUserList()">Users List</button>
    </div>
  </form>
</div>
</div> 


<div class="container" style="border:1px solid black;background-color:#ebeeef;margin-top:80px;">


<div id="tablee" >
<div id="showTable" class="" style="margin-left:40px;margin-top:40px;">


</div>


<div class="col-xs-6 previous">
<button type="submit" class="btn btn-primary" style="margin-left:440px;margin-top:40px;" onclick="showAddForm()">AddUsers</button>    </div>
</div>


<div id="editModule" style="border:1px solid black;background-color:white;margin-top:80px;">

 <form >
   
    <div class="form-group">
      <label> User Name</label>
      
                  <input readonly="readonly" type="text" class="form-control" id="editUser" value="" name="editUser" placeholder="" name="editUser" >
<!--                         <input  type="hidden" class="form-control" id="checkready" value="" name="checkready"  name="checkready" >
 -->      
   <!--  </div>
    <div class="form-group">
      <label> Password</label>
      
            <input readonly="readonly" type="text" class="form-control" id="editPassword" value="" name="editPassword" placeholder="" name="editPassword" >
      
    </div> -->
    <div class="form-group">
      <label> Email Id</label>
      <input  type="text" class="form-control" id="editEmailId" value="" name="editEmailId" placeholder="" name="editEmailId" >
    </div>

    
      <div class="col-xs-6 previous">
    <button type="submit" class="btn btn-primary" style="margin-left:473px;" onclick="updateRecords()">Update</button>
    </div>
    <div class="col-xs-4 next">
    <button type="submit" class="btn btn-secondary" onclick="GetUserList()">Users List</button>
    </div>
  </form>

</div>

</div>

<!--     <button type="submit" class="btn btn-default" onclick="showAddForm()">AddBooks</button>
 -->
<div id="successDiv" class="col-lg-6 col-lg-offset-3 alert alert-success">Added Successfully</div>


<form align="right" name="form1" action="logout" method="post">
  <label class="logoutLblPos">
  <input name="submit2" type="submit" id="submit2" value="log out">
  </label>
</form>

<form align="right" name="form1" action="menu" method="post">
  <label class="menuDirect">
  <input name="submit2" type="submit" id="submit2" value="menu">
  </label>
</form>
</body>


</html>


<script>

$( document ).ready(function() {
	$("#editModule").hide();
	$('#userForm').hide();
	//$("#successDiv").html("success");
	//$("#successDiv").show();

	//GetAutorList();
	GetUserList();
	
});

function showAddForm()
{
	$('#userForm').show();
	$('#tablee').hide();
	//$('#showTable').hide();
	}


function checkValidtion()
{
	var userName=$('#userName').val();
	var password=$('#password').val();
	var emailId=$('#emailId').val();
	
	
	if(userName==null || userName=="" )
		{
		alert("Please Enter userName");
		return false;
		}
	
	if(password==null || password=="" )
	{
	alert("Please Enter password");
	return false;
	}
	
	if(emailId==null || emailId=="" )
	{
	alert("Please Enter emailId");
	return false;
	}
	 if (!isEmail(emailId)) {
		 alert("Please Enter valid emailId");
		return false;
	} 
	return true;
	}

/* function ValidateEmail(mail) 
{
	var mailformat = "/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/";
	if(mail.match(mailformat))
	{
	alert("Valid email address!");
	
	return true;
} */

function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
	}

function addUser()
{
	
	
	if(checkValidtion())
		{
		
	
	$.ajax(
			{url: "addUserList", 
				type:"POST",
				async: false,
				
				data:{
					
					 "userName":$('#userName').val(),
					"password":$('#password').val(),
					"emailId":$('#emailId').val(),
					"adminFlag":$('#adminFlag').val()
					
					 
					
					
				}
			}).done(function(data){
				
				if(data=="success")
					{
					alert(data);
				$("#successDiv").html("success");
				$("#successDiv").show();
				document.getElementById("#successDiv").style.display="block";
				$("#failureDiv").hide();
					}
				else
					{
					alert("Username already exists..");
					}
	});
		}
	
	else
		{
		//alert("else");
		$('#checkready').val("block");
		showAddForm();
		}
	
	}
	
function addBooks()
{
	
	
	if(checkValidtion())
		{
		//alert("validated...")
//	alert("true");
	$.ajax(
			{url: "addBookList", 
				type:"POST",
				
				data:{
					
					"bookName":$('#bookName').val(),
					"authorName":$('#authorName').val(),
					"bookPrice":$('#bookPrice').val(),
					
					
					
				}
			}).done(function(data){
				$("#successDiv").html("success");
				$("#successDiv").show();
				document.getElementById("#successDiv").style.display="block";
				$("#failureDiv").hide();
	});
		}
	
	else
		{
		//alert("else");
		$('#checkready').val("block");
		showAddForm();
		}
	
	}
	
	
function editBook(id)
{
	$('#addForm').hide();
	
	$('#tablee').hide();
	
	var bookName = $('#jqGrid-table').jqGrid('getCell', id, 'BookName');
	
	var authorName = $('#jqGrid-table').jqGrid('getCell', id, 'AuthorName');
	
	var bookPrice = $('#jqGrid-table').jqGrid('getCell', id, 'BookPrice');
	
	$('#editBook').text(bookName);
	$('#editAuthor').text(authorName);
	$('#editPrice').text(bookPrice);
	
	$('#editBook').val(bookName);
	$('#editAuthor').val(authorName);
	$('#editPrice').val(bookPrice);
	$("#editModule").show();
}


	
	
	
	
	
	function deleteBook(id)
	{
		//alert(id);
		var bookName = $('#jqGrid-table').jqGrid('getCell', id, 'BookName');
		//$('#editPrice').val($('#editPrice').text());

	$.ajax(
			{url: "deleteBook", 
				type:"POST",
				
				data:{
					
					"bookName":bookName,
					
					
					
					
				}
			}).done(function(data){
				GetAutorList();
	});
			
	
	}
	
	function editUser(id)
	{
		if(id!=0)
			{
		//id=iduser.target;
		//alert(id);
		$('#userForm').hide();
		
		$('#tablee').hide();
		
		var userName = $('#jqGrid-table').jqGrid('getCell', id, 'userName');
		
		//var password = $('#jqGrid-table').jqGrid('getCell', id, 'password');
		
		var emailId = $('#jqGrid-table').jqGrid('getCell', id, 'EmailId');
		
		//alert(userName);
		
		$('#editUser').text(userName);
		//$('#editPassword').text(password);
		$('#editEmailId').text(emailId);
		
		$('#editUser').val(userName);
		//$('#editPassword').val(password);
		$('#editEmailId').val(emailId);
		$("#editModule").show();
			}
	}


		function updateRecords()
		{
			//$('#editPrice').val($('#editPrice').text());
	//alert($('#editPrice').val());
	//alert($('#editPrice').text());
		$.ajax(
				{url: "editUser", 
					type:"POST",
					
					data:{
						
						"userName":$('#editUser').val(),
						"emailId":$('#editEmailId').val()
						
						
						
						
					}
				}).done(function(data){
			
		});
				
		
		}
		
		
		
		
		function deleteUser(id)
		{
			if(id!=0)
				{
			//alert(id);
			var userName = $('#jqGrid-table').jqGrid('getCell', id, 'userName');
			//$('#editPrice').val($('#editPrice').text());

		$.ajax(
				{url: "deleteUser", 
					type:"POST",
					
					data:{
						
						"userName":userName,
						
						
						
						
					}
				}).done(function(data){
					GetUserList();
		});
				
				}
		}
		
	
function GetUserList() {
	
	
	$('#successDiv,#failiureDiv').hide();
	$('#successDiv,#failiureDiv').html("");
	$('#userForm').hide();
	$.ajax({
	url : 'searchUsers',
	type : 'POST',
	
	cache : false,
	async : false
	})
	.done(
	function(data) {
	 
	/* $('#imageLoading').hide();
	$('#loadmodal').hide();
	$('#searchBtn1').prop('disabled', false);
	  */
	 
	var jsonList = JSON.parse(data);
	  
	//  alert(data);
	$('#showTable').html('');
	$('#showTable')
	.html('<div style="color:green;background-color: #dbcccc;"><h4 style="font-size:20px;font-family: cursive;text-align:center">Members Present</h4></div><table id="jqGrid-table"></table><div id="pager"></div>');
	 
	$('#showTable').show();
	$("#jqGrid-table").jqGrid("clearGridData");
	
	$("#jqGrid-table").jqGrid({
	data : jsonList,
	datatype : 'local',
	colNames : ['Select',
	'Members','EmailId',
	'Edit','Delete'
	//'Select',
	
	],
	colModel : [
	
	 
		  {
		        name: 'MyPrint',
		        width: 80,
		        align: "center",
		        editoptions: { value: "True:False" },
		        editrules: { required: true },
		        formatter: "checkbox",
		        formatoptions: { disabled: false },
		        editable: true  }    , 
		
		
	    
	    { name : 'userName', index : 'userName', width : '707px', align : 'center'},
	   
	    { name : 'EmailId', index : 'EmailId', width : '707px', align : 'center'},

	   
	    {name : 'Edit', index : 'Edit',formatter: function(cellvalue, options, rowobject){
			 
	        return'<a style="font-weight: bold;color:red;cursor:pointer" onclick=editUser('+options.rowId+')>Edit</a>';
	    }},
	    {name : 'Delete', index : 'Delete',formatter: function(cellvalue, options, rowobject){
			 
	        return'<a style="font-weight: bold;color:red;cursor:pointer" onclick=deleteUser('+options.rowId+')>Delete</a>';
	    }},
	    
	   
	   /*  {name : 'AuthorName',index : 'AuthorName',formatter: function(cellvalue, options, rowobject) {
	        return'<a style="font-weight: bold;color:red;cursor:pointer" onclick=showFullDetails('+cellvalue+')>'+cellvalue+'</a>';
	    	
	    },align : 'center'}, */
	],
		
	 /* onSelectRow : function(rowid) {
		var auth = $('#jqGrid-table').jqGrid('getCell', rowid, 'AuthorName');
		alert(auth);
		$('#successDiv,#failiureDiv').hide();
		$('#successDiv,#failiureDiv').html("");
	}  */
		
		/* name : 'AuthorName', index : 'AuthorName',formatter: function(cellvalue, options, rowobject){
			 
	        return'<a style="font-weight: bold;color:red;cursor:pointer" onclick=showFullDetails('+cellvalue+')>'+cellvalue+'</a>';
	    }},
	    
	    { name : 'BookCount', index : 'BookCount', width : '120px', align : 'center'},
	], */
	/* {name : 'dcrTtumId', index : 'dcrTtumId',formatter: function(cellvalue, options, rowobject){
	return'<a style="font-weight: bold;color:red;cursor:pointer" onclick=showTtumInfo('+cellvalue+')>'+cellvalue+'</a>';
	}}, 
	{ name : 'tranDate', index : 'tranDate', width : '80px', align : 'center'},
	
	{ name : 'interchange', index : 'interchange', hidden : true},{ name : 'interchangeName', index : 'interchangeName', width : '100px', align : 'center'},
	],
	
	
	onSelectRow : function(rowid) {
	var tranactionChannel = $('#jqGrid-table').jqGrid('getCell', rowid, 'tranactionChannel');
	$('#successDiv,#failiureDiv').hide();
	$('#successDiv,#failiureDiv').html("");
	 

	 
	}, */
	pager:'#pager',
	rowNum : 10,
	height : 'auto',
	autowidth : true,
	shrinkToFit : false,
	rowList : [ 10, 50, 100 ],
	viewrecords : true,
	pgbuttons : true,
	gridview : true,
	subGrid : true,
	caption : "Book Store",
	
	
	
	
	}).jqGrid('navGrid', '#pager', { edit: false, add: false, del: false,search: true });
	});
	//$('#gridId').jqGrid('setGridWidth', '800')
}
function showFullDetails(id)
{
	var authName = $('#jqGrid-table').jqGrid('getCell', id, 'AuthorName');
	//alert(authName);
	
	$('#successDiv,#failiureDiv').hide();
	$('#successDiv,#failiureDiv').html("");
	$('#formAt').hide();
	$.ajax({
	url : 'showFullDetails',
	type : 'POST',
	data: {
		
		"authorName":authName
		
		
	},
	cache : false,
	async : false
	})
	.done(
	function(data) {
	 
	/* $('#imageLoading').hide();
	$('#loadmodal').hide();
	$('#searchBtn1').prop('disabled', false);
	  */
	 
	var jsonList = JSON.parse(data);
	  
	  //alert(data);
	$('#showTable').html('');
	$('#showTable')
	.html('<h4>'+authName+',s Books </h4><table id="jqGrid-table"></table><div id="pager"></div>');
	 
	$('#showTable').show();
	$("#jqGrid-table").jqGrid("clearGridData");
	
	$("#jqGrid-table").jqGrid({
	data : jsonList,
	datatype : 'local',
	colNames : [
	
	'Book Name',
	'AuthorName',
	'Book Price',
	'Published Date',
	'Edit',
	'Delete'
	
	],
	colModel : [
	
		{ name : 'BookName', index : 'BookName', width : '400px', align : 'center'},
		{ name : 'AuthorName', index : 'AuthorName', width : '400px', align : 'center' , hidden:true},

		{ name : 'BookPrice', index : 'BookPrice', width : '120px', align : 'center'},
		
		{ name : 'Created_Date', index : 'Created_Date', width : '300px', align : 'center'},
		 {name : 'Edit', index : 'Edit',formatter: function(cellvalue, options, rowobject){
			 
		        return'<a style="font-weight: bold;color:red;cursor:pointer" onclick=editBook('+options.rowId+')>Edit</a>';
		    }},
		    {name : 'Delete', index : 'Delete',formatter: function(cellvalue, options, rowobject){
				 
		        return'<a style="font-weight: bold;color:red;cursor:pointer" onclick=deleteBook('+options.rowId+')>Delete</a>';
		    }},

		
		
	],
		
	 
	
	
	
	 

	 
	
	pager:'#pager',
	rowNum : 10,
	height : 'auto',
	autowidth : true,
	shrinkToFit : false,
	rowList : [ 10, 50, 100 ],
	viewrecords : true,
	pgbuttons : true,
	gridview : true,
	subGrid : true,
	search:true,
	searchtext:"Search",
	caption : "Book Store",
	
	 
	
	
	}
	

	
	).jqGrid('navGrid', '#pager', { edit: false, add: false, del: false,search: true });
	});
	
	
	}
</script>

<style>

body
{
 background-image : url("https://collegeinfogeek.com/wp-content/uploads/2018/11/Essential-Books.jpg");

}

.logoutLblPos{

   position:fixed;
   right:10px;
   top:5px;
}
.menuDirect{

   position:fixed;
   right:10px;
   top:37px;
}

</style>
