var inheritClass = (function(){
	var dk;
	var ec;
	var embeddedMaker;
	function inheritClass(EntityManager,RelationManager,NodeManager){
		this.em = EntityManager;
		this.rm = RelationManager;
		this.nm = NodeManager;
		this.ec = EntityControll;
		this.mm = new memberMaker(RelationManager,NodeManager);
	}
	inheritClass.prototype.makeClass = function(classEntity,relNode){
		var textCode = "";
		this.dk = new dualKey(classEntity,this.nm);
		if(this.ec.isDualKey(classEntity)){
			textCode += this.dk.makePKClass();
			console.log("inherit DualKey Class",textCode);
		
			
		}else{
			textCode +=this.superClass(classEntity,relNode);
			
			
		}
		
		return textCode;
	};
	
	
	inheritClass.prototype.superClass = function(classEntity,relNode){
		var classAndContructorName = codeUtils.upperFirstLetter(classEntity.name);
		
		
		var code = "";
		code += "@Entity\n";
		code += "public class "+classAndContructorName +"{\n\n";
		code += "\tpublic "+classAndContructorName+"(){};\n";
		code += this.mm.make(classEntity);
		//memberMaker's createMember;
		
		code+="};\n\n\n"
			
		code+=subClass(classEntity,relNode);
		return code;
	}
	inheritClass.prototype.subClass = function(classEntity,relNode){
		relNode.child.forEach(function(child){
			var targetRelation = MArrayUtil.intersection(child.reId,relNode.reId);
			this.makeSub(classEntity,this.em.getEntityByName(targetRelation.target),child);
			//sub는 키가 2개이상이기 때문에 여기서 Embeddable 클래스를 생성해야됨.
			
		})
	}
	inheritClass.prototype.makeSub = function(classEntity,targetEntity,targetNode){
		var tarClassName = codeUtils.upperFirstLetter(targetEntity.name);
		var srcClassName = codeUtils.upperFirstLetter(classEntity.name);
		
		
		var code = "@Entity\n";
		code +="public class "+tarClassName+"{\n"
		code += this.mm.make(targetEntity);
		
		
	}
	return inheritClass;
})();
