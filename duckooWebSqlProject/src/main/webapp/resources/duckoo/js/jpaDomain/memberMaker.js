var memberMaker = (function(){
	var rm;
	var nm;
	
	function memberMaker(relationManager,nodeManager){
		rm = relationManager;
		nm = nodeManager;
	}
	memberMaker.prototype.make = function(targetEntity){
		var pks = targetEntity.search({isPk:true});
		var normals1 = targetEntity.search({isPk:false});
		var normals2 = targetEntity.search({isFk:false});
		var normals = MyArrayUtil.intersection(normals1,normals2);
		var fks = targetEntity.search({isFk:true});
		var result = ""
		
		
		result +=this.makeColumn(targetEntity,pks[0],true);
		
		for(var i = 0;i<normals.length;i++){
			result +=this.makeColumn(targetEntity,normals[i],false);
		}
		result +=this.relationMapping(targetEntity,pks[0]);//한개만가능
		
		if(fks.length!=0){
			for(var i=0;i<fks.length;i++){
				result +=this.reverseMapping(targetEntity,fks[i]);//역시 한개만 가능
			}
		}
		
		return result;
	}
	memberMaker.prototype.makeColumn = function(entity,targetAttrbute,primaryFlag){
		var str = "";
		if(primaryFlag){
			str+="\t@Id"+"\n";
			if(1){
				str+="\t@GeneratedValue(strategy="+"GenerationType.AUTO"+")"+"\n";
			}
		}
		str += "\t@Column(name="+targetAttrbute.pName+")"+"\n";
		str+="\tprivate "+maps.getType((targetAttrbute.datetype).split("(")[0])+" "+targetAttrbute.pName+";\n\n";
		
		return str;
	}
	
	
	memberMaker.prototype.relationMapping = function(entity,targetAttribute){
		var targetnode = nm.get(targetAttribute.id);
		var childNodes = nm.get(targetAttribute.id).child;
		
		console.log("targetnode",targetnode.id);
		console.log("childNodes",childNodes);
		console.log("entity get :",entity);
		var relationStr = "";
	
			for(var i=0;i<childNodes.length;i++){
				if(rm.get(childNodes[i].reId[0]).relationType=="OneToMany"){
					relationStr += this.makeOneToMany(rm.get(targetnode.reId[i]).relationType,rm.get(targetnode.reId[i]).restrictType,targetnode,rm.get(targetnode.reId[i]).source,rm.get(targetnode.reId[i]).target,targetnode.child[i]);
				}
				else if(rm.get(childNodes[i].reId[0]).relationType=="OneToOne"){
					relationStr += this.makeOneToOne(rm.get(targetnode.reId[i]).relationType,rm.get(targetnode.reId[i]).restrictType,targetnode,entity,rm.get(targetnode.reId[i]).target);
				}
			}
			

		return relationStr;
	}
	memberMaker.prototype.makeOneToMany = function(relationType,restrictType,targetNode,src_tbl_name,target_tbl_name,child){
		console.log("child id :",child);
		
		var temp = EntityManager.getEntityByName(child.entity).search({id:Number(child.id)});
		//console.log("temptemptemptemptemp:",temp);
		var str = "\t@"+relationType+"(mappedBy="+'"'+temp[0].pName+'"'+(restrictType==="cascade"?",cascade = CascadeType.ALL":"")+")"+"\n";
		str +="\tprivate List<"+target_tbl_name+"> example1"+" = new ArrayList<>();\n";
		return str;
	}
	memberMaker.prototype.makeOneToOne = function(relationType,restrictType,targetNode,entity,target_tbl_name){
		var str = "\t@"+relationType+"\n";
		str += "\t@JoinColumn(name = "+entity.search({id:targetNode.id+""}).pName+")\n";
		str += "\tprivate "+target_tbl_name+ " example2;\n\n";
		return str;
	}
	memberMaker.prototype.makeManyToOne = function(relationType,restrictType,targetNode,entity,target_tbl_name){//oneToMany의 주인.
		var targetNodeId = Number(targetNode.id);
		var str = "\t@"+relationType+"\n";
		//console.log("나오긴 하니:",entity.search({id:targetNodeId}));
		str += "\t@JoinColumn(name = "+'"'+(entity.search({id:targetNodeId}))[0].pName+'"'+")\n";
		str += "\tprivate "+target_tbl_name+ " example2;\n\n";
		return str;
	}
	memberMaker.prototype.makeManyToMany = function(){
		
	}
	
	memberMaker.prototype.reverseMapping = function(entity, targetAttribute){
		var targetnode = nm.get(targetAttribute.id);
		var childNodes = nm.get(targetAttribute.id).child;
		//console.log("reverse Entity",entity);
		//console.log("targetNode",targetnode.id);
		var relationStr="";
		if(typeof targetnode.parent!==undefined){
			var reverseRelation = MyArrayUtil.intersection(targetnode.reId,targetnode.parent.reId);
			
			var reverseRelType = (rm.get(reverseRelation).relationType).split("To")[1] + "To" + (rm.get(reverseRelation).relationType).split("To")[0];
			//console.log("reverse Type : ",reverseRelType);
			if(reverseRelType=="ManyToOne"){
				relationStr +=this.makeManyToOne(reverseRelType,rm.get(reverseRelation).restrictType,targetnode,entity,rm.get(reverseRelation).source);
				
			}
			
		}
		return relationStr;
	}
	return memberMaker;
})();


