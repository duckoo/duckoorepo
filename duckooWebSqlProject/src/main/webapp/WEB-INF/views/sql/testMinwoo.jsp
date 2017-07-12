<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>erd main</title>
<% Random random = new Random(); 
    int token= random.nextInt();
%> 		 		
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/duckoo/css/mainModal.css">
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsPlumb/1.7.2/jquery.jsPlumb.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/duckoo/js/duckooPlumb.js?<%=token%>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.3/jquery.nicescroll.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.3/jquery.nicescroll.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.8/handlebars.js"></script>
<script type="text/javascript" src="/resources/duckoo/js/Observer.js?<%=token%>"></script>


<script type="text/javascript" src="/resources/duckoo/js/view/dView.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/util/MyArrayUtil.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/util/Count.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/saveAndLoad/SaveAndLoad.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/schema/SchemaManager.js?<%=token%>"></script>




<body class="canvas" id="canvasDiv" style="width: 6000px; height: 6000px; border: 1px solid black;">
<div id="javaClassText" style="margin-top:1500px; width:1005px; height:1000px; border-style:solid; background-color: white; overflow:auto;"></div>

<jsp:include page="/resources/duckoo/jsp/entity.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 

<jsp:include page="/resources/duckoo/jsp/modalAttribute.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 

<jsp:include page="/resources/duckoo/jsp/menu.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 


<jsp:include page="/resources/duckoo/jsp/RelationModal.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 

<jsp:include page="/resources/duckoo/jsp/jpaOptionModal.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 

<jsp:include page="/resources/duckoo/jsp/sqlGen.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include>


<script type="text/javascript" src="/resources/duckoo/js/JpaCon/emClass.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/JpaCon/codeUtils.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/JpaCon/property.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/JpaCon/PropMaker.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/JpaCon/classInfo.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/JpaCon/classManager.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/JpaCon/scanner.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/JpaCon/classInfoMaker.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/JpaCon/classifier.js?<%=token%>"></script>

<script type="text/javascript" src="/resources/duckoo/js/jpaDomain/Maps.js?<%=token%>"></script>

<script type="text/javascript" src="/resources/duckoo/js/EntityControll.js?<%=token%>"></script>

<script id="javaClasss" type="text/x-handlebars-template">
<br>--------------------------------{{className}} JPA Code-----------------------------</br>
<div id="{{className.className}}" style="width:1000px; font-weight: bold;">
    <div style="width:auto; float:left; color:#880055;">import</div><div style="margin-left:3px; width:auto; float:left; color:#040000;"> java.util.*;</div>
    <br>
    <div style="width:auto; float:left; color:#880055;">import</div><div style="margin-left:3px; width:auto; float:left; color:#040000;"> javax.persistence.*;</div>
    <br>
	<br>
    <div id="annotations_{{className}}">
     
    </div>
    <div style="width:auto; float:left; color:#880055;">public class</div><div style="margin-left:3px; width:auto; float:left; color:#040000;"> {{className}} {</div>
    <br>
    <br>
    <div style="width:auto; float:left; color:#880055;">public </div><div style="margin-left:5px;  float:left; color:#040000;">{{className}}(){</div><div style="margin-left:3px; width:auto; float:left; color:#040000;">};</div>
    
    <div id="columns_{{className}}">
	
	</div>
    
    <br>
    <div style="width:auto; float:left;"></div><div style="margin-left:3px; width:auto; float:left; color:#040000;">}</div>
</div>
</script>
<script id="classAnnotations" type="text/x-handlebars-template">
	<div id="annotation_{{className}}_{{anotation}}" style="color:#63666B">@{{annotation}}</div>
</script>


<script id="columnDivs" type="text/x-handlebars-template">	
	<br>
    <div id="columnDiv_{{className}}_{{pName}}">
	</div>
</script>

<script id="columnAnno" type="text/x-handlebars-template">
	{{#annoCheck propAnno}}
	<br>
	<div style="color:#63666B; width:auto; float:left;">@{{propAnno}}</div><div style="color:#040000; float:left;">(name=</div><div style="color:#2C03F5; float:left;">"{{colName}}"</div><div style="color:#040000; float:left;">)</div>
	{{/annoCheck}}
	{{#annoCheck1 propAnno}}
		{{#markCheck mark}}
		<br>
		<div style="color:#63666B; float:left; width:100%;">@{{propAnno}}</div>
		{{else}}
		<br>
		<div style="color:#63666B; width:auto; float:left;">@{{propAnno}}</div><div style="color:#040000; float:left;">(mappedBy=</div><div style="color:#2C03F5; float:left;">"{{joinedTable}}"</div><div style="color:#040000; float:left;">)</div>
		{{/markCheck}}
	{{/annoCheck1}}
	{{#annoCheck2 propAnno}}
		{{#markCheck mark}}
		<br>
		<div style="color:#63666B; width:auto; float:left;">@{{propAnno}}</div>
		<br>
		<div style="color:#63666B; width:auto; float:left;">@JoinColumn</div><div style="color:#040000; float:left;">(name=</div><div style="color:#2C03F5; float:left;">"{{joinedColName}}"</div><div style="color:#040000; float:left;">)</div>
		{{else}}
		<br>
		<div style="color:#63666B; float:left; width:100%;">@{{propAnno}}</div>
		{{/markCheck}}
	{{/annoCheck2}}
	{{#annoCheck3 propAnno}}
		<br>
		<div style="color:#63666B; float:left; width:100%;">@{{propAnno}}</div>
	{{/annoCheck3}}
	
</script>

<script id="columnVal" type="text/x-handlebars-template">
	<br>
	<div style="float:left; color:#880055;">private </div>
	
	<div style="margin-left:5px; float:left; color:#040000;">{{dataType}} </div><div style="margin-left:5px; color:#2C03F5; float:left;">{{pName}}</div><div style="float:left; color:#040000;">;</div>
</script>


<script>
jsPlumb.ready(function() {
	 setInterval(function(){
		 console.log("re:");
		jsPlumb.repaintEverything();
	},1000/20);

	 //이름만드는거 존나 귀찮아서..만든 임시함수임.
	 function makeName(attr1,attr2){
       var str1=""+attr1[0].id;
       var str2=""+attr2[0].id;
       for(var i=1,len=attr1.length;i<len;i++){
    	   str1+="/"+attr1[i].id;
    	   str2+="/"+attr2[i].id;
       }
		return str1+"_"+str2;
	 }
	
	var customGrade=EntityManager.createEntity({name:"customGrade",attr:[]});
	var pk1=customGrade.setAttr({lName:"등급코드",pName:"cgNo",datetype:"int",datelength:"7",notNull:true,isPk:true,autoIncrement:true})
	 customGrade.setAttr({lName:"코드명",pName:"cgName",datetype:"varchar",datelength:"32",notNull:true})
	 
	var custom= EntityManager.createEntity({name:"custom",attr:[]});
	var cPk= custom.setAttr({lName:"고객번호",pName:"cno",datetype:"int",datelength:"7",notNull:true,isPk:true,autoIncrement:true})
	var fk1=custom.setAttr({lName:"고객등급코드",pName:"cgNo",datetype:"int",datelength:"7",notNull:true,isFk:true})
	 custom.setAttr({lName:"성명",pName:"name",datetype:"varchar",datelength:"32",notNull:true})
	 custom.setAttr({lName:"주소",pName:"adress",datetype:"varchar",datelength:"32"});
	 custom.setAttr({lName:"전화번호",pName:"phoneNumber",datetype:"varchar",datelength:"32"});
	 custom.setAttr({lName:"성별",pName:"gender",datetype:"varchar",datelength:"9"});

	 v(customGrade).show({x:20,y:120});
     v(custom).show({x:20,y:600});
	  var relation = {source:"customGrade",target:"custom",relationType:"OneToMany",relationLine:"nidentify",restrictType:"cascade", name:makeName([pk1],[fk1])};
     relationfunction.setTempRelation(relation); 
     relationfunction.registRelationShipManager();

    var order=EntityManager.createEntity({name:"orders",attr:[]});
   var oPK= order.setAttr({lName:"주문번호",pName:"oNo",datetype:"int",datelength:"7",notNull:true,isPk:true,autoIncrement:true});
   var oFk= order.setAttr({lName:"고객번호",pName:"cno",datetype:"int",datelength:"7",notNull:true,isFk:true});
     custom.setAttr({lName:"주문일자",pName:"order_date",datetype:"date",datelength:"0",notNull:true});
	 custom.setAttr({lName:"총금액",pName:"sumMoney",datetype:"varchar",datelength:"28"});
	 custom.setAttr({lName:"처리상태",pName:"state",datetype:"varchar",datelength:"9",notNull:true});

	 v(order).show({x:400,y:360});
	 relation = {source:"custom",target:"orders",relationType:"OneToMany",relationLine:"nidentify",restrictType:"cascade", name:makeName([cPk],[oFk])};
	 relationfunction.setTempRelation(relation); 
	 relationfunction.registRelationShipManager();
	 
	 var stuff= EntityManager.createEntity({name:"items",attr:[]});
	 var sPK= stuff.setAttr({lName:"상품번호",pName:"sno",datetype:"int",datelength:"28",notNull:true,isPk:true,autoIncrement:true});
	 stuff.setAttr({lName:"상품명",pName:"sname",datetype:"varchar",datelength:"28",notNull:true});
	 stuff.setAttr({lName:"재고량",pName:"state",datetype:"int",datelength:"9",notNull:true});
     v(stuff).show({x:800,y:120});
	 
	 var orderStuff=EntityManager.createEntity({name:"orderItem",attr:[]});
	 orderStuff.setAttr({lName:"주문상세번호",pName:"oNoStuff",datetype:"int",datelength:"28",notNull:true,isPk:true,autoIncrement:true});
	var sFK=orderStuff.setAttr({lName:"상품코드",pName:"sno",datetype:"int",datelength:"28",notNull:true,isPk:true,isFk:true});
	 oFK= orderStuff.setAttr({lName:"주문번호",pName:"ono",datetype:"int",datelength:"28",notNull:true,isPk:true,isFk:true});
	 orderStuff.setAttr({lName:"수량",pName:"count",datetype:"int",datelength:"28"});
		
	 v(orderStuff).show({x:800,y:600});
	 relation = {source:"orders",target:"orderItem",relationType:"OneToMany",relationLine:"identify",restrictType:"cascade", name:makeName([oPK],[oFK])};
	 relationfunction.setTempRelation(relation); 
	 relationfunction.registRelationShipManager();

	 relation = {source:"items",target:"orderItem",relationType:"OneToMany",relationLine:"identify",restrictType:"cascade", name:makeName([sPK],[sFK])};
	 relationfunction.setTempRelation(relation); 
	 relationfunction.registRelationShipManager();
	 
	 console.log($(".entity").css("z-index"));
	 SchemaManager.SetNewSchema("test");
	 SchemaManager.SetNewSchema("test2");
	 SchemaManager.SetNewSchema("test3");
	 
	 
	 SchemaManager.SetNewSchema("test4");
	 //SaveAndLoad.saveToJson();
	

 	 var cf = new classifier();
 	 var attrNodes = attrNodeManager.getAllNode();
 	 var key= Object.keys(attrNodes);
 	 key.forEach(function(val){
 		cf.classify(attrNodes[val]);
 	 });
 	 	
	cf.punish();
	console.log("클래스 인포:",classManager.getClassInfoArr());
	 
	 var classInfo = classManager.getClassInfoArr();
	 
	 var emClassInfo=[];
	 
	 for(var i=0; i<classInfo.length; i++){
			if(classInfo[i].Emclass!=undefined){
				classInfo.push(classInfo[i].Emclass);
			}
	 }
	  
	 
	 
	 
	 
	 var $javaClassText = $("#javaClassText");//클래스들 붙일 곳
	 
	 var classInfoSource = $("#javaClasss").html();//클래스핸들소스
	 var javaTemplate = Handlebars.compile(classInfoSource);//클래스핸들바스컴파일
	 
	 var classAnnotationSource = $("#classAnnotations").html();//클래스어노테이션소스
	 var classAnnotationTemplate = Handlebars.compile(classAnnotationSource);// 클래스어노테이션컴파일
	 
	 
	 for(var i=0; i<classInfo.length; i++){
		 var className = classInfo[i].className;
	 	 var javaData = {className:className}; 
		 var javaHtml = javaTemplate(javaData);
	 	 $javaClassText.append(javaHtml);
	 	 for(var j=0; j<classInfo[i].annotations.length; j++){
		 		var annotation = classInfo[i].annotations[j];
		 		var classAnnotationData = {className:classInfo[i].className,annotation:annotation};
		 		
		 		var classAnnotationHtml = classAnnotationTemplate(classAnnotationData);
		 		$("#annotations_"+classInfo[i].className).append(classAnnotationHtml);
		 	 }	 
	 }
	 
	 
	 var columnDivsSource = $("#columnDivs").html();//컬럼디아브이소스
	 var columnDivsTemplate = Handlebars.compile(columnDivsSource); //컬럼디아브이컴파일
	 
	 for(var i=0; i<classInfo.length; i++){
		 for(var j=0; j<classInfo[i].properties.length; j++){
			 var pName = classInfo[i].properties[j].pName;
			 var pNameData = {className:classInfo[i].className,pName:pName};
			 var pNameHtml = columnDivsTemplate(pNameData);
			 $("#columns_"+classInfo[i].className).append(pNameHtml);
		 }
	 }

	 
	 Handlebars.registerHelper("annoCheck",function(anno,options){
		 console.log("@Column");
		 var anno = anno;
		 if(anno=="Column"){
			 return options.fn(this);
		 } else{
			 return options.inverse(this);
		 }
	 });
	 
	 Handlebars.registerHelper("annoCheck1",function(anno,options){
		 console.log("@OneToMany");
		 var anno = anno;
		 if(anno=="OneToMany"){
			 return options.fn(this);
		 } else{
			 return options.inverse(this);
		 }
	 });
	 
	 Handlebars.registerHelper("markCheck",function(mark,options){
		
		if(mark){
			return options.fn(this);
		}else{
			return options.inverse(this);
		}
	 });
	 
	 Handlebars.registerHelper("annoCheck2",function(anno,options){
		 console.log("@ManyToOne");
		 var anno = anno;
		 if(anno=="ManyToOne"){
			 return options.fn(this);
		 } else{
			 return options.inverse(this);
		 }
	 });
	 Handlebars.registerHelper("annoCheck3",function(anno,options){
		 console.log("@ID");
		 var anno = anno;
		 if(anno=="ID"){
			 return options.fn(this);
		 } else{
			 return options.inverse(this);
		 }
	 });	 
	 
	 
	 var columnAnnoSource = $("#columnAnno").html();//컬럼어노소스
	 var columnAnnoTemplate =Handlebars.compile(columnAnnoSource); // 컬럼어노컴파일 
	 
	 for(var i=0; i<classInfo.length; i++){
		 for(var j=0; j<classInfo[i].properties.length; j++){
			 for(var k=0; k<classInfo[i].properties[j].annotations.length; k++){
				 var anno = classInfo[i].properties[j].annotations[k];
				 //console.log("anno:",anno,"/i j k:",i,",",j,",",k,"/pname:",classInfo[i].properties[j].pName);
				 var colName = classInfo[i].properties[j].colName;
				 if(classInfo[i].properties[j].joinedColumn[0]!=undefined){
				 	var annoData = {propAnno:anno,colName:colName,mark:classInfo[i].properties[j].mark,joinedTable:classInfo[i].tableName,joinedColName:classInfo[i].properties[j].joinedColumn[0].pName};
				 }else{
					 var annoData = {propAnno:anno,colName:colName,mark:classInfo[i].properties[j].mark,joinedTable:classInfo[i].tableName};
				 }
				 var annoHtml = columnAnnoTemplate(annoData);
				 $("#columnDiv_"+classInfo[i].className+"_"+classInfo[i].properties[j].pName).append(annoHtml);
			 }
			 
		 }
	 }
	 
	 
	 var columnValSource = $("#columnVal").html();//컬럼변수소스
	 var coulumnValTemplate = Handlebars.compile(columnValSource);//컬럼변수템플릿
	  
	 for(var i=0; i<classInfo.length; i++){
		 for(var j=0; j<classInfo[i].properties.length; j++){
				 var pName = classInfo[i].properties[j].pName;
				 var dataType = classInfo[i].properties[j].dataType;
				
				 for(var k=0; k<classInfo[i].properties[j].annotations.length; k++){
					 if(classInfo[i].properties[j].annotations[k]=="OneToMany"){
						 dataType = "List<"+classInfo[i].properties[j].dataType+">";
						 pName = classInfo[i].properties[j].pName +" = new ArrayList()";
					 }
				 }
				 
				 
				 var valData = {pName:pName,dataType:dataType};
				 
				 
				 
				 var valHtml = coulumnValTemplate(valData);
				 $("#columnDiv_"+classInfo[i].className+"_"+classInfo[i].properties[j].pName).append(valHtml);
		 }
	 }
	 
	

     
});
</script>