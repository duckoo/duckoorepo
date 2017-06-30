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

Handlebars.registerHelper("isNotNull", function(ispk,notnull) {
	  var ret="";
	  if(ispk)ret="NOT NULL";
	  if(notnull)ret="NOT NULL";
    return ret;
});

Handlebars.registerHelper("genFK", function(that) { //검증 안함......
    var attr=that.search({isFk:true});
    var sql="";
    attr.forEach(function(att){
    	var pNode=attrNodeManager.get(att.id).parent;
    	var pEntity= EntityManager.getEntityByName(pNode.entity);
    	var pPname= pEntity.getAttr(Number(pNode.id)).pName;
    	var tf=att.pName;
    	var tE=pEntity.name;
    	var fxconName="FK_"+that.name +"_"+att.pName+"_"+pNode.id;
    	 sql+="ALTER TABLE "+that.name+"  ADD  CONSTRAINT "+fxconName+" FOREIGN KEY ("+tf+") REFERENCES "+tE+"("+pPname+") \n\n";
    });
    return sql;
});

function arrTofileArea(arr){
	var str=arr[0];
	for(var i=1,len = arr.length;i<len ;i++){
		str+=","+arr[i];
	}
 return str;
}

Handlebars.registerHelper("getPk", function(that) {
 var pkArr= that.search({isPk:true});
       var str=pkArr[0].pName;
    for(var i=1,len=pkArr.length;i<len;i++){
    	str+=","+pkArr[i].pName;
    }
    return str;
});

Handlebars.registerHelper("getDefault", function(exp) {
	if(exp){
		return " DEFAULT "+ exp;
	}
	return "";
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
