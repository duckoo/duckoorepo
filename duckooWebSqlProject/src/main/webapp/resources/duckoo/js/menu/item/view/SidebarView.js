var SidebarView=(function(){
	var bodyTemplate=Handlebars.compile($("#__sidebarTemp__").html());
	
	function SidebarView(sidebar){
		 this.sidebar=sidebar;
		 this.id= this.sidebar.id;
		$("body").append(bodyTemplate(sidebar));
		this.resizable();
		this.draggable();
		
	}
	SidebarView.prototype.render=function(){
		
	}
	
	SidebarView.prototype.resizable=function(opt){
	  var $sidebar =$("#"+this.id);
		if(!$sidebar.length)return;
		var opt= opt || 	{
			start: function() {
				memo = $(this).css('transition');
				console.log(memo);
				$(this).css('transition', 'none');
			},
				stop: function() {
				$(this).css('transition', memo);
			}
		};
		
		$sidebar.resizable(opt);
	}
	SidebarView.prototype.draggable=function(opt){
		var $sidebar =$("#"+this.id);
	    if(!$sidebar.length)return;
		  
		var opt = opt || {
			start: function() {
				memo = $(this).css('transition');
				$(this).css('transition', 'none');
			},
				stop: function() {
				$(this).css('transition', memo);
			},
			handle:".sideBarHeader"
		}
		$sidebar.draggable(opt);
	}
	
	
	
	return SidebarView;
})();