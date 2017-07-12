var propMaker = (function(){
	
	
	//for single pk entity//for nonidentify relation
	var makePropsSingle = function(targetEntity,tempClassInfo){
		var props = [];
		var pkProps = targetEntity.search({isPk:true});
		var ownProps = targetEntity.search({isFk:false});
		var noProps = MyArrayUtil.intersection(targetEntity.search({isPk:false}),targetEntity.search({isFk:false}));
		var fkProps = targetEntity.search({isFk:true});
		
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
						var search = attrNodeManager.get(prop.id).child[i];
						tempProp.addJoinColumn(EntityManager.getEntityByName(search.entity).search({id:Number(search.id)})[0]);
						tempProp.addJoinTable({"table":relationManager.get(attrNodeManager.get(prop.id).reId[i]).target,"relationType":relationManager.get(attrNodeManager.get(prop.id).reId[i]).relationType});
					}
				}
			}
			
			tempProp.dataType = maps.getType(prop.datetype);
			tempProp.pName = prop.pName;
			tempProp.colName = (prop.pName).toUpperCase();
			
			
			props.push(tempProp);
		});
		if(fkProps.length!=0){
		fkProps.forEach(function(fkProp){
			for(var i =0;i<attrNodeManager.get(fkProp.id).reId.length;i++){
				var fProp = new property();
				relation = (relationManager.get(attrNodeManager.get(fkProp.id).reId[i]));
				fProp.pName = relation.source;
				fProp.addAnnotations(codeUtils.reverseRelationType(relation.relationType));
				fProp.addAnnotations("JoinColumn");
				fProp.mark=true;
				fProp.dataType = codeUtils.upperFirstLetter(relation.source);
				fProp.isReferenced = false;
				fProp.addJoinTable(relation.source);
				if(classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation.source)).Emclass!=undefined){
					fProp.setJoinedColumn(classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation[i].source)).Emclass.property);
				}else{
					//일단 보류. 하나있을때 밖에 구분못하는데 너무 복잡하게 찾아들어감
					var ano = classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation.source)).properties;
					console.log("allofClassInfo",classManager.getClassInfoArr());
					console.log("targetClassName : ",relation.source);
					console.log("ananananananananana",classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation.source)));
					var refCol;
					ano.forEach(function(ref){
						if(ref.isReferenced){refCol = ref}
					})
					
					fProp.addJoinColumn(refCol);
				}
				props.push(fProp);
			}
			
			
			
		});
	}
		//if has child
		/*for(var i in props){
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
		}*/
		if(codeUtils.hasChild(targetEntity,pkProps)){
			pkProps.forEach(function(pk){
				var node = attrNodeManager.get(pk.id);
				if(node.reId!=undefined){
					
					var refProp = new property();
					for(var j in node.reId){
						var relation = relationManager.get(node.reId[j]);
						refProp.addAnnotations(relation.relationType);
						refProp.dataType = codeUtils.upperFirstLetter(relation.target);
						refProp.pName = relation.target;
						refProp.addJoinTable(relation.target);
						refProp.columnName = relation.target.toUpperCase();
						var joincolumns = ((relation.name).split("_")[1]).split("/");
						console.log("조인컬럼 시벌아아아아아아",(relation.name).split("_")[1])
						for(var k in joincolumns){
							console.log("조인컬럼스 :",EntityManager.getEntityByName(relation.target).search({id:Number(joincolumns[k])}));
							refProp.addJoinColumn(EntityManager.getEntityByName(relation.target).search({id:Number(joincolumns[k])})[0]);
							
						}
						
					}
					props.push(refProp);
				}
			});
			
			
		}
	/*	for(var i in props){
			if(props[i].isReferenced){
				for(var j in props[i].reId)
				var refProp = new property();
				console.log
				var relation = relationManager.get(props[i].reId[j]);
				refProp.annotations(relation.relationType);
				refProp.dataType = codeUtils.upperFirstLetter(relation.target);
				refProp.pName = relation.target;
				refProp.addJoinTable(relation.target);
				refProp.columnName = relation.target.toUpperCase();
				var joincolumns = relation.name.split("_")[1].split["/"];
				for(var k in joincolumns){
					
					refProp.addJoinColumn(attrNodeManager.get(joincolumns[k]));
					
				}
				props.push(refProp);
				
			}
		}*/
		
		
		/*console.log("property Arr",props);*/
		return props;
	}
	//for dualkey pk entity
	var makePropsDualKey = function(targetEntity,tempClassInfo){
		var props=[];
		var noProps = MyArrayUtil.intersection(targetEntity.search({isPk:false}),targetEntity.search({isFk:false}));
		var fkProps = targetEntity.search({isFk:true});
		var pkrefName =tempClassInfo.Emclass.className;
		var pkProps = targetEntity.search({isPk:true});
		var ownPk = MyArrayUtil.intersection(targetEntity.search({isPk:true}),targetEntity.search({isFk:true}))
		
		
		ownPk.forEach(function(prop){
			var pProp = new property();
			pProp.addAnnotations("EmbeddedId");
			pProp.dataType = maps.getType(prop.datetype);
			pProp.pName = prop.pName;
			if(attrNodeManager.get(prop.id).reId!=undefined){
				pProp.isReferenced = true;
			}
			pProp.colName = (prop.pName).toUpperCase();
		});
		
		noProps.forEach(function(prop){
			var tempProp= new property();
			tempProp.addAnnotations("Column");
			tempProp.dataType = maps.getType(prop.datetype);
			tempProp.pName = prop.pName;
			tempProp.colName = (prop.pName).toUpperCase();
			
			
			props.push(tempProp);
			
			
		});
		if(fkProps.length!=0){
			fkProps.forEach(function(fkProp){
				for(var i =0;i<attrNodeManager.get(fkProp.id).reId.length;i++){
					var fProp = new property();
					relation = (relationManager.get(attrNodeManager.get(fkProp.id).reId[i]));
					fProp.pName = relation.source;
					fProp.addAnnotations(codeUtils.reverseRelationType(relation.relationType));
					fProp.mark=true;
					fProp.addAnnotations("JoinColumn");
					fProp.dataType = codeUtils.upperFirstLetter(relation.source);
					fProp.isReferenced = false;
					fProp.addJoinTable(relation.source);
					if(classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation.source)).Emclass!=undefined){
						fProp.setJoinedColumn(classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation[i].source)).Emclass.property);
					}else{
						//일단 보류. 하나있을때 밖에 구분못하는데 너무 복잡하게 찾아들어감
						var ano = classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation.source)).properties;
						console.log("allofClassInfo",classManager.getClassInfoArr());
						console.log("targetClassName : ",relation.source);
						console.log("ananananananananana",classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation.source)));
						var refCol;
						ano.forEach(function(ref){
							if(ref.isReferenced){refCol = ref}
						})
						
						fProp.addJoinColumn(refCol);
					}
					props.push(fProp);
				}
				
				
				
			});
		}
		
		
		
		
	/*	fkProps.forEach(function(fkProp){
			
			var relation =[];
			
			
			for(var i =0;i<attrNodeManager.get(fkProp.id).reId.length;i++){
				var fProp = new property();
				relation.push(relationManager.get(attrNodeManager.get(fkProp.id).reId[i]));
				fProp.addAnnotations("Column");
				fProp.addAnnotations(codeUtils.reverseRelationType(relation[i].relationType));
				fProp.addAnnotations("JoinColumn");
				fProp.dataType = codeUtils.upperFirstLetter(relation[i].source);
				fProp.addJoinTable(fProp.dataType);
				fProp.isReferenced = false;
				if(classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation[i].source)).Emclass!=undefined){
					fProp.setJoinedColumn(classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation[i].source)).Emclass.property);
				}else{
					//일단 보류. 하나있을때 밖에 구분못하는데 너무 복잡하게 찾아들어감
					var ano = classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation[i].source)).properties;
					console.log("ananananananananana",classManager.getClassInfoByClassName(codeUtils.upperFirstLetter(relation[i].source)));
					var refCol;
					ano.forEach(function(ref){
						if(ref.isReferenced){refCol = ref}
					})
					
					fProp.addJoinColumn(refCol);
				}
				props.push(fProp);
				
			}
			
			
		});*/
	/*	for(var i in props){
			if(props[i].isReferenced){
				for(var j in props[i].joinedTable){
					var tar = props[i].joinedTable[j];
					var refProp = new property();
					
					refProp.addAnnotations(tar.relationType);
					refProp.dataType = codeUtils.upperFirstLetter(tar.table);
					refProp.pName = tar.table;
					console.log("???????????????????pName:",refProp.pName);
					refProp.columnName = tar.table.toUpperCase();
					refProp.addJoinColumn(props[i].JoinedColumn);
					props.push(refProp);
				}
				
			}
		}*/
		if(codeUtils.hasChild(targetEntity,pkProps)){
			pkProps.forEach(function(pk){
				var node = attrNodeManager.get(pk.id);
				if(node.reId!=undefined){
					console.log("jkhasdfgkjhafsdhjklsfdajhasdjgkjklashgjkashgkdhaksdjghjkldsahglkjdsahgjkdsag");
					var refProp = new property();
					for(var j in node.reId){
						var relation = relationManager.get(node.reId[j]);
						refProp.annotations(relation.relationType);
						refProp.dataType = codeUtils.upperFirstLetter(relation.target);
						refProp.pName = relation.target;
						refProp.addJoinTable(relation.target);
						refProp.columnName = relation.target.toUpperCase();
						var joincolumns = relation.name.split("_")[1].split["/"];
						for(var k in joincolumns){
							
							refProp.addJoinColumn(attrNodeManager.get(joincolumns[k]));
							
						}
						
					}
					props.push(refProp);
				}
			});
			
			
		}
		return props;
	}
	//haschild()
	
	
	//dual key check,
	var makeProp = function(targetEntity,tempClassInfo){
		var pkProp = targetEntity.search({isPk:true});
		if(pkProp.length<=1){
			return makePropsSingle(targetEntity,tempClassInfo);
		}
		else{
			tempClassInfo.setEmclass(emClass.makeEmClass(targetEntity));
			//tempClassInfo 자기 rel의 소스친구의 emclass 타입.
			return makePropsDualKey(targetEntity,tempClassInfo);
		}
	}
	
	return{makeProp:makeProp}
	
})();