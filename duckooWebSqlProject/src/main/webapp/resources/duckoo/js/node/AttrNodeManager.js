var attrNodeManager=(function(){
	
	function AttrNodeManager(){
		this.arr= {};
	}

	AttrNodeManager.prototype.add=function(node){
		if(!node.id)return;
		this.arr[node.id]=node;
	}
	
	AttrNodeManager.prototype.unRelationParent=function(id){ //검증안됨
	   var pare= this.arr[id].parent;
		if(!pare){
			return;
		}
		this.unLink(id);
		var inArr= MyArrayUtil.minu(this.arr[id].reId,pare.reId);
		pare.reId=MyArrayUtil.minu(pare.reId,inArr);
		this.arr[id].reId=MyArrayUtil.minu(this.arr[id].reId,inArr);
	}
	
	AttrNodeManager.prototype.unLink=function(id){// 검증안됨..
		var pare= this.arr[id].parent;
		console.log("p:: ",pare)
		if(!pare)return;
		var pArr=pare.getChild();
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
		if(!this.arr[id]){
			 this.arr[id]= new AttrNode({id:id});
		}
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
		var pNode =this.get(pid);
		var cNode= this.get(cid);
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
	
	AttrNodeManager.prototype.relationTour=function(startId,fn){
		function tour(){
			var p= this.parent.reId;
			var t= this.reId;
			var iRarr = MyArrayUtil.intersection(p,t);
			iRarr.forEach(function(id){ fn(id); })
		}
		this.update(startId,tour);
	}
	
	
	
	
	return new AttrNodeManager();
})();