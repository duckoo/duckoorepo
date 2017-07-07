<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Random" %>
<% Random random = new Random(); 
    int token= random.nextInt();
%> 	
<link rel="stylesheet" href="/resources/duckoo/css/mainNavi.css?<%=token%>">
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
<header class="mainHeader">    
<div class="row">

   		<div class="logo">
	         <a href="#">Lhander</a>
	      </div>

	   	<nav id="main-nav-wrap">
				<ul class="main-navigation">
					<li class="current"><a class="smoothscroll" href="#intro" title="">Home</a></li>
					<li><a class="smoothscroll" href="/sql/testTaebong" title="">ERD page</a></li>
					<li><a class="smoothscroll" href="#features" title="">NONE</a></li>
					<li><a class="smoothscroll" href="/board/list" title="">Q&A</a></li>
					<li><a class="smoothscroll" href="/board/faq" title="">FAQ</a></li>
					<c:set var="username" value='<%=cookieList.get("username") %>'></c:set>
					<c:choose>
						<c:when test="${username == null}">
							<li class="highlight with-sep"><a id="customBtn" class="g-signin2"  data-onsuccess="onSignIn">LOGIN</a></li>
						</c:when>
						<c:otherwise>
							<li class="highlight with-sep"><a href="#"><%=cookieList.get("username") %> 님</a></li>
							<li><a class="smoothscroll" href="#logout" title="">LOGOUT</a></li>		
						</c:otherwise>
					</c:choose>					
										
				</ul>
			</nav>

			<a class="menu-toggle" href="#"><span>Menu</span></a>
   		
   	</div>
 </header> 	