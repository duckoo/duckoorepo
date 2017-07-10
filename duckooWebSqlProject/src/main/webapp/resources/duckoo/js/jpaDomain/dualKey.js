var dualKey = (function(){
	var entity;
	var nm;
	function dualKey(entity,nodeManager){
		this.entity = entity;
		this.nm = nodeManager;
		console.log("엔티티받음?:",this.entity);
	}
	
	
	dualKey.prototype.makePKClass = function(){
		var tempPKArr = this.entity.search({isPk:true});
		
		str = "@Data\n";
		str += "@MappedSuperClass\n";
		str +="public class "+this.entity.name+"_pks"+"{\n";
		
		str +=this.makeProp(entity,tempPKArr);// hashcode, equals 만들어야됨
		str+="}\n\n";
		
		
		
		
		return str;
		
	}
	dualKey.prototype.makeProp = function(entity,PKArr){
		var PKProps = "";
		for(var i =0;i<PKArr.length;i++){
			PKProps +="@Column(name="+'"'+PKArr[i].pName+'")\n';
			PKProps +="private "+maps.getType(PKArr[i].datetype.split("(")[0])+" "+PKArr[i].pName+"\n\n";
		}
		return PKProps;
	}
	dualKey.prototype.makeDualKeyTable = function(entity,PKArr){
		var normalCol = this.entity.search({isPk:false});
		var str = "@Entity\n";
		str+= "@Data\n";
		str+= "public class "+this.entity.name+"{\n"
		
			str+=this.makeColumn(entity,PKArr[0],true);
		
		for(var i=0;i<normalCol.length;i++){
			str+=this.makeColumn(entity,normalCol[i],false);
		}
		
		
		
		str+="}"
		return str;
	}
	dualKey.prototype.makeColumn = function(entity,targetAttribute,primaryFlag){
		var str = "";
		if(primaryFlag){
			str+="\t@EmbeddedId"+"\n";
			
			str += "\tprivate "+this.entity.name+"_pks "+"pk;"+"\n\n";
			
			/*//   @ManyToOne
			   @JoinColumns({
				     @JoinColumn(name="bno", referencedColumnName="bno"),
				     @JoinColumn(name="title", referencedColumnName="title")
				   })
				   //Embeddedable로 지정한 식별자의 기본키필드지정
				   //PK(키값)으로 매핑됨을 의미한다.
				   @MapsId("테이블명+_pks") 
				   private 테이블명+_pks parent;식별관계일 때 이렇게됨(복합키를 가진 식별관계/).*/
		}else{
			str += "\t@Column(name="+targetAttribute.pName+")"+"\n";
		
			str+="\tprivate "+maps.getType((targetAttribute.datetype).split("(")[0])+" "+targetAttribute.pName+";\n\n";
		}
		return str;
		
		
	}
	return dualKey;
})();
