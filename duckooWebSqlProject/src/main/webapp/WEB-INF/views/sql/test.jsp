<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script type="text/javascript" src="/resources/js-graph-it_1.1/js-graph-it.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/js-graph-it_1.1/js-graph-it.css">
    <link rel="stylesheet" type="text/css" href="/resources/js-graph-it_1.1/sf-homepage/sf-homepage.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>


<style>
   .block { position: absolute; }
</style>
</head>
 <body onload="initPageObjects();">
    <div class="canvas" id="mainCanvas"
      style="width: 350px; height: 250px; border: 1px solid black;">
      <h1 class="block" id="h1_block"
        style="left: 10px; top: 10px;">
          h1 block
      </h1>
      <h2 class="block" id="h2_block"
        style="left: 200px; top: 100px;">
        h2 block
      </h2>
      <div class="connector h1_block h2_block">
      	<img class="connector-end" src="/resources/js-graph-it_1.1/sf-homepage/arrow.gif">
      </div>
    </div>
    

    
<script>
 $(document).ready(function(e){
	 $("#h1_block").draggable();
 });
	
</script>
   
  </body>
</html>