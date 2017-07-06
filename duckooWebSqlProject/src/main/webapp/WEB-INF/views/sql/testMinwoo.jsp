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
<script type="text/javascript" src="/resources/duckoo/js/view/dView.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/saveAndLoad/Save.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/util/Count.js?<%=token%>"></script>
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
	
	var customGrade=EntityManager.createEntity({name:"고객등급",attr:[]});
	var pk1=customGrade.setAttr({lName:"등급코드",pName:"cgNo",datetype:"INTEGER",datelength:"7",notNull:true,isPk:true,autoIncrement:true})
	 customGrade.setAttr({lName:"코드명",pName:"cgName",datetype:"VARCHAR",datelength:"32",notNull:true})
	 
	var custom= EntityManager.createEntity({name:"고객",attr:[]});
	var cPk= custom.setAttr({lName:"고객번호",pName:"cno",datetype:"INTEGER",datelength:"7",notNull:true,isPk:true,autoIncrement:true})
	var fk1=custom.setAttr({lName:"고객등급코드",pName:"cgNo",datetype:"INTEGER",datelength:"7",notNull:true,isFk:true})
	 custom.setAttr({lName:"성명",pName:"name",datetype:"VARCHAR",datelength:"32",notNull:true})
	 custom.setAttr({lName:"주소",pName:"adress",datetype:"VARCHAR",datelength:"32"});
	 custom.setAttr({lName:"전화번호",pName:"phoneNumber",datetype:"VARCHAR",datelength:"32"});
	 custom.setAttr({lName:"성별",pName:"gender",datetype:"VARCHAR",datelength:"9"});

	 v(customGrade).show({x:20,y:120});
     v(custom).show({x:20,y:600});
	  var relation = {source:"고객등급",target:"고객",relationType:"OneToMany",relationLine:"nidentify",restrictType:"cascade", name:makeName([pk1],[fk1])};
     relationfunction.setTempRelation(relation); 
     relationfunction.registRelationShipManager();

    var order=EntityManager.createEntity({name:"주문",attr:[]});
   var oPK= order.setAttr({lName:"주문번호",pName:"oNo",datetype:"INTEGER",datelength:"7",notNull:true,isPk:true,autoIncrement:true});
   var oFk= order.setAttr({lName:"고객번호",pName:"cno",datetype:"INTEGER",datelength:"7",notNull:true,isFk:true});
     custom.setAttr({lName:"주문일자",pName:"order_date",datetype:"DATE",datelength:"0",notNull:true});
	 custom.setAttr({lName:"총금액",pName:"sumMoney",datetype:"VARCHAR",datelength:"28"});
	 custom.setAttr({lName:"처리상태",pName:"state",datetype:"VARCHAR",datelength:"9",notNull:true});

	 v(order).show({x:400,y:360});
	 relation = {source:"고객",target:"주문",relationType:"OneToMany",relationLine:"nidentify",restrictType:"cascade", name:makeName([cPk],[oFk])};
	 relationfunction.setTempRelation(relation); 
	 relationfunction.registRelationShipManager();
	 
	 var stuff= EntityManager.createEntity({name:"상품",attr:[]});
	 var sPK= stuff.setAttr({lName:"상품번호",pName:"sno",datetype:"INTEGER",datelength:"28",notNull:true,isPk:true,autoIncrement:true});
	 stuff.setAttr({lName:"상품명",pName:"sname",datetype:"VARCHAR",datelength:"28",notNull:true});
	 stuff.setAttr({lName:"재고량",pName:"state",datetype:"INTEGER",datelength:"9",notNull:true});
     v(stuff).show({x:800,y:120});
	 
	 var orderStuff=EntityManager.createEntity({name:"주문상품",attr:[]});
	 orderStuff.setAttr({lName:"주문상세번호",pName:"oNoStuff",datetype:"INTEGER",datelength:"28",notNull:true,isPk:true,autoIncrement:true});
	var sFK=orderStuff.setAttr({lName:"상품코드",pName:"sno",datetype:"INTEGER",datelength:"28",notNull:true,isPk:true,isFk:true});
	 oFK= orderStuff.setAttr({lName:"주문번호",pName:"ono",datetype:"INTEGER",datelength:"28",notNull:true,isPk:true,isFk:true});
	 orderStuff.setAttr({lName:"수량",pName:"count",datetype:"INTEGER",datelength:"28"});
		
	 v(orderStuff).show({x:800,y:600});
	 relation = {source:"주문",target:"주문상품",relationType:"OneToMany",relationLine:"identify",restrictType:"cascade", name:makeName([oPK],[oFK])};
	 relationfunction.setTempRelation(relation); 
	 relationfunction.registRelationShipManager();

	 relation = {source:"상품",target:"주문상품",relationType:"OneToMany",relationLine:"identify",restrictType:"cascade", name:makeName([sPK],[sFK])};
	 relationfunction.setTempRelation(relation); 
	 relationfunction.registRelationShipManager();
	 
	 Save.saveEntity(orderStuff);
     
});
	
</script>
   
  </body>
</html>