var classMaker = (function(){
	var en;
	var mm;
	function classMaker(EntityManager,relationManager,NodeManager){
		en = EntityManager;
		mm = new memberMaker(relationManager,NodeManager);
	}
	classMaker.prototype.make = function(targetEntity){
		var str = "public class "+targetEntity.name+"{\n";
		str +=mm.make(targetEntity);
		str +="};"
		return str;
	}
	classMaker.prototype.classify = function(entityName){
		var target = en.getEntityByName(entityName);
		
		var str = "@Entity\n";
		str +="@Table(name = "+entityName+")\n";
		if(!EntityControll.isDualKey(target)){
			str += this.make(target);//class 문자열.
		}
		return str;
	}
	

	return classMaker;
})();
