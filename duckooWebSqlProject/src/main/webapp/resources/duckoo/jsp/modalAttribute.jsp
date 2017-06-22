<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <link rel="stylesheet" href="/resources/duckoo/css/modal.css?<%=request.getParameter("token")%>">
    <link rel="stylesheet" href="/resources/duckoo/css/entityAttr.css?<%=request.getParameter("token")%>">

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
    {{#selectBasic notNull}}
       <option value="false">아니오</option>
       <option value="true">예</option>   
     {{/selectBasic}}  
     </select>
   </td>
   <td class='datas'><input type='text' maxlength="10"></input></td>
 </tr>
</script> 
<script type="text/javascript" src="/resources/duckoo/js/modal.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/modalAttribute.js?<%=request.getParameter("token")%>"></script>
