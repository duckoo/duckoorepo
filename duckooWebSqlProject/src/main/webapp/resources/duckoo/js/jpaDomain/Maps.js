var maps = (function(){
	var Values= {"varchar":"String",
				 "INT":"Integer",
				 "Date":"Date"
				 };
	
	function getType(dataType){
		var type = Values[dataType];
		return type;
	}




	return{getType:getType}
})();


