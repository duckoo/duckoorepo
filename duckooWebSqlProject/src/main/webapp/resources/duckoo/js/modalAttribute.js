var modalAttribute=(function(){
	
	var head= "<tr style='border-style:solid;'>"+
    "        <th>키타입</th>"+
    "        <th>논리이름</th>"+
    "        <th>물리이름</th>"+
    "        <th>데이터타입</th>"+
    "        <th>Not null</th>"+
    "        <th>Default</th>"+
    "    </tr>";
	
	console.log("head: ",head);
	
	var body=
	" <div class='attrBox'>"+
    " <table class='tbl'>"+String(head)+"</table>"+
    "</div>"+
    "<div class = 'btnWrapper'>"+
    " <div class='addAttrBtn'><i class='fa fa-plus-circle fa-2x' aria-hidden='true'></i></div>"+
    " <div class='deleteAttrBtn'><i class='fa fa-times-circle fa-2x' aria-hidden='true'></i></div>"+
    "</div>"; 
	
	var columnHTML= $("#attrAddForm").html();
	var columnTemplate=Handlebars.compile(columnHTML);
	

function makeToSelected(value,options){
	var $el = $('<select />').html( options.fn(this) );
    $el.find('[value="' + value + '"]').attr({'selected':'selected'});
    console.log("val: ", value);
    
    return $el.html();
}
	
Handlebars.registerHelper('select', function(isPK,isFK, options ){
	var value="";
	value+=isPK?"PK":"";
	value+=isFK?"FK":"";
	if(value==="")value="None";
    return makeToSelected(value,options);
});

Handlebars.registerHelper('selectBasic', function(value, options ){
    return makeToSelected(value,options);
});

function setAttr(entity){
	var attr= entity.getAttr();
	var $tbl=  $(".tbl");
	 $tbl.html(head);
	console.log("setAttr1: ",attr);
	for(var i=0,len=attr.length;i<len;i++){
		 $tbl.append(columnTemplate(attr[i]));
	}
};

function setModal(entity,modal){
	modal.setViewPort(body);
	var target;
	setAttr(entity);
	$('.tbl').on("click","tr .datas",function(e){
        e.stopPropagation();
        e.preventDefault();
        $("tr").css("background-color","");
        $(this).parent().css("background-color","#269abc");
       target = $(this).parent();
    });
    $('.deleteAttrBtn').on('click',function(e){
        e.stopPropagation();
        e.preventDefault();
        target.remove();
    });
    
    $('.addAttrBtn').on('click',function(e){
        e.stopPropagation();
        e.preventDefault();
        console.log("add c ",entity);
        entity.setAttr({lName:"none",pName:"none",domainName:"none",datetype:"int"}); 
        setAttr(entity);
    });
   
   
}
return {setModal:setModal}	
})();