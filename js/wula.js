require("./components/fun.js");
require("jquery");

function loadpage() {
	var hashUrl = location.hash.replace(/#/g, '');
	if (hashUrl) {
		$.ajax({
			url       : '/' + hashUrl,
			beforeSend: function (xhr) {
				if ($.loadStatus === true) {
					return false;
				}
				$.loadStatus = true;
				console.log(['ajaxurl',xhr]);

			},
			success   : function (html) {
				$("#wula-body").html(html);
			},
			complete  : function () {
				$.loadStatus = false;
			},
			error     : function (jqXHR,error) {
				console.log(jqXHR);
				$("#wula-body").html('<div class=console-container><div class="console-title"><div class=pull-left><h5 class=console-title-icon><i class="fa fa-exclamation-triangle text-danger"></i> url: '+hashUrl+'</h5></div><div class=pull-right><a href="javascript:history.back();" class="btn btn-default">返回</a></div></div><div class="row"><div class="col-sm-12">'+jqXHR.responseText+'</div></div></div>');

			}

		});
	}
}

$(function () {
	loadpage();
	$(window).bind('hashchange', function () {
		loadpage();

	});
});