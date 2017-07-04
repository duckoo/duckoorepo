<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "google-signin-client_id"content = "271929324186-nb92pvj0v2cdv4cr7chvt84nvu6q2t4o.apps.googleusercontent.com">
<title>Web ERD Main</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
<style>
.mainBody{
    background-image: url(/resources/images/mainIMG.gif);
}
.mainTitle{
    font-size:50px;
    color: red;
    float:left;
    position:relative;
    width:100%;
}
.loginBtnDIV{
	float:left;
	position:relative;
}
#my-signin2{
	background-color: transparent;
    box-shadow: 0 0 0 2px #a291fb inset!important;
    color: #a291fb;

}


</style>

</head>

<body class="mainBody">

<div class="mainTitle">
	<p>DUCKOO</p>
</div>

<div style="display:none">
	<form id="garaForm" method="post" action="/main/index1">
	</form>
</div>



<div class="g-signin2" data-onsuccess="onSignIn"></div>
<a href="#" onclick="signOut();">Sign out</a>
<script>
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  var cookie = document.cookie;
	  cookie="userid="+profile.getEmail();
	  cookie="username="+profile.getName();
	
	  
	  var form = document.getElementById("garaForm");
	  form.submit();
	}
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
  
</script>
</body>

</html>