(function (global, $) {

	var wula = global.wula = {};
	wula.init = function (opts) {
		opts       = $.extend({
			dashboard     : '/zine/home/abc',
			menuUrl       : '/zine/home/conf',
			appSidebarFull: true
		}, opts || {});
		var appVue = new Vue({
			el     : '#wula-app',
			data   : {
				dashboard: opts.dashboard,
				menuUrl  : opts.menuUrl,
				appSidebarFull: opts.appSidebarFull,

				menus    : [],
				subMenus : [],
				subUrl   : '',

				parentUrl : '',
				parentName: '',

			},
			created(){
				var that = this;
				//加载菜单
				$.getJSON(this.menuUrl, function (data) {
					that.menus = data.menus;
					that.setMenuStatus();
				});

				$(window).bind('hashchange', function () {
					that.loadHashPage();
					that.setMenuStatus();
				});
				if (this.getHashUrl() == '/' && this.dashboard) {
					location.href = '#' + this.getHashUrl(this.dashboard);
				} else {
					this.loadHashPage();
				}
			},
			methods: {
				showUrl: function (url) {
					if (url == "#" || url == '') {
						return "javascript:void(0);"
					} else {
						return url;
					}
				},

				hasChild: function (objChild) {

					return typeof objChild == 'object' && objChild.length > 0;
				},

				getHashUrl: function (url) {
					var hashUrl = typeof url == 'undefined' ? location.hash : url;
					hashUrl     = hashUrl.replace(/#/g, '');
					if (hashUrl.indexOf("/") !== 0) {
						hashUrl = "/" + hashUrl;
					}
					return hashUrl;
				},

				loadHashPage: function () {
					var hashUrl    = this.getHashUrl();
					var loadHandle = null;
					if (hashUrl == "/") {
						return false;
					}
					var that = this;
					$.ajax({
						url       : hashUrl,
						beforeSend: function (xhr) {
							loadHandle = that.$loading({
								target: "#wula-body",
								text  : 'Loading...'
							})
						},
						success   : function (html) {
							$("#wula-body").html(html);
						},
						complete  : function () {
							loadHandle.close();
						},
						error     : function (jqXHR, error) {
							$("#wula-body").html(jqXHR.responseText);
						}

					});
				},

				setMenuStatus: function () {
					if (this.getHashUrl() == "/") {
						return false;
					}
					this.subMenus = [];
					return this.findMenu();
				},

				findMenu: function (menus, level) {
					//递归第一层
					if (typeof menus == 'undefined') {
						menus = this.menus;
					}
					if (typeof level == 'undefined') {
						level = 1;
					}
					var that = this;

					//下面使用each进行遍历
					for (var i = 0; i < menus.length; i++) {

						//如果匹配，返回
						if (this.getHashUrl(menus[i].url) == this.getHashUrl()) {
							//如果当前url为2级导航，计算当前二级导航的子菜单并记录当前访问为父菜单
							if (level == 2) {
								that.subMenus   = this.hasChild(menus[i].child) ? menus[i].child : [];
								that.parentUrl  = menus[i].url;
								that.parentName = menus[i].name;
							}
							that.subUrl = menus[i].url;
							return menus[i];
						}

						//如果有子元素递归检查
						if (typeof menus[i].child == 'object' && menus[i].child.length > 0) {
							var rst = that.findMenu(menus[i].child, level + 1);
							if (typeof rst == 'object') {
								if (level == 2) {
									appVue.subMenus = menus[i].child;
									that.parentUrl  = menus[i].url;
									that.parentName = menus[i].name;
								}
								return rst;
							}
						}

					}
				},
			},
		});

		/**
		 * 一级菜单收缩动作
		 */
		$(document).on('click', '.sidebar-nav .sidebar-nav-head', function () {
			if ($(this).parents('div.sidebar-nav').hasClass('sidebar-nav-fold')) {
				$(this).parents('div.sidebar-nav').removeClass('sidebar-nav-fold');
			} else {
				$(this).parents('div.sidebar-nav').addClass('sidebar-nav-fold');
			}
		});

		/**
		 * 二级菜单内收缩效果
		 */
		$(document).on('click', '.nav-tree-link', function () {
			if ($(this).parent('li').hasClass('nav-showchild')) {
				$(this).parent('li').removeClass('nav-showchild');
			} else {
				$(this).parent('li').addClass('nav-showchild');
			}
		});

		/**
		 * 二级菜单侧边栏打开关闭动作
		 */
		$(document).on('click', '.product-navbar-collapse-icon', function (e) {
			console.log(e);
			if ($(this).parents('div.app-product').hasClass('app-product-navbar-full')) {
				$(this).parents('div.app-product').removeClass('app-product-navbar-full').addClass('app-product-navbar-mini')
			} else {
				$(this).parents('div.app-product').removeClass('app-product-navbar-mini').addClass('app-product-navbar-full')
			}
		});

		return appVue;
	};

})(window, jQuery);