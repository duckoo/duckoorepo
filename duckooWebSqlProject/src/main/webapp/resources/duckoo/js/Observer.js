var Obsever=(function(){
	var Obs={
	   fx:undefined,
	   name:undefined,
	   init:function(name,fx){
			this.name=name;
			this.fx=fx;
		},
	   fire:function(opt){
		   if(this.fx)this.fx(opt);
	   }
	}
	return Obs;
})();

