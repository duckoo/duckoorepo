var classMaker = (function(){
	var en;
	var mm;
	var nm;
	function classMaker(EntityManager,relationManager,NodeManager){
		en = EntityManager;
		mm = new memberMaker(relationManager,NodeManager);
		this.nm = NodeManager;
	}
	classMaker.prototype.make = function(targetEntity){
		var str = "public class "+this.makeClassName(targetEntity.name)+"{\n";
		str +="\tpublic "+targetEntity.name+"(){};\n\n"
		str +=mm.make(targetEntity);
		str +="};"
		return str;
	}
	classMaker.prototype.classify = function(entityName){
		var target = en.getEntityByName(entityName);
		
		var str = this.addImport();
		str += "@Entity\n";
		str +="@Table(name = "+'"'+entityName+'"'+")\n"
		if(!EntityControll.isDualKey(target)){
			str += this.make(target);//class 문자열.
		}else{
			var dk = new dualKey(target,this.nm);
			str="";
			str += dk.makePKClass();
		}
		return str;
	}
	
	classMaker.prototype.addImport = function(){
		var str = "import javax.persistence.*;\n\n";
		return str;
	}
	
	
	return classMaker;
})();
