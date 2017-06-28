var relationManager=(function(){
	function RelationManager(){
		this.arr={};
	}
	RelationManager.prototype.add=function(relation){
		if(!relation.name)return;
		 this.arr[relation.name]=relation;
	}
	
	RelationManager.prototype.get=function(name){
		return this.arr[name];
	}

	RelationManager.prototype.del=function(name){
		if(this.arr[name]) delete this.arr[name];
	}
	
	return new RelationManager();
})();