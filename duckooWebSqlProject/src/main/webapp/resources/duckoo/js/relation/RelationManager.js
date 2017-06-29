var relationManager=(function(){
	function RelationManager(){
		this.arr={};
	}
	RelationManager.prototype.add=function(relation){
		if(!relation.id)return;
		 this.arr[relation.id]=relation;
	}
	RelationManager.prototype.get=function(id){
		return this.arr[id];
	}
	RelationManager.prototype.del=function(id){
		if(this.arr[id]) delete this.arr[id];
	}
	return new RelationManager();
})();