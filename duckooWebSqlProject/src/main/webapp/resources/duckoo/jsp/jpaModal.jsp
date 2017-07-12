<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/duckoo/css/modalFull.css?1">
<div class="modal fade" id="jpaModal" role="dialog" style="width:100%; height:100%">
    <div class="modal-dialog modal-fullsize">
      <div class="modal-content modal-fullsize">
        <div class="modal-header">
          <h4 class="modal-jpaTitle">JPA CODE</h4>
        </div>
        <div class="modal-jpabody" style="height:800px;">
        	
			<div id="javaClassText" style="width:100%; float:left; height:800px; overflow:auto;">
			
			</div>
			
        </div>
        <div class="modal-footer" style="margin-top:20px;">
          <button id="javaCodeDivCloseBtn" type="button" class="btn btn-danger">Close</button>
        </div>
      </div>
    </div>
</div>
  
  
<script id="javaClasss" type="text/x-handlebars-template">
<br>--------------------------------{{className}} JPA Code-----------------------------</br>
<div id="{{className.className}}" style="width:100%; font-weight: bold;">
    <div style="width:auto; float:left; color:#880055;">import</div><div style="margin-left:3px; width:auto; float:left; color:#040000;"> java.util.*;</div>
    <br>
    <div style="width:auto; float:left; color:#880055;">import</div><div style="margin-left:3px; width:auto; float:left; color:#040000;"> javax.persistence.*;</div>
    <br>
	<br>
    <div id="annotations_{{className}}">
     
    </div>
    <div style="width:auto; float:left; color:#880055;">public class</div><div style="margin-left:3px; width:auto; float:left; color:#040000;"> {{className}} {</div>
    <br>
    <br>
    <div style="width:auto; float:left; color:#880055;">public </div><div style="margin-left:5px;  float:left; color:#040000;">{{className}}(){</div><div style="margin-left:3px; width:auto; float:left; color:#040000;">};</div>
    
    <div id="columns_{{className}}">
	
	</div>
    
    <br>
    <div style="width:auto; float:left;"></div><div style="margin-left:3px; width:auto; float:left; color:#040000;">}</div>
</div>
</script>
<script id="classAnnotations" type="text/x-handlebars-template">
	<div id="annotation_{{className}}_{{anotation}}" style="color:#63666B">@{{annotation}}</div>
</script>


<script id="columnDivs" type="text/x-handlebars-template">	
	<br>
    <div id="columnDiv_{{className}}_{{pName}}">
	</div>
</script>

<script id="columnAnno" type="text/x-handlebars-template">
	{{#annoCheck propAnno}}
	<br>
	<div style="color:#63666B; width:auto; float:left;">@{{propAnno}}</div><div style="color:#040000; float:left;">(name=</div><div style="color:#2C03F5; float:left;">"{{colName}}"</div><div style="color:#040000; float:left;">)</div>
	{{/annoCheck}}
	{{#annoCheck1 propAnno}}
		{{#markCheck mark}}
		<br>
		<div style="color:#63666B; float:left; width:100%;">@{{propAnno}}</div>
		{{else}}
		<br>
		<div style="color:#63666B; width:auto; float:left;">@{{propAnno}}</div><div style="color:#040000; float:left;">(mappedBy=</div><div style="color:#2C03F5; float:left;">"{{joinedTable}}"</div><div style="color:#040000; float:left;">)</div>
		{{/markCheck}}
	{{/annoCheck1}}
	{{#annoCheck2 propAnno}}
		{{#markCheck mark}}
		<br>
		<div style="color:#63666B; width:auto; float:left;">@{{propAnno}}</div>
		<br>
		<div style="color:#63666B; width:auto; float:left;">@JoinColumn</div><div style="color:#040000; float:left;">(name=</div><div style="color:#2C03F5; float:left;">"{{joinedColName}}"</div><div style="color:#040000; float:left;">)</div>
		{{else}}
		<br>
		<div style="color:#63666B; float:left; width:100%;">@{{propAnno}}</div>
		{{/markCheck}}
	{{/annoCheck2}}
	{{#annoCheck3 propAnno}}
		<br>
		<div style="color:#63666B; float:left; width:100%;">@{{propAnno}}</div>
	{{/annoCheck3}}
	
</script>

<script id="columnVal" type="text/x-handlebars-template">
	<br>
	<div style="float:left; color:#880055;">private </div>
	
	<div style="margin-left:5px; float:left; color:#040000;">{{dataType}} </div><div style="margin-left:5px; color:#2C03F5; float:left;">{{pName}}</div><div style="float:left; color:#040000;">;</div>
</script>

<script>

$("#javaCodeDivCloseBtn").on("click",function(e){
	e.stopPropagation();
    e.preventDefault();
    $("#javaClassText").empty();
    console.log("empty");
    $("#jpaModal").modal("hide");
});


</script>


<script type="text/javascript" src="/resources/duckoo/js/jpa/jpaGen.js?aaasdf"></script>

