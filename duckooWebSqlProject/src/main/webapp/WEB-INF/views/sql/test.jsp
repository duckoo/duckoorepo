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
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsPlumb/1.7.2/jquery.jsPlumb.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/duckoo/js/duckooPlumb.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/relationship.js?<%=token%>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.3/jquery.nicescroll.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.3/jquery.nicescroll.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.8/handlebars.js"></script>

<script type="text/javascript" src="/resources/duckoo/js/Observer.js?<%=token%>"></script>  
<script type="text/javascript" src="/resources/duckoo/js/view/dView.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/util/kAOP.js?<%=token%>"></script>


</head>
<body class="canvas" id="canvasDiv" style="width: 6000px; height: 6000px; border: 1px solid black;">

<jsp:include page="/resources/duckoo/jsp/entity.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 

<jsp:include page="/resources/duckoo/jsp/modalAttribute.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 

<jsp:include page="/resources/duckoo/jsp/menu.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include>  


<jsp:include page="/resources/duckoo/jsp/sqlGen.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 


<script>
jsPlumb.ready(function() {
	 
	setInterval(function(){
	   jsPlumb.repaintEverything();
	},1000/20);
	
	  EntityManager.createEntity({name:"e1"});
	 var en=EntityManager.getEntityByName("e1");
	
	 
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"int",datelength:10,isPk:true,isFk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"int",datelength:11,isFk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"int",datelength:12,isPk:true,isFk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"int",datelength:13,isPk:true,isFk:true});

	
	v(en).show();
	/* console.log("fac: ",fac);
	fac.inject(en)
	console.log("show",en.show);
	console.log(": ",en);
	en.show.call(en);
	fac.show.call(en);
	console.log()
	 */
/* 	
	 RelationShipManager.createRelationship({name:"r1",source:"test", target:"e1" ,RelationAttrName:[ ["1","2"],["3","4"] ] })
	 */
/* var kp=	 new kAOP();	 
	 	 kp.before(SqlFactory,"get",function(){
		 console.log("AOP TEST ",this);
	 }) */
	 
	/* var genSql=SqlFactory.get("mysql");
	var sql = genSql.genCreateTableDDL(en);
	 console.log("sql: ",sql);  */


	/* var obj={
     name:"name",
      kyb:{1:"dd",2:"ss"},
      zz:[1,2,3,4,5]
	}
	spyContainer(obj); */
	/*  obj.name.observe(function(pt){
		 console.log("arg: ",pt)
			console.log("observe---------------");
	})
	obj.name.change(); */
	
	/* console.log("why ",obj.name("sibal"));
	 */
	 
	// obj.kyb("1","564");
	/*  console.log(obj.kyb("1"));
	 console.log("key 1: ",obj.kyb("1")); */
	/* console.log("z: ", obj.zz(1,"ssss"));
    console.log("z: ", obj.zz(1,"222"));        
    console.log("z: ", obj.zz(1)); 
    
  //  console.log("name: ", obj.name("siba"));  
    console.log("name: ", obj.name());  
     */
 //   console.log("why2: ",obj.name("sibal"));
//  observer ex....
/*  EntityManager.createEntity({name:"e1"},true); 
 var observer=Object.create(Obsever);
 observer.init("entityclick",function(opt){
	console.log(opt); 
 });
  observer.fx=function(opt){
	 console.log("hi");
 } 
  EntityManager.Obserable.setEventObserver("click",observer);
  EntityManager.Obserable.setEventObserver("scaleUpBtn_click",observer);  */ 
     
  
  
}); 
	
</script>
   
  </body>
</html>