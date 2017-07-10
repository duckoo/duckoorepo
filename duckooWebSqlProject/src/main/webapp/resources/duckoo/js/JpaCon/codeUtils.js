var codeUtils = (function(){
		
	var upperFirstLetter = function(entityName){
		var first = entityName[0].toUpperCase();
		var second = entityName.substring(1,entityName.length);
		
		return first+second;
	}
	var reverseRelationType = function(relationType){
		var reverseArr = relationType.split("To");
		
		var result = reverseArr[1]+"To"+reverseArr[0];
		return result;
	}



	return{upperFirstLetter:upperFirstLetter,
		  reverseRelationType:reverseRelationType
	}
	
})();

