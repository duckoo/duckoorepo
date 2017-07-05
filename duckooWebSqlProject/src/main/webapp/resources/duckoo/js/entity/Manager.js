var EntityManager=(function(){
	var entityArr={};// all of Entity;
	var Obserable=DObserable.createObserable();
// function///////////////////////////////////////////////////////////////////////////////////////////////////// 
function createEntity(opt){
	if(entityArr[opt.name])return;
    var newEntity=Entity.createInstance(opt);
    Object.defineProperty(entityArr,newEntity.name,{
	         value:newEntity,
	         writable:true,
	         enumerable:true,
	         configurable:false
	}); 
    return newEntity;
}		
function deleteEntity(name){
	var en=getEntityByName(name);
	 if(!en)return;
	 hideEntity(name);
	 delete en; //delete 쓰지말라고하던데 흠
}
function setAttribute(entityName,opt){
	var en=getEntityByName(entityName);
	if(!en){alert("잘못된 엔티디 접근");return;}
	en.setAttr(opt);
}
function getEntityByName(name){
	if(arguments.length===0){return entityArr}
	return entityArr[name];
}
function setEntity(entity){
	if(!entity || !entity.name){return ;}
	entityArr[entity.name]=entity;
}
function setJObj(e){
	entityArr={}; // 테스트때문에.. 굳이 안해줘도됨.
	var key = Object.keys(e);
	for(var i=0 ,len = key.length;i<len;i++){
		createEntity(e[key[i]]);
	}
}
return {
	    createEntity:createEntity,
	    setEntity:setEntity,
	    deleteEntity:deleteEntity,
	    getEntityByName:getEntityByName,
	    setAttribute:setAttribute,
	    Obserable:Obserable,
	    setJObj:setJObj
      };
})();
