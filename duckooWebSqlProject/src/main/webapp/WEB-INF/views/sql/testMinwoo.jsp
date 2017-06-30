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

<script type="text/javascript" src="/resources/duckoo/js/util/Count.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/util/MyArrayUtil.js?<%=token%>"></script>




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


<jsp:include page="/resources/duckoo/jsp/RelationModal.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 

<jsp:include page="/resources/duckoo/jsp/sqlGen.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 


<script type="text/javascript" src="/resources/duckoo/js/EntityControll.js?<%=token%>"></script>
<script>
jsPlumb.ready(function() {
	 setInterval(function(){
		 console.log("re:");
		jsPlumb.repaintEverything();
	},1000/20);
	
	var mkFlag = false;
	var tempRelation = {};
	 EntityManager.createEntity({name:"e1",attr:[]},false);
	 var en=EntityManager.getEntityByName("e1");
	 en.setAttr({lName:"게시글번호",pName:"bno",datetype:"tt2",isPk:true,isFk:false});
	 en.setAttr({lName:"글제목",pName:"title",datetype:"tt2",isPk:true,isFk:false});
	 en.setAttr({lName:"글내용",pName:"content",datetype:"tt2"});
	 en.setAttr({lName:"작성자",pName:"writer",datetype:"tt2"});
	 en.setAttr({lName:"등록날자",pName:"regdate",datetype:"tt2"});
	 
	
	 v(en).show();
	 
	 
	
	 
	
	 

});
	
</script>
   
  </body>
</html>