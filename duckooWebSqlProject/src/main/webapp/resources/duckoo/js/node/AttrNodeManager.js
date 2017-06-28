var attrNodeManager=(function(){
	
	function AttrNodeManager(){
		this.arr= {};
	}

	AttrNodeManager.prototype.add=function(node){
		if(!node.id)return;
		this.arr[node.id]=node;
	}
	
	AttrNodeManager.prototype.unLink=function(id){
		var parent= this.get(id).parent;
		var pArr=parent.getChild();
		var idx =0;
		pArr.some(function(n){
	        if(n.id===id){
	        	pArr.splice(idx,1);
	        	return true;
	        }
			 idx++;
		})
		
		this.get(id).parent=undefined;	
	}
	
	
	AttrNodeManager.prototype.get=function(id){
		return this.arr[id];
	}
	
	AttrNodeManager.prototype.del=function(id){
		var idArr=[];
		var manager = this;
		idArr.push(id);
		
		this.unLink(id);

		this.update(id,function(){
			idArr.push(this.id);
		});
		
		idArr.forEach(function(idx){
			 delete manager.arr[idx];
		})
	}
	
	
	AttrNodeManager.prototype.link=function(pid,cid){
		var pNode =this.get(pid.id);
		if(!pNode){
			pNode=new AttrNode({id:pid.id,val:pid.val});
			this.add(pNode);
		}
		var cNode= this.get(cid.id);
		if(!cNode){
			cNode= new AttrNode({id:cid.id,val:cid.val});
			this.add(cNode);
		}
		
		cNode.setParent(pNode);
		pNode.addChild(cNode);
	}
	
	
	AttrNodeManager.prototype.update=function(startId,fn){
		var manager =this;
		(function chain(id){
		  if(!id)return;
		  var node= manager.get(id);
		  node.getChild().forEach(function(that){
		    	fn.call(that);
				chain(that.id);
			})
		})(startId);
	}
	
	
	
	
	
	return new AttrNodeManager();
})();