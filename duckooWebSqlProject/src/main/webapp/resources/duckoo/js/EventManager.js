var EventManager = (function(){

 
 var eventArr = {};

 var addDynamicEvent = function(id,target,eventType,func){
	 if(target){
	 
		 $("#"+id).on(eventType,target,func);
	 }
	 else{
		 $("#"+id).on(eventType,func);
	 }
	 eventArr[id]={}
	 eventArr[id][eventType]=({fx:func,eventType:eventType,target:target});
 }
var addStaticEvent = function(id,eventType,func){
	
}
 var deleteEvent = function(id){
	 if(eventArr[id]){
		 if(target){
			 $("#"+id).off(eventArr[id].eventType,eventArr[id].target);
		 }
		 else{
			 $("#"+id).off(eventArr[id].eventType);
		 }
		 delete 	eventArr[id];// 확실하지않다
	 }
 }
var setEvent = function(id,target,eventType,func){
	deleteEvent(id);
	addEvent(id,target,eventType,func);
}
var getEvent = function(id){
	return eventArr[id];
}

  return{	getEvent:getEvent,
	  		deleteEvent:deletEvent,
	  		addEvent:addEvent
  		}
})();