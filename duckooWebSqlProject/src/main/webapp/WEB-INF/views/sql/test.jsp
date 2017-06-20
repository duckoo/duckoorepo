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
 		<script type="text/javascript" src="/resources/jsplumb.min.js"></script>
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
    border-radius: 10px; width:150px; height:100px; border-style: solid; border-color: red; margin-left:10px;
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

</style>

</head>
 <body>
    <div class="canvas" id="canvasDiv"
      style="width: 1000px; height: 1000px; border: 1px solid black;">
    </div>
  
  
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Large Modal</button>
  
 <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.8/handlebars.js"></script>
 <script id="entityTemplate" type="text/x-handlebars-template">
<div class='entity' id='{{name}}'>
        <div class='deleteTbl' data-deleteBtn='{{name}}'>x</div>
        <div class='innerEntity' data-innerEntity='{{name}}'>
          <div class='table_name'>
              <div style='width:65%; margin-left:5px; float:left;'>{{name}}</div>
              <button class='scaleUpBtn' style='float:right;' data-scaleBtn='{{name}}'><i class='fa fa-chevron-down' aria-hidden='true' ></i></button>
          </div>
            <div class='attrArea' data-attrArea='{{name}}' data-attrAreaSmall={{name}} style='width:100%; {{#getAttrHeight extend}}{{/getAttrHeight}}; position:relative; float:left; overflow:auto;'>
              <div style='width:100%; height:100%; background-color: rgba(255, 0, 0, 0.5);'>  
               {{#if extend}}
					<div style="width:100%;">  
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
   					    </div>
					</div>
				</div>
              {{else}}
			  <div id='pk_{{name}}' style='width:100%;height:100%;'>
                   {{#each attr}}
                            {{#if isPk}}    
                              <div class="pk"><i class="fa fa-key" target='pk' aria-hidden="true"></i>{{lName}}</div>
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

jsPlumb.ready(function() {
	 setInterval(function(){
		repaint();
	},100/3);

	/*  EntityManager.createEntity({name:"e1"},true);
	 var en=EntityManager.getEntityByName(-"e1");
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"tt2",isPk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla2222",datetype:"tt222",isPk:true});
	 
	 console.log("or: ",en);
	 var c1 = en.clone();
	 console.log("cl: ",c1);
	 c1.setAttr({id:0,lName:"change",pName:"change",datetype:"change",isPk:true})
	  console.log("or-1: ",en);
	 console.log("cl-1: ",c1);
	 
	 EntityManager.setEntity(c1);
	 
	 console.log("jebal: ",EntityManager.getEntityByName("e1")); */
	 
//	 modalAttribute.setModal(modal);
	 EntityManager.createEntity({name:"e1",attr:[]},false);
	 var en=EntityManager.getEntityByName("e1");
	
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"tt2",isPk:true,isFk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"tt2",isPk:true,isFk:true});
	 en.setAttr({lName:"sibal",pName:"s_sibla",datetype:"tt2",isPk:true,isFk:true});
	 en.setAttr({lName:"sibal3",pName:"s_sibla222233",datetype:"tt22222"});
	 en.setAttr({lName:"sibal3",pName:"s_sibla222233",datetype:"tt22222"});
	 en.setAttr({lName:"sibal3",pName:"s_sibla222233",datetype:"tt22222"});
	 
	 EntityManager.showEntity("e1");
	 EntityManager.createEntity({name:"e32232",attr:[]},true);
	 //niceScroll({ horizrailenabled: true});
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