var classifier = (function(){
	
	var superClasses=[];
	
	function classifier() {
		
	}
	classifier.prototype.classify = function(node){
		var tempNode = scanner.superClassScan(node);
			
		if(superClasses.length==0){
			superClasses.push(tempNode);
		}
		
		
		for(var i in superClasses){
			if(tempNode.id===superClasses[i].id){
				/*console.log("what is tempNode?",tempNode);
				console.log("what is inNode?",inNode);*/
				return;
			}
			else{
				superClasses.push(tempNode);
			}
		};
	}
	
	classifier.prototype.punish =function(){
		console.log("superclass",superClasses);
		superClasses.forEach(function(spc){	
			classInfoMaker.makeClassInfo(spc);
		});
		//child?
		
		superClasses.forEach(function(spc){
			for(var i in spc.child){
				classInfoMaker.makeClassInfo(spc.child[i]);
			}
		});
		
		
		
		
	}
	
	
	console.log("classInfo : ",classManager.getClassInfoArr());
	return classifier;
})();
