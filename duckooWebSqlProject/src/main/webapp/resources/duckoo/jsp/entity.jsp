<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <link rel="stylesheet" href="/resources/duckoo/css/entity.css?<%=request.getParameter("token")%>">

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
<script type="text/javascript" src="/resources/duckoo/js/entity.js?<%=request.getParameter("token")%>"></script>  
 
