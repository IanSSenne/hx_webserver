package hx_webserver;

import haxe.io.Path;

class HTTPUtils {
	public static function codeToMessage(code:Int):String {
		var message:String = "";
		switch (code) {
			case 100:
				message = "Continue";
			case 101:
				message = "Switching Protocols";
			case 102:
				message = "Processing";
			case 103:
				message = "Early Hints";
			case 200:
				message = "OK";
			case 201:
				message = "Created";
			case 202:
				message = "Accepted";
			case 203:
				message = "Non-authoritative Information";
			case 204:
				message = "No Content";
			case 205:
				message = "Reset Content";
			case 206:
				message = "Partial Content";
			case 207:
				message = "Multi-Status";
			case 208:
				message = "Already Reported";
			case 226:
				message = "IM Used";
			case 300:
				message = "Multiple Choices";
			case 301:
				message = "Moved Permanently";
			case 302:
				message = "Found";
			case 303:
				message = "See Other";
			case 304:
				message = "Not Modified";
			case 305:
				message = "Use Proxy";
			case 306:
				message = "unused";
			case 307:
				message = "Temporary Redirect";
			case 308:
				message = "Permanent Redirect";
			case 400:
				message = "Bad Request";
			case 401:
				message = "Unauthorized";
			case 402:
				message = "Payment Required";
			case 403:
				message = "Forbidden";
			case 404:
				message = "Not Found";
			case 405:
				message = "Method Not Allowed";
			case 406:
				message = "Not Acceptable";
			case 407:
				message = "Proxy Authentication Required";
			case 408:
				message = "Request Timeout";
			case 409:
				message = "Conflict";
			case 410:
				message = "Gone";
			case 411:
				message = "Length Required";
			case 412:
				message = "Precondition Failed";
			case 413:
				message = "Payload Too Large";
			case 414:
				message = "URI Too Long";
			case 415:
				message = "Unsupported Media Type";
			case 416:
				message = "Range Not Satisfiable";
			case 417:
				message = "Expectation Failed";
			case 418:
				message = "I'm a teapot";
			case 421:
				message = "Misdirected Request";
			case 422:
				message = "Unprocessable Content";
			case 423:
				message = "Locked";
			case 424:
				message = "Failed Dependency";
			case 425:
				message = "Too Early";
			case 426:
				message = "Upgrade Required";
			case 428:
				message = "Precondition Required";
			case 429:
				message = "Too Many Requests";
			case 431:
				message = "Request Header Fields Too Large";
			case 451:
				message = "Unavailable For Legal Reasons";
			case 500:
				message = "Internal Server Error";
			case 501:
				message = "Not Implemented";
			case 502:
				message = "Bad Gateway";
			case 503:
				message = "Service Unavailable";
			case 504:
				message = "Gateway Timeout";
			case 505:
				message = "HTTP Version Not Supported";
			case 506:
				message = "Variant Also Negotiates";
			case 507:
				message = "Insufficient Storage";
			case 508:
				message = "Loop Detected";
			case 510:
				message = "Not Extended";
			case 511:
				message = "Network Authentication Required";
		}
		return message;
	}

	// pulled from https://github.com/jshttp/mime-db
	public static function getMimeType(file:String, defaultMimeType:String = "application/octet-stream") {
		var ext:String = Path.extension(file);
		var mime = HTTPMimeDb.mimeTypes.get(ext);
		if (mime == null) {
			return defaultMimeType;
		}
		return mime;
	}
}
