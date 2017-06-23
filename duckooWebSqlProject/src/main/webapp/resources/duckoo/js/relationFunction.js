var relationfunction=(function(){
	var flag = false;
	var tempRelation = undefined;
	var elementArr=[];
	var srcPKElement=[];
	var tarPKElemnet=[];
	
	function prepareStatement(e){
		if(flag){	
			
			var id = $(e.that).attr('id');
		 	if(elementArr.length==0){
			
				elementArr.push(id);
				console.log("firstArr :",elementArr);
				return;
		 	}
		 	else if(elementArr[0]!==id){
		    	var fid= elementArr[0];//relationship 이용해서  modal작업끝나고 랜더링
		    	elementArr.push(id);
		    	console.log("second :",elementArr);
		    	$("#relationModal").modal();
		    	tempRelation= {source:fid,target:id,name:id+""+fid};
		    
		    	console.log("tempRelation : ",tempRelation);
		    	

		    	return;
		     }
		 }
	}
	  
	 var observer=Object.create(Obsever);
	 
	  observer.init("relationModalclick",prepareStatement);
	  EntityManager.Obserable.setEventObserver("click",observer);
	  

	 function collectSelectOption(EntityObject,isSource,relationType){
		 console.log("entity :" ,EntityObject);
		 var pkAttrArray = [];
		 //console.log("the result of search :",EntityObject.search({isPk:true}));
		if(tempRelation.relationLine=="identify"||isSource){
			pkAttrArray = collectPKElement(EntityObject,pkAttrArray,isSource);
			console.log("Collect comp : " ,pkAttrArray);
		}
		else if(tempRelation.relationLine=="nidentify"){
			pkAttrArray =  collectStdElement(EntityObject,pkAttrArray,isSource);
			console.log("Collect comp : " ,pkAttrArray);
		}
		
		 if(isSource){
			 srcPKElement = pkAttrArray;
		 }
		 else{
			 tarPKElement = pkAttrArray;
		 }
		 createSelectOption(pkAttrArray,isSource,relationType);
		 
	 }
	 function createSelectOption(pkAttrArr,isSource,relationType){
		 var targetLink;
		 console.log("Attribute Collected : " , pkAttrArr)
		 if(isSource){
			 targetLink = $("#sourceCol"); 
		 
		 targetLink.html("");
		 var insideStr="";
		 for(var i = 0;i<pkAttrArr.length;i++){
			 insideStr += pkAttrArr[i].pName+"";
			 insideStr +="+";
			 }
		 insideStr = insideStr.substring(0,insideStr.length-1);
		 
		 var str = "<option value="+insideStr+">"+insideStr+"</option>"
		 

		 targetLink.append(str);
		 }else{
			 targetSelectOption(pkAttrArr);
		 }
		 
	 }
	 function targetSelectOption(pkAttrArr){
		 var targetLink = $("#targetInfo");
		 targetLink.html("");
		 
		 for(var i =0;i<srcPKElement.length;i++){
			 var str="";
			 str+="<p>"+srcPKElement[i].pName+"과 매칭될 컬럼.</p>"
			 str += "<select class = 'tarCol'>"
				 
				 for(var j=0;j<pkAttrArr.length;j++){
					 
					 str+="<option class='tarVal' value="+pkAttrArr[j].pName+">"+pkAttrArr[j].pName+"</option>"
				 }
			 str+="</select>"
			 targetLink.append(str);
		 }
		 
	 }
	function collectPKElement(EntityObject,pkAttrArray,isSource){
		for(var i=0;i<EntityObject.attr.length;i++){
			 
			  if(EntityObject.attr[i].isPk){
				 pkAttrArray.push(EntityObject.attr[i]);
			 }
		 } 
		return pkAttrArray;
	}
	function collectStdElement(EntityObject,pkAttrArray,isSource){
		for(var i=0;i<EntityObject.attr.length;i++){
			 
			 if(!isSource&&(!EntityObject.attr[i].isPk)&&(!EntityObject.attr[i].isFk)){
					pkAttrArray.push(EntityObject.attr[i]);
				 }
		 }
		return pkAttrArray;
	}
	function changeFlagState(){
		flag = (!flag);
		return flag;
	}
	function getTempRelation(){
		return tempRelation;
		
	};
	function getSrcPK(){
		return srcPKElement;
	}
	function getTarPK(){
		return tarPKElement;
	}
	function getElementArr(){
		var tempEleArr = elementArr;
		elementArr=[];
		return tempEleArr;
	}
	function initiateElementArr(){
		
		elementArr=[];
	}
	 return {changeFlagState:changeFlagState,
		 	getTempRelation:getTempRelation,
		 	collectSelectOption:collectSelectOption,
		 	getSrcPK:getSrcPK,
		 	getTarPK:getTarPK,

		 	getElementArr:getElementArr,
		 	initiateElementArr:initiateElementArr}
	 

	 
	 
})();