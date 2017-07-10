var emClass = (function(){
	
	var emClassMake = function(srcEntity,targetEntity,prevPKtype,prevPKname,curTbl_name){
		
		
	
	}
	
	var emClassMakeSingleTable = function(superClassEntity){
		var pkArr = superClassEntity.search({isPK:true});
		var emClassName = superClassEntity.name+"Id";
		var code="@Embeddable\n";
		
		code+="public class "+emClassName+" implements Serialiable{\n";
		pkArr.forEach(function(attr){
			code += "\tprivate "+attr.datetype+" "+attr.pName+";\n";
		});
		
		
		//Equals and HashCode 만들어야됨.lombok 쓰는걸 권장.
		
		code+="};"
			
		return {code:code,emclass:emClassName};
		
	}
	return{emClassMake:emClassMake}
})();

