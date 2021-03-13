app.directive('channelLogo',function()
{
	
	return{
		
	restrict:"EA",
	/*template:"<h1>hello</h1>"*/
	template:function(_element,atribute)
	{
		alert(atribute.size);
		
	}
	}
});