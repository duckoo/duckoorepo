<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "google-signin-client_id"content = "271929324186-nb92pvj0v2cdv4cr7chvt84nvu6q2t4o.apps.googleusercontent.com">
<title>Insert title here</title>
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
<body>

<div class="mainTitle">
	<p>DUCKOO</p>
</div>

<div style="display:none">
	<form id="garaForm" method="get" action="/main/index">
	</form>
</div>



<button id="my-signin2"></button>

</body>
</html>