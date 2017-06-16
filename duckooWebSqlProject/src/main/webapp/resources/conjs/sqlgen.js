var genConnector = function initGen(canvasID, EntityManager){
	
	
	$("#"+canvasID).on("click",".entity",function(e){
		e.stopPropagation();
		e.preventDefault();
		console.log("id for findEntityDiv",this.id);
		var id = this.id;
		console.log("arr",EntityManager.entityArr);
		var target = EntityManager.searchForId(id);
		generate(target);
		console.log(Entitys);
	});
	
	
	var generate = function(targetEntity,targetRelations){
		console.log(targetEntity);
		var sql = "create table " + targetEntity.name + "(" +"\n";
		
		searchAttributes();
		
		sql += "\n);"
			console.log(sql);
		return sql;
	}
	
	var searchAttributes = function(targetEntity){
		console.log(targetEntity);
		
	}
}
