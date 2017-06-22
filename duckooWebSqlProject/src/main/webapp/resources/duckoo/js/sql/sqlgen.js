var GenMysqlSql=(function(){
	
var createTableDDLTemplate=Handlebars.compile($("#mysqlCreateDDL").html());

Handlebars.registerHelper("genMySQLType",
function(domainName, datetype ,datelength){
      if(DomainManager.get(domainName))return domainName;    
	return datetype+"("+datelength+")";
});
	
Handlebars.registerHelper("isEnd", function(last) {
	 if(!last)return ",";
});

Handlebars.registerHelper("getPk", function(that) {
    console.log(that);
 var pkArr= that.search({isPk:true});
       var str=pkArr[0].pName;
    for(var i=1,len=pkArr.length;i<len;i++){
    	str+=","+pkArr[i].pName;
    }
    return str;
});


	function genCreateTableDDL(entity){
		return createTableDDLTemplate(entity);
	}
	return({
        name:"mysql",		
        genCreateTableDDL:genCreateTableDDL
	});
})();

var SqlFactory=(function(){
	var arr={};
	function add(fac){
		if(!fac.name)return;
		if("genCreateTableDDL" in fac)
	      arr[fac.name]=fac;
	};
	function get(name){
		var fac=arr[name];
		if(fac)return fac;
		return undefined;
	}
	return({
		add:add,
		get:get
	});
})();

SqlFactory.add(GenMysqlSql);


/*var sqlGenerator =(function(){
	var createSQLFORM=$("#sqlCreate").html();
	var createSQLTemplate=Handlebars.compile(createSQLFORM);
	
	Handlebars.registerHelper('gen', function (cst,ty) {
		console.log("야야야야",cst,ty);
		var compareName = cst.trim();
		  if(compareName==="notnull"){
		  }
		  //compare constraints type
		  return cst;
		});
	
	var generate = function(entity){
		var sql = createSQLTemplate(entity);
		console.log(sql);
		return sql;
	}
	
	return {generate:generate};
})();*/
