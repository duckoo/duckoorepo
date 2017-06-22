var modalAttribute=(function(){
	var head= "<div class='modalTr'>"+
        "<span class='modalTh'>키타입</span>"+
        "<span class='modalTh'>논리이름</span>"+
        "<span class='modalTh'>물리이름</span>"+
        "<span class='modalTh'>데이터타입</span>"+
        "<span class='modalTh'>기본값</span>"+
       "<span class='modalTh'>제약조건</span>"+
    "</div>";
	
var body=
	" <div class='attrBox'>"+
    " <div class='tbl'>"+String(head)+"</div>"+
    "</div>"+
    "<div class = 'btnWrapper'>"+
    " <div class='addAttrBtn'><i class='fa fa-plus-circle fa-2x' aria-hidden='true'></i></div>"+
    " <div class='deleteAttrBtn'><i class='fa fa-times-circle fa-2x' aria-hidden='true'></i></div>"+
    "</div>"; 
	
var columnHTML= $("#attrAddForm").html();
var columnTemplate=Handlebars.compile(columnHTML);
	
var target=undefined;
var entity=undefined;

var Obserable= DObserable.createObserable();




function click_trDatas(e){
	 $("div").css("background-color","");
	 var $that=$(e.that);  
	 $that.parent().css("background-color","#269abc");
	  target = $that.parent();
}
var obb=Object.create(Obsever);
obb.init("colorChange",click_trDatas);
Obserable.setEventObserver("click_trDatas",obb);


function openConstraintBtn(e){
	        
/*	e.event
	e.that;
*/	
 console.log("evetn.: ", e)	;
	var id=$(e.that).attr("data-openCB");
	var $hiddenDiv=$("#openDiv_"+id);
	if($hiddenDiv.css("display")==='none')
		$hiddenDiv.css("display","block");
	else
		$hiddenDiv.css("display","none");
	
};
var obb=Object.create(Obsever);
obb.init("openConstraintBtn",openConstraintBtn);
Obserable.setEventObserver("openConstraintBtn",obb);


function delBtn(e){
	 if(!target)return;
	  var id=target.attr("id");
	 entity.deleteAttr(Number(id));
	 target.remove();
};
obb=Object.create(Obsever);
obb.init("delBtn",delBtn);
Obserable.setEventObserver("delBtn",obb);

function addBtn(e){
    entity.setAttr({lName:"none",pName:"none",domainName:"none",datetype:"int"}); 
    tagSetAttr(entity);
}
obb=Object.create(Obsever);
obb.init("addBtn2",addBtn);
Obserable.setEventObserver("addBtn",obb);

function saveBtn(e){
	tagGetAttr(entity);
    EntityManager.setEntity(entity);
    var $entity = $("#"+entity.name);
    $entity.html($(entity.genHtml()).html());
}

obb=Object.create(Obsever);
obb.init("saveBtn",saveBtn);
Obserable.setEventObserver("saveBtn",obb);

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

function tagSetAttr(){
	var attr= entity.getAttr();
	console.log("attr: ",attr)
	
	var $tbl=  $(".tbl");
	console.log("whwhwhy?: ",$tbl)
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
	    attr[i].notNull=nullSel.val() ==="true" ? true:false;
	}
}

function setModal(enti,modal){
	entity=enti;
	modal.setViewPort(body);
	 tagSetAttr();
	 console.log("tlwkr");
}

return {
	    setModal:setModal,
	    Obserable:Obserable
	  };
})();