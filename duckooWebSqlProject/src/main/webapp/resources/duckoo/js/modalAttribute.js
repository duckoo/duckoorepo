var modalAttribute=(function(){
	var head= "<div class='modalTr' style='height:46px'>"+
        "<div class='modalTh'>키타입</div>"+
        "<div class='modalTh'>논리이름</div>"+
        "<div class='modalTh'>물리이름</div>"+
        "<div class='modalTh'>데이터타입</div>"+
        "<div class='modalTh'>기본값</div>"+
       "<div class='modalTh'>제약조건</div>"+
    "</div>";
	
var body=
	"<div class='attrBoxHeader'>"+String(head)+"</div>"+
	" <div class='attrBox'>"+
    " <div class='tbl'></div>"+
    "</div>"+
    "<div class='addAttrBtnBox'><button class='addAttrBtn'>새컬럼+</button></div>"; 
	
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
	 var $hiddenBtnDiv = $("#"+$that.parent().attr("name"));
	 if($hiddenBtnDiv.css("display")==='none'){
			$hiddenBtnDiv.css("display","block");
			setTimeout(function(){$hiddenBtnDiv.css("padding-top","15px");},0.1);
			setTimeout(function(){$hiddenBtnDiv.css("height","49px");},0.1);
	}
	else{
			$hiddenBtnDiv.css("height","0px");
			$hiddenBtnDiv.css("padding-top","0px");
			setTimeout(function(){$hiddenBtnDiv.css("display","none");},270);
	}
	 
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
	var $btnsDiv=$("#openAttrDelUpDiv_"+id);
	if($hiddenDiv.css("display")==='none'){
		$hiddenDiv.css("display","block");
		setTimeout(function(){$hiddenDiv.css("padding-top","15px");},0.1);
		setTimeout(function(){$hiddenDiv.css("height","49px");},0.1);
	}
	else{
		$hiddenDiv.css("height","0px");
		$hiddenDiv.css("padding-top","0px");
		setTimeout(function(){$hiddenDiv.css("display","none");},270);
	}
};
obb=Object.create(Obsever);
obb.init("openConstraintBtn2",openConstraintBtn);
Obserable.setEventObserver("openConstraintBtn",obb);

function attrInputChange(e){
	var id = $(e.that).attr("data-updateAttrBtn");
	
    var keyType = $("#keyType_"+id).text();
    var lName = $("#lName_"+id).text();
    var pName = $("#pName_"+id).text();
    var dataType = $("#dataType_"+id).text();
    var defaultVal = $("#default_"+id).text();
    var notNull = $("#notNull_"+id).is(":checked");
    var autoIncre = $("#autoIncre_"+id).is(":checked");
    var unique = $("#uniqueVal_"+id).is(":checked");
    console.log("텍스트인풋으로 가져와보자:",id,keyType,lName,pName,dataType,defaultVal,notNull,autoIncre,unique);
    if(keyType==="PK"){
    	$("#keyTypeUp").val("PK").prop("selected", true);	
    }else if(keyType==="PK/FK"){
    	$("#keyTypeUp").val("PKFK").prop("selected", true);
    }else if(keyType==="FK"){
    	$("#keyTypeUp").val("FK").prop("selected", true);
    }
    else{
    	$("#keyTypeUp").val("None").prop("selected", true);
    }
    var $updateAttrModalWindow=$("#updateAttrModalWindow");
    $("#lNameUp").val(lName);
    $("#pNameUp").val(pName);
    $("#dataTypeUp").val(dataType);
    $("#defaultValUp").val(defaultVal);
    $("#notNullUp").attr("checked",notNull);
    $("#autoIncreUp").attr("checked",autoIncre);
    $("#uniqueValUp").attr("checked",unique);
    $("#updateAttrFinalBtn").attr("data-id",String(id));
    $updateAttrModalWindow.modal();
};
obb=Object.create(Obsever);
obb.init("attrInputChange2",attrInputChange);
Obserable.setEventObserver("attrInputChange",obb);

function updateAttrFinalBtn(e){
	var $that = $(e.that);
	console.log("that: ",$that);
	var id= $that.attr("data-id");
	console.log("ididid",Number(id));
	var attr =  entity.getAttr(Number(id));
	console.log("uafb attr : ",attr);
	
	var keyType = $("#keyTypeUp option:selected").val();
	if(keyType==="PK"){
		attr.isPk = true;
		attr.isFk = false;
	}else if(keyType==="FK"){
		attr.isPk = false;
		attr.isFk = true;
	}else if(keyType==="None"){
		attr.isPk = false;
		attr.isFk = false;
		console.log("난다고래래래래래래래래래래래래래래ㅐ래랠래래ㅐ래랠");
	}else{
		attr.isPk = true;
		attr.isFk = true;	
	}	
	attr.lName = $("#lNameUp").val();
    attr.pName = $("#pNameUp").val();
    attr.datetype = $("#dataTypeUp").val();
    attr.defaultVal = $("#defaultValUp").val();
    attr.notNull = $("#notNullUp").is(":checked");
    attr.autoIncrement = $("#autoIncreUp").is(":checked");
    
    
    
    
    var attr1= attr.clone();
    delete attr1["isPk"];
    delete attr1["isFk"];
    delete attr1["notNull"];
    delete attr1["autoIncrement"];
    
    console.log("uafb attr : ",attr1);
    
    attrNodeManager.updateTourAll(String(id),{datetype:attr.datetype});
    attrNodeManager.updateTourChild(String(id),attr1);
    attrNodeManager.keyTypeTour(String(id),{isPk:attr.isPk,isFk:attr.isFk});
}
obb=Object.create(Obsever);
obb.init("updateAttrFinalBtn2",updateAttrFinalBtn);
Obserable.setEventObserver("updateAttrFinalBtn",obb);

function delBtn(e){
	 if(!target)return;
	  var id=target.attr("id");
	 
	  var keyType = document.getElementById("keyType_"+id).innerHTML;
	  var pName=document.getElementById("pName_"+id).innerHTML;
	  
	  confirms(keyType, pName);
	  
};
obb=Object.create(Obsever);
obb.init("delBtn2",delBtn);
Obserable.setEventObserver("delBtn",obb);

function confirms(keyType, pName){
	if(keyType==="FK"||keyType==="PK/FK"||keyType==="PK"){
		$("#confrimModal").modal();
		
	} else {
		var id=target.attr("id");
		entity.deleteAttr(Number(id));
		var $openAttrDelUpDiv= $("#openAttrDelUpDiv_"+id);
		var $openDiv = $("openDiv_"+id);
		$openAttrDelUpDiv.remove();
		$openDiv.remove();
		target.remove();
	}
};

function confirmYes(){
	
	var id = target.attr("id");
	
	console.log("에이티티알메니저:",attrNodeManager);
	attrNodeManager.deleteTour(Number(id));
	console.log("delete Atfer:",attrNodeManager);
	
	
	entity.deleteAttr(Number(id));
	var $openAttrDelUpDiv= $("#openAttrDelUpDiv_"+id);
	var $openDiv = $("openDiv_"+id);
	$openAttrDelUpDiv.remove();
	$openDiv.remove();
	target.remove();
	
	
	
	$("#confrimModal").modal('hide');	
	
		
};
obb=Object.create(Obsever);
obb.init("confirmYes2",confirmYes);
Obserable.setEventObserver("confirmYes",obb);


function addAttrFinalBtn(e){
	var isPk=$("#keyType option:selected").val()==="PK"?true:false;
    var lName = $("#lName").val();
    var pName = $("#pName").val();
    var dataType = $("#dataType").val();
    var defaultVal = $("#defaultVal").val();
    
    var notNull = $("#notNull").is(":checked");
    var autoIncre = $("#autoIncre").is(":checked");
    var uniqueVal = $("#uniqueVal").is(":checked");
    console.log(lName,pName,dataType,defaultVal,notNull,autoIncre,uniqueVal);
	entity.setAttr({isPk:isPk, lName:lName,pName:pName,domainName:"none",datetype:dataType,notNull:notNull,autoIncrement:autoIncre,uniqueVal:uniqueVal});
    tagSetAttr(entity);
}
obb=Object.create(Obsever);
obb.init("addAttrFinalBtn2",addAttrFinalBtn);
Obserable.setEventObserver("addAttrFinalBtn",obb);

function saveBtn(e){
	console.log("entitytytytyty:",entity);
    EntityManager.setEntity(entity);
    var $entity = $("#"+entity.name);
    
    v(entity).refresh();
   
    var $innerEntity = $("[data-innerEntity='"+entity.name+"']");
    $entity.css("width",300);
    $entity.css("height",350);
    $innerEntity.css("width",275);
    $innerEntity.css("height",325);
}
obb=Object.create(Obsever);
obb.init("saveBtn2",saveBtn);
Obserable.setEventObserver("saveBtn",obb);





function tagSetAttr(){
	var attr= entity.getAttr();
	console.log("tagSetAttr:",attr);//값살아있음
	var $tbl=  $(".tbl");
	 $tbl.html("");
	for(var i=0,len=attr.length;i<len;i++){
		 $tbl.append(columnTemplate(attr[i]));
	}
};

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