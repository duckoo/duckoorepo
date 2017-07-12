var jpaGen = (function(){
	
	var cf;
	
	function jpaGen(cfd){
		this.cf = cfd;
	}
	jpaGen.prototype.generate = function(){
	this.cf.punish();
	console.log("클래스 인포:",classManager.getClassInfoArr());
	 var classInfo = classManager.getClassInfoArr();
	 var $javaClassText = $("#javaClassText");//클래스들 붙일 곳
	 
	 var classInfoSource = $("#javaClasss").html();//클래스핸들소스
	 var javaTemplate = Handlebars.compile(classInfoSource);//클래스핸들바스컴파일
	 
	 var classAnnotationSource = $("#classAnnotations").html();//클래스어노테이션소스
	 var classAnnotationTemplate = Handlebars.compile(classAnnotationSource);// 클래스어노테이션컴파일
	 
	 
	 for(var i=0; i<classInfo.length; i++){
		 var className = classInfo[i].className;
	 	 var javaData = {className:className}; 
		 var javaHtml = javaTemplate(javaData);
	 	 $javaClassText.append(javaHtml);
	 	 for(var j=0; j<classInfo[i].annotations.length; j++){
		 		var annotation = classInfo[i].annotations[j];
		 		var classAnnotationData = {className:classInfo[i].className,annotation:annotation};
		 		
		 		var classAnnotationHtml = classAnnotationTemplate(classAnnotationData);
		 		$("#annotations_"+classInfo[i].className).append(classAnnotationHtml);
		 	 }	 
	 }
	 
	 
	 var columnDivsSource = $("#columnDivs").html();//컬럼디아브이소스
	 var columnDivsTemplate = Handlebars.compile(columnDivsSource); //컬럼디아브이컴파일
	 
	 for(var i=0; i<classInfo.length; i++){
		 for(var j=0; j<classInfo[i].properties.length; j++){
			 var pName = classInfo[i].properties[j].pName;
			 var pNameData = {className:classInfo[i].className,pName:pName};
			 var pNameHtml = columnDivsTemplate(pNameData);
			 $("#columns_"+classInfo[i].className).append(pNameHtml);
		 }
	 }

	 
	 Handlebars.registerHelper("annoCheck",function(anno,options){
		 console.log("@Column");
		 var anno = anno;
		 if(anno=="Column"){
			 return options.fn(this);
		 } else{
			 return options.inverse(this);
		 }
	 });
	 
	 Handlebars.registerHelper("annoCheck1",function(anno,options){
		 console.log("@OneToMany");
		 var anno = anno;
		 if(anno=="OneToMany"){
			 return options.fn(this);
		 } else{
			 return options.inverse(this);
		 }
	 });
	 
	 Handlebars.registerHelper("markCheck",function(mark,options){
		
		if(mark){
			return options.fn(this);
		}else{
			return options.inverse(this);
		}
	 });
	 
	 Handlebars.registerHelper("annoCheck2",function(anno,options){
		 console.log("@ManyToOne");
		 var anno = anno;
		 if(anno=="ManyToOne"){
			 return options.fn(this);
		 } else{
			 return options.inverse(this);
		 }
	 });
	 Handlebars.registerHelper("annoCheck3",function(anno,options){
		 console.log("@ID");
		 var anno = anno;
		 if(anno=="ID"){
			 return options.fn(this);
		 } else{
			 return options.inverse(this);
		 }
	 });	 
	 
	 
	 var columnAnnoSource = $("#columnAnno").html();//컬럼어노소스
	 var columnAnnoTemplate =Handlebars.compile(columnAnnoSource); // 컬럼어노컴파일 
	 
	 for(var i=0; i<classInfo.length; i++){
		 for(var j=0; j<classInfo[i].properties.length; j++){
			 for(var k=0; k<classInfo[i].properties[j].annotations.length; k++){
				 var anno = classInfo[i].properties[j].annotations[k];
				 //console.log("anno:",anno,"/i j k:",i,",",j,",",k,"/pname:",classInfo[i].properties[j].pName);
				 var colName = classInfo[i].properties[j].colName;
				 if(classInfo[i].properties[j].joinedColumn[0]!=undefined){
				 	var annoData = {propAnno:anno,colName:colName,mark:classInfo[i].properties[j].mark,joinedTable:classInfo[i].tableName,joinedColName:classInfo[i].properties[j].joinedColumn[0].pName};
				 }else{
					 var annoData = {propAnno:anno,colName:colName,mark:classInfo[i].properties[j].mark,joinedTable:classInfo[i].tableName};
				 }
				 var annoHtml = columnAnnoTemplate(annoData);
				 $("#columnDiv_"+classInfo[i].className+"_"+classInfo[i].properties[j].pName).append(annoHtml);
			 }
			 
		 }
	 }
	 
	 
	 var columnValSource = $("#columnVal").html();//컬럼변수소스
	 var coulumnValTemplate = Handlebars.compile(columnValSource);//컬럼변수템플릿
	  
	 for(var i=0; i<classInfo.length; i++){
		 for(var j=0; j<classInfo[i].properties.length; j++){
				 var pName = classInfo[i].properties[j].pName;
				 var dataType = classInfo[i].properties[j].dataType;
				
				 for(var k=0; k<classInfo[i].properties[j].annotations.length; k++){
					 if(classInfo[i].properties[j].annotations[k]=="OneToMany"){
						 dataType = "List<"+classInfo[i].properties[j].dataType+">";
						 pName = classInfo[i].properties[j].pName +" = new ArrayList()";
					 }
				 }
				 
				 
				 var valData = {pName:pName,dataType:dataType};
				 
				 
				 
				 var valHtml = coulumnValTemplate(valData);
				 $("#columnDiv_"+classInfo[i].className+"_"+classInfo[i].properties[j].pName).append(valHtml);
		 }
	 }
	}
	 return jpaGen;
})();