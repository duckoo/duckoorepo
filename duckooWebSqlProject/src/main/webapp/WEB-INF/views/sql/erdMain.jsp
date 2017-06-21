<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Random" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% Random random = new Random(); 
    int token= random.nextInt();
%>
 		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/duckoo/css/modal.css?<%=token%>">
    <link rel="stylesheet" href="/resources/duckoo/css/entityAttr.css?<%=token%>">
   
    
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsPlumb/1.7.2/jquery.jsPlumb.js"></script>
<script type="text/javascript" src="/resources/duckoo/js/duckooPlumb.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/relationship.js?<%=token%>"></script>



<script type="text/javascript" src="/resources/duckoo/js/modal.js?<%=token%>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.3/jquery.nicescroll.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.3/jquery.nicescroll.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
<style>
.entity {
    width:175px; height:125px; margin-top:50px; margin-left:50px;
    -webkit-transition: width 0.5s, height 0.5s; /* For Safari 3.1 to 6.0 */
    transition: width 0.5s, height 0.5s;
    
    
    
}
.deleteTbl{
    width:100%; height:10px; font-size: 15px; font-weight: bold; color:red; text-align: right;
}
.innerEntity{
    border-radius: 10px; width:150px; height:100px; border-style: solid; border-color: gray; margin-left:10px;
    -webkit-transition: width 0.5s, height 0.5s; /* For Safari 3.1 to 6.0 */
    transition: width 0.5s, height 0.5s;
    background-color:white;
}
.table_name{
  width:100%; height:25px; border-bottom-style:solid; border-bottom-color: gray; position:relative; float:left;
}
.deleteTbl:hover{
    cursor:pointer;
}
  .select-editable { position:relative; background-color:white; border:solid grey 1px;  width:120px; height:18px; }
  .select-editable select { position:absolute; top:0px; left:0px; font-size:14px; border:none; width:120px; margin:0; }
  .select-editable input { position:absolute; top:0px; left:0px; width:100px; padding:1px; font-size:12px; border:none; }
  .select-editable select:focus, .select-editable input:focus { outline:none; }

#canvasDiv{
	background-image: url(http://freedevelopertutorials.azurewebsites.net/wp-content/uploads/2015/06/grid.png);

}


#pageTab{
	width:100%;
	height:5%;
	

}
body{
    color: #797979;
		background: #f2f2f2;
    font-family: 'Ruda', sans-serif;
    padding: 0px !important;
    margin: 0px !important;
    height:960px;
    border-width:1px;
    border-color: "black";
    border-style: solid;
}
#pageTab ul li
{
	border-top-right-radius: 30px;

}
#menuBar{
	height:40px;
	border-bottom:medium;
	border-bottom-style: groove;
	
	
}

.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #64DB99;
  border: none;
  color : #FFFFFF;
  text-align: center;
  font-size: 15px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 2px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
.




</style>
</head>


<body>


	

	<div id="pageTab">
	
		<ul class="nav nav-tabs">
    <li class="active"><a href="#"><i class="fa fa-table" aria-hidden="true"></i>&nbsp;ERD page</a></li>
    <li><a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i>&nbsp;Q&A</a></li>
    <li><a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i>&nbsp;Share</a></li>
  </ul>

	</div>
	<div id="menuBar">
		<h5 style="float:left; font-weight:bold;">&nbsp;&nbsp;저장되었습니다.&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check" aria-hidden="true"></i></h5>
		<button class="button btn btn-success" type="button" style="vertical-align:middle; float:right;" data-toggle="tooltip" data-placement="bottom" title="DB에 테이블을 생성합니다."><span>Insert DB</span></button>
		<button class="button btn btn-success" type="button" style="vertical-align:middle; float:right;" data-toggle="tooltip" data-placement="top" title="JAVA로 VO코드를 생성합니다."><span>Generate-Code</span></button>
	</div>

	<div id="mainContainer">
	<div id="wrapper" style="width:100%; height:100%">
	<div id="sideBar" style="float:left; width:15%; height:650px; background-color:#d2d2d2; border-radius: 5px;">
	 <div id="sideBtns" style="width:100%; vertical-align:middle; height:40px; border-radius: 5px;">
	 	<button id="mktbl" class="btn btn-success" style="margin-top:5px; margin-left:5px;" type="button" data-toggle="tooltip" data-placement="bottom" title="테이블생성">
	 		<i class="fa fa-table" aria-hidden="true"></i>
	 	</button>
	 	<button id="mkcon" class="btn btn-success" style="margin-top:5px;" type="button" data-toggle="tooltip" data-placement="top" title="관계생성">
			<i class="fa fa-long-arrow-down" aria-hidden="true"></i>
		</button>
	 </div>
	 <div style="width:100%; height:610px; border-radius: 5px; background-color: white;border-radius: 10px; border-style: groove;">
	 
	 </div> 
	</div>

		<div id="canvasDiv" style="float:left; width:83%; height:650px; border-bottom-style: groove ;  overflow:scroll;">
		<%@ include file="MainModal.jsp" %>
			
		</div>
		
	<div id="footer">
		<div id="cosole" style="float:left; width:70%; height:200px; border-right-style: groove;">
		
		</div>
		<div id="miniMap" style="float:left; width:28%; height:200px;">
			<div id="iframe" style="width:100%;height:100%; overflow:scroll;">
					
			</div>
		</div>
		
	</div>

	</div>
</div>


 <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.8/handlebars.js"></script>
 <script id="entityTemplate" type="text/x-handlebars-template">
<div class='entity' id='{{name}}'>
    <div class='deleteTbl' data-deleteBtn='{{name}}'>x</div>
    <div class='innerEntity' data-innerEntity='{{name}}'>
        <div class='table_name'>
           <div style='width:65%; margin-left:5px; float:left;'>{{name}}</div>
           <button class='scaleUpBtn' style='float:right;' data-scaleBtn='{{name}}'><i class='fa fa-chevron-down' aria-hidden='true' ></i></button>
        </div>
        <div class='attrArea' data-attrArea='{{name}}' data-attrAreaSmall={{name}} style='width:100%; {{#getAttrHeight extend}}{{/getAttrHeight}}; float:left; overflow:auto;'>
		{{#if extend}}
			<div class="attrTableDiv" style="width:100%;">
				<table class="attrTable">
					<tr class="pkRow">
                    	<th class="pkTh">키타입</th>
                    	<th class="pkTh">논리이름</th>
                    	<th class="pkTh">물리이름</th>
                    	<th class="pkTh">Not Null</th>
                	</tr>
				{{#attr}}
					{{#if isPk}}
                   	<tr class="pkRow">
                      	<td class="pkTd">PK{{#if isFk}} FK{{/if}}</td>
                       	<td class="pkTd">{{lName}}</td>
                        <td class="pkTd">{{pName}}</td>
                        <td class="pkTd">{{nullable}}</td>
                    </tr>
					{{else if isFk}}
                    <tr class="fkRow">
                       	<td class="fkTd">FK</td>
                        <td class="fkTd">{{lName}}</td>
                        <td class="fkTd">{{pName}}</td>
                        <td class="fkTd">{{nullable}}</td>
                   	</tr>
					{{else}}
                   	<tr class="stdRow">
                       	<td class="stdTd"></td>
                       	<td class="stdTd">{{lName}}</td>
                        <td class="stdTd">{{pName}}</td>
                        <td class="stdTd">{{nullable}}</td>
                   	</tr>
					{{/if}}
				{{/attr}}
				</table>
		{{else}}
			<div id='pk_{{name}}' style='width:100%;height:100%;'>
				{{#each attr}}
					{{#if isPk}}
						<div class="pkDiv"><i class="fa fa-key" target='pk' aria-hidden="true"></i>{{lName}}</div>
					{{else if isFk}}
						<div class="fk"><i class="fa fa-key" target='fk' aria-hidden="true"></i>{{lName}}</div>
					{{/if}}
				{{/each}}
			</div>
		{{/if}}
        </div>
    </div>
</div>
</script> 

 <script id="modalTemplate" type="text/x-handlebars-template">
<div id="{{id}}" style="display:none;
	background-color:#FFFFFF;
	position:absolute;
	top:300px;
	left:200px;
	padding:10px;
	border:2px solid #E2E2E2;
	z-Index:9999">
    <h3>Test Modal</h3>
    <p>이 창은 모달창입니다.</p>
    <button id="confirm_button">확인</button>
    <button class="js_close">닫기</button>
</div>  
</script> 


 <script id="attrAddForm" type="text/x-handlebars-template">
 <tr class='modalTr' id={{id}}>
   <td class='datas'>
 <select id="keyType_{{id}}">
  {{#select isPk isFk}}
    <option data-pk="true" data-fk="false"  value="PK">PK</option>
    <option data-pk="false" data-fk="true"  value="FK">FK</option>
    <option data-pk="true" data-fk="true"  value="PKFK">PK+FK</option>
    <option data-pk="false" data-fk="false"  value="None">None</option>
   {{/select}}
  </select>
   </td>
   <td class='datas'><input id="lName_{{id}}" type='text' value={{lName}} maxlength="10"  style="width:100px;"></input></td>
   <td class='datas'><input id="pName_{{id}}" type='text' value={{pName}}  maxlength="10" style="width:100px;"></input></td>
   <td class='datas'>
      <select style='width: 100px; height:24px; float: left;' onchange='this.nextElementSibling.value=this.value'>
             <option></option>
             <option>int()</option>
             <option>varchar()</option>
       </select>
    <input id="dataType_{{id}}" value={{datetype}} style='width: 85px; margin-left: -99px; margin-top: 1px; border: none; float: left;'/>
  </td>
   <td class='datas'>
     <select id="notNull_{{id}}">
    {{#selectBasic nullable}}
       <option value="true">아니오</option>
       <option value="false">예</option>   
     {{/selectBasic}}  
     </select>
   </td>
   <td class='datas'><input type='text' maxlength="10"></input></td>
 </tr>
</script> 

 <script id="sqlCreate" type="text/x-handlebars-template">

 create table {{name}} (  
{{#attr}}
	  {{name}},
      {{gen name type}}

 {{/attr}}
);

</script> 



 <script type="text/javascript" src="/resources/duckoo/js/entity.js?<%=token%>"></script>   
   <script type="text/javascript" src="/resources/conjs/sqlgen.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/modal.js?<%=token%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/modalAttribute.js?<%=token%>"></script>
<script>

	$(document).ready(function(){
		 setInterval(function(){
				repaint();
			},100/3);
		
		$("#mktbl").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			//modal
			$("#tbl_nameModal").modal();
			
			 
			
			
			
		});
		$("#conferm").on("click",function(e){
			var tempName = $("#tbl_name").val();
			
			EntityManager.createEntity({name:tempName,attr:[]},false);
			EntityManager.showEntity(tempName);
		});
		
	});

</script>


</body>


</html>