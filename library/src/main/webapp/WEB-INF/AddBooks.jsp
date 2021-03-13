<!DOCTYPE html>
<html lang="en">
<head>
  <title>AddBook</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="user.jsp"/> 
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
 <div id="addForm" style="border:1px solid black;">
<div class="container" style="background-color:white;margin-top:80px;">
  <h2>Add Books</h2>
  
  <form >
  
    <div class="form-group">
      <label> Book Name</label>
      <input type="text" class="form-control" id="bookName"  name="bookName" placeholder="Enter Book Name" name="bookName">
    </div>
    <div class="form-group">
      <label> Author Name</label>
      <input type="text" class="form-control" id="authorName" name="authorName" placeholder="Enter Author Name" name="authorName">
    </div>
    <div class="form-group">
      <label> Book Price</label>
      <input type="text" class="form-control" id="bookPrice" name="bookPrice" placeholder="Enter Book Price" name="bookPrice">
    </div>
    <div class="col-xs-6 previous">
    <button type="submit" class="btn btn-primary" style="margin-left:473px;" onclick="addBooks()">Submit</button>
    </div>
    <div class="col-xs-4 next">
    <button type="submit" class="btn btn-secondary" onclick="GetAutorList()">Authors List</button>
    </div>
  </form>
</div>
</div> 


<div class="container" style="border:1px solid black;background-color:white;margin-top:80px;">


<div id="tablee" >
<div id="showTable" class="" style="margin-left:40px;margin-top:40px;">


</div>


<div class="col-xs-6 previous">
<button type="submit" class="btn btn-secondary" style="margin-left:440px;margin-top:40px;" onclick="showAddForm()">AddBooks</button>    </div>
</div>

<!-- <div class="col-xs-6 previous">
<button type="submit" class="btn btn-secondary" style="margin-left:440px;margin-top:40px;" onclick="showAddForm()">AddBooks</button>    </div>
</div>
 -->

<div id="editModule" style="border:1px solid black;background-color:white;margin-top:80px;">

 <form >
   
    <div class="form-group">
      <label> Book Name</label>
      
                  <input readonly="readonly" type="text" class="form-control" id="editBook" value="" name="editBook" placeholder="" name="editBook" >
                        <input  type="hidden" class="form-control" id="checkready" value="" name="checkready"  name="checkready" >
      
    </div>
    <div class="form-group">
      <label> Author Name</label>
      
            <input readonly="readonly" type="text" class="form-control" id="editAuthor" value="" name="editAuthor" placeholder="" name="editAuthor" >
      
    </div>
    <div class="form-group">
      <label> Book Price</label>
      <input  type="text" class="form-control" id="editPrice" value="" name="editPrice" placeholder="" name="editPrice" >
    </div>

    
      <div class="col-xs-6 previous">
    <button type="submit" class="btn btn-primary" style="margin-left:473px;" onclick="updateRecords()">Update</button>
    </div>
    <div class="col-xs-4 next">
    <button type="submit" class="btn btn-secondary" onclick="GetAutorList()">Authors List</button>
    </div>
  </form>

</div>

</div>

<!--     <button type="submit" class="btn btn-default" onclick="showAddForm()">AddBooks</button>
 -->
<div id="successDiv" class="col-lg-6 col-lg-offset-3 alert alert-success">Added Successfully</div>

</body>
</html>


<script>

$( document ).ready(function() {
	$("#editModule").hide();
	$('#addForm').hide();
	//$("#successDiv").html("success");
	//$("#successDiv").show();

	GetAutorList();
	
});

function showAddForm()
{
	$('#addForm').show();
	$('#tablee').hide();
	//$('#showTable').hide();
	}


function checkValidtion()
{
	var bookName=$('#bookName').val();
	var authorName=$('#authorName').val();
	var bookPrice=$('#bookPrice').val();
	
	
	if(bookName==null || bookName=="" )
		{
		alert("Please Enter Book Name");
		return false;
		}
	
	if(authorName==null || authorName=="" )
	{
	alert("Please Enter Author Name");
	return false;
	}
	
	if(bookPrice==null || bookPrice=="" )
	{
	alert("Please Enter Book Price");
	return false;
	}
	return true;
	}



	
function addBooks()
{
	
	
	if(checkValidtion())
		{
		
	alert("true");
	$.ajax(
			{url: "add", 
				type:"POST",
				async: false,
				
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


	function updateRecords()
	{
		//$('#editPrice').val($('#editPrice').text());
//alert($('#editPrice').val());
//alert($('#editPrice').text());
	$.ajax(
			{url: "editBook", 
				type:"POST",
				
				data:{
					
					"bookName":$('#editBook').val(),
					"bookPrice":$('#editPrice').val(),
					
					
					
				}
			}).done(function(data){
		
	});
			
	
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
	
	
	
function GetAutorList() {
	
	
	$('#successDiv,#failiureDiv').hide();
	$('#successDiv,#failiureDiv').html("");
	$('#addForm').hide();
	$.ajax({
	url : 'searchAuthors',
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
	.html('<h4>Books Available</h4><table id="jqGrid-table"></table><div id="pager"></div>');
	 
	$('#showTable').show();
	$("#jqGrid-table").jqGrid("clearGridData");
	
	$("#jqGrid-table").jqGrid({
	data : jsonList,
	datatype : 'local',
	colNames : ['Select',
	'Author Name',
	'No Of Books Available',
	
	
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
		
		
	    
	    { name : 'AuthorName', index : 'AuthorName', width : '707px', align : 'center'},
	    
	    {name : 'BookCount', index : 'BookCount',width : '350px',formatter: function(cellvalue, options, rowobject){
			 
	        return'<a style="font-weight: bold;color:red;cursor:pointer" onclick=showFullDetails('+options.rowId+')>'+cellvalue+'</a>';
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


</style>
