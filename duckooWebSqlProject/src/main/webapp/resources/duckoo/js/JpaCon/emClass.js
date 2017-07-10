var emClass = (function(){
	
	
	var makeEmClass = function(targetEntity){
		var emClassInfo = new classInfo();
		
		emClassInfo.className = codeUtils.upperFirstLetter(targetEntity.name)+"Id";
		
		emClassInfo.setProp(makeEmProps(targetEntity,emClassInfo)); 
		
		emClassInfo.addAnnotations("Embeddable");
		
		
		
		return emClassInfo;
	};
	
	var makeEmProps = function(targetEntity,emClassInfo){
		var pkArr = targetEntity.search({isPk:true});
		var props = [];
		pkArr.forEach(function(pkcol){
			pkProp = new property();
			pkProp.addAnnotations("Column");
			pkProp.addAnnotations("id");
			pkProp.pName = pkcol.pName;
			pkProp.ColumnName = (pkcol.pName).toUpperCase();
			props.push(pkProp);
		});
		return props;
	}
	
	return {makeEmClass:makeEmClass}
})();
