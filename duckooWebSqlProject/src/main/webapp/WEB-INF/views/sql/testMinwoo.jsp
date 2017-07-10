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
<script type="text/javascript" src="/resources/duckoo/js/relationship.js?<%=token%>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.3/jquery.nicescroll.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.3/jquery.nicescroll.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.8/handlebars.js"></script>
<script type="text/javascript" src="/resources/duckoo/js/Observer.js?<%=token%>"></script>

<script type="text/javascript" src="/resources/duckoo/js/view/dView.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/util/MyArrayUtil.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/util/Count.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/view/dView.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/saveAndLoad/Save.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/util/Count.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/util/MyArrayUtil.js?<%=token%>"></script>


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
<script>
jsPlumb.ready(function() {
	 setInterval(function(){
		 console.log("re:");
		jsPlumb.repaintEverything();
	},1000/20);
	


	var tempRelation = {};
	 EntityManager.createEntity({name:"e1",attr:[]},false);
	 var en=EntityManager.getEntityByName("e1");

	 en.setAttr({lName:"게시글번호",pName:"bno",datetype:"INT()",isPk:true,isFk:false});
	 en.setAttr({lName:"글제목",pName:"title",datetype:"varchar()",isPk:false,isFk:false});
	 en.setAttr({lName:"글내용",pName:"content",datetype:"varchar()"});
	 en.setAttr({lName:"작성자",pName:"writer",datetype:"varchar"});
	 en.setAttr({lName:"등록날자",pName:"regdate",datetype:"varchar"});

	 EntityManager.createEntity({name:"e2",attr:[]},false);
	 var en2=EntityManager.getEntityByName("e2");
	 en2.setAttr({lName:"댓글번호",pName:"rno",datetype:"varchar",isPk:true,isFk:false});
	 en2.setAttr({lName:"게시글번호",pName:"bno",datetype:"INT()",isPk:true,isFk:true});
	 en2.setAttr({lName:"댓글제목",pName:"title",datetype:"varchar"});
	 en2.setAttr({lName:"댓글내용",pName:"content",datetype:"varchar"});
	 en2.setAttr({lName:"댓글작성자",pName:"writer",datetype:"varchar"});
	 en2.setAttr({lName:"댓글등록날자",pName:"regdate",datetype:"varchar"});
	  
	 
	 EntityManager.createEntity({name:"e3",attr:[]},false);
	 var en3=EntityManager.getEntityByName("e3");
	 en3.setAttr({lName:"파일번호",pName:"fno",datetype:"varchar()",isPk:true,isFk:false});
	 en3.setAttr({lName:"게시글번호",pName:"bno",datetype:"INT()",isPk:false,isFk:true});
	 en3.setAttr({lName:"게시글번호",pName:"fname",datetype:"varchar()"});
	
	
	 
	 relationfunction.setTempRelation(relation);
	 v(en).show();
	 v(en2).show();
	 v(en3).show();

 	var relation = {source:"e1",target:"e2",relationType:"OneToMany",relationLine:"identify",restrictType:"cascade", name:en.search({pName:"bno"})[0].id+"_"+en2.search({pName:"bno"})[0].id};

	 relationfunction.setTempRelation(relation);
	relationfunction.registRelationShipManager(); 
	
	relation = {source:"e1",target:"e3",relationType:"OneToMany",relationLine:"nidentify",restrictType:"cascade", name:en.search({pName:"bno"})[0].id+"_"+en3.search({pName:"bno"})[0].id};
	relationfunction.setTempRelation(relation);
	relationfunction.registRelationShipManager();
	
	/*  var cm =new classMaker(EntityManager,relationManager,attrNodeManager);
	 console.log(cm);
	 console.log(cm.classify("e1"));  */
 	var cf = new classifier();
	 
	 cf.classify(attrNodeManager.get("7"));
	 cf.classify(attrNodeManager.get("7"));
	 
	 classManager.getClassInfoArr();

     
});
	
</script>
   
  </body>
</html>