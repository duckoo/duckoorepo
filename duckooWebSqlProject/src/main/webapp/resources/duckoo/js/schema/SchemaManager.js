var SchemaManager=(function(){
 function SchemaManager(){
   this.arr= {};
 }
 
 SchemaManager.prototype.set=function(parsedObj){
	 console.log("parse: ",parsedObj);
	 var key=Object.keys(parsedObj);
	 this.arr[key[0]]=parsedObj[key[0]];
	 return parsedObj[key[0]];
 }
 SchemaManager.prototype.get=function(name){
	 if(arguments.length===0)return this.arr;
	 return this.arr[name];
 }
 
 SchemaManager.prototype.getKeys=function(){
	 var key= Object.keys(this.arr);
	 return key;
 }
 SchemaManager.prototype.focusOn=function(name){
	 SaveAndLoad.load(this.arr[name]);
 }
 
 SchemaManager.prototype.getEntitysNames=function(name){
	 var es= this.arr[name].entitys;
	 return Object.keys(es);
 }
 
 
 return new SchemaManager();
})();