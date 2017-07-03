var GenMysqlSql=(function(){
	
var createTableDDLTemplate=Handlebars.compile($("#mysqlCreateDDL").html());


Handlebars.registerHelper("genMySQLType",
function(domainName, datetype ,datelength){
      if(DomainManager.get(domainName))return domainName;    
	return datetype+"("+datelength+")";
});
	

Handlebars.registerHelper("getDefault", function(exp) {
	if(exp){
		return " DEFAULT "+ exp;
	}
	return "";
});

	function genCreateTableDDL(entity){
		var pkId= entity.search({isPk:true})[0].id;
        var childEntitys=[];
    	childEntitys.push(entity);
	    var str=CommonSql.dropTable(entity)+"\n";
	    
		attrNodeManager.relationTour(pkId,function(rId){
			var rel= relationManager.get(rId);
			childEntitys.push(EntityManager.getEntityByName(rel.target));
		})
		
		for(var i=0,len=childEntitys.length;i<len;i++){
			str+=createTableDDLTemplate(childEntitys[i])+"\n";
		}
		 return str;
	}
	return({
        name:"mysql",		
        genCreateTableDDL:genCreateTableDDL
	});
})();