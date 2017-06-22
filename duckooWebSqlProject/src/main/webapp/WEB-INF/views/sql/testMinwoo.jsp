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
<script type="text/javascript" src="/resources/duckoo/js/EntityControll.js?<%=token%>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.3/jquery.nicescroll.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.3/jquery.nicescroll.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.8/handlebars.js"></script>


</head>

<body class="canvas" id="canvasDiv" style="width: 6000px; height: 6000px; border: 1px solid black;">

<jsp:include page="/resources/duckoo/jsp/entity.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 

<jsp:include page="/resources/duckoo/jsp/modalAttribute.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> 

<!--<jsp:include page="/resources/duckoo/jsp/menu.jsp">
<jsp:param name="token" value="<%=token%>" />
</jsp:include> --> 

<%@include file="MainModal.jsp" %>
<%@include file="/resources/duckoo/jsp/menu.jsp" %>


<script>
jsPlumb.ready(function() {
	 setInterval(function(){
		 console.log("re:");
		jsPlumb.repaintEverything();
	},1000/20);
	$("#identified").modal();
	var mkFlag = false;
	var tempRelation = {};
	 EntityManager.createEntity({name:"e1",attr:[]},false);
	 var en=EntityManager.getEntityByName("e1");
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"tt2",isPk:true,isFk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"tt2",isFk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"tt2",isPk:true,isFk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"tt2",isPk:true,isFk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"tt2",isPk:true,isFk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"tt2",isPk:true,isFk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"tt2",isPk:true,isFk:true});
	
	 en.setAttr({lName:"sibal3",pName:"s_sibla222233",datetype:"tt22222"});
	 en.setAttr({lName:"sibal3",pName:"s_sibla222233",datetype:"tt22222"});
	 en.setAttr({lName:"sibal3",pName:"s_sibla222233",datetype:"tt22222"});
	 EntityManager.showEntity("e1");
	 EntityManager.createEntity({name:"e32232",attr:[]},true);
	 $('.attrArea').niceScroll({ horizrailenabled: true,boxzoom: false});
	 

	 $("#makeTableBtn").on("click",function(e){
		 $("#tbl_nameModal").modal({backdrop:'static'});
		 
		 
	 });
	 $("#conform").on("click",function(e){
		 
		 var tempName = $("#tbl_name").val().trim();
		 
		 if(!EntityControll.isEntityExist(tempName)){
		 	EntityManager.createEntity({name:tempName,attr:[]},false);
		 	EntityManager.showEntity(tempName);
		 	$("#tbl_nameModal").modal('hide');
		 }
		 else{
			 console.log("중복.");
			 
		 }
		 
	 });
	
	 $("#makeRelationBtn").on("click",function(e){
		 	e.stopPropagation();
			e.preventDefault();
			console.log(mkFlag);
			var icon = $(this);
			mkFlag = (!mkFlag);
			
			if(mkFlag){
				icon.css("background-color","#FF0066");
				
				mkConnect(mkFlag,tempRelation);
				
				return;
			}else{
				icon.css("background-color","#5cb85c");
				console.log("state change");
				disbindEntityEvent();
				return;
			}
		
		
	 });
	 
	 $("#idf").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			tempRelation.temp.relationLine = "identify";
			$("#relationModal").modal("hide");
			$("#identified").modal();
			
		});
	 
	 $("#relSave").on("click",function(e){
		e.stopPropagation();
		e.preventDefault();
		console.log($("#sourceCol option:selected").val());
		tempRelation.temp.relationAttr=[$("#sourceCol option:selected").val(),$("#targetCol option:selected").val()]
		
	      $(".option").each(function() {
	    	  
	         if($(this).is(':checked')){
	        	 console.log("이ㅏ렇게 쒸바련아",$(this).val());
	            tempRelation.temp.relationType = ($(this).val());
	         }
	      });
		//tempRelation Attr이용해서 connect option 지정.
		renderManager.connectDiv({$source:$("#"+tempRelation.temp.source) ,$target:$("#"+tempRelation.temp.target),id:tempRelation.source+""+tempRelation.target});
		console.log(tempRelation);
	 });
	 
	 
	 function mkConnect(flag,tempRelation){ 
		 
		var elementArr=[]; 
	 
	 	$("#canvasDiv").on("click",".entity",function(e){
		 if(flag){	
			e.stopPropagation();
			e.preventDefault();
			var id = $(this).attr('id');
		 	if(elementArr.length==0){
			
				elementArr.push(id);
				console.log("firstArr :",elementArr);
				return;
		 	}
		 	else if(elementArr[0]!==id){
		    	var fid= elementArr[0];//relationship 이용해서  modal작업끝나고 랜더링
		    	elementArr.push(id);
		    	console.log("second :",elementArr);
		    	$("#relationModal").modal();
		    	tempRelation.temp = {source:fid,target:id,name:id+""+fid};
		    	
		    	
		    	collectSelectOption(EntityManager.getEntityByName(elementArr[0]),true);
		    	collectSelectOption(EntityManager.getEntityByName(elementArr[1]),false);
		    	console.log("tempRelation : ",tempRelation);
		    	
		    	
		    	
		    	
		    	elementArr=[];
		    	return;
		     }
		 }
	 	});
	 }
	 function disbindEntityEvent(){
			 $("#canvasDiv").off("click",".entity");
	 
	 }
	 function collectSelectOption(EntityObject,isSource){
		 console.log("entity :" ,EntityObject);
		 pkAttrArray = [];
		 for(var i=0;i<EntityObject.attr.length;i++){
			 if(EntityObject.attr[i].isPk){
				 pkAttrArray.push(EntityObject.attr[i]);
			 }
		 }
		 createSelectOption(pkAttrArray,isSource);
	 }
	 function createSelectOption(pkAttrArr,isSource){
		 var targetLink;
		 if(isSource){
			 targetLink = $("#sourceCol");
			 
		 }else{
			 targetLink = $("#targetCol");
			 
		 }
		 targetLink.html("");
		 for(var i = 0;i<pkAttrArr.length;i++){
			 targetLink.append("<option value="+pkAttrArr[i].pName+">"+pkAttrArr[i].pName+"</option>");
			 
		 }
		 
	 }

	 /*
	 var en=EntityManager.getEntityByName("e1");
	 en.setAttr({lName:"king",pName:"s_sibla",datetype:"tt2",isPk:true,isFk:true});
	 var attr=en.getAttr(0);
	 console.log("att: ",attr);
	 modalAttribute.addColumn(attr);
	 $("#myModal").modal(); */
});
	
</script>
   
  </body>
</html>