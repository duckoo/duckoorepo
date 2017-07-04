<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script id="attributeMySQL" type="text/x-handlebars-template">  {{pName}} {{#genMySQLType domainName datetype datelength}}{{/genMySQLType}} {{#isNotNull isPk notNull}}{{/isNotNull}} {{#if autoIncrement}}AUTO_IMCREMENT{{/if}} {{#genMysqlEXP defaultExp}}{{/genMysqlEXP}}</script>
 <script id="mysqlCreateDDL" type="text/x-handlebars-template">
 create table {{name}}(  
  {{#genMySqlAttribute this}}{{/genMySqlAttribute}}
);

ALTER TABLE {{name}}
ADD CONSTRAINT PK_{{name}} PRIMARY KEY {{#getPk this}}{{/getPk}}

{{#genFK this}}{{/genFK}}
</script>




<script id="attributeOracle" type="text/x-handlebars-template">  {{pName}} {{#genOracleType domainName datetype datelength}}{{/genOracleType}} {{#isNotNull isPk notNull}}{{/isNotNull}}{{#genOracleEXP defaultExp}}{{/genOracleEXP}}</script>
 <script id="oracleCreateDDL" type="text/x-handlebars-template">
 create table {{name}} (  
  {{#genOracleAttribute this}}{{/genOracleAttribute}} 
);

ALTER TABLE {{name}}
ADD CONSTRAINT PK_{{name}} PRIMARY KEY {{#getPk this}}{{/getPk}}
 
{{#genFK this}}{{/genFK}}
</script>



 
<script type="text/javascript" src="/resources/duckoo/js/sql/commonSql/CommonSql.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/sql/mysql/GenMysqlSql.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/sql/oracle/GenOracleSql.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/sql/sqlFactory.js?<%=request.getParameter("token")%>"></script>

<script type="text/javascript">
SqlFactory.add(GenMysqlSql);
SqlFactory.add(GenOracleSql);


var $document =$document ||$(document);

$document.on("click","#genTest",function(e){
	console.log("hi");
	 var entityArr= EntityManager.getEntityByName();
	 var key= Object.keys(entityArr);
	 var genSql=SqlFactory.get("oracle");
	 for(var i=0,len=key.length;i<len;i++){
	    var sql = genSql.genCreateTableDDL(entityArr[key[i]]);
			 console.log("oracle : ",sql);
	 }
});

</script>
