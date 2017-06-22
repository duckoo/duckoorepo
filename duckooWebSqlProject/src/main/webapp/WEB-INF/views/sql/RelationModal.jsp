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
          <h4 class="modal-Rtitle">관계생성[식별]</h4>
          <h4>자동 FK컬럼 생성을 원하시면 Auto Generation을 체크해 주시기 바랍니다.</h4>
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
        	<input type="checkbox" class="option"  value="OneToOne">1:1<br />
        	<input type="checkbox" class="option"  value="OneToMany" checked>1:M<br />
        	<input type="checkbox" class="option"  value="ManyToMany">M:N<br />
        </div>
        <div id="genOption">
        	<input type="checkbox" class="genOption" value=true>Auto Genereting Foreign Key<br/>
        </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
           <button type="button" id="relSave" class="btn btn-success" data-dismiss="modal">save</button>
        </div>
      </div>
    </div>
</div>


<script type="text/javascript" src="/resources/duckoo/js/relationFunction.js?<%=request.getAttribute("token")%>"></script>
<script>


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
	console.log("mkRB");
	
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
		relationfunction.collectSelectOption(EntityManager.getEntityByName(tempArr[1]),false,relationfunction.getTempRelation().relationLine);
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
	
	else if(EntityControll.isPkExist(relationfunction.getSrcPK(),relationfunction.getTarPK())){
	console.log($("#sourceCol option:selected").val());
	relationfunction.getTempRelation().relationAttr=[$("#sourceCol option:selected").val(),$("#targetCol option:selected").val()]
	
     $(".option").each(function() {
   	  
        if($(this).is(':checked')){
       	
       	relationfunction.getTempRelation().relationType = ($(this).val());
        }
     });
	
   
	//tempRelation Attr이용해서 connect option 지정.
	renderManager.connectDiv({$source:$("#"+relationfunction.getTempRelation().source) ,$target:$("#"+	relationfunction.getTempRelation().target),id:relationfunction.getTempRelation().source+" "+relationfunction.getTempRelation().target});
	
	console.log(relationfunction.getTempRelation());
	}
	else{
		alert("대응되는 Attribute를 찾을 수 없습니다. 자동생성은 AutoGenerete를 체크하세요");
		
	}
	
	$("#makeRelationBtn").trigger("click");
	$("#identified").modal('hide');
});







function autoGen(srcElementId,tarElementId,connectionType){
	console.log("src 엘리먼트 :",srcElementId);
	console.log("tar 엘리먼트 :",tarElementId);
	relationfunction.getTempRelation().relationAttr=[$("#sourceCol option:selected").val(),$("#sourceCol option:selected").val()];
	
    $(".option").each(function() {
  	  
       if($(this).is(':checked')){
      	
      	relationfunction.getTempRelation().relationType = ($(this).val());
       }
    }); 
	//배열로나옴
    var cloneAttr = EntityManager.getEntityByName(srcElementId).search({pName:relationfunction.getTempRelation().relationAttr[0]})[0].clone();
	
	cloneAttr.isFk = true;
	if(connectionType=="nidentify"){cloneAttr.isPk=false;}
  	EntityManager.setAttribute(tarElementId, cloneAttr);
	//tempRelation Attr이용해서 connect option 지정.
	renderManager.connectDiv({$source:$("#"+relationfunction.getTempRelation().source) ,$target:$("#"+relationfunction.getTempRelation().target),id:relationfunction.getTempRelation().source+" "+relationfunction.getTempRelation().target});
	
	console.log(relationfunction.getTempRelation());
	
}



</script>