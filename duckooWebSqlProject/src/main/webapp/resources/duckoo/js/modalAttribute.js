var modalAttribute=(function(){
	
	var head= "<tr class='modalTr' style='border-style:solid;'>"+
    "        <th class='modelTh'>키타입</th>"+
    "        <th class='modelTh'>논리이름</th>"+
    "        <th class='modelTh'>물리이름</th>"+
    "        <th class='modelTh'>데이터타입</th>"+
    "        <th class='modelTh'>Not null</th>"+
    "        <th class='modelTh'>Default</th>"+
    "    </tr>";
	
	var body=
	" <div class='attrBox'>"+
    " <table class='tbl'>"+String(head)+"</table>"+
    "</div>"+
    "<div class = 'btnWrapper'>"+
    " <div class='addAttrBtn'><i class='fa fa-plus-circle fa-2x' aria-hidden='true'></i></div>"+
    " <div class='deleteAttrBtn'><i class='fa fa-times-circle fa-2x' aria-hidden='true'></i></div>"+
    "</div>"; 
	
	var columnHTML= $("#attrAddForm").html();
	var columnTemplate=Handlebars.compile(columnHTML);
	

function makeToSelected(value,options){
	var $el = $('<select />').html( options.fn(this) );
    $el.find('[value="' + value + '"]').attr({'selected':'selected'});
    return $el.html();
}
	
Handlebars.registerHelper('select', function(isPK,isFK, options ){
	var value="";
	value+=isPK?"PK":"";
	value+=isFK?"FK":"";
	if(value==="")value="None";
    return makeToSelected(value,options);
});

Handlebars.registerHelper('selectBasic', function(value, options ){
    return makeToSelected(value,options);
});

function tagSetAttr(enti){
	var attr= enti.getAttr();
	var $tbl=  $(".tbl");
	 $tbl.html(head);
	
	for(var i=0,len=attr.length;i<len;i++){
		 $tbl.append(columnTemplate(attr[i]));
	}
};
function tagGetAttr(enti){
	var attr=enti.getAttr();
	for(var i=0,len=attr.length;i<len;i++){
		var id= attr[i].id;
		var selOption=$("#keyType_"+id+" option:selected");
		attr[i].isPk=selOption.attr("data-pk")==="true" ? true:false;
		attr[i].isFk=selOption.attr("data-fk")==="true" ? true:false;
	    attr[i].lName=document.getElementById("lName_"+id).value;
	    attr[i].pName=document.getElementById("pName_"+id).value;
	    attr[i].datetype=document.getElementById("dataType_"+id).value;
	    var nullSel=$("#notNull_"+id+" option:selected");
	    attr[i].nullable=nullSel.val() ==="true" ? true:false;
	}
}


function setModal(_entity,modal){
	
	console.log("start Modal: ");
	modal.setViewPort(body);
	var target;
	var entity=_entity;
	tagSetAttr(entity);
	$('.tbl').on("click","tr .datas",function(e){
        e.stopPropagation();
        e.preventDefault();
        $("tr").css("background-color","");
        $(this).parent().css("background-color","#269abc");
       target = $(this).parent();
    });
    $('.deleteAttrBtn').on('click',function(e){
         if(!target)return;
    	e.stopPropagation();
        e.preventDefault();
        var id=target.attr("id");
        entity.deleteAttr(Number(id));
         target.remove();
    });
    $('.addAttrBtn').on('click',function(e){
        e.stopPropagation();
        e.preventDefault();
        entity.setAttr({lName:"none",pName:"none",domainName:"none",datetype:"int"}); 
        tagSetAttr(entity);
    });
    $('#saveBtn').one('click',function(e){
    	tagGetAttr(entity);
        EntityManager.setEntity(entity);
        var $entity = $("#"+entity.name);
        var $innerEntity = $("[data-innerEntity='"+entity.name+"']");
        console.log($innerEntity);
        $entity.html($(entity.genHtml()).html());
        $entity.css("width",300);
	    $entity.css("height",350);
	    $innerEntity.css("width",275);
	    $innerEntity.css("height",325);
        
        $("#myModal").modal("hide");
    });
   
   
}
return {setModal:setModal}	
})();