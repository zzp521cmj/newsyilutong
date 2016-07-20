var BMapLib = window.BMapLib = BMapLib || {};
(function() {
	var d = 0;
	var pts=[];
	var i = BMapLib.SearchInRectangle = function(m, n, l) {
		if (!m) {
			return
		}
		this._map = m;
		this._searchWords = n;
		this._opts = {
			map : m,
			followText : "",
			strokeWeight : 2,
			strokeColor : "#111",
			style : "solid",
			fillColor : "#ccc",
			opacity : 0.4,
			cursor : "crosshair",
			autoClose : true,
			autoViewport : false,
			alwaysShowOverlay : true,
			panel : "",
			selectFirstResult : "false",
			_zoomType : d
		};
		this._setOptions(l);
		this._opts.strokeWeight = this._opts.strokeWeight <= 0 ? 1
				: this._opts.strokeWeight;
		this._opts.opacity = this._opts.opacity < 0 ? 0
				: this._opts.opacity > 1 ? 1 : this._opts.opacity;
		this._isOpen = false;
		this._fDiv = null;
		this._followTitle = null;
		this._overlay = null;
		this.local = this.localSearch(this)
	};
	i.prototype._setOptions = function(l) {
		if (!l) {
			return
		}
		if (l.renderOptions) {
			for ( var m in l.renderOptions) {
				if (typeof (l.renderOptions[m]) != "undefined") {
					this._opts[m] = l.renderOptions[m]
				}
			}
		}
		if (l.onSearchComplete) {
			this._opts.onSearchComplete = l.onSearchComplete
		}
	};
	i.prototype.setStrokeColor = function(l) {
		if (typeof l == "string") {
			this._opts.strokeColor = l;
			this._updateStyle()
		}
	};
	i.prototype.setLineStroke = function(l) {
		if (typeof l == "number" && Math.round(l) > 0) {
			this._opts.strokeWeight = Math.round(l);
			this._updateStyle()
		}
	};
	i.prototype.setLineStyle = function(l) {
		if (l == "solid" || l == "dashed") {
			this._opts.style = l;
			this._updateStyle()
		}
	};
	i.prototype.setOpacity = function(l) {
		if (typeof l == "number" && l >= 0 && l <= 1) {
			this._opts.opacity = l;
			this._updateStyle()
		}
	};
	i.prototype.setFillColor = function(l) {
		this._opts.fillColor = l;
		this._updateStyle()
	};
	i.prototype.setCursor = function(l) {
		this._opts.cursor = l;
		e.setCursor(this._opts.cursor)
	};
	i.prototype._updateStyle = function() {
		if (this._fDiv) {
			this._fDiv.style.border = [ this._opts.strokeWeight, "px ",
					this._opts.style, " ", this._opts.color ].join("");
			var l = this._fDiv.style, m = this._opts.opacity;
			l.opacity = m;
			l.MozOpacity = m;
			l.KhtmlOpacity = m;
			l.filter = "alpha(opacity=" + (m * 100) + ")"
		}
	};
	i.prototype.getCursor = function() {
		return this._opts.cursor
	};
	
	i.prototype._bind = function() {
		this.setCursor(this._opts.cursor);
		var m = this;
		c(this._map.getContainer(), "mousemove", function(p) {
			if (!m._isOpen) {
				return
			}
			if (!m._followTitle) {
				return
			}
			p = window.event || p;
			var n = p.target || p.srcElement;
			if (n != e.getDom(m._map)) {
				m._followTitle.hide();
				return
			}
			if (!m._mapMoving) {
				m._followTitle.show()
			}
			var o = e.getDrawPoint(p, true);
			m._followTitle.setPosition(o)
		});
		if (this._opts.followText) {
			var l = this._followTitle = new BMap.Label(this._opts.followText, {
				offset : new BMap.Size(14, 16),
				enableMassClear : false
			});
			this._followTitle.setStyles({
				color : "#333",
				borderColor : "#ff0103"
			})
		}
	};
	i.prototype.open = function() {
		if (this._isOpen == true) {
			return true
		}
		if (!!BMapLib._toolInUse) {
			return
		}
		BMapLib._toolInUse = true;
		this._isOpen = true;
		if (!this.binded) {
			this._bind();
			this.binded = true
		}
		if (this._followTitle) {
			this._map.addOverlay(this._followTitle);
			this._followTitle.hide()
		}
		var n = this;
		var o = this._map;
		var p = 0;
		if (/msie (\d+\.\d)/i.test(navigator.userAgent)) {
			p = document.documentMode || +RegExp["\x241"]
		}
		var r = 0;
		var m = function(s) {
			s = window.event || s;
			if (s.button != 0 && !p || p && s.button != 1) {
				return
			}
			if (!!p && e.getDom(o).setCapture) {
				e.getDom(o).setCapture()
			}
			if (!n._isOpen) {
				return
			}
			r = 0;
			n._bind.isZooming = true;
			c(document, "mousemove", l);
			c(document, "mouseup", q);
			n._bind.mx = s.layerX || s.offsetX || 0;
			n._bind.my = s.layerY || s.offsetY || 0;
			n._bind.ix = s.pageX || s.clientX || 0;
			n._bind.iy = s.pageY || s.clientY || 0;
			a(e.getDom(o), "beforeBegin", n._generateHTML());
			n._fDiv = e.getDom(o).previousSibling;
			n._fDiv.style.width = "0";
			n._fDiv.style.height = "0";
			n._fDiv.style.left = n._bind.mx + "px";
			n._fDiv.style.top = n._bind.my + "px";
			b(s);
			return g(s)
		};
		var l = function(z) {
			if (n._isOpen == true && n._bind.isZooming == true) {
				if (n._overlay) {
					n._map.removeOverlay(n._overlay)
				}
				var z = window.event || z;
				var u = z.pageX || z.clientX || 0;
				var s = z.pageY || z.clientY || 0;
				var w = n._bind.dx = u - n._bind.ix;
				var t = n._bind.dy = s - n._bind.iy;
				var v = Math.abs(w) - n._opts.strokeWeight;
				var y = Math.abs(t) - n._opts.strokeWeight;
				n._fDiv.style.width = (v < 0 ? 0 : v) + "px";
				n._fDiv.style.height = (y < 0 ? 0 : y) + "px";
				r = v;
				var x = [ o.getSize().width, o.getSize().height ];
				if (w >= 0) {
					n._fDiv.style.right = "auto";
					n._fDiv.style.left = n._bind.mx + "px";
					if (n._bind.mx + w >= x[0] - 2 * n._opts.strokeWeight) {
						n._fDiv.style.width = x[0] - n._bind.mx - 2
								* n._opts.strokeWeight + "px";
						n._followTitle && n._followTitle.hide()
					}
				} else {
					n._fDiv.style.left = "auto";
					n._fDiv.style.right = x[0] - n._bind.mx + "px";
					if (n._bind.mx + w <= 2 * n._opts.strokeWeight) {
						n._fDiv.style.width = n._bind.mx - 2
								* n._opts.strokeWeight + "px";
						n._followTitle && n._followTitle.hide()
					}
				}
				if (t >= 0) {
					n._fDiv.style.bottom = "auto";
					n._fDiv.style.top = n._bind.my + "px";
					if (n._bind.my + t >= x[1] - 2 * n._opts.strokeWeight) {
						n._fDiv.style.height = x[1] - n._bind.my - 2
								* n._opts.strokeWeight + "px";
						n._followTitle && n._followTitle.hide()
					}
				} else {
					n._fDiv.style.top = "auto";
					n._fDiv.style.bottom = x[1] - n._bind.my + "px";
					if (n._bind.my + t <= 2 * n._opts.strokeWeight) {
						n._fDiv.style.height = n._bind.my - 2
								* n._opts.strokeWeight + "px";
						n._followTitle && n._followTitle.hide()
					}
				}
				b(z);
				return g(z)
			}
		};
		i.prototype.getpoint = function() {
			return pts;
		};
		
		var q = function(A) {
			if (!r) {
				n._fDiv.parentNode.removeChild(n._fDiv)
			}
			if (n._isOpen == true) {
				h(document, "mousemove", l);
				h(document, "mouseup", q);
				if (!r) {
					return
				}
				if (!!p && e.getDom(o).releaseCapture) {
					e.getDom(o).releaseCapture()
				}
				var v = parseInt(n._fDiv.style.left)
						+ parseInt(n._fDiv.style.width) / 2;
				var u = parseInt(n._fDiv.style.top)
						+ parseInt(n._fDiv.style.height) / 2;
				var z = [ o.getSize().width, o.getSize().height ];
				if (isNaN(v)) {
					v = z[0] - parseInt(n._fDiv.style.right)
							- parseInt(n._fDiv.style.width) / 2
				}
				if (isNaN(u)) {
					u = z[1] - parseInt(n._fDiv.style.bottom)
							- parseInt(n._fDiv.style.height) / 2
				}
				var C = Math.min(z[0] / Math.abs(n._bind.dx), z[1]
						/ Math.abs(n._bind.dy));
				C = Math.floor(C);
				var x = new BMap.Pixel(v - parseInt(n._fDiv.style.width) / 2, u
						+ parseInt(n._fDiv.style.height) / 2);
				var w = new BMap.Pixel(v + parseInt(n._fDiv.style.width) / 2, u
						- parseInt(n._fDiv.style.height) / 2);
				var F = o.pixelToPoint(x);
				var E = o.pixelToPoint(w);
				var y = new BMap.Bounds(F, E);
				delete n._bind.dx;
				delete n._bind.dy;
				delete n._bind.ix;
				delete n._bind.iy;
				if (!isNaN(C)) {
					if (n._opts._zoomType == d) {
						targetZoomLv = Math.round(o.getZoom()
								+ (Math.log(C) / Math.log(2)));
						if (targetZoomLv < o.getZoom()) {
							targetZoomLv = o.getZoom()
						}
					}
				} else {
					targetZoomLv = o.getZoom()
							+ (n._opts._zoomType == d ? 1 : -1)
				}
				var s = o.pixelToPoint({
					x : v,
					y : u
				}, o.getZoom());
				if (n._opts.autoViewport) {
					o.centerAndZoom(s, targetZoomLv)
				}
				var I = e.getDrawPoint(A);
				if (n._followTitle) {
					n._followTitle.setPosition(I);
					n._followTitle.show()
				}
				n._bind.isZooming = false;
				n._fDiv.parentNode.removeChild(n._fDiv);
				n._fDiv = null
			}
			var t = y.getSouthWest(), B = y.getNorthEast(), G = new BMap.Point(
					B.lng, t.lat), H = new BMap.Point(t.lng, B.lat), D = new BMap.Polygon(
					[ t, H, B, G ]);
			pts=new BMap.Bounds(t,B);
			D.setStrokeWeight(n._opts.strokeWeight);
			D.setStrokeOpacity(n._opts.opacity);
			D.setFillOpacity(n._opts.opacity);
			D.setStrokeColor(n._opts.strokeColor);
			D.setStrokeStyle(n._opts.style);
			D.setFillColor(n._opts.fillColor);
			n._overlay = D;
			o.addOverlay(D);
			n.local.searchInBounds(n._searchWords, y);
			if (!n._opts.alwaysShowOverlay) {
				new f({
					duration : 240,
					fps : 20,
					delay : 500,
					render : function(K) {
						var J = 0.3 * (1 - K);
						D.setStrokeOpacity(J)
					},
					finish : function() {
						o.removeOverlay(n._overlay);
						n._overlay = null;
					}
				});
			}
			if (n._opts.autoClose) {
				setTimeout(function() {
					if (n._isOpen == true) {
						n.close()
					}
				}, 70)
			}
			b(A);
			return g(A)
		};
		e.show(this._map);
		this.setCursor(this._opts.cursor);
		if (!this._isBeginDrawBinded) {
			c(e.getDom(this._map), "mousedown", m);
			this._isBeginDrawBinded = true
		}
		return true
	};
	i.prototype.close = function() {
		if (!this._isOpen) {
			return
		}
		this._isOpen = false;
		BMapLib._toolInUse = false;
		this._followTitle && this._followTitle.hide();
		e.hide()
	};
	i.prototype.setKeyword = function(l) {
		this._searchWords = l
	};
	i.prototype._generateHTML = function() {
		return [ "<div style='position:absolute;z-index:300;border:",
				this._opts.strokeWeight, "px ", this._opts.style, " ",
				this._opts.strokeColor, "; opacity:", this._opts.opacity,
				"; background: ", this._opts.fillColor,
				"; filter:alpha(opacity=",
				Math.round(this._opts.opacity * 100),
				"); width:0; height:0; font-size:0'></div>" ].join("")
	};
	i.prototype.localSearch = function(l) {
		return new BMap.LocalSearch(l._map, {
			renderOptions : {
				map : l._opts.map,
				autoViewport : false,
				panel : l._opts.panel,
				selectFirstResult : l._opts.selectFirstResult
			},
			onSearchComplete : function(m) {
				if (l._opts.onSearchComplete) {
					l._opts.onSearchComplete(m)
				}
			}
		})
	};
	function a(o, l, n) {
		var m, p;
		if (o.insertAdjacentHTML) {
			o.insertAdjacentHTML(l, n)
		} else {
			m = o.ownerDocument.createRange();
			l = l.toUpperCase();
			if (l == "AFTERBEGIN" || l == "BEFOREEND") {
				m.selectNodeContents(o);
				m.collapse(l == "AFTERBEGIN")
			} else {
				p = l == "BEFOREBEGIN";
				m[p ? "setStartBefore" : "setEndAfter"](o);
				m.collapse(p)
			}
			m.insertNode(m.createContextualFragment(n))
		}
		return o
	}
	function j(m, l) {
		a(m, "beforeEnd", l);
		return m.lastChild
	}
	function b(l) {
		var l = window.event || l;
		l.stopPropagation ? l.stopPropagation() : l.cancelBubble = true
	}
	function g(l) {
		var l = window.event || l;
		l.preventDefault ? l.preventDefault() : l.returnValue = false;
		return false
	}
	function c(l, m, n) {
		if (!l) {
			return
		}
		m = m.replace(/^on/i, "").toLowerCase();
		if (l.addEventListener) {
			l.addEventListener(m, n, false)
		} else {
			if (l.attachEvent) {
				l.attachEvent("on" + m, n)
			}
		}
	}
	function h(l, m, n) {
		if (!l) {
			return
		}
		m = m.replace(/^on/i, "").toLowerCase();
		if (l.removeEventListener) {
			l.removeEventListener(m, n, false)
		} else {
			if (l.detachEvent) {
				l.detachEvent("on" + m, n)
			}
		}
	}
	var e = {
		_map : null,
		_html : "<div style='background:transparent url(http://api.map.baidu.com/images/blank.gif);position:absolute;left:0;top:0;width:100%;height:100%;z-index:1000' unselectable='on'></div>",
		_maskElement : null,
		_cursor : "default",
		_inUse : false,
		show : function(l) {
			if (!this._map) {
				this._map = l
			}
			this._inUse = true;
			if (!this._maskElement) {
				this._createMask(l)
			}
			this._maskElement.style.display = "block"
		},
		_createMask : function(n) {
			this._map = n;
			if (!this._map) {
				return
			}
			var m = this._maskElement = j(this._map.getContainer(), this._html);
			var l = function(o) {
				b(o);
				return g(o)
			};
			c(m, "mouseup", function(o) {
				if (o.button == 2) {
					l(o)
				}
			});
			c(m, "contextmenu", l);
			m.style.display = "none"
		},
		getDrawPoint : function(o, q) {
			o = window.event || o;
			var l = o.layerX || o.offsetX || 0;
			var p = o.layerY || o.offsetY || 0;
			var m = o.target || o.srcElement;
			if (m != e.getDom(this._map) && q == true) {
				while (m && m != this._map.getContainer()) {
					if (!(m.clientWidth == 0 && m.clientHeight == 0
							&& m.offsetParent && m.offsetParent.nodeName
							.toLowerCase() == "td")) {
						l += m.offsetLeft;
						p += m.offsetTop
					}
					m = m.offsetParent
				}
			}
			if (m != e.getDom(this._map) && m != this._map.getContainer()) {
				return
			}
			if (typeof l === "undefined" || typeof p === "undefined") {
				return
			}
			if (isNaN(l) || isNaN(p)) {
				return
			}
			return this._map.pixelToPoint(new BMap.Pixel(l, p))
		},
		hide : function() {
			if (!this._map) {
				return
			}
			this._inUse = false;
			if (this._maskElement) {
				this._maskElement.style.display = "none"
			}
		},
		getDom : function(l) {
			if (!this._maskElement) {
				this._createMask(l)
			}
			return this._maskElement
		},
		setCursor : function(l) {
			this._cursor = l || "default";
			if (this._maskElement) {
				this._maskElement.style.cursor = this._cursor
			}
		}
	};
	function f(o) {
		var l = {
			duration : 1000,
			fps : 30,
			delay : 0,
			transition : k.linear,
			onStop : function() {
			}
		};
		if (o) {
			for ( var m in o) {
				l[m] = o[m]
			}
		}
		this._opts = l;
		if (l.delay) {
			var n = this;
			setTimeout(function() {
				n._beginTime = new Date().getTime();
				n._endTime = n._beginTime + n._opts.duration;
				n._launch()
			}, l.delay)
		} else {
			this._beginTime = new Date().getTime();
			this._endTime = this._beginTime + this._opts.duration;
			this._launch()
		}
	}
	f.prototype._launch = function() {
		var m = this;
		var l = new Date().getTime();
		if (l >= m._endTime) {
			if (typeof m._opts.render == "function") {
				m._opts.render(m._opts.transition(1))
			}
			if (typeof m._opts.finish == "function") {
				m._opts.finish()
			}
			return
		}
		m.schedule = m._opts.transition((l - m._beginTime) / m._opts.duration);
		if (typeof m._opts.render == "function") {
			m._opts.render(m.schedule)
		}
		if (!m.terminative) {
			m._timer = setTimeout(function() {
				m._launch()
			}, 1000 / m._opts.fps)
		}
	};
	var k = {
		linear : function(l) {
			return l
		},
		reverse : function(l) {
			return 1 - l
		},
		easeInQuad : function(l) {
			return l * l
		},
		easeInCubic : function(l) {
			return Math.pow(l, 3)
		},
		easeOutQuad : function(l) {
			return -(l * (l - 2))
		},
		easeOutCubic : function(l) {
			return Math.pow((l - 1), 3) + 1
		},
		easeInOutQuad : function(l) {
			if (l < 0.5) {
				return l * l * 2
			} else {
				return -2 * (l - 2) * l - 1
			}
			return
		},
		easeInOutCubic : function(l) {
			if (l < 0.5) {
				return Math.pow(l, 3) * 4
			} else {
				return Math.pow(l - 1, 3) * 4 + 1
			}
		},
		easeInOutSine : function(l) {
			return (1 - Math.cos(Math.PI * l)) / 2
		}
	}
})();