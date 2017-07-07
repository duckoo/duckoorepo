
	$(window).on("load",function() {
		   
	      // will first fade out the loading animation 
	    	$("#loader").fadeOut("slow", function(){

	        // will fade out the whole DIV that covers the website.
	        $("#preloader").delay(300).fadeOut("slow");
	        (function onLoad() {
	    	    gapi.load('auth2', function() {
	    	    gapi.auth2.init();
	    	    console.log("onload");
	    	    });
	       })();
	        var checkText = $(".abcRioButtonContentWrapper").children(".abcRioButtonContents").children().eq(1).css("display");
	        //if($("#connectedghy8jjlg218g").css("display")=="block"){
	        	(function customBtnClick(){
	        		var $abcRio = $(".abcRioButtonContentWrapper");
	        		$abcRio.children(".abcRioButtonContents");
	        		console.log("abcrio:",$abcRio.children(".abcRioButtonContents").children().eq(1).css("display"));
	        		//$(".abcRioButtonContentWrapper").trigger("click");
	        	})();
	       // }
	        
	      });       

	 });	

	
   $(".smoothscroll").on("click",function(e){
	  e.stopPropagation();
	  e.preventDefault();
	  
	  $(".main-navigation li").removeClass();
	  
	  $(this).parent().addClass("current");
	  
   });
   
   function onSignIn() {
	   	  
	   	  const googleUser = gapi.auth2.getAuthInstance().currentUser.get();
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		  document.cookie="G_AUTHUSER_H=0; expires=Thu, 18 Dec 2013 12:00:00 UTC";
		  document.cookie="G_AUTHUSER_H=0; path=/";
		  document.cookie="userid="+profile.getEmail()+"; path=/";
		  document.cookie="username="+profile.getName()+"; path=/";
	   
		  cookieMake();
		}
   
   function cookieMake(){
	   	  var refreshMain = document.getElementById("garaForm");
		  console.log("refresh");
		  refreshMain.submit();	  
   }
   
	
//navigation moves
   function signOut() {
	   const googleUser = gapi.auth2.getAuthInstance().currentUser.get();
	   var profile = googleUser.getBasicProfile();
	    var auth2 = gapi.auth2.getAuthInstance();
	    console.log("auth2:",auth2);
	    auth2.signOut().then(function () {
	      location.href="https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/main/index"
	      console.log('User signed out.');
	    });
   };

   
   
	$(".smoothscroll").on("click",function(e){
		e.stopPropagation();
		e.preventDefault();
		var href=$(this).attr("href");
		alert(href);
		switch(href){
			case  "/sql/testTaebong" : alert("sqlTaebong"); window.location.href=$(this).attr("href");
			break;
			case  "#logout" : signOut();
							  document.cookie="username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
							  document.cookie="userid=; expires=-Thu, 01 Jan 1970 00:00:00 UTC; path=/";
							  document.cookie="G_AUTHUSER_H=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
							  document.cookie="G_AUTHUSER_H=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/main";
							  console.log("쿠키삭제?");
							  window.location.href="/main/index";
			break;				  
		}
		
		
		
		
	});
	
	




   