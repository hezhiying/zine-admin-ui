//扩展jQuery字符串方法123123
$.extend(String.prototype,{
	toJson:function() {
		var str = this;
		//去掉第一个?号
		if(this[0] == "?"){
			var str = this.substr(1);
		}
		var search,args ={};
		search = str.split("&");
		for( var i = 0; i < search.length; i++){
			var key = search[i].split("=")[0] || '';
			var value = search[i].split("=")[1] || '';
			if(key){
				args[key] = value;
			}
		}
		return args;
	},
	parseArgs : function() {
		var re = /\$(.+?)\$/g, match, args = [];
		while (match = re.exec(this)) {
			args.push(match[1]);
		}
		return args;
	},
	//是否整型
	isInteger : function() {
		return (new RegExp(/^\d+$/).test(this));
	},

	isNumber : function(value, element) {
		return (new RegExp(/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/).test(this));
	},

	//第一个字符是不是pattern
	startsWith : function(pattern) {
		return this.indexOf(pattern) === 0;
	},
	//最后一个字符是不是pattern
	endsWith : function(pattern) {
		var d = this.length - pattern.length;
		return d >= 0 && this.lastIndexOf(pattern) === d;
	},
	//手机号码验证
	isMobile:function () {
		return  this.length == 11 && /^(((1[3|4|5|7|8][0-9]{1}))+\d{8})$/.test(this);
	},
	//电话或者手机号验证
	isTel:function () {
		var tel = /^(\d{3,4}-?)?\d{7,9}$/g;
		return tel.test(this) || this.isMobile();
	},
	//中文字符验证
	isChinese:function () {
		return /^[\u0391-\uFFE5]+$/.test(this);

	},
	//英文字符验证
	isEnglish:function () {
		return  /^[A-Za-z]+$/.test(this);

	}
});