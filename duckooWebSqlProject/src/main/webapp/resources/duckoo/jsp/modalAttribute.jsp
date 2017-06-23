<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <link rel="stylesheet" href="/resources/duckoo/css/modal.css?<%=request.getParameter("token")%>">
    <link rel="stylesheet" href="/resources/duckoo/css/entityAttr.css?<%=request.getParameter("token")%>">

 <script id="attrAddForm" type="text/x-handlebars-template">
        <div class='modalTr' id={{id}} name="openAttrDelUpDiv_{{id}}">
            <div class='datas'>
				{{#if isPk}}
					<p id="keyType_{{id}}">PK</p>
				{{else}}
					<p id="keyType_{{id}}">NONE</p>
				{{/if}}	
            </div>
            <div class='datas'><p id="lName_{{id}}">{{lName}}</p></div>
            <div class='datas'><p id="pName_{{id}}"{{pName}}>{{pName}}</p></div>
            <div class='datas'><p id="dataType_{{id}}">{{datetype}}</p></div>
            <div class='datas'><p id="default_{{default}}">{{default}}</p></div>
            <div class='datas'><button class="openConstraintBtn" data-openCB="{{id}}"><i class="fa fa-chevron-down" aria-hidden="true"></i></button></div>
        </div>
        <div class='modalTr' id="openDiv_{{id}}" name='ConstraintCheckBox'>
            <input onclick="return false;" type='checkbox' name='Not Null' value='Not Null'>Not Null</input>
            <input onclick="return false;" type='checkbox' name='Autoincrement' value='Autoincrement'>Autoincrement</input>
            <input onclick="return false;" type='checkbox' name='Unique' value='Unique'>Unique</input>
        </div>
		<div class='modalTr' id="openAttrDelUpDiv_{{id}}" name='attrDelUpBtnBox'>
			<button>수정</button>
			<button>삭제</button>
		</div>
</script> 
<script type="text/javascript" src="/resources/duckoo/js/modal.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/modalAttribute.js?<%=request.getParameter("token")%>"></script>
<script>
$(document).on("click",".openConstraintBtn",function(e){

	e.stopPropagation();
    e.preventDefault();
	
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