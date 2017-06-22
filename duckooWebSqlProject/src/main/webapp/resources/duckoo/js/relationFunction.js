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
		    	
		    	
		    	collectSelectOption(EntityManager.getEntityByName(elementArr[0]),true);
		    	collectSelectOption(EntityManager.getEntityByName(elementArr[1]),false);
		    	console.log("tempRelation : ",tempRelation);
		    	
		    	
		    	elementArr=[];
		    	return;
		     }
		 }
	}
	  
	 var observer=Object.create(Obsever);
	 
	  observer.init("relationModalclick",prepareStatement);
	  EntityManager.Obserable.setEventObserver("click",observer);
	  

	 function collectSelectOption(EntityObject,isSource){
		 console.log("entity :" ,EntityObject);
		 pkAttrArray = [];
		 
		 //console.log("the result of search :",EntityObject.search({isPk:true}));
		 
		 for(var i=0;i<EntityObject.attr.length;i++){
			 if(EntityObject.attr[i].isPk){
				 pkAttrArray.push(EntityObject.attr[i]);
			 }
		 }
		 if(isSource){
			 srcPKElement = pkAttrArray;
		 }else{
			 tarPKElement = pkAttrArray;
		 }
		 createSelectOption(pkAttrArray,isSource);
		 
	 }
	 function createSelectOption(pkAttrArr,isSource){
		 var targetLink;
		 if(isSource){
			 targetLink = $("#sourceCol");
			 
		 }else{
			 targetLink = $("#targetCol");
			 
		 }
		 targetLink.html("");
		 for(var i = 0;i<pkAttrArr.length;i++){
			 targetLink.append("<option value="+pkAttrArr[i].pName+">"+pkAttrArr[i].pName+"</option>");
			 
		 }
		 
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
	 return {changeFlagState:changeFlagState,
		 	getTempRelation:getTempRelation,
		 	getSrcPK:getSrcPK,
		 	getTarPK:getTarPK}
	 
	 
	 
})();