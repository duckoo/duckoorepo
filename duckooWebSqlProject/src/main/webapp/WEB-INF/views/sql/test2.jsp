<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script type="text/javascript" src="/resources/jsplumb.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>


<style>
        #diagramContainer {
            padding: 20px;
            width:80%; height: 200px;
            border: 1px solid gray;
        }
        
       .item {
            height:80px; width: 80px;
            border: 1px solid blue;
            float: left;
            
       }
    </style>

</head>
 <body>
<div id="diagramContainer">
        <div id="item_left" class="item" onmousemove ="repaint()"></div>
        <div id="item_right" class="item" onmousemove ="repaint()" style="margin-left:50px;"></div>
        <div id="item_up" class="item" onmousemove ="repaint()" style="margin:50px;"></div>
        <div id="item_down" class="item" onmousemove ="repaint()" style="margin-top:50px;"></div>
    </div>
    

    
 <script>
    function repaint(){
        jsPlumb.repaintEverything();
    }
    
       jsPlumb.ready(function() {
        var left = $("#item_left").attr("id");
        var right = $("#item_right").attr("id");
        var up = $("#item_up").attr("id");
        var down = $("#item_down").attr("id");
        var container = $("#diagramContainer");
        
        $("#item_left").draggable();
         $("#item_up").draggable();
         $("#item_right").draggable();
         $("#item_down").draggable();
        
     
       var contact = function(firstElement,nextElement){
            jsPlumb.connect({
                source:$("#diagramContainer #"+firstElement),
                target:$("#diagramContainer #"+nextElement),
              
                endpoint:"Rectangle",
                anchor:["Continuous", { faces:[ "bottom", "left" ,"right","top"] } ]
            });
                            
       }
        contact(left,right);
        contact(up,down);
        contact(left,up);
        contact(left,down);
        contact(right,down);
        jsPlumb.draggable($("#item_left"));
    
        
       });
    </script>
   
  </body>
</html>