// Based on Jared Meadows UserScript from https://userstyles.org/styles/172874
// Raw JS at https://userstyles.org/styles/userjs/172874/google-voice-dark-theme.user.js
(function() {var css = [
        "/*--------------------------------------------------------------",
        ">>>    CUSTOM",
        "--------------------------------------------------------------*/",
        "",
        "/* Scrollbar width */",
        "::-webkit-scrollbar {",
        "   width: 7px;",
        "}",
        "/* Scrollbar track */",
        "::-webkit-scrollbar-track {",
        "   border-radius: 10px;",
        "   background: #CCCCCC;",
        "}",
        "/* Scrollbar handle */",
        "::-webkit-scrollbar-thumb {",
        "   background: #10b2a2;",
        "   border-radius: 10px;",
        "}",
        "/* Scrollbar handle on hover */",
        "::-webkit-scrollbar-thumb:hover {",
        "   background: #10e7d0;",
        "}",
].join("\n");
if (typeof GM_addStyle != "undefined") {
	GM_addStyle(css);
} else if (typeof PRO_addStyle != "undefined") {
	PRO_addStyle(css);
} else if (typeof addStyle != "undefined") {
	addStyle(css);
} else {
	var node = document.createElement("style");
	node.type = "text/css";
	node.appendChild(document.createTextNode(css));
	var heads = document.getElementsByTagName("head");
	if (heads.length > 0) {
		heads[0].appendChild(node);
	} else {
		// no head yet, stick it whereever
		document.documentElement.appendChild(node);
	}
}
})();
