var EnitityView=(function(){
  var entityHtml=$("#entityTemplate").html();
  var entityTemplate=Handlebars.compile(entityHtml);

  Handlebars.registerHelper("getAttrHeight",function(ex){
		var str="height:";
		if(ex)str+="285px";
		else str+="68px";
		return str;
	});
  function genHtmlStr(){ 
	   return entityTemplate(this);
   } 
  function refresh(){ 	
	 var str=this.genHtmlStr();
	 var $this=$("#"+this.name);
	   $this.html($(str).html());
	}
  function renderToHTML($taget){
		 if(!$taget)$taget=$("body");
		 var str=this.genHtmlStr();
		$taget.append(str);
		$("#"+this.name).draggable();
	}
  function show(){ 
		var $this=$("#"+this.name);
		$this.css("display","block");
		if($this.length===0){
			this.renderToHTML();
		}
	}
  function hide(){
	 var $this=$("#"+this.name);
	 $this.css("display","none");
	}
  
  function inject(en){
	    en.hide=hide;
	    en.genHtmlStr=genHtmlStr;
		en.renderToHTML=renderToHTML;
		en.refresh=refresh;
		en.show=show;
		return en;
	}
  
  var ret={
		  inject:inject,
		  show:show
         }
   return ret;
})();
dView.add({name:"entity", val:EnitityView});