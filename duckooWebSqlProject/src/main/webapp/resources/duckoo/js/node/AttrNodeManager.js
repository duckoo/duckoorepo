var attrNodeManager=(function(){
	
	function AttrNodeManager(){
		this.arr= {};
	}

	AttrNodeManager.prototype.add=function(node){
		if(!node.id)return;
		this.arr[node.id]=node;
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
			console.log("디스쩜에이알알:",this.arr[idx]);
		    var en=EntityManager.getEntityByName(this.arr[Number(idx)].entity);
		    en.deleteAttr(Number(idx));
		    console.log("en:::::",en);
			 delete manager.arr[idx];
		}.bind(this));
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
		console.log("들어왔냐 에이티티알 매니저에!!!!!!!?");
		function tour(){
			var p= this.parent.reId;
			console.log("PPPPPPPP:",p);
			var t= this.reId;
			var iRarr = MyArrayUtil.intersection(p,t);
			iRarr.forEach(function(id){ fn(id); })
			console.log("iRarr:", iRarr);
		}
		this.update(startId,tour);
	}
	
	AttrNodeManager.prototype.unRelationParent=function(id){ //부모와 인연을 끊는다..
		   var pare= this.arr[id].parent;
			if(!pare){
				return;
			}
			this.unLink(id);
			var inArr= MyArrayUtil.intersection(this.arr[id].reId,pare.reId);
			pare.reId= MyArrayUtil.minu(pare.reId,inArr);
			this.arr[id].reId=MyArrayUtil.minu(this.arr[id].reId,inArr);
		}
	
	AttrNodeManager.prototype.deleteTour=function(id){
		var deleTarget=[];
		 if(this.arr[id].parent){
			 deleTarget = MyArrayUtil.intersection(this.arr[id].reId,this.arr[id].parent.reId);
		 }
		attrNodeManager.relationTour(Number(id),function(imyourman){
			var count=relationManager.get(imyourman).decreaseCount();
			if(count===0){deleTarget.push(imyourman);}
		});
		attrNodeManager.unRelationParent(Number(id));//
		deleTarget.forEach(function(rId){
			  jsPlumb.detach(renderManager.getConnecter(rId));
		});
		attrNodeManager.del(Number(id));//
	}
	
	
	AttrNodeManager.prototype.keyTypeTour=function(id,keyType){
		var deleTarget=[];
		var manager = this;
		 if(this.arr[id].parent){
			 deleTarget = MyArrayUtil.intersection(this.arr[id].reId,this.arr[id].parent.reId);
		 }
		 
		 manager.relationTour(Number(id),function(imyourman){
			var count=relationManager.get(imyourman).decreaseCount();
			if(count===0){deleTarget.push(imyourman);}
		});
		
		deleTarget.forEach(function(rId){
			  jsPlumb.detach(renderManager.getConnecter(rId));
		});
       ///////////////////////////////////////
		var targetId=[];
		manager.unRelationParent(Number(id));
		
		this.update(id,function(){
			targetId.push(this.id);
		});
		
		console.log("targetID: ",targetId)
		
		targetId.forEach(function(_id){
			var en=EntityManager.getEntityByName(this.arr[Number(_id)].entity);
			console.log("enitity: ",en);
			   keyType.id=Number(_id);
			   console.log("keyType: ",keyType);
			   en.setAttr(keyType);
			  console.log("enitity:2 ",en);
			   manager.unRelationParent(Number(_id));
		}.bind(this));

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
	
	
	AttrNodeManager.prototype.updateTourChild=function(id,attr){
		var target=[];
		if(!id)return;
		attr.id=id;
		EntityManager.getEntityByName(this.arr[id].entity).setAttr(attr);
		
		this.update(id,function(){
			target.push(this.id);
		});
		console.log("ㄷ이이이이이스스스ㅡ,... ",target);
		target.forEach(function(cid){
			var node = this.arr[cid];
			attr.id=Number(cid);
			EntityManager.getEntityByName(node.entity).setAttr(attr);
		}.bind(this));
		
	}
	
	
	
	
	
	AttrNodeManager.prototype.updateTourAll=function(id,attr){
		   var pArr=[];
		   if(!this.arr[id].parent)return;
		   
		    (function up(parent){
		    	if(!parent)return;
		    	pArr.push(parent.id);
		    	up(parent.parent);
		    }.bind(this))(this.arr[id].parent);
		    
		    
		    var startId= pArr.pop();
		    this.updateTourChild(Number(startId),attr);
		
	}
	
	
	
	
	
	
	
	
	return new AttrNodeManager();
})();