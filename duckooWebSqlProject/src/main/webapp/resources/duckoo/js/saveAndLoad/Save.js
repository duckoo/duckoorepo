var Save=(function(){
	
	
	
	function Save(){
		
		
	}
	
	Save.prototype.saveEntity=function(e){
		var json= JSON.stringify(e);
		console.log(json);
		var jObj=JSON.parse(json);
		console.log(jObj);
	}
	
	
	return new Save();
})();