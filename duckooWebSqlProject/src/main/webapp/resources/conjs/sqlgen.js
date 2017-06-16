var sqlGenerator =(function(){
	
	
	var createSQLFORM=$("#sqlCreate").html();
	var createSQLTemplate=Handlebars.compile(createSQLFORM);
	
	Handlebars.registerHelper('gen', function (cst) {
		var compareName = cst.trim();
		  if(compareName==="notnull"){
			  
		  }
		  return "gen_";
		});
	
	
	var generate = function(entity){
		var sql = createSQLTemplate(entity);
	       
		console.log(sql);
		
		return sql;
	}
	
	var searchAttributes = function(targetEntityObject){
		
		var subText="";
		var targetAttr = targetEntityObject.getAttr();
		
		targetEntity.getAttr({constraint:"pk"})
		
		for(var i=0;i<targetEntity.getAttr().length;i++){
			subText+="\t"+targetAttr[i].name + " " + targetAttr[i].type + ",\n";
		}
		
		return subText;
	}
	
	
	return {generate:generate};
})();
