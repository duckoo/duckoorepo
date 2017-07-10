var classifier = (function(){
	
	var superClasses=[];
	
	function classifier() {
		
	}
	classifier.prototype.classify = function(node){
		var tempNode = scanner.superClassScan(node);
			
		if(superClasses.length==0){
			superClasses.push(tempNode);
		}
		
		
		superClasses.forEach(function(inNode){
			if(tempNode==inNode){
				console.log("what is tempNode?",tempNode);
				console.log("what is inNode?",inNode);
				return;
			}
			
			superClasses.push(tempNode);
		});
			
	
		console.log("superclass",superClasses);
		
		superClasses.forEach(function(spc){	
			classInfoMaker.makeClassInfo(spc);
		});
		for(var i =0; i<tempNode.child.length;i++){
			console.log("????????????????????");
			classInfoMaker.makeClassInfo(tempNode.child[i]);
		}
		
	}
	console.log("classInfo : ",classManager.getClassInfoArr());
	return classifier;
})();
