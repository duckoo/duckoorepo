<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="tbl_nameModal" role="dialog" >
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-stitle">테이블 생성.</h4>
        </div>
        <div class="modal-sbody">
          <p>테이블 이름 입력.<input type="text" id="tbl_name"></input></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          <button type="button"  id="conform" class ="btn btn-success">conform</button>
        </div>
      </div>
    </div>
</div>

<div class="modal fade" id="relationModal" role="dialog" >
    <div class="modal-dialog modal-m">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-Rtitle">관계생성.</h4>
        </div>
        <div class="modal-Rbody">
          <div class="identify">
          	<button type="button" id="idf" class="btn btn-info">식</button>
          </div>
          <div class="nidentify">
          	<button type="button" id="nidf"class="btn btn-danger">비식</button>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>



<div class="modal fade" id="identified" role="dialog" >
    <div class="modal-dialog modal-m">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-Rtitle">tbl_관계생성</h4>
          <h4>자동 FK컬럼 생성을 원하시면새 컬럼 생성을 체크해 주시기 바랍니다.</h4>
        </div>
        <div class="modal-Rbody">
        <div id="srcInfo">
        	<select id="sourceCol">
        		<option selected="selected" value="1">col1</option>
        		<option value="2">col2</option>
        	</select>
        </div>
        <div id="targetInfo">
        	<select id="targetCol">
        		<option selected value="1">tarcol1</option>
        		<option>tarcol2</option>
        	</select>
        </div>
        <div id="options">
        	<input type="checkbox" class="option"  value="OneToOne" onclick="checkOpt(this)">1:1<br />
        	<input type="checkbox" class="option"  value="OneToMany" checked onclick="checkOpt(this)">1:M<br />
        	<input type="checkbox" class="option"  value="ManyToMany" onclick="checkOpt(this)">M:N<br />
        </div>
        <div id="genOption">
        	<input type="checkbox" class="genOption" value=true>새 컬럼생성후 연결<br/>
        </div>
        </div>
        <div class="modal-footer">
        	<button type="button" id="optSelect"class="btn btn-success">옵션설정.</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
           <button type="button" id="relSave" class="btn btn-success" data-dismiss="modal">save</button>
        </div>
      </div>
    </div>
</div>
<div class="modal fade" id="optionSelect" role="dialog" >
    <div class="modal-dialog modal-m">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-Rtitle"></h4>
          <h4></h4>
        </div>
        <div class="modal-Rbody">
     
        <div id="resOption">
        	<input type="checkbox" class="resOption"  value="restrict" checked onclick="checkRes(this)">restrict<br />
        	<input type="checkbox" class="resOption"  value="cascade" onclick="checkRes(this)">cascade<br />
        	<input type="checkbox" class="resOption"  value="no action" onclick="checkRes(this)">no action<br />
        	<input type="checkbox" class="resOption"  value="set null" onclick="checkRes(this)">set null<br />
        </div>
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
           <button type="button" id="optSave" class="btn btn-success" data-dismiss="modal">save</button>
        </div>
      </div>
    </div>
</div>

<script type="text/javascript" src="/resources/duckoo/js/relationFunction.js?<%=22%>"></script>
<script>
function checkRes(chk){
    var obj = $(".resOption");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
function checkOpt(chk){
    var obj = $(".option");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
$("#makeTableBtn").on("click",function(e){
	 $("#tbl_nameModal").modal({backdrop:'static'});
	 
});
$("#conform").on("click",function(e){
	 
	 var tempName = $("#tbl_name").val().trim();
	 
	 if(!EntityControll.isEntityExist(tempName)){
	 	EntityManager.createEntity({name:tempName,attr:[]},false);
	 	EntityManager.showEntity(tempName);
	 	$("#tbl_nameModal").modal('hide');
	 }
	 else{
		 console.log("중복.");
		 
	 }
	 
});

$("#makeRelationBtn").on("click",function(e){
 	e.stopPropagation();
	e.preventDefault();
	
	relationfunction.initiateElementArr();
	var icon = $(this);
	  
	console.log("rf:",relationfunction)
	
	var mkFlag=relationfunction.changeFlagState();
	console.log("rf:",mkFlag);
	var color="#5cb85c";
	if(mkFlag)
	  color="#FF0066";
	icon.css("background-color",color);

});

$("#idf").on("click",function(e){
		e.stopPropagation();
		e.preventDefault();
		relationfunction.getTempRelation().relationLine = "identify";
		$("#relationModal").modal("hide");
		$("#identified").modal();
		var tempArr = relationfunction.getElementArr();
		relationfunction.collectSelectOption(EntityManager.getEntityByName(tempArr[0]) , true , relationfunction.getTempRelation().relationLine);
		relationfunction.collectSelectOption(EntityManager.getEntityByName(tempArr[1]), false ,relationfunction.getTempRelation().relationLine);
	});
$("#nidf").on("click",function(e){
	e.stopPropagation();
	e.preventDefault();
	relationfunction.getTempRelation().relationLine = "nidentify";
	$("#relationModal").modal("hide");
	$("#identified").modal();
	var tempArr = relationfunction.getElementArr();
	relationfunction.collectSelectOption(EntityManager.getEntityByName(tempArr[0]),true,relationfunction.getTempRelation().relationLine);
	relationfunction.collectSelectOption(EntityManager.getEntityByName(tempArr[1]),false,relationfunction.getTempRelation().relationLine);
});

$("#relSave").on("click",function(e){
	e.stopPropagation();
	e.preventDefault();
	console.log(relationfunction.getSrcPK());
	console.log(relationfunction.getTarPK());
	
	var targetName= MatchName().split("+");
	var firstName = "";
	var lastName = "";
	var autoFlag = false;  
	$(".genOption").each(function() {
   	  
        if($(this).is(':checked')){
        	autoFlag =  true;
        }else{
        autoFlag= false;
        }
     });
	console.log("autoFlag",autoFlag);
	if(autoFlag){
		autoGen(relationfunction.getTempRelation().source,relationfunction.getTempRelation().target,relationfunction.getTempRelation().relationLine);
	}
	else if(!EntityControll.isEffectiveName(targetName)){
		alert("중복된 컬럼이 등록되었습니다 다시시도하세요.");
		$("#identified").modal('hide');
		$("#makeRelationBtn").trigger("click");
		return;
	}
	else if(EntityControll.isPkExist(relationfunction.getSrcPK(),relationfunction.getTarPK())){
	console.log($("#sourceCol option:selected").val());
	
	relationfunction.getTempRelation().relationAttr=[$("#sourceCol option:selected").val(),MatchName()];
	
     $(".option").each(function() {
   	  
        if($(this).is(':checked')){
       	
       	relationfunction.getTempRelation().relationType = ($(this).val());
        }
        checkBoxInitiate("option");
     });
     //현재 pk의 데이터 타입을 Fk데이터 타입에 대입시켜버림 그냥 검증에서 데이터 타입 안맞으면 안들어가게 하는게 나을거같음.
     for(var i= 0; i<targetName.length;i++){
     	var getFKAttr = EntityManager.getEntityByName(relationfunction.getTempRelation().target).search({pName:targetName[i]})[0];
     	console.log("target's FK attribute : ",getFKAttr);
     	console.log("the clone of src Attr :" , EntityManager.getEntityByName(relationfunction.getTempRelation().source).search({pName:relationfunction.getSrcPK()[i].pName})[0]);
     	getFKAttr.datetype = EntityManager.getEntityByName(relationfunction.getTempRelation().source).search({pName:relationfunction.getSrcPK()[i].pName})[0].clone().datetype;
     	
     	firstName += EntityManager.getEntityByName(relationfunction.getTempRelation().source).search({pName:relationfunction.getSrcPK()[i].pName})[0].id;
     	lastName += getFKAttr.id;
     	
     	if(relationfunction.getTempRelation.relationLine=="identify"){
     		getFKAttr.isFk = true;
     	}else{
     		getFKAttr.isFk = true;
     		getFKAttr.isPk = false;
     	}
     	relationfunction.getTempRelation().name = firstName +"_"+lastName;
     }
     
	//tempRelation Attr이용해서 connect option 지정.
	
	
	console.log(relationfunction.getTempRelation());
	
	
	registRelationShipManager(relationfunction.getTempRelation());
	
	console.log("relation ship saved : ",RelationShipManager.getRelationship(relationfunction.getTempRelation().name));
	
	}
	else{
		alert("대응되는 Attribute를 찾을 수 없습니다. 자동생성은 AutoGenerete를 체크하세요");
		
	}
	
	$("#makeRelationBtn").trigger("click");
	
	$("#identified").modal('hide');
});
function registRelationShipManager(tempRelation){
	console.log(tempRelation.restrictType);
	if(typeof tempRelation.restrictType==="undefined"){
		restrictSelect();
		
	}
	/* if(EntityControll.isAlreadyConnected(relationfunction.getTempRelation())){
		console.log("redefine errors catch")
		alert("이미 관계가 하나 이상 존재홥니다. 관계를 제거하고 다시 시도해 주십시오");
		return;
	} */
	var firstName;
	var lastName;
	var tempRelAtt = tempRelation.relationAttr;
	var srcAttArr = tempRelAtt[0].split("+");
	var tarAttArr = tempRelAtt[1].split("+");
	tempRelation.RelationAttrName = [srcAttArr,tarAttArr];
	RelationShipManager.createRelationship(relationfunction.getTempRelation());
	console.log("ttttttttttttttttttttttttttttttt :",RelationShipManager.getRelation("e1e32232"));
	renderManager.connectDiv({$source:$("#"+tempRelation.source) ,$target:$("#"+tempRelation.target),id:tempRelation.source+" "+tempRelation.target,lineType:tempRelation.relationLine});
	
	console.log("get relationship name :",RelationShipManager.temp(1));
	v(EntityManager.getEntityByName(tempRelation.source)).refresh();
	v(EntityManager.getEntityByName(tempRelation.target)).refresh();
	
}

function MatchName(){
	var tempSelectedValue = [];
	var resultStr="";
	var domTarget = $(".tarCol option:selected");
	console.log("selected dom target : ",domTarget);
	for(var i = 0;i<domTarget.length;i++){
		tempSelectedValue.push(domTarget[i].value);
		resultStr += domTarget[i].value+"+";
	}
	console.log("collecting Target's FK option :", tempSelectedValue);
	console.log("the result of String name : ",resultStr.substring(0,resultStr.length-1));
	
	
	return resultStr.substring(0,resultStr.length-1);
}



//id.
function autoGen(srcElementId,tarElementId,connectionType){
	console.log("src 엘리먼트 :",srcElementId);
	console.log("tar 엘리먼트 :",tarElementId);
	relationfunction.getTempRelation().relationAttr=[$("#sourceCol option:selected").val(),$("#sourceCol option:selected").val()];
	var tempString = $("#sourceCol option:selected").val();
	var firstName = "";
	var lastName = "";
	
	var tempArr = tempString.split("+");
	console.log("names of selected pk's : ",tempArr)
	
	var cloneArr = [];
    $(".option").each(function() {
  	  
       if($(this).is(':checked')){
      	
      	relationfunction.getTempRelation().relationType = ($(this).val());
      	
       }
    }); 
	//배열로나옴
	for(var i=0;i<tempArr.length;i++){
		var cloneAttr = EntityManager.getEntityByName(srcElementId).search({pName:tempArr[i]})[0].clone();
		firstName +=EntityManager.getEntityByName(srcElementId).search({pName:tempArr[i]})[0].clone().id+"/";
		cloneAttr.isFk = true;
		if(connectionType=="nidentify"){cloneAttr.isPk=false;}
		cloneArr.push(cloneAttr);
		
	}
	console.log("the information of cloneArr :",cloneArr);
	for(var j = 0;j<cloneArr.length;j++){
  		EntityManager.setAttribute(tarElementId, cloneArr[j]);
	}
	firstName = firstName.substring(0,firstName.length-1);
	relationfunction.getTempRelation().name = firstName +"_"+firstName;
	//tempRelation Attr이용해서 connect option 지정.
	//renderManager.connectDiv({$source:$("#"+relationfunction.getTempRelation().source) ,$target:$("#"+relationfunction.getTempRelation().target),id:relationfunction.getTempRelation().source+" "+relationfunction.getTempRelation().target,lineType:relationfunction.getTempRelation().relationLine});
	
	console.log(relationfunction.getTempRelation());
	registRelationShipManager(relationfunction.getTempRelation());
	
	console.log("relation ship saved : ",RelationShipManager.getRelationship(relationfunction.getTempRelation().name));
}


$(".genOption").on("click",function(e){
	var genVal = $(this).val();
	genVal= (genVal==="true")?false:true;
	
	
	console.log("first flag",genVal);
	
	$(this).val(genVal);
	console.log("change complete? :",$(this).val());
	if(!genVal){
		$("#targetInfo").css("visibility","hidden");
		
	}
	else{
		$("#targetInfo").css("visibility","visible");
	}
	
})
$("#optSelect").on("click",function(e){
	$("#optionSelect").modal();
	 
	
	
	
})
$("#optSave").on("click",function(e){
	restrictSelect();

});
function restrictSelect(){
	 $(".resOption").each(function() {
	  	  
		if($(this).is(':checked')){     	
	   relationfunction.getTempRelation().restrictType = ($(this).val())}
		
	
	})
	checkBoxInitiate("resOption");
}

function checkBoxInitiate(optionValueClass){
	var obj = $("."+optionValueClass);
	console.log("restrict option array:",obj);
    for(var i=0; i<obj.length; i++){
    		
        if(i!=0){
            obj[i].checked = false;
        }
        else{
        	obj[i].checked = true;
        }
    }
	
	
	
};

</script>