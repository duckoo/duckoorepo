var memberMaker = (function(){
	var rm;
	var nm;
	
	function memberMaker(relationManager,nodeManager){
		rm = relationManager;
		nm = nodeManager;
	}
	memberMaker.prototype.make = function(targetEntity){
		var pks = targetEntity.search({isPk:true});
		var normals = targetEntity.search({isPk:false});
		var result = ""
		console.log("pks",pks);
		console.log("normals:",normals);
		result +=this.makeColumn(targetEntity,pks[0],true);
		for(var i = 0;i<normals.length;i++){
			result +=this.makeColumn(targetEntity,normals[i],false);
		}
		result +=this.relationMapping(targetEntity,pks[0]);
		return result;
	}
	memberMaker.prototype.makeColumn = function(entity,targetAttrbute,primaryFlag){
		var str = "\t@Column(name="+targetAttrbute.pName+")"+"\n";
		if(primaryFlag){
			str+="\t@Id"+"\n";
			if(targetAttrbute.autoIncrement){
				str+="\t@GeneratedValue(strategy="+"GenerationType.AUTO"+")"+"\n";
			}
		}
		
		str+="\tprivate "+maps.getType((targetAttrbute.datetype).split("(")[0])+" "+targetAttrbute.pName+";\n";
		
		return str;
	}
	
	
	memberMaker.prototype.relationMapping = function(entity,targetAttribute){
		var targetnode = nm.get(targetAttribute.id);
		var childNodes = nm.get(targetAttribute.id).child;
		
		console.log("targetnode",targetnode);
		console.log("childNodes",childNodes);
		
		
		
		var relationStr = "";
	
			for(var i=0;i<childNodes.length;i++){
				if(rm.get(childNodes[i].reId[0]).relationType=="OneToMany"){
					relationStr += "\t@"+rm.get(childNodes[i].reId[0]).relationType+"(fetch=FetchType.LAZY"+(rm.get(childNodes[i].reId[0]).restrictType==="cascade"?",cascade = CascadeType.ALL":"")+")"+"\n";
				}
				relationStr += "\t@JoinColumn(name="+childNodes[i].entity.search({id:Number(childNodes[i].id)}).pName+")"+"\n";
				
				relationStr +="\tprivate List<"+rm.get(childNodes[i].reId[0]).target+"> example1"+";\n";
			}

			

		return relationStr;
	}
	memberMaker.prototype.makeOneToMany = function(relationType,restrictType,src_tbl_name,target_tbl_name){
		var str = "\t"+relationType+"(mappedBy="+src_tbl_name (restrictType==="cascade"?",cascade = CascadeType.ALL":"")+")"+"\n";
		
		
	}
	memberMaker.prototype.makeOneToOne = function(){
		
	}
	memberMaker.prototype.makeManyToOne = function(){
		
	}
	return memberMaker;
})();


