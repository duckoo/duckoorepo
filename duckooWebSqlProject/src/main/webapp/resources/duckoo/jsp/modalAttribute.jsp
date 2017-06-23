<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <link rel="stylesheet" href="/resources/duckoo/css/modal.css?<%=request.getParameter("token")%>">
    <link rel="stylesheet" href="/resources/duckoo/css/entityAttr.css?<%=request.getParameter("token")%>">

 <script id="attrAddForm" type="text/x-handlebars-template">
        <div class='modalTr'>
            <div class='datas'>
                <select id="keyType_{{id}}">
                  {{#select isPk isFk}}
                    <option data-pk="true" data-fk="false"  value="PK">PK</option>
                    <option data-pk="false" data-fk="false"  value="None">None</option>    
                  {{/select}}
                </select>
            </div>
            <div class='datas'><input id="lName_{{id}}" type='text' value={{lName}} style="width:100px;"></input></div>
            <div class='datas'><input id="pName_{{id}}" type='text' value={{pName}} style="width:100px;"></input></div>
            <div class='datas'>
                <select style='width: 100px; height:24px; float: left;' onchange='this.nextElementSibling.value=this.value'>
                    <option></option>
                    <option>int()</option>
                    <option>varchar()</option>
                </select>
                <input id="dataType_{{id}}" value={{datetype}} style='width: 85px; margin-left: -99px; margin-top: 1px; border: none; float: left;'/>
            </div>
            <div class='datas'><input type='text' style='width:100px;'></input></div>
            <div class='datas'><button class="openConstraintBtn" data-openCB="{{id}}">+</button></div>
        </div>
        <div class='modalTr' id="openDiv_{{id}}" name='ConstraintCheckBox'>
            <input type='checkbox' name='Not Null' value='Not Null'>Not Null</input>
            <input type='checkbox' name='Autoincrement' value='Autoincrement'>Autoincrement</input>
            <input type='checkbox' name='Unique' value='Unique'>Unique</input>
        </div>
</script> 
<script type="text/javascript" src="/resources/duckoo/js/modal.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/modalAttribute.js?<%=request.getParameter("token")%>"></script>
<script>
$(document).on("click",".openConstraintBtn",function(e){
	
	
	
	
	modalAttribute.Obserable.fire("openConstraintBtn",{event:e,that:this});
	
})
$(document).on("click",".datas",function(e){
    e.stopPropagation();
    e.preventDefault();
  /*   $("tr").css("background-color","");
    $(this).parent().css("background-color","#269abc");
   target = $(this).parent();
    */
   modalAttribute.Obserable.fire("click_trDatas",{event:e,that:this});
});

$(document).on('click','.deleteAttrBtn',function(e){
	e.stopPropagation();
    e.preventDefault();
	/* if(!target)return;
    var id=target.attr("id");
    entity.deleteAttr(Number(id));
     target.remove();
      */
     modalAttribute.Obserable.fire("delBtn",{event:e,that:this});     
});

$(document).on('click','.addAttrBtn',function(e){
    e.stopPropagation();
    e.preventDefault();
    /* entity.setAttr({lName:"none",pName:"none",domainName:"none",datetype:"int"}); 
    tagSetAttr(entity); */
    console.log(modalAttribute);
    modalAttribute.Obserable.fire("addBtn",{event:e,that:this});
});

$(document).on('click','#saveBtn',function(e){
	/* tagGetAttr(entity);
    EntityManager.setEntity(entity); */
    /*
    var $entity = $("#"+entity.name);
    var $innerEntity = $("[data-innerEntity='"+entity.name+"']");
    console.log($innerEntity);
    $entity.html($(entity.genHtml()).html());
    $entity.css("width",300);
    $entity.css("height",350);
    $innerEntity.css("width",275);
    $innerEntity.css("height",325);
    */
    modalAttribute.Obserable.fire("saveBtn",{event:e,that:this});
    $("#myModal").modal("hide");
});


</script>