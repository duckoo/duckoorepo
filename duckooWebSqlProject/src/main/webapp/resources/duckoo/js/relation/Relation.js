var Relation=(function(){

	function Relation(opt){
         var opt = opt || {};
         this.name = opt.name || undefined;
         this.source =opt.source|| undefined ;
         this.target =opt.target || undefined;
         this.nodes= opt.nodes || [ [] , [] ];
         this.relationLine= opt.relationLine || undefined;
         this.restrictType = opt.restrictType || {};
	}
	
	Relation.prototype.addNode=function(pId,cId){
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
	
	return Relation;
})();
