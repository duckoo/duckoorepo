var Relation=(function(){
	
	function Relation(opt){
         var opt = opt || {};
         this.name = opt.name || undefined;
         this.id = opt.id  ||  undefined;
         this.source =opt.source|| undefined ;
         this.target =opt.target || undefined;
        
         this.count=opt.count || 0;
         this.relationLine= opt.relationLine || undefined;
         this.restrictType = opt.restrictType || {};
         
         
         //this.nodes= opt.nodes || [ [] , [] ];
	}
	Relation.prototype.getCount=function(){
		return  this.count;
	}
	Relation.prototype.setCount=function(ct){
		 this.count=ct;
		 return this.count;
	}
	Relation.prototype.decreaseCount=function(){
		this.count-=1;
		return this.count;
	}
	Relation.prototype.increaseCount=function(){
		this.count+=1;
		return this.count;
	}
	
	Relation.prototype.getId=function(){
		return this.id;
	}
	
	
	
/*	Relation.prototype.addNode=function(pId,cId){
		  this.nodes[0].push(pId);
		  this.nodes[1].push(cId);
	}
	
	Relation.prototype.getNodeByParent=function(pId){
		var idx=0;
		this.nodes[0].some(function(node){
			if( node === pId)
			  return true;
			idx++;
		  });
		return {
			idx:idx,
			parent: this.nodes[0][idx],
			child:this.nodes[1][idx],
		 }
	}
	Relation.prototype.getChildNode=function(){
		return this.nodes[1];
	}
	Relation.prototype.getParentdNode=function(){
		return this.nodes[0];
	}
	
	
	
	Relation.prototype.getNodeByChild=function(pId){
		var idx=0;
		this.nodes[1].some(function(node){
			if( node === pId)
			  return true;
			idx++;
		  });
		return {
			 idx:idx,
			 parent: this.nodes[0][idx],
			 child:this.nodes[1][idx]
		 }
	}
	
	Relation.prototype.deleteByParentID=function(pid){
	  var idx= this.getNodeByParent(pid).idx;
	  this.nodes[0].splice(idx,1);
	  this.nodes[1].splice(idx,1);
		
	}
	
	Relation.prototype.deleteByChildID=function(pid){
		  var idx= this.getNodeByChild(pid).idx;
		  this.nodes[0].splice(idx,1);
		  this.nodes[1].splice(idx,1);
	}
	*/
	return Relation;
})();
