var $sideBar = $("#sideBar");
	var $console = $("#console");
	
	
	
	$sideBar.resizable({
		start: function() {
			memo = $(this).css('transition');
			console.log(memo);
			$(this).css('transition', 'none');
		},
			stop: function() {
			$(this).css('transition', memo);
		}
	});
	$sideBar.draggable({
		start: function() {
			memo = $(this).css('transition');
			console.log(memo);
			$(this).css('transition', 'none');
		},
			stop: function() {
			$(this).css('transition', memo);
		},
		handle:".sideBarHeader"
	});
	function sideBarOpen(){
		document.getElementById("sideBar").style.display="block";
		setTimeout("openSideBarAnimation()",100);
			
	}
	function openSideBarAnimation(){
		document.getElementById("sideBar").style.width = "14%";
	}

	function closeSideBar(){
		document.getElementById("sideBar").style.width = "0px";
		setTimeout("closeSideBarAnimation()",200);	
	}
	function closeSideBarAnimation(){
		document.getElementById("sideBar").style.display="none";
	}

	
	
	$console.resizable({
		start: function() {
			memo = $(this).css('transition');
			console.log(memo);
			$(this).css('transition', 'none');
		},
			stop: function() {
			$(this).css('transition', memo);
		}
	});
	$console.draggable({
		start: function() {
			memo = $(this).css('transition');
			console.log(memo);
			$(this).css('transition', 'none');
		},
			stop: function() {
			$(this).css('transition', memo);
		},
		handle:".consoleHeader"
	});
	function consoleOpen(){
		document.getElementById("console").style.display="block";
		setTimeout("openConsoleAnimation()",100);
			
	}
	function openConsoleAnimation(){
		document.getElementById("console").style.width = "70%";
	}
	function closeConsole(){
		document.getElementById("console").style.width = "0px";
		setTimeout("closeConsoleAnimation()",200);
	}
	function closeConsoleAnimation(){
		document.getElementById("console").style.display="none";
	}
