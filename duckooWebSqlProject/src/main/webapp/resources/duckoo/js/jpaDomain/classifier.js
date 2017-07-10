var classifier = (function(){
	var em;
	var rm;
	var nm;
	var inherit;
	var normal;
	
	function classifier(EntityManager,RelationManager,NodeManager){
		this.em = EntityManager;
		this.rm = RelationManager;
		this.nm = NodeManager;
		this.inherit = new inheritClass(EntityManager,RelationManager,NodeManager);
	}
	classifier.prototype.classify = function(Node,opt){
		var superClass;
		//전체 다 가져와야됨, 순회로 바꿔야...
		console.log("node",Node)
		if(typeof Node.parent==undefined){
			console.log("parent is undefined");
			return;
		}
			superClass = Node.parent;
		console.log("current superClass",superClass);
		while(typeof superClass!=undefined&&(superClass.parent)!=undefined){
			superClass = superClass.parent;
		}
		console.log("superClass",superClass.entity);
		console.log("em",this.em);
		this.makeSuperClass(this.em.getEntityByName(superClass.entity),superClass);
	}
	
	classifier.prototype.makeSuperClass = function(superClassEntity,superClassNode){
		var relations = superClassNode.reId;
		var typeSelectNum=0;
		relations.forEach(function(rel){
			if(rel.relationLine=="identify"){
				typeSelectNum++;
			}
		});
		if(typeSelectNum==0){
			//@MappedSuperClass 상속관계갖는 JPA코드생성. 관계 nonidentify면 classMaker로 생성하고 종료.
			console.log(this.inherit.makeClass(superClassEntity,superClassNode));
		}else{
			//상속관계는 필요없음. 일반용 classMaker ㄱㄱ
			
		}
	}
	
	
	
	return classifier;
})();
