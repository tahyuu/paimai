if (top != self) {
	top.location = self.location
}
var timestamp;
var uniqueid;

function gettimestamp() {
	return Math.round(new Date().getTime()).toString()
}
function getrequestid() {
	return gettimestamp()
}
var gettingimage = false;

function showImgCode() {
	if (!gettingimage) {
		$("#imgcode").attr("src", "");
		gettingimage = true;
		timestamp = gettimestamp();
		var requestid = getrequestid();
		var version = "1.0";
		var checkcode = requestid + timestamp + version;
		var jsondata = {
			version: version,
			timestamp: timestamp,
			requestid: requestid,
			request: {},
			checkcode: hex_md5(checkcode)
		};
		var value = json2string(jsondata);
		e = escape(value);
		var data = '{"method":"getimagecode","cmd":"' + e + '"}';
		$.ajax({
			url: "/webwcf/BidCmd.svc/WebCmd",
			type: "POST",
			contentType: "application/json",
			data: data,
			dataType: "json",
			success: function(data) {
				gettingimage = false;
				var dataJson = $.parseJSON(data);
				if (dataJson.response.responsecode === 0) {
					var pairs = dataJson.response.data.split(',');
					uniqueid = pairs[0];
					uniqueid = pairs[0]
					$("#imgcode").attr("src", pairs[1])
				} else {
					alert(dataJson.response.responsemsg)
				}
			},
			error: function() {
				gettingimage = false
			}
		})
	}
}
jQuery(function($) {
	showImgCode();
	$('#imgcode').click(function() {
		showImgCode()
	});
	$('#imagenumberrefresh').click(function() {
		showImgCode()
	});
	$('#btnlogin').click(function() {
		PostLogin();
		return false
	});
	$('body').keydown(function(e) {
		if (e.keyCode == 13) {
			PostLogin();
			return false
		}
	});
	Test()
});

function Test() {
	ShowDialog("?????", 700, 470);
	funCheckBrowser();
	funFlashChecker();
	if (checkBrowser && checkFlash) {
		$("#testResultText").text("???????");
		$("#testResultText").attr("class", "");
		$("#testResultText").addClass("bg-right");
		$("#testBtnConfirm").show()
	} else {
		$("#testResultText").text("????????");
		$("#testResultText").attr("class", "");
		$("#testResultText").addClass("bg-wrong");
		$("#testBtnConfirm").hide()
	}
}
function clearform() {
	$("#bidnumber").val("");
	$("#bidpassword").val("");
	$("#imagenumber").val("");
	$("#idcard").val("")
}
var bidnumber = '';

function PostLogin() {
	timestamp = gettimestamp();
	var err = '';
	bidnumber = $.trim($("#bidnumber").val());
	var bidpassword = $.trim($("#bidpassword").val());
	var imagenumber = $.trim($("#imagenumber").val());
	var idcard = $.trim($("#idcard").val()).toLowerCase();
	var idtype = $("#hidtype").val();
	if (bidnumber === '') {
		err += '??????\n'
	} else if (!/\d{8}/.test(bidnumber)) {
		err += '???8????\n'
	}
	if (bidpassword === '') {
		err += '?????\n'
	}
	if (imagenumber === '') {
		err += '????????\n'
	}
	if ($("#dtidcard").attr("display") == 'none') {
		if (idcard === '') {
			err += '???' + (idtype == "0" ? "??????" : "?????")
		}
	}
	if (err !== '') {
		alert(err)
	} else {
		bidpassword = hex_md5(bidnumber.toLowerCase() + bidpassword.toLowerCase());
		var version = "1.0";
		var requestid = getrequestid();
		var checkcode = bidpassword + bidnumber + imagenumber + idcard + requestid + uniqueid + version;
		var clientId = $.cookie("clientId" + bidnumber);
		if (clientId == null) clientId = '';
		var clientInfo = detectOS() + ";" + browser + ";" + flashVersion;
		var jsondata = {
			version: version,
			timestamp: timestamp,
			bidnumber: bidnumber,
			requestid: requestid,
			checkcode: hex_md5(checkcode),
			request: {
				info: clientInfo,
				uniqueid: uniqueid,
				bidnumber: bidnumber,
				bidpassword: bidpassword,
				imagenumber: imagenumber,
				idcard: idcard,
				clientId: clientId,
				idtype: idtype
			}
		};
		var value = json2string(jsondata);
		var e = escape(value);
		var data = '{"method":"login","cmd":"' + e + '"}';
		$.ajax({
			url: "/webwcf/BidCmd.svc/WebCmd",
			type: "POST",
			contentType: "application/json",
			data: data,
			dataType: "json",
			success: function(data) {
				var dataJson = $.parseJSON(data);
				if (dataJson.response.responsecode === 0) {
					setcookie(dataJson.response.data);
					clearform();
					$("#dtidcard").hide();
					document.location.href = 'bid.htm';
					if (window.event) window.event.returnValue = false
				} else if (dataJson.response.responsecode === 4021) {
					alert(dataJson.response.responsemsg);
					$("#dtidcard").show();
					$("#imagenumber").val("");
					$("#idcard").val("");
					showImgCode()
				} else if (dataJson.response.responsecode === 2101) {
					alert(dataJson.response.responsemsg);
					$("#imagenumber").val("");
					showImgCode()
				} else {
					showImgCode();
					alert(dataJson.response.responsemsg);
					clearform()
				}
			}
		})
	}
}
function setcookie(logindata) {
	$.cookie('bidnumber', bidnumber);
	$.cookie('username', logindata.name);
	$.cookie('clientId' + bidnumber, logindata.clientid);
	$.cookie('bidcount', logindata.bidcount);
	$.cookie('vdate', logindata.date);
	$.cookie('pwd', logindata.b);
	var traderserverstr = '';
	for (var i = 0; i < logindata.tradeserver.length; i++) {
		traderserverstr += ',' + logindata.tradeserver[i].server + ':' + logindata.tradeserver[i].port
	}
	if (traderserverstr !== '') traderserverstr = traderserverstr.substring(1);
	$.cookie('tradeserver', traderserverstr);
	var webserverstr = '';
	for (var k = 0; k < logindata.webserver.length; k++) {
		webserverstr += ',' + logindata.webserver[k].server + ':' + logindata.webserver[k].port
	}
	if (webserverstr !== '') webserverstr = webserverstr.substring(1);
	$.cookie('webserver', webserverstr)
}
function json2string(obj) {
	var THIS = this;
	switch (typeof(obj)) {
	case 'string':
		return '"' + obj.replace(/(["\\])/g, '\\$1') + '"';
	case 'array':
		return '[' + obj.map(THIS.json2string).join(',') + ']';
	case 'object':
		if (obj instanceof Array) {
			var strArr = [];
			var len = obj.length;
			for (var i = 0; i < len; i++) {
				strArr.push(THIS.json2string(obj[i]))
			}
			return '[' + strArr.join(',') + ']'
		} else if (obj === null) {
			return 'null'
		} else {
			var string = [];
			for (var property in obj) string.push(THIS.json2string(property) + ':' + THIS.json2string(obj[property]));
			return '{' + string.join(',') + '}'
		}
	case 'number':
		return obj;
	case false:
		return obj;
	case 'boolean':
		return obj
	}
}
function ShowDialog(title, width, height) {
	var dialogorder = $("#testdialog").dialog({
		dialogClass: "no-close",
		modal: true,
		title: " " + title + "",
		title_html: false,
		width: width,
		height: height,
		draggable: false,
		closeOnEscape: false,
		buttons: [{
			text: "??",
			"class": "btn btn-success",
			"id": "testBtnConfirm",
			"style": "display:",
			click: function() {
				$(this).dialog("close");
				ShowProtocolDialog("????", 700, 470);
				$("#protocolBtnConfirm").show()
			}
		}]
	})
}
function ShowProtocolDialog(title, width, height) {
	var dialogorder = $("#protocoldialog").dialog({
		dialogClass: "no-close",
		modal: true,
		title: " " + title + "",
		title_html: true,
		width: width,
		height: height,
		draggable: false,
		closeOnEscape: false,
		buttons: [{
			text: "???????",
			"class": "btn btn-success",
			"id": "protocolBtnConfirm",
			"style": "display:",
			click: function() {
				$(this).dialog("close")
			}
		}]
	})
}
function detectOS() {
	try {
		var sUserAgent = navigator.userAgent;
		var isWin = (navigator.platform === "Win32") || (navigator.platform === "Windows");
		var isMac = (navigator.platform === "Mac68K") || (navigator.platform === "MacPPC") || (navigator.platform === "Macintosh") || (navigator.platform === "MacIntel");
		var bIsIpad = sUserAgent.match(/ipad/i) === "ipad";
		var bIsIphoneOs = sUserAgent.match(/iphone os/i) === "iphone os";
		var isUnix = (navigator.platform === "X11") && !isWin && !isMac;
		var isLinux = (String(navigator.platform).indexOf("Linux") > -1);
		var bIsAndroid = sUserAgent.toLowerCase().match(/android/i) === "android";
		var bIsCE = sUserAgent.match(/windows ce/i) === "windows ce";
		var bIsWM = sUserAgent.match(/windows mobile/i) === "windows mobile";
		if (isMac) return "Mac";
		if (isUnix) return "Unix";
		if (isLinux) {
			if (bIsAndroid) return "Android";
			else return "Linux"
		}
		if (bIsCE || bIsWM) {
			return 'wm'
		}
		if (isWin) {
			var isWin2K = sUserAgent.indexOf("Windows NT 5.0") > -1 || sUserAgent.indexOf("Windows 2000") > -1;
			if (isWin2K) return "Win2000";
			var isWinXP = sUserAgent.indexOf("Windows NT 5.1") > -1 || sUserAgent.indexOf("Windows XP") > -1;
			if (isWinXP) return "WinXP";
			var isWin2003 = sUserAgent.indexOf("Windows NT 5.2") > -1 || sUserAgent.indexOf("Windows 2003") > -1;
			if (isWin2003) return "Win2003";
			var isWinVista = sUserAgent.indexOf("Windows NT 6.0") > -1 || sUserAgent.indexOf("Windows Vista") > -1;
			if (isWinVista) return "WinVista";
			var isWin7 = sUserAgent.indexOf("Windows NT 6.1") > -1 || sUserAgent.indexOf("Windows 7") > -1;
			if (isWin7) return "Win7";
			var isWin8 = sUserAgent.indexOf("Windows NT 6.2") > -1 || sUserAgent.indexOf("Windows 8") > -1;
			if (isWin8) return "Win8";
			var isWin81 = sUserAgent.indexOf("Windows NT 6.3") > -1 || sUserAgent.indexOf("Windows 8.1") > -1;
			if (isWin81) return "Win81";
			var isWin10 = sUserAgent.indexOf("Windows NT 10.0") > -1 || sUserAgent.indexOf("Windows 10") > -1;
			if (isWin10) return "Win10"
		}
	} catch (e) {}
	return "other"
}
var checkBrowser = false;
var browser = '';

function funCheckBrowser() {
	var Sys = {};
	var ua = navigator.userAgent.toLowerCase();
	var s;
	var scan;
	(s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1].split(".")[0] : (s = ua.match(/edge\/([\d.]+)/)) ? Sys.edge = s[1].split(".")[0] : (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1].split(".")[0] : (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1].split(".")[0] : (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1].split(".")[0] : (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1].split(".")[0] : 0;
	var comment = "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??Windows???????ie7??????????Mac OS X?????Safari????";
	if (Sys.ie) {
		$("#BrowserTest").text("?????ie??,????" + Sys.ie + "????");
		browser = "ie:" + Sys.ie;
		if (Sys.ie < 6) {
			$("#BrowserTestImg").attr("src", "img/alert.jpg");
			$("#BrowserTest").text("?????ie??,????" + Sys.ie + "?????" + comment);
			$("#iesetup").show();
			$("#firefoxsetup").show();
			$(".download1").show()
		} else {
			checkBrowser = true
		}
	} else if (Sys.edge) {
		$("#BrowserTest").html("?????edge???????");
		checkBrowser = true;
		browser = "edge:"
	} else if ( !! window.ActiveXObject || "ActiveXObject" in window) {
		$("#BrowserTest").text("?????ie??,????11????");
		checkBrowser = true;
		browser = "ie:11"
	} else if (Sys.firefox) {
		$("#BrowserTest").html("?????firefox???????" + comment);
		$("#BrowserTestImg").attr("src", "img/alert.png");
		$("#iesetup").show();
		$("#firefoxsetup").show();
		$(".download1").show();
		browser = "firefox:"
	} else if (Sys.chrome) {
		$("#BrowserTest").html("?????chrome???????" + comment);
		$("#BrowserTestImg").attr("src", "img/alert.png");
		$("#iesetup").show();
		$("#firefoxsetup").show();
		$(".download1").show();
		browser = "chrome:"
	} else if (Sys.opera) {
		$("#BrowserTestImg").attr("src", "img/alert.jpg");
		$("#BrowserTest").html("?????opera???????" + comment);
		$("#iesetup").show();
		$("#firefoxsetup").show();
		$(".download1").show();
		browser = "opera:"
	} else if (Sys.safari) {
		$("#BrowserTest").html("?????safari??????");
		checkBrowser = true;
		browser = "safari:"
	}
	$("#BrowserTestImg").show()
}
var checkFlash = false;
var flashVersion = 0;

function funFlashChecker() {
	var hasFlash = 0;
	if (document.all) {
		try {
			var swf = new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
			if (swf) {
				hasFlash = 1;
				VSwf = swf.GetVariable("$version");
				flashVersion = parseInt(VSwf.split(" ")[1].split(",")[0])
			}
		} catch (e) {}
	} else {
		if (navigator.plugins && navigator.plugins.length > 0) {
			for (var x = 0; x < navigator.plugins.length; x++) {
				if (navigator.plugins[x].name.indexOf("Shockwave Flash") > -1) {
					var swf = navigator.plugins[x];
					if (swf) {
						hasFlash = 1;
						var words = swf.description.split(" ");
						for (var i = 0; i < words.length; ++i) {
							if (isNaN(parseInt(words[i]))) continue;
							if (flashVersion < parseInt(words[i])) flashVersion = parseInt(words[i])
						}
					}
				}
			}
		}
	}
	if (hasFlash) {
		if (flashVersion < 11) {
			$("#FlashTest").text("???????????" + flashVersion + "?flash??,???11?????");
			$("#FlashTestImg").attr("src", "img/alert.jpg");
			$("#flashsetup").show()
		} else {
			$("#FlashTest").text("???????????" + flashVersion + "?flash??");
			checkFlash = true
		}
	} else {
		$("#FlashTest").text("????????flash??,????flash??");
		$("#FlashTestImg").attr("src", "img/alert.jpg");
		$("#flashsetup").show()
	}
	$("#FlashTestImg").show()
}
