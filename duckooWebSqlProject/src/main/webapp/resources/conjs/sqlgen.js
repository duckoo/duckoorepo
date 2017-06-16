var sqlGenerator =(function(){
	
	
	var createSQLFORM=$("#sqlCreate").html();
	var createSQLTemplate=Handlebars.compile(createSQLFORM);
	
	Handlebars.registerHelper('gen', function (cst) {
		var compareName = cst.trim();
		  if(compareName==="notnull"){
			  
		  }
		  //compare constraints type
		  return "gen_";
		});
	
	
	var generate = function(entity){
		var sql = createSQLTemplate(entity);
	       
		console.log(sql);
		
		return sql;
	}
	

	
	return {generate:generate};
})();
