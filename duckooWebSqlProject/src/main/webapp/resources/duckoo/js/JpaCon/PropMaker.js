var propMaker = (function(){
	
	
	//for single pk entity//for nonidentify relation
	var makePropsSingle = function(targetEntity,tempClassInfo){
		var props = [];
		var ownProps = targetEntity.search({isFk:false});
		var noProps = MyArrayUtil.intersection(targetEntity.search({isPk:false}),targetEntity.search({isFk:false}));
		var fkProps = targetEntity.search({isFk:true});
		var fProp = new property();
		
		
		
		//own column
		ownProps.forEach(function(prop){
			var tempProp= new property();
			tempProp.addAnnotations("Column");
			if(prop.isPk){
				tempProp.addAnnotations("ID");
				
				if(attrNodeManager.get(prop.id).reId!=undefined){
					tempProp.isReferenced = true;
					for(var i =0;i<attrNodeManager.get(prop.id).reId.length;i++){
						tempProp.addRelations(relationManager.get(attrNodeManager.get(prop.id).reId[i]));
						tempProp.addJoinTable({"table":relationManager.get(attrNodeManager.get(prop.id).reId[i]).target,"relationType":relationManager.get(attrNodeManager.get(prop.id).reId[i]).relationType});
					}
				}
			}
			
			tempProp.dataType = maps.getType(prop.datetype);
			tempProp.pName = prop.pName;
			tempProp.colName = (prop.pName).toUpperCase();
			
			
			props.push(tempProp);
		});
		
		fkProps.forEach(function(fkProp){
			var relation =[];
			for(var i =0;i<attrNodeManager.get(fkProp.id).reId.length;i++){
				
				relation.push(relationManager.get(attrNodeManager.get(fkProp.id).reId[i]));
				fProp.addAnnotations("Column");
				fProp.addAnnotations(codeUtils.reverseRelationType(relation[i].relationType));
				fProp.addAnnotations("JoinColumn");
				fProp.dataType = relation.source;
				fProp.isReferenced = true;
				fProp.addJoinColumn((fkProp.pName).toUpperCase());
				props.push(fProp);
			}
		});
		//if has child
		for(var i in props){
			if(props[i].isReferenced){
				for(var j in props[i].joinedTable){
					var tar = props[i].joinedTable[j];
					var refProp = new property();
					refProp.addAnnotations(tar.relationType);
					refProp.dataType = codeUtils.upperFirstLetter(tar.table);
					refProp.pName = tar.table;
					refProp.columnName = tar.table.toUpperCase();
					
					props.push(refProp);
				}
			}
		}
		console.log("property Arr",props);
		return props;
	}
	//for dualkey pk entity
	var makePropsDualKey = function(targetEntity,tempClassInfo){
		var props=[];
		var noProps = MyArrayUtil.intersection(targetEntity.search({isPk:false}),targetEntity.search({isFk:false}));
		var fkProps = targetEntity.search({isFk:true});
		var pkrefName =tempClassInfo.Emclass.className;
		var fProp = new property();
		
		var pkProp = new property();
		pkProp.addAnnotations("EmbeddedId");
		pkProp.dataType = tempClassInfo.Emclass.className;
		pkProp.pName = tempClassInfo.Emclass.className.toLowerCase();
		props.push(pkProp);
		
		noProps.forEach(function(prop){
			var tempProp= new property();
			tempProp.addAnnotations("Column");
			tempProp.dataType = maps.getType(prop.datetype);
			tempProp.pName = prop.pName;
			tempProp.colName = (prop.pName).toUpperCase();
			
			
			props.push(tempProp);
			
			
		});
		fkProps.forEach(function(fkProp){
			
			var relation =[];
			for(var i =0;i<attrNodeManager.get(fkProp.id).reId.length;i++){
				
				relation.push(relationManager.get(attrNodeManager.get(fkProp.id).reId[i]));
				fProp.addAnnotations("Column");
				fProp.addAnnotations(codeUtils.reverseRelationType(relation[i].relationType));
				fProp.addAnnotations("JoinColumn");
				fProp.dataType = codeUtils.upperFirstLetter(relation[i].source);
				fProp.isReferenced = true;
				fProp.addJoinColumn((fkProp.pName).toUpperCase());
				props.push(fProp);
			}
			
			
		});
		
		return props;
	}
	
	
	//dual key check,
	var makeProp = function(targetEntity,tempClassInfo){
		var pkProp = targetEntity.search({isPk:true});
		if(pkProp.length<=1){
			return makePropsSingle(targetEntity,tempClassInfo);
		}
		else{
			tempClassInfo.setEmclass(emClass.makeEmClass(targetEntity));
			return makePropsDualKey(targetEntity,tempClassInfo);
		}
	}
	
	return{makeProp:makeProp}
	
})();