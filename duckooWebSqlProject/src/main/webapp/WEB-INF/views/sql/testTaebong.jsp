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

<script type="text/javascript" src="/resources/duckoo/js/node/AttrNode.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/node/AttrNodeManager.js?<%=token%>"></script>

</head>

<body>


<script>
var attMan=new AttrNodeManager();
var o1= new AttrNode({id:1,val:{name:"1"}});
var o2= new AttrNode({id:2,val:{name:"2"}});
var o3=new AttrNode({id:3,val:{name:"3"}});
var o4=new AttrNode({id:4,val:{name:"4"}});

attMan.add(o1);
attMan.add(o2);
attMan.add(o3);
attMan.add(o4);


attMan.link(o1,o2);
attMan.link(o2,o3);
attMan.link(o3,o4);

attMan.del(3);

attMan.update(1,function(){
	console.log(this.id);
})



/* attMan.update(2,function(){
//	console.log(this.id);
	this.val.name="sibal";
	//console.log(this.val.name);
})
attMan.update(1,function(){
//	console.log(this.id);
	console.log(this.val.name);
})
 */



 
 
 
 

</script>   
  </body>
</html>