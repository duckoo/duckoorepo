var maps = (function(){
	var Values= {"varchar":"String",
				 "INT":"Integer",
				 "Date":"Date",
				 "Varchar2":"String",
				 "varchar2":"String",
				 "TimeStamp":"TimeStamp"
				 };
	
	function getType(dataType){
		var reDatatype = dataType.split("(")[0];
		var type = Values[reDatatype];
		return type;
	}




	return{getType:getType}
})();


