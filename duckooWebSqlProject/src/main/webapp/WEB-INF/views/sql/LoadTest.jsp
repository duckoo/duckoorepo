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
<script type="text/javascript" src="/resources/duckoo/js/saveAndLoad/SaveAndLoad.js?<%=token%>"></script>
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
	 
    var test={"entitys":{"고객등급":{"name":"고객등급","extend":false,"attr":[{"lName":"등급코드","pName":"cgNo","datetype":"INTEGER","datelength":"7","notNull":true,"isPk":true,"autoIncrement":true,"id":1},{"lName":"코드명","pName":"cgName","datetype":"VARCHAR","datelength":"32","notNull":true,"id":2}],"top":120,"left":20},"고객":{"name":"고객","extend":false,"attr":[{"lName":"고객번호","pName":"cno","datetype":"INTEGER","datelength":"7","notNull":true,"isPk":true,"autoIncrement":true,"id":3},{"lName":"고객등급코드","pName":"cgNo","datetype":"INTEGER","datelength":"7","notNull":true,"isFk":true,"id":4},{"lName":"성명","pName":"name","datetype":"VARCHAR","datelength":"32","notNull":true,"id":5},{"lName":"주소","pName":"adress","datetype":"VARCHAR","datelength":"32","id":6},{"lName":"전화번호","pName":"phoneNumber","datetype":"VARCHAR","datelength":"32","id":7},{"lName":"성별","pName":"gender","datetype":"VARCHAR","datelength":"9","id":8},{"lName":"주문일자","pName":"order_date","datetype":"DATE","datelength":"0","notNull":true,"id":11},{"lName":"총금액","pName":"sumMoney","datetype":"VARCHAR","datelength":"28","id":12},{"lName":"처리상태","pName":"state","datetype":"VARCHAR","datelength":"9","notNull":true,"id":13}],"top":600,"left":20},"주문":{"name":"주문","extend":false,"attr":[{"lName":"주문번호","pName":"oNo","datetype":"INTEGER","datelength":"7","notNull":true,"isPk":true,"autoIncrement":true,"id":9},{"lName":"고객번호","pName":"cno","datetype":"INTEGER","datelength":"7","notNull":true,"isFk":true,"id":10}],"top":360,"left":400},"상품":{"name":"상품","extend":false,"attr":[{"lName":"상품번호","pName":"sno","datetype":"INTEGER","datelength":"28","notNull":true,"isPk":true,"autoIncrement":true,"id":14},{"lName":"상품명","pName":"sname","datetype":"VARCHAR","datelength":"28","notNull":true,"id":15},{"lName":"재고량","pName":"state","datetype":"INTEGER","datelength":"9","notNull":true,"id":16}],"top":120,"left":800},"주문상품":{"name":"주문상품","extend":false,"attr":[{"lName":"주문상세번호","pName":"oNoStuff","datetype":"INTEGER","datelength":"28","notNull":true,"isPk":true,"autoIncrement":true,"id":17},{"lName":"상품코드","pName":"sno","datetype":"INTEGER","datelength":"28","notNull":true,"isPk":true,"isFk":true,"id":18},{"lName":"주문번호","pName":"ono","datetype":"INTEGER","datelength":"28","notNull":true,"isPk":true,"isFk":true,"id":19},{"lName":"수량","pName":"count","datetype":"INTEGER","datelength":"28","id":20}],"top":600,"left":800}},"relations":{"1":{"name":"1_4","id":1,"source":"고객등급","target":"고객","count":1,"relationLine":"nidentify","restrictType":"cascade","relationType":"OneToMany"},"2":{"name":"3_10","id":2,"source":"고객","target":"주문","count":1,"relationLine":"nidentify","restrictType":"cascade","relationType":"OneToMany"},"3":{"name":"9_19","id":3,"source":"주문","target":"주문상품","count":1,"relationLine":"identify","restrictType":"cascade","relationType":"OneToMany"},"4":{"name":"14_18","id":4,"source":"상품","target":"주문상품","count":1,"relationLine":"identify","restrictType":"cascade","relationType":"OneToMany"}},"nodes":{"circularID":{"1":{"child":["4"],"id":"1"},"3":{"child":["10"],"id":"3"},"4":{"parent":"1","child":[],"id":"4"},"9":{"child":["19"],"id":"9"},"10":{"parent":"3","child":[],"id":"10"},"14":{"child":["18"],"id":"14"},"18":{"parent":"14","child":[],"id":"18"},"19":{"parent":"9","child":[],"id":"19"}},"value":{"1":{"id":"1","reId":[1],"entity":"고객등급"},"3":{"id":"3","reId":[2],"entity":"고객"},"4":{"id":"4","reId":[1],"entity":"고객"},"9":{"id":"9","reId":[3],"entity":"주문"},"10":{"id":"10","reId":[2],"entity":"주문"},"14":{"id":"14","reId":[4],"entity":"상품"},"18":{"id":"18","reId":[4],"entity":"주문상품"},"19":{"id":"19","reId":[3],"entity":"주문상품"}}}}
    
    var jSon=JSON.stringify(test);
	SaveAndLoad.load(jSon)
	
});
	
</script>
   
  </body>
</html>