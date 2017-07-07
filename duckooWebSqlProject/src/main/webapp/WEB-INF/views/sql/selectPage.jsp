<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%Cookie[] cookies = (Cookie[])session.getAttribute("login");
 	Map<String,String> cookieList = new HashMap<String,String>();
 	if(cookies==null){
 		cookieList.put("username",null);
 	} else{
 		for(int i =0; i<cookies.length; i++){
 				cookieList.put(cookies[i].getName(),cookies[i].getValue());
 		}
 	}
 	pageContext.setAttribute("username",cookieList.get("username"));
 %> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/duckoo/css/selectPage.css">
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
</head>
<body id="selectPageBody">
    <div id="selectPageBox">
        <button class="selecPageBtns" id="newERDBtn">NEW ERD</button>
        <button class="selecPageBtns" id="prevERDBtn">PREV ERD</button>
    </div>
</body>

<script>
	$(document).ready(function(){
		
		$(".selecPageBtns").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			var selectedBtn = $(this).attr("id");
			
			window.location.href="/sql/testTaebong?selectedBtn="+selectedBtn;
		});

		
	});


</script>

</html>