function Mall(t) {
    var e = this,
        i = {
            id: 0,
            latitude: "",
            longitude: "",
            name: "",
            markers: {},
            available_assets: [],
            in_menu_asset_click: !1,
            on_level_asset_click: !1,
            levels: [],
            controller: "",
            image_url: ""
        };
    this.options = $.extend(!0, {}, i, t), this.$html = $('<div class="row" style="border: 1px #ddd solid; position: relative"><div class="col-md-1 js-menu-holder"><ul class="nav nav-pills nav-stacked js-level-list"><li><h2 style="font-size: 2em; font-weight: bolder">' + this.options.name + '</h2></li><li role="presentation" nowrap><a href="javascript:" class="js-create">Create Level</a></li></ul><button class="btn btn-success js-save">Save</button></div><div class="col-md-11 js-level-holder" id="js-mall-level-holder"></div><ul class="js-asset-types list-group-indoor" style="position: absolute; right: 10px; top: 0; list-style-type: none"></ul></div>'), this.$html.find(".js-create").on("click", function() {
        e.create_level()
    }), this.$html.find(".js-save").on("click", function() {
        e.save()
    });
    var n = this.options.levels;
    this.options.levels = [];
    for (var a in n) this.add_level(n[a]);
    this.$html.on("click", "a.js-level", function() {
        var t = $(this).attr("data-floor-number");
        //$('#mall_level_assets_table tbody').empty();
        console.log('level clicked');
        for (var i in e.options.levels) 
        	e.options.levels[i].options.floor_number == t && e.display_level(e.options.levels[i])
    })
}
var Kinetic = {};
if (! function(t) {
        var e = Math.PI / 180;
        Kinetic = {
            version: "5.1.9",
            stages: [],
            idCounter: 0,
            ids: {},
            names: {},
            shapes: {},
            listenClickTap: !1,
            inDblClickWindow: !1,
            enableTrace: !1,
            traceArrMax: 100,
            dblClickWindow: 400,
            pixelRatio: void 0,
            dragDistance: 0,
            angleDeg: !0,
            showWarnings: !0,
            draggable: true, /* trying to implement zoom */
            Filters: {},
            Node: function(t) {
                this._init(t)
            },
            Shape: function(t) {
                this.__init(t)
            },
            Container: function(t) {
                this.__init(t)
            },
            Stage: function(t) {
                this.___init(t)
            },
            BaseLayer: function(t) {
                this.___init(t)
            },
            Layer: function(t) {
                this.____init(t)
            },
            FastLayer: function(t) {
                this.____init(t)
            },
            Group: function(t) {
                this.___init(t)
            },
            isDragging: function() {
                var t = Kinetic.DD;
                return t ? t.isDragging : !1
            },
            isDragReady: function() {
                var t = Kinetic.DD;
                return t ? !!t.node : !1
            },
            _addId: function(t, e) {
                void 0 !== e && (this.ids[e] = t)
            },
            _removeId: function(t) {
                void 0 !== t && delete this.ids[t]
            },
            _addName: function(t, e) {
                if (void 0 !== e)
                    for (var i = e.split(/\W+/g), n = 0; n < i.length; n++) i[n] && (void 0 === this.names[i[n]] && (this.names[i[n]] = []), this.names[i[n]].push(t))
            },
            _removeName: function(t, e) {
                if (void 0 !== t) {
                    var i = this.names[t];
                    if (void 0 !== i) {
                        for (var n = 0; n < i.length; n++) {
                            var a = i[n];
                            a._id === e && i.splice(n, 1)
                        }
                        0 === i.length && delete this.names[t]
                    }
                }
            },
            getAngle: function(t) {
                return this.angleDeg ? t * e : t
            },
            _parseUA: function(t) {
                var e = t.toLowerCase(),
                    i = /(chrome)[ \/]([\w.]+)/.exec(e) || /(webkit)[ \/]([\w.]+)/.exec(e) || /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(e) || /(msie) ([\w.]+)/.exec(e) || e.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(e) || [],
                    n = !!t.match(/Android|BlackBerry|iPhone|iPad|iPod|Opera Mini|IEMobile/i),
                    a = !!t.match(/IEMobile/i);
                return {
                    browser: i[1] || "",
                    version: i[2] || "0",
                    mobile: n,
                    ieMobile: a
                }
            },
            UA: void 0
        }, Kinetic.UA = Kinetic._parseUA(t.navigator && t.navigator.userAgent || "")
    }(this), function(t, e) {
        if ("object" == typeof exports) {
            var i = e();
            if (global.window === global) Kinetic.document = global.document, Kinetic.window = global;
            else {
                var n = require("canvas"),
                    a = require("jsdom").jsdom;
                Kinetic.document = a("<!DOCTYPE html><html><head></head><body></body></html>"), Kinetic.window = Kinetic.document.createWindow(), Kinetic.window.Image = n.Image, Kinetic._nodeCanvas = n
            }
            return Kinetic.root = t, void(module.exports = i)
        }
        "function" == typeof define && define.amd && define(e), Kinetic.document = document, Kinetic.window = window, Kinetic.root = t
    }(this, function() {
        return Kinetic
    }), function() {
        Kinetic.Collection = function() {
            var t = [].slice.call(arguments),
                e = t.length,
                i = 0;
            for (this.length = e; e > i; i++) this[i] = t[i];
            return this
        }, Kinetic.Collection.prototype = [], Kinetic.Collection.prototype.each = function(t) {
            for (var e = 0; e < this.length; e++) t(this[e], e)
        }, Kinetic.Collection.prototype.toArray = function() {
            var t, e = [],
                i = this.length;
            for (t = 0; i > t; t++) e.push(this[t]);
            return e
        }, Kinetic.Collection.toCollection = function(t) {
            var e, i = new Kinetic.Collection,
                n = t.length;
            for (e = 0; n > e; e++) i.push(t[e]);
            return i
        }, Kinetic.Collection._mapMethod = function(t) {
            Kinetic.Collection.prototype[t] = function() {
                var e, i = this.length,
                    n = [].slice.call(arguments);
                for (e = 0; i > e; e++) this[e][t].apply(this[e], n);
                return this
            }
        }, Kinetic.Collection.mapMethods = function(t) {
            var e = t.prototype;
            for (var i in e) Kinetic.Collection._mapMethod(i)
        }, Kinetic.Transform = function(t) {
            this.m = t && t.slice() || [1, 0, 0, 1, 0, 0]
        }, Kinetic.Transform.prototype = {
            copy: function() {
                return new Kinetic.Transform(this.m)
            },
            point: function(t) {
                var e = this.m;
                return {
                    x: e[0] * t.x + e[2] * t.y + e[4],
                    y: e[1] * t.x + e[3] * t.y + e[5]
                }
            },
            translate: function(t, e) {
                return this.m[4] += this.m[0] * t + this.m[2] * e, this.m[5] += this.m[1] * t + this.m[3] * e, this
            },
            scale: function(t, e) {
                return this.m[0] *= t, this.m[1] *= t, this.m[2] *= e, this.m[3] *= e, this
            },
            rotate: function(t) {
                var e = Math.cos(t),
                    i = Math.sin(t),
                    n = this.m[0] * e + this.m[2] * i,
                    a = this.m[1] * e + this.m[3] * i,
                    r = this.m[0] * -i + this.m[2] * e,
                    s = this.m[1] * -i + this.m[3] * e;
                return this.m[0] = n, this.m[1] = a, this.m[2] = r, this.m[3] = s, this
            },
            getTranslation: function() {
                return {
                    x: this.m[4],
                    y: this.m[5]
                }
            },
            skew: function(t, e) {
                var i = this.m[0] + this.m[2] * e,
                    n = this.m[1] + this.m[3] * e,
                    a = this.m[2] + this.m[0] * t,
                    r = this.m[3] + this.m[1] * t;
                return this.m[0] = i, this.m[1] = n, this.m[2] = a, this.m[3] = r, this
            },
            multiply: function(t) {
                var e = this.m[0] * t.m[0] + this.m[2] * t.m[1],
                    i = this.m[1] * t.m[0] + this.m[3] * t.m[1],
                    n = this.m[0] * t.m[2] + this.m[2] * t.m[3],
                    a = this.m[1] * t.m[2] + this.m[3] * t.m[3],
                    r = this.m[0] * t.m[4] + this.m[2] * t.m[5] + this.m[4],
                    s = this.m[1] * t.m[4] + this.m[3] * t.m[5] + this.m[5];
                return this.m[0] = e, this.m[1] = i, this.m[2] = n, this.m[3] = a, this.m[4] = r, this.m[5] = s, this
            },
            invert: function() {
                var t = 1 / (this.m[0] * this.m[3] - this.m[1] * this.m[2]),
                    e = this.m[3] * t,
                    i = -this.m[1] * t,
                    n = -this.m[2] * t,
                    a = this.m[0] * t,
                    r = t * (this.m[2] * this.m[5] - this.m[3] * this.m[4]),
                    s = t * (this.m[1] * this.m[4] - this.m[0] * this.m[5]);
                return this.m[0] = e, this.m[1] = i, this.m[2] = n, this.m[3] = a, this.m[4] = r, this.m[5] = s, this
            },
            getMatrix: function() {
                return this.m
            },
            setAbsolutePosition: function(t, e) {
                var i = this.m[0],
                    n = this.m[1],
                    a = this.m[2],
                    r = this.m[3],
                    s = this.m[4],
                    o = this.m[5],
                    c = (i * (e - o) - n * (t - s)) / (i * r - n * a),
                    h = (t - s - a * c) / i;
                return this.translate(h, c)
            }
        };
        var t = "2d",
            e = "[object Array]",
            i = "[object Number]",
            n = "[object String]",
            a = Math.PI / 180,
            r = 180 / Math.PI,
            s = "#",
            o = "",
            c = "0",
            h = "Kinetic warning: ",
            l = "Kinetic error: ",
            d = "rgb(",
            u = {
                aqua: [0, 255, 255],
                lime: [0, 255, 0],
                silver: [192, 192, 192],
                black: [0, 0, 0],
                maroon: [128, 0, 0],
                teal: [0, 128, 128],
                blue: [0, 0, 255],
                navy: [0, 0, 128],
                white: [255, 255, 255],
                fuchsia: [255, 0, 255],
                olive: [128, 128, 0],
                yellow: [255, 255, 0],
                orange: [255, 165, 0],
                gray: [128, 128, 128],
                purple: [128, 0, 128],
                green: [0, 128, 0],
                red: [255, 0, 0],
                pink: [255, 192, 203],
                cyan: [0, 255, 255],
                transparent: [255, 255, 255, 0]
            },
            f = /rgb\((\d{1,3}),(\d{1,3}),(\d{1,3})\)/;
        Kinetic.Util = {
            _isElement: function(t) {
                return !(!t || 1 != t.nodeType)
            },
            _isFunction: function(t) {
                return !!(t && t.constructor && t.call && t.apply)
            },
            _isObject: function(t) {
                return !!t && t.constructor == Object
            },
            _isArray: function(t) {
                return Object.prototype.toString.call(t) == e
            },
            _isNumber: function(t) {
                return Object.prototype.toString.call(t) == i
            },
            _isString: function(t) {
                return Object.prototype.toString.call(t) == n
            },
            _throttle: function(t, e, i) {
                var n, a, r, s = null,
                    o = 0,
                    c = i || {},
                    h = function() {
                        o = c.leading === !1 ? 0 : (new Date).getTime(), s = null, r = t.apply(n, a), n = a = null
                    };
                return function() {
                    var i = (new Date).getTime();
                    o || c.leading !== !1 || (o = i);
                    var l = e - (i - o);
                    return n = this, a = arguments, 0 >= l ? (clearTimeout(s), s = null, o = i, r = t.apply(n, a), n = a = null) : s || c.trailing === !1 || (s = setTimeout(h, l)), r
                }
            },
            _hasMethods: function(t) {
                var e, i = [];
                for (e in t) this._isFunction(t[e]) && i.push(e);
                return i.length > 0
            },
            createCanvasElement: function() {
                var t = Kinetic.document.createElement("canvas");
                try {
                    t.style = t.style || {}
                } catch (e) {}
                return t
            },
            isBrowser: function() {
                return "object" != typeof exports
            },
            _isInDocument: function(t) {
                for (; t = t.parentNode;)
                    if (t == Kinetic.document) return !0;
                return !1
            },
            _simplifyArray: function(t) {
                var e, i, n = [],
                    a = t.length,
                    r = Kinetic.Util;
                for (e = 0; a > e; e++) i = t[e], r._isNumber(i) ? i = Math.round(1e3 * i) / 1e3 : r._isString(i) || (i = i.toString()), n.push(i);
                return n
            },
            _getImage: function(e, i) {
                var n, a;
                if (e)
                    if (this._isElement(e)) i(e);
                    else if (this._isString(e)) n = new Kinetic.window.Image, n.onload = function() {
                    i(n)
                }, n.src = e;
                else if (e.data) {
                    a = Kinetic.Util.createCanvasElement(), a.width = e.width, a.height = e.height;
                    var r = a.getContext(t);
                    r.putImageData(e, 0, 0), this._getImage(a.toDataURL(), i)
                } else i(null);
                else i(null)
            },
            _getRGBAString: function(t) {
                var e = t.red || 0,
                    i = t.green || 0,
                    n = t.blue || 0,
                    a = t.alpha || 1;
                return ["rgba(", e, ",", i, ",", n, ",", a, ")"].join(o)
            },
            _rgbToHex: function(t, e, i) {
                return ((1 << 24) + (t << 16) + (e << 8) + i).toString(16).slice(1)
            },
            _hexToRgb: function(t) {
                t = t.replace(s, o);
                var e = parseInt(t, 16);
                return {
                    r: e >> 16 & 255,
                    g: e >> 8 & 255,
                    b: 255 & e
                }
            },
            getRandomColor: function() {
                for (var t = (16777215 * Math.random() << 0).toString(16); t.length < 6;) t = c + t;
                return s + t
            },
            get: function(t, e) {
                return void 0 === t ? e : t
            },
            getRGB: function(t) {
                var e;
                return t in u ? (e = u[t], {
                    r: e[0],
                    g: e[1],
                    b: e[2]
                }) : t[0] === s ? this._hexToRgb(t.substring(1)) : t.substr(0, 4) === d ? (e = f.exec(t.replace(/ /g, "")), {
                    r: parseInt(e[1], 10),
                    g: parseInt(e[2], 10),
                    b: parseInt(e[3], 10)
                }) : {
                    r: 0,
                    g: 0,
                    b: 0
                }
            },
            _merge: function(t, e) {
                var i = this._clone(e);
                for (var n in t) i[n] = this._isObject(t[n]) ? this._merge(t[n], i[n]) : t[n];
                return i
            },
            cloneObject: function(t) {
                var e = {};
                for (var i in t) e[i] = this._isObject(t[i]) ? this.cloneObject(t[i]) : this._isArray(t[i]) ? this.cloneArray(t[i]) : t[i];
                return e
            },
            cloneArray: function(t) {
                return t.slice(0)
            },
            _degToRad: function(t) {
                return t * a
            },
            _radToDeg: function(t) {
                return t * r
            },
            _capitalize: function(t) {
                return t.charAt(0).toUpperCase() + t.slice(1)
            },
            error: function(t) {
                throw new Error(l + t)
            },
            warn: function(t) {
                Kinetic.root.console && console.warn && Kinetic.showWarnings && console.warn(h + t)
            },
            extend: function(t, e) {
                for (var i in e.prototype) i in t.prototype || (t.prototype[i] = e.prototype[i])
            },
            addMethods: function(t, e) {
                var i;
                for (i in e) t.prototype[i] = e[i]
            },
            _getControlPoints: function(t, e, i, n, a, r, s) {
                var o = Math.sqrt(Math.pow(i - t, 2) + Math.pow(n - e, 2)),
                    c = Math.sqrt(Math.pow(a - i, 2) + Math.pow(r - n, 2)),
                    h = s * o / (o + c),
                    l = s * c / (o + c),
                    d = i - h * (a - t),
                    u = n - h * (r - e),
                    f = i + l * (a - t),
                    g = n + l * (r - e);
                return [d, u, f, g]
            },
            _expandPoints: function(t, e) {
                var i, n, a = t.length,
                    r = [];
                for (i = 2; a - 2 > i; i += 2) n = Kinetic.Util._getControlPoints(t[i - 2], t[i - 1], t[i], t[i + 1], t[i + 2], t[i + 3], e), r.push(n[0]), r.push(n[1]), r.push(t[i]), r.push(t[i + 1]), r.push(n[2]), r.push(n[3]);
                return r
            },
            _removeLastLetter: function(t) {
                return t.substring(0, t.length - 1)
            }
        }
    }(), function() {
        var t = Kinetic.Util.createCanvasElement(),
            e = t.getContext("2d"),
            i = Kinetic.UA.mobile ? function() {
                var t = window.devicePixelRatio || 1,
                    i = e.webkitBackingStorePixelRatio || e.mozBackingStorePixelRatio || e.msBackingStorePixelRatio || e.oBackingStorePixelRatio || e.backingStorePixelRatio || 1;
                return t / i
            }() : 1;
        Kinetic.Canvas = function(t) {
            this.init(t)
        }, Kinetic.Canvas.prototype = {
            init: function(t) {
                var e = t || {},
                    n = e.pixelRatio || Kinetic.pixelRatio || i;
                this.pixelRatio = n, this._canvas = Kinetic.Util.createCanvasElement(), this._canvas.style.padding = 0, this._canvas.style.margin = 0, this._canvas.style.border = 0, this._canvas.style.background = "transparent", this._canvas.style.position = "absolute", this._canvas.style.top = 0, this._canvas.style.left = 30
            },
            getContext: function() {
                return this.context
            },
            getPixelRatio: function() {
                return this.pixelRatio
            },
            setPixelRatio: function(t) {
                this.pixelRatio = t, this.setSize(this.getWidth(), this.getHeight())
            },
            setWidth: function(t) {
                this.width = this._canvas.width = t * this.pixelRatio, this._canvas.style.width = t + "px"
            },
            setHeight: function(t) {
                this.height = this._canvas.height = t * this.pixelRatio, this._canvas.style.height = t + "px"
            },
            getWidth: function() {
                return this.width
            },
            getHeight: function() {
                return this.height
            },
            setSize: function(t, e) {
                this.setWidth(t), this.setHeight(e)
            },
            toDataURL: function(t, e) {
                try {
                    return this._canvas.toDataURL(t, e)
                } catch (i) {
                    try {
                        return this._canvas.toDataURL()
                    } catch (n) {
                        return Kinetic.Util.warn("Unable to get data URL. " + n.message), ""
                    }
                }
            }
        }, Kinetic.SceneCanvas = function(t) {
            var e = t || {},
                i = e.width || 0,
                n = e.height || 0;
            Kinetic.Canvas.call(this, e), this.context = new Kinetic.SceneContext(this), this.setSize(i, n)
        }, Kinetic.SceneCanvas.prototype = {
            setWidth: function(t) {
                var e = this.pixelRatio,
                    i = this.getContext()._context;
                Kinetic.Canvas.prototype.setWidth.call(this, t), i.scale(e, e)
            },
            setHeight: function(t) {
                var e = this.pixelRatio,
                    i = this.getContext()._context;
                Kinetic.Canvas.prototype.setHeight.call(this, t), i.scale(e, e)
            }
        }, Kinetic.Util.extend(Kinetic.SceneCanvas, Kinetic.Canvas), Kinetic.HitCanvas = function(t) {
            var e = t || {},
                i = e.width || 0,
                n = e.height || 0;
            Kinetic.Canvas.call(this, e), this.context = new Kinetic.HitContext(this), this.setSize(i, n), this.hitCanvas = !0
        }, Kinetic.Util.extend(Kinetic.HitCanvas, Kinetic.Canvas)
    }(), function() {
        var t = ",",
            e = "(",
            i = ")",
            n = "([",
            a = "])",
            r = ";",
            s = "()",
            o = "=",
            c = ["arc", "arcTo", "beginPath", "bezierCurveTo", "clearRect", "clip", "closePath", "createLinearGradient", "createPattern", "createRadialGradient", "drawImage", "fill", "fillText", "getImageData", "createImageData", "lineTo", "moveTo", "putImageData", "quadraticCurveTo", "rect", "restore", "rotate", "save", "scale", "setLineDash", "setTransform", "stroke", "strokeText", "transform", "translate"];
        Kinetic.Context = function(t) {
            this.init(t)
        }, Kinetic.Context.prototype = {
            init: function(t) {
                this.canvas = t, this._context = t._canvas.getContext("2d"), Kinetic.enableTrace && (this.traceArr = [], this._enableTrace())
            },
            fillShape: function(t) {
                t.getFillEnabled() && this._fill(t)
            },
            strokeShape: function(t) {
                t.getStrokeEnabled() && this._stroke(t)
            },
            fillStrokeShape: function(t) {
                var e = t.getFillEnabled();
                e && this._fill(t), t.getStrokeEnabled() && this._stroke(t)
            },
            getTrace: function(c) {
                var h, l, d, u, f = this.traceArr,
                    g = f.length,
                    p = "";
                for (h = 0; g > h; h++) l = f[h], d = l.method, d ? (u = l.args, p += d, p += c ? s : Kinetic.Util._isArray(u[0]) ? n + u.join(t) + a : e + u.join(t) + i) : (p += l.property, c || (p += o + l.val)), p += r;
                return p
            },
            clearTrace: function() {
                this.traceArr = []
            },
            _trace: function(t) {
                var e, i = this.traceArr;
                i.push(t), e = i.length, e >= Kinetic.traceArrMax && i.shift()
            },
            reset: function() {
                var t = this.getCanvas().getPixelRatio();
                this.setTransform(1 * t, 0, 0, 1 * t, 0, 0)
            },
            getCanvas: function() {
                return this.canvas
            },
            clear: function(t) {
                var e = this.getCanvas();
                t ? this.clearRect(t.x || 0, t.y || 0, t.width || 0, t.height || 0) : this.clearRect(0, 0, e.getWidth(), e.getHeight())
            },
            _applyLineCap: function(t) {
                var e = t.getLineCap();
                e && this.setAttr("lineCap", e)
            },
            _applyOpacity: function(t) {
                var e = t.getAbsoluteOpacity();
                1 !== e && this.setAttr("globalAlpha", e)
            },
            _applyLineJoin: function(t) {
                var e = t.getLineJoin();
                e && this.setAttr("lineJoin", e)
            },
            setAttr: function(t, e) {
                this._context[t] = e
            },
            arc: function() {
                var t = arguments;
                this._context.arc(t[0], t[1], t[2], t[3], t[4], t[5])
            },
            beginPath: function() {
                this._context.beginPath()
            },
            bezierCurveTo: function() {
                var t = arguments;
                this._context.bezierCurveTo(t[0], t[1], t[2], t[3], t[4], t[5])
            },
            clearRect: function() {
                var t = arguments;
                this._context.clearRect(t[0], t[1], t[2], t[3])
            },
            clip: function() {
                this._context.clip()
            },
            closePath: function() {
                this._context.closePath()
            },
            createImageData: function() {
                var t = arguments;
                return 2 === t.length ? this._context.createImageData(t[0], t[1]) : 1 === t.length ? this._context.createImageData(t[0]) : void 0
            },
            createLinearGradient: function() {
                var t = arguments;
                return this._context.createLinearGradient(t[0], t[1], t[2], t[3])
            },
            createPattern: function() {
                var t = arguments;
                return this._context.createPattern(t[0], t[1])
            },
            createRadialGradient: function() {
                var t = arguments;
                return this._context.createRadialGradient(t[0], t[1], t[2], t[3], t[4], t[5])
            },
            drawImage: function() {
                var t = arguments,
                    e = this._context;
                3 === t.length ? e.drawImage(t[0], t[1], t[2]) : 5 === t.length ? e.drawImage(t[0], t[1], t[2], t[3], t[4]) : 9 === t.length && e.drawImage(t[0], t[1], t[2], t[3], t[4], t[5], t[6], t[7], t[8])
            },
            fill: function() {
                this._context.fill()
            },
            fillText: function() {
                var t = arguments;
                this._context.fillText(t[0], t[1], t[2])
            },
            getImageData: function() {
                var t = arguments;
                return this._context.getImageData(t[0], t[1], t[2], t[3])
            },
            lineTo: function() {
                var t = arguments;
                this._context.lineTo(t[0], t[1])
            },
            moveTo: function() {
                var t = arguments;
                this._context.moveTo(t[0], t[1])
            },
            rect: function() {
                var t = arguments;
                this._context.rect(t[0], t[1], t[2], t[3])
            },
            putImageData: function() {
                var t = arguments;
                this._context.putImageData(t[0], t[1], t[2])
            },
            quadraticCurveTo: function() {
                var t = arguments;
                this._context.quadraticCurveTo(t[0], t[1], t[2], t[3])
            },
            restore: function() {
                this._context.restore()
            },
            rotate: function() {
                var t = arguments;
                this._context.rotate(t[0])
            },
            save: function() {
                this._context.save()
            },
            scale: function() {
                var t = arguments;
                this._context.scale(t[0], t[1])
            },
            setLineDash: function() {
                var t = arguments,
                    e = this._context;
                this._context.setLineDash ? e.setLineDash(t[0]) : "mozDash" in e ? e.mozDash = t[0] : "webkitLineDash" in e && (e.webkitLineDash = t[0])
            },
            setTransform: function() {
                var t = arguments;
                this._context.setTransform(t[0], t[1], t[2], t[3], t[4], t[5])
            },
            stroke: function() {
                this._context.stroke()
            },
            strokeText: function() {
                var t = arguments;
                this._context.strokeText(t[0], t[1], t[2])
            },
            transform: function() {
                var t = arguments;
                this._context.transform(t[0], t[1], t[2], t[3], t[4], t[5])
            },
            translate: function() {
                var t = arguments;
                this._context.translate(t[0], t[1])
            },
            _enableTrace: function() {
                var t, e, i = this,
                    n = c.length,
                    a = Kinetic.Util._simplifyArray,
                    r = this.setAttr,
                    s = function(t) {
                        var n, r = i[t];
                        i[t] = function() {
                            return e = a(Array.prototype.slice.call(arguments, 0)), n = r.apply(i, arguments), i._trace({
                                method: t,
                                args: e
                            }), n
                        }
                    };
                for (t = 0; n > t; t++) s(c[t]);
                i.setAttr = function() {
                    r.apply(i, arguments), i._trace({
                        property: arguments[0],
                        val: arguments[1]
                    })
                }
            }
        }, Kinetic.SceneContext = function(t) {
            Kinetic.Context.call(this, t)
        }, Kinetic.SceneContext.prototype = {
            _fillColor: function(t) {
                var e = t.fill() || Kinetic.Util._getRGBAString({
                    red: t.fillRed(),
                    green: t.fillGreen(),
                    blue: t.fillBlue(),
                    alpha: t.fillAlpha()
                });
                this.setAttr("fillStyle", e), t._fillFunc(this)
            },
            _fillPattern: function(t) {
                var e = t.getFillPatternImage(),
                    i = t.getFillPatternX(),
                    n = t.getFillPatternY(),
                    a = t.getFillPatternScale(),
                    r = Kinetic.getAngle(t.getFillPatternRotation()),
                    s = t.getFillPatternOffset(),
                    o = t.getFillPatternRepeat();
                (i || n) && this.translate(i || 0, n || 0), r && this.rotate(r), a && this.scale(a.x, a.y), s && this.translate(-1 * s.x, -1 * s.y), this.setAttr("fillStyle", this.createPattern(e, o || "repeat")), this.fill()
            },
            _fillLinearGradient: function(t) {
                var e = t.getFillLinearGradientStartPoint(),
                    i = t.getFillLinearGradientEndPoint(),
                    n = t.getFillLinearGradientColorStops(),
                    a = this.createLinearGradient(e.x, e.y, i.x, i.y);
                if (n) {
                    for (var r = 0; r < n.length; r += 2) a.addColorStop(n[r], n[r + 1]);
                    this.setAttr("fillStyle", a), this.fill()
                }
            },
            _fillRadialGradient: function(t) {
                for (var e = t.getFillRadialGradientStartPoint(), i = t.getFillRadialGradientEndPoint(), n = t.getFillRadialGradientStartRadius(), a = t.getFillRadialGradientEndRadius(), r = t.getFillRadialGradientColorStops(), s = this.createRadialGradient(e.x, e.y, n, i.x, i.y, a), o = 0; o < r.length; o += 2) s.addColorStop(r[o], r[o + 1]);
                this.setAttr("fillStyle", s), this.fill()
            },
            _fill: function(t) {
                var e = t.fill() || t.fillRed() || t.fillGreen() || t.fillBlue(),
                    i = t.getFillPatternImage(),
                    n = t.getFillLinearGradientColorStops(),
                    a = t.getFillRadialGradientColorStops(),
                    r = t.getFillPriority();
                e && "color" === r ? this._fillColor(t) : i && "pattern" === r ? this._fillPattern(t) : n && "linear-gradient" === r ? this._fillLinearGradient(t) : a && "radial-gradient" === r ? this._fillRadialGradient(t) : e ? this._fillColor(t) : i ? this._fillPattern(t) : n ? this._fillLinearGradient(t) : a && this._fillRadialGradient(t)
            },
            _stroke: function(t) {
                var e = t.dash(),
                    i = t.getStrokeScaleEnabled();
                t.hasStroke() && (i || (this.save(), this.setTransform(1, 0, 0, 1, 0, 0)), this._applyLineCap(t), e && t.dashEnabled() && this.setLineDash(e), this.setAttr("lineWidth", t.strokeWidth()), this.setAttr("strokeStyle", t.stroke() || Kinetic.Util._getRGBAString({
                    red: t.strokeRed(),
                    green: t.strokeGreen(),
                    blue: t.strokeBlue(),
                    alpha: t.strokeAlpha()
                })), t._strokeFunc(this), i || this.restore())
            },
            _applyShadow: function(t) {
                var e = Kinetic.Util,
                    i = t.getAbsoluteOpacity(),
                    n = e.get(t.getShadowColor(), "black"),
                    a = e.get(t.getShadowBlur(), 5),
                    r = e.get(t.getShadowOpacity(), 1),
                    s = e.get(t.getShadowOffset(), {
                        x: 0,
                        y: 0
                    });
                r && this.setAttr("globalAlpha", r * i), this.setAttr("shadowColor", n), this.setAttr("shadowBlur", a), this.setAttr("shadowOffsetX", s.x), this.setAttr("shadowOffsetY", s.y)
            }
        }, Kinetic.Util.extend(Kinetic.SceneContext, Kinetic.Context), Kinetic.HitContext = function(t) {
            Kinetic.Context.call(this, t)
        }, Kinetic.HitContext.prototype = {
            _fill: function(t) {
                this.save(), this.setAttr("fillStyle", t.colorKey), t._fillFuncHit(this), this.restore()
            },
            _stroke: function(t) {
                t.hasStroke() && (this._applyLineCap(t), this.setAttr("lineWidth", t.strokeWidth()), this.setAttr("strokeStyle", t.colorKey), t._strokeFuncHit(this))
            }
        }, Kinetic.Util.extend(Kinetic.HitContext, Kinetic.Context)
    }(), function() {
        var t = "get",
            e = "set";
        Kinetic.Factory = {
            addGetterSetter: function(t, e, i, n, a) {
                this.addGetter(t, e, i), this.addSetter(t, e, n, a), this.addOverloadedGetterSetter(t, e)
            },
            addGetter: function(e, i, n) {
                var a = t + Kinetic.Util._capitalize(i);
                e.prototype[a] = function() {
                    var t = this.attrs[i];
                    return void 0 === t ? n : t
                }
            },
            addSetter: function(t, i, n, a) {
                var r = e + Kinetic.Util._capitalize(i);
                t.prototype[r] = function(t) {
                    return n && (t = n.call(this, t)), this._setAttr(i, t), a && a.call(this), this
                }
            },
            addComponentsGetterSetter: function(i, n, a, r, s) {
                var o, c, h = a.length,
                    l = Kinetic.Util._capitalize,
                    d = t + l(n),
                    u = e + l(n);
                i.prototype[d] = function() {
                    var t = {};
                    for (o = 0; h > o; o++) c = a[o], t[c] = this.getAttr(n + l(c));
                    return t
                }, i.prototype[u] = function(t) {
                    var e, i = this.attrs[n];
                    r && (t = r.call(this, t));
                    for (e in t) this._setAttr(n + l(e), t[e]);
                    return this._fireChangeEvent(n, i, t), s && s.call(this), this
                }, this.addOverloadedGetterSetter(i, n)
            },
            addOverloadedGetterSetter: function(i, n) {
                var a = Kinetic.Util._capitalize(n),
                    r = e + a,
                    s = t + a;
                i.prototype[n] = function() {
                    return arguments.length ? (this[r](arguments[0]), this) : this[s]()
                }
            },
            backCompat: function(t, e) {
                var i;
                for (i in e) t.prototype[i] = t.prototype[e[i]]
            },
            afterSetFilter: function() {
                this._filterUpToDate = !1
            }
        }, Kinetic.Validators = {
            RGBComponent: function(t) {
                return t > 255 ? 255 : 0 > t ? 0 : Math.round(t)
            },
            alphaComponent: function(t) {
                return t > 1 ? 1 : 1e-4 > t ? 1e-4 : t
            }
        }
    }(), function() {
        var t = "absoluteOpacity",
            e = "absoluteTransform",
            i = "Change",
            n = "children",
            a = ".",
            r = "",
            s = "get",
            o = "id",
            c = "kinetic",
            h = "listening",
            l = "mouseenter",
            d = "mouseleave",
            u = "name",
            f = "set",
            g = "Shape",
            p = " ",
            v = "stage",
            m = "transform",
            _ = "Stage",
            K = "visible",
            y = ["id"],
            S = ["xChange.kinetic", "yChange.kinetic", "scaleXChange.kinetic", "scaleYChange.kinetic", "skewXChange.kinetic", "skewYChange.kinetic", "rotationChange.kinetic", "offsetXChange.kinetic", "offsetYChange.kinetic", "transformsEnabledChange.kinetic"].join(p);
        Kinetic.Util.addMethods(Kinetic.Node, {
            _init: function(i) {
                var n = this;
                this._id = Kinetic.idCounter++, this.eventListeners = {}, this.attrs = {}, this._cache = {}, this._filterUpToDate = !1, this.setAttrs(i), this.on(S, function() {
                    this._clearCache(m), n._clearSelfAndDescendantCache(e)
                }), this.on("visibleChange.kinetic", function() {
                    n._clearSelfAndDescendantCache(K)
                }), this.on("listeningChange.kinetic", function() {
                    n._clearSelfAndDescendantCache(h)
                }), this.on("opacityChange.kinetic", function() {
                    n._clearSelfAndDescendantCache(t)
                })
            },
            _clearCache: function(t) {
                t ? delete this._cache[t] : this._cache = {}
            },
            _getCache: function(t, e) {
                var i = this._cache[t];
                return void 0 === i && (this._cache[t] = e.call(this)), this._cache[t]
            },
            _clearSelfAndDescendantCache: function(t) {
                this._clearCache(t), this.children && this.getChildren().each(function(e) {
                    e._clearSelfAndDescendantCache(t)
                })
            },
            clearCache: function() {
                return delete this._cache.canvas, this._filterUpToDate = !1, this
            },
            cache: function(t) {
                var e = t || {},
                    i = e.x || 0,
                    n = e.y || 0,
                    a = e.width || this.width(),
                    r = e.height || this.height(),
                    s = e.drawBorder || !1;
                if (0 === a || 0 === r) return void Kinetic.Util.warn("Width or height of caching configuration equals 0. Cache is ignored.");
                var o = new Kinetic.SceneCanvas({
                        pixelRatio: 1,
                        width: a,
                        height: r
                    }),
                    c = new Kinetic.SceneCanvas({
                        pixelRatio: 1,
                        width: a,
                        height: r
                    }),
                    h = new Kinetic.HitCanvas({
                        width: a,
                        height: r
                    }),
                    l = o.getContext(),
                    d = h.getContext();
                return h.isCache = !0, this.clearCache(), l.save(), d.save(), s && (l.save(), l.beginPath(), l.rect(0, 0, a, r), l.closePath(), l.setAttr("strokeStyle", "red"), l.setAttr("lineWidth", 5), l.stroke(), l.restore()), l.translate(-1 * i, -1 * n), d.translate(-1 * i, -1 * n), "Shape" === this.nodeType && (l.translate(-1 * this.x(), -1 * this.y()), d.translate(-1 * this.x(), -1 * this.y())), this.drawScene(o, this), this.drawHit(h, this), l.restore(), d.restore(), this._cache.canvas = {
                    scene: o,
                    filter: c,
                    hit: h
                }, this
            },
            _drawCachedSceneCanvas: function(t) {
                t.save(), this.getLayer()._applyTransform(this, t), t._applyOpacity(this), t.drawImage(this._getCachedSceneCanvas()._canvas, 0, 0), t.restore()
            },
            _getCachedSceneCanvas: function() {
                var t, e, i, n, a = this.filters(),
                    r = this._cache.canvas,
                    s = r.scene,
                    o = r.filter,
                    c = o.getContext();
                if (a) {
                    if (!this._filterUpToDate) {
                        try {
                            for (t = a.length, c.clear(), c.drawImage(s._canvas, 0, 0), e = c.getImageData(0, 0, o.getWidth(), o.getHeight()), i = 0; t > i; i++) n = a[i], n.call(this, e), c.putImageData(e, 0, 0)
                        } catch (h) {
                            Kinetic.Util.warn("Unable to apply filter. " + h.message)
                        }
                        this._filterUpToDate = !0
                    }
                    return o
                }
                return s
            },
            _drawCachedHitCanvas: function(t) {
                var e = this._cache.canvas,
                    i = e.hit;
                t.save(), this.getLayer()._applyTransform(this, t), t.drawImage(i._canvas, 0, 0), t.restore()
            },
            on: function(t, e) {
                var i, n, s, o, c, h = t.split(p),
                    l = h.length;
                for (i = 0; l > i; i++) n = h[i], s = n.split(a), o = s[0], c = s[1] || r, this.eventListeners[o] || (this.eventListeners[o] = []), this.eventListeners[o].push({
                    name: c,
                    handler: e
                });
                return this
            },
            off: function(t) {
                var e, i, n, r, s, o, c = (t || "").split(p),
                    h = c.length;
                if (!t)
                    for (i in this.eventListeners) this._off(i);
                for (e = 0; h > e; e++)
                    if (n = c[e], r = n.split(a), s = r[0], o = r[1], s) this.eventListeners[s] && this._off(s, o);
                    else
                        for (i in this.eventListeners) this._off(i, o);
                return this
            },
            dispatchEvent: function(t) {
                var e = {
                    target: this,
                    type: t.type,
                    evt: t
                };
                this.fire(t.type, e)
            },
            addEventListener: function(t, e) {
                this.on(t, function(t) {
                    e.call(this, t.evt)
                    consol.log('evt'+t.evt)
                })
            },
            removeEventListener: function(t) {
                this.off(t)
            },
            remove: function() {
                var i = this.getParent();
                return i && i.children && (i.children.splice(this.index, 1), i._setChildrenIndices(), delete this.parent), this._clearSelfAndDescendantCache(v), this._clearSelfAndDescendantCache(e), this._clearSelfAndDescendantCache(K), this._clearSelfAndDescendantCache(h), this._clearSelfAndDescendantCache(t), this
            },
            destroy: function() {
                Kinetic._removeId(this.getId()), Kinetic._removeName(this.getName(), this._id), this.remove()
            },
            getAttr: function(t) {
                var e = s + Kinetic.Util._capitalize(t);
                return Kinetic.Util._isFunction(this[e]) ? this[e]() : this.attrs[t]
            },
            getAncestors: function() {
                for (var t = this.getParent(), e = new Kinetic.Collection; t;) e.push(t), t = t.getParent();
                return e
            },
            getAttrs: function() {
                return this.attrs || {}
            },
            setAttrs: function(t) {
                var e, i;
                if (t)
                    for (e in t) e === n || (i = f + Kinetic.Util._capitalize(e), Kinetic.Util._isFunction(this[i]) ? this[i](t[e]) : this._setAttr(e, t[e]));
                return this
            },
            isListening: function() {
                return this._getCache(h, this._isListening)
            },
            _isListening: function() {
                var t = this.getListening(),
                    e = this.getParent();
                return "inherit" === t ? e ? e.isListening() : !0 : t
            },
            isVisible: function() {
                return this._getCache(K, this._isVisible)
            },
            _isVisible: function() {
                var t = this.getVisible(),
                    e = this.getParent();
                return "inherit" === t ? e ? e.isVisible() : !0 : t
            },
            shouldDrawHit: function(t) {
                var e = this.getLayer();
                return t && t.isCache || e && e.hitGraphEnabled() && this.isListening() && this.isVisible() && !Kinetic.isDragging()
            },
            show: function() {
                return this.setVisible(!0), this
            },
            hide: function() {
                return this.setVisible(!1), this
            },
            getZIndex: function() {
                return this.index || 0
            },
            getAbsoluteZIndex: function() {
                function t(c) {
                    for (e = [], i = c.length, n = 0; i > n; n++) a = c[n], o++, a.nodeType !== g && (e = e.concat(a.getChildren().toArray())), a._id === s._id && (n = i);
                    e.length > 0 && e[0].getDepth() <= r && t(e)
                }
                var e, i, n, a, r = this.getDepth(),
                    s = this,
                    o = 0;
                return s.nodeType !== _ && t(s.getStage().getChildren()), o
            },
            getDepth: function() {
                for (var t = 0, e = this.parent; e;) t++, e = e.parent;
                return t
            },
            setPosition: function(t) {
                return this.setX(t.x), this.setY(t.y), this
            },
            getPosition: function() {
                return {
                    x: this.getX(),
                    y: this.getY()
                }
            },
            getAbsolutePosition: function() {
                var t = this.getAbsoluteTransform().getMatrix(),
                    e = new Kinetic.Transform,
                    i = this.offset();
                return e.m = t.slice(), e.translate(i.x, i.y), e.getTranslation()
            },
            setAbsolutePosition: function(t) {
                var e, i = this._clearTransform();
                return this.attrs.x = i.x, this.attrs.y = i.y, delete i.x, delete i.y, e = this.getAbsoluteTransform(), e.invert(), e.translate(t.x, t.y), t = {
                    x: this.attrs.x + e.getTranslation().x,
                    y: this.attrs.y + e.getTranslation().y
                }, this.setPosition({
                    x: t.x,
                    y: t.y
                }), this._setTransform(i), this
            },
            _setTransform: function(t) {
                var i;
                for (i in t) this.attrs[i] = t[i];
                this._clearCache(m), this._clearSelfAndDescendantCache(e)
            },
            _clearTransform: function() {
                var t = {
                    x: this.getX(),
                    y: this.getY(),
                    rotation: this.getRotation(),
                    scaleX: this.getScaleX(),
                    scaleY: this.getScaleY(),
                    offsetX: this.getOffsetX(),
                    offsetY: this.getOffsetY(),
                    skewX: this.getSkewX(),
                    skewY: this.getSkewY()
                };
                return this.attrs.x = 0, this.attrs.y = 0, this.attrs.rotation = 0, this.attrs.scaleX = 1, this.attrs.scaleY = 1, this.attrs.offsetX = 0, this.attrs.offsetY = 0, this.attrs.skewX = 0, this.attrs.skewY = 0, this._clearCache(m), this._clearSelfAndDescendantCache(e), t
            },
            move: function(t) {
                var e = t.x,
                    i = t.y,
                    n = this.getX(),
                    a = this.getY();
                return void 0 !== e && (n += e), void 0 !== i && (a += i), this.setPosition({
                    x: n,
                    y: a
                }), this
            },
            _eachAncestorReverse: function(t, e) {
                var i, n, a = [],
                    r = this.getParent();
                if (e && e._id === this._id) return t(this), !0;
                for (a.unshift(this); r && (!e || r._id !== e._id);) a.unshift(r), r = r.parent;
                for (i = a.length, n = 0; i > n; n++) t(a[n])
            },
            rotate: function(t) {
                return this.setRotation(this.getRotation() + t), this
            },
            moveToTop: function() {
                if (!this.parent) return void Kinetic.Util.warn("Node has no parent. moveToTop function is ignored.");
                var t = this.index;
                return this.parent.children.splice(t, 1), this.parent.children.push(this), this.parent._setChildrenIndices(), !0
            },
            moveUp: function() {
                if (!this.parent) return void Kinetic.Util.warn("Node has no parent. moveUp function is ignored.");
                var t = this.index,
                    e = this.parent.getChildren().length;
                return e - 1 > t ? (this.parent.children.splice(t, 1), this.parent.children.splice(t + 1, 0, this), this.parent._setChildrenIndices(), !0) : !1
            },
            moveDown: function() {
                if (!this.parent) return void Kinetic.Util.warn("Node has no parent. moveDown function is ignored.");
                var t = this.index;
                return t > 0 ? (this.parent.children.splice(t, 1), this.parent.children.splice(t - 1, 0, this), this.parent._setChildrenIndices(), !0) : !1
            },
            moveToBottom: function() {
                if (!this.parent) return void Kinetic.Util.warn("Node has no parent. moveToBottom function is ignored.");
                var t = this.index;
                return t > 0 ? (this.parent.children.splice(t, 1), this.parent.children.unshift(this), this.parent._setChildrenIndices(), !0) : !1
            },
            setZIndex: function(t) {
                if (!this.parent) return void Kinetic.Util.warn("Node has no parent. zIndex parameter is ignored.");
                var e = this.index;
                return this.parent.children.splice(e, 1), this.parent.children.splice(t, 0, this), this.parent._setChildrenIndices(), this
            },
            getAbsoluteOpacity: function() {
                return this._getCache(t, this._getAbsoluteOpacity)
            },
            _getAbsoluteOpacity: function() {
                var t = this.getOpacity();
                return this.getParent() && (t *= this.getParent().getAbsoluteOpacity()), t
            },
            moveTo: function(t) {
                return this.getParent() !== t && (this.remove(), t.add(this)), this
            },
            toObject: function() {
                var t, e, i, n, a = Kinetic.Util,
                    r = {},
                    s = this.getAttrs();
                r.attrs = {};
                for (t in s) e = s[t], a._isFunction(e) || a._isElement(e) || a._isObject(e) && a._hasMethods(e) || (i = this[t], delete s[t], n = i ? i.call(this) : null, s[t] = e, n !== e && (r.attrs[t] = e));
                return r.className = this.getClassName(), r
            },
            toJSON: function() {
                return JSON.stringify(this.toObject())
            },
            getParent: function() {
                return this.parent
            },
            getLayer: function() {
                var t = this.getParent();
                return t ? t.getLayer() : null
            },
            getStage: function() {
                return this._getCache(v, this._getStage)
            },
            _getStage: function() {
                var t = this.getParent();
                return t ? t.getStage() : void 0
            },
            fire: function(t, e, i) {
                return i ? this._fireAndBubble(t, e || {}) : this._fire(t, e || {}), this
            },
            getAbsoluteTransform: function(t) {
                return t ? this._getAbsoluteTransform(t) : this._getCache(e, this._getAbsoluteTransform)
            },
            _getAbsoluteTransform: function(t) {
                var e, i, n = new Kinetic.Transform;
                return this._eachAncestorReverse(function(t) {
                    e = t.transformsEnabled(), i = t.getTransform(), "all" === e ? n.multiply(i) : "position" === e && n.translate(t.x(), t.y())
                }, t), n
            },
            getTransform: function() {
                return this._getCache(m, this._getTransform)
            },
            _getTransform: function() {
                var t = new Kinetic.Transform,
                    e = this.getX(),
                    i = this.getY(),
                    n = Kinetic.getAngle(this.getRotation()),
                    a = this.getScaleX(),
                    r = this.getScaleY(),
                    s = this.getSkewX(),
                    o = this.getSkewY(),
                    c = this.getOffsetX(),
                    h = this.getOffsetY();
                return (0 !== e || 0 !== i) && t.translate(e, i), 0 !== n && t.rotate(n), (0 !== s || 0 !== o) && t.skew(s, o), (1 !== a || 1 !== r) && t.scale(a, r), (0 !== c || 0 !== h) && t.translate(-1 * c, -1 * h), t
            },
            clone: function(t) {
                var e, i, n, a, r, s = this.getClassName(),
                    o = Kinetic.Util.cloneObject(this.attrs);
                for (var h in y) {
                    var l = y[h];
                    delete o[l]
                }
                for (e in t) o[e] = t[e];
                var d = new Kinetic[s](o);
                for (e in this.eventListeners)
                    for (i = this.eventListeners[e], n = i.length, a = 0; n > a; a++) r = i[a], r.name.indexOf(c) < 0 && (d.eventListeners[e] || (d.eventListeners[e] = []), d.eventListeners[e].push(r));
                return d
            },
            toDataURL: function(t) {
                t = t || {};
                var e = t.mimeType || null,
                    i = t.quality || null,
                    n = this.getStage(),
                    a = t.x || 0,
                    r = t.y || 0,
                    s = new Kinetic.SceneCanvas({
                        width: t.width || this.getWidth() || (n ? n.getWidth() : 0),
                        height: t.height || this.getHeight() || (n ? n.getHeight() : 0),
                        pixelRatio: 1
                    }),
                    o = s.getContext();
                return o.save(), (a || r) && o.translate(-1 * a, -1 * r), this.drawScene(s), o.restore(), s.toDataURL(e, i)
            },
            toImage: function(t) {
                Kinetic.Util._getImage(this.toDataURL(t), function(e) {
                    t.callback(e)
                })
            },
            setSize: function(t) {
                return this.setWidth(t.width), this.setHeight(t.height), this
            },
            getSize: function() {
                return {
                    width: this.getWidth(),
                    height: this.getHeight()
                }
            },
            getWidth: function() {
                return this.attrs.width || 0
            },
            getHeight: function() {
                return this.attrs.height || 0
            },
            getClassName: function() {
                return this.className || this.nodeType
            },
            getType: function() {
                return this.nodeType
            },
            getDragDistance: function() {
                return void 0 !== this.attrs.dragDistance ? this.attrs.dragDistance : this.parent ? this.parent.getDragDistance() : Kinetic.dragDistance
            },
            _get: function(t) {
                return this.className === t || this.nodeType === t ? [this] : []
            },
            _off: function(t, e) {
                var i, n, a = this.eventListeners[t];
                for (i = 0; i < a.length; i++)
                    if (n = a[i].name, !("kinetic" === n && "kinetic" !== e || e && n !== e)) {
                        if (a.splice(i, 1), 0 === a.length) {
                            delete this.eventListeners[t];
                            break
                        }
                        i--
                    }
            },
            _fireChangeEvent: function(t, e, n) {
                this._fire(t + i, {
                    oldVal: e,
                    newVal: n
                })
            },
            setId: function(t) {
                var e = this.getId();
                return Kinetic._removeId(e), Kinetic._addId(this, t), this._setAttr(o, t), this
            },
            setName: function(t) {
                var e = this.getName();
                return Kinetic._removeName(e, this._id), Kinetic._addName(this, t), this._setAttr(u, t), this
            },
            setAttr: function(t, e) {
                var i = f + Kinetic.Util._capitalize(t),
                    n = this[i];
                return Kinetic.Util._isFunction(n) ? n.call(this, e) : this._setAttr(t, e), this
            },
            _setAttr: function(t, e) {
                var i;
                void 0 !== e && (i = this.attrs[t], this.attrs[t] = e, this._fireChangeEvent(t, i, e))
            },
            _setComponentAttr: function(t, e, i) {
                var n;
                void 0 !== i && (n = this.attrs[t], n || (this.attrs[t] = this.getAttr(t)), this.attrs[t][e] = i, this._fireChangeEvent(t, n, i))
            },
            _fireAndBubble: function(t, e, i) {
                var n = !0;
                if (e && this.nodeType === g && (e.target = this), t === l && i && (this._id === i._id || this.isAncestorOf && this.isAncestorOf(i)) ? n = !1 : t === d && i && (this._id === i._id || this.isAncestorOf && this.isAncestorOf(i)) && (n = !1), n) {
                    this._fire(t, e);
                    var a = (t === l || t === d) && (i && i.isAncestorOf && i.isAncestorOf(this) || !(!i || !i.isAncestorOf));
                    e && !e.cancelBubble && this.parent && this.parent.isListening() && !a && (i && i.parent ? this._fireAndBubble.call(this.parent, t, e, i.parent) : this._fireAndBubble.call(this.parent, t, e))
                }
            },
            _fire: function(t, e) {
                var i, n = this.eventListeners[t];
                if (e.type = t, n)
                    for (i = 0; i < n.length; i++) n[i].handler.call(this, e)
            },
            draw: function() {
                return this.drawScene(), this.drawHit(), this
            }
        }), Kinetic.Node.create = function(t, e) {
            return this._createNode(JSON.parse(t), e)
        }, Kinetic.Node._createNode = function(t, e) {
            var i, n, a, r = Kinetic.Node.prototype.getClassName.call(t),
                s = t.children;
            if (e && (t.attrs.container = e), i = new Kinetic[r](t.attrs), s)
                for (n = s.length, a = 0; n > a; a++) i.add(this._createNode(s[a]));
            return i
        }, Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Node, "position"), Kinetic.Factory.addGetterSetter(Kinetic.Node, "x", 0), Kinetic.Factory.addGetterSetter(Kinetic.Node, "y", 0), Kinetic.Factory.addGetterSetter(Kinetic.Node, "opacity", 1), Kinetic.Factory.addGetter(Kinetic.Node, "name"), Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Node, "name"), Kinetic.Factory.addGetter(Kinetic.Node, "id"), Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Node, "id"), Kinetic.Factory.addGetterSetter(Kinetic.Node, "rotation", 0), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Node, "scale", ["x", "y"]), Kinetic.Factory.addGetterSetter(Kinetic.Node, "scaleX", 1), Kinetic.Factory.addGetterSetter(Kinetic.Node, "scaleY", 1), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Node, "skew", ["x", "y"]), Kinetic.Factory.addGetterSetter(Kinetic.Node, "skewX", 0), Kinetic.Factory.addGetterSetter(Kinetic.Node, "skewY", 0), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Node, "offset", ["x", "y"]), Kinetic.Factory.addGetterSetter(Kinetic.Node, "offsetX", 0), Kinetic.Factory.addGetterSetter(Kinetic.Node, "offsetY", 0), Kinetic.Factory.addSetter(Kinetic.Node, "dragDistance"), Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Node, "dragDistance"), Kinetic.Factory.addSetter(Kinetic.Node, "width", 0), Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Node, "width"), Kinetic.Factory.addSetter(Kinetic.Node, "height", 0), Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Node, "height"), Kinetic.Factory.addGetterSetter(Kinetic.Node, "listening", "inherit"), Kinetic.Factory.addGetterSetter(Kinetic.Node, "filters", void 0, function(t) {
            return this._filterUpToDate = !1, t
        }), Kinetic.Factory.addGetterSetter(Kinetic.Node, "visible", "inherit"), Kinetic.Factory.addGetterSetter(Kinetic.Node, "transformsEnabled", "all"), Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Node, "size"), Kinetic.Factory.backCompat(Kinetic.Node, {
            rotateDeg: "rotate",
            setRotationDeg: "setRotation",
            getRotationDeg: "getRotation"
        }), Kinetic.Collection.mapMethods(Kinetic.Node)
    }(), function() {
        Kinetic.Filters.Grayscale = function(t) {
            var e, i, n = t.data,
                a = n.length;
            for (e = 0; a > e; e += 4) i = .34 * n[e] + .5 * n[e + 1] + .16 * n[e + 2], n[e] = i, n[e + 1] = i, n[e + 2] = i
        }
    }(), function() {
        Kinetic.Filters.Brighten = function(t) {
            var e, i = 255 * this.brightness(),
                n = t.data,
                a = n.length;
            for (e = 0; a > e; e += 4) n[e] += i, n[e + 1] += i, n[e + 2] += i
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "brightness", 0, null, Kinetic.Factory.afterSetFilter)
    }(), function() {
        Kinetic.Filters.Invert = function(t) {
            var e, i = t.data,
                n = i.length;
            for (e = 0; n > e; e += 4) i[e] = 255 - i[e], i[e + 1] = 255 - i[e + 1], i[e + 2] = 255 - i[e + 2]
        }
    }(), function() {
        function t() {
            this.r = 0, this.g = 0, this.b = 0, this.a = 0, this.next = null
        }

        function e(e, a) {
            var r, s, o, c, h, l, d, u, f, g, p, v, m, _, K, y, S, C, x, b, w, F, P, T, k = e.data,
                A = e.width,
                M = e.height,
                D = a + a + 1,
                L = A - 1,
                G = M - 1,
                I = a + 1,
                R = I * (I + 1) / 2,
                N = new t,
                U = null,
                O = N,
                E = null,
                B = null,
                H = i[a],
                W = n[a];
            for (o = 1; D > o; o++) O = O.next = new t, o == I && (U = O);
            for (O.next = N, d = l = 0, s = 0; M > s; s++) {
                for (y = S = C = x = u = f = g = p = 0, v = I * (b = k[l]), m = I * (w = k[l + 1]), _ = I * (F = k[l + 2]), K = I * (P = k[l + 3]), u += R * b, f += R * w, g += R * F, p += R * P, O = N, o = 0; I > o; o++) O.r = b, O.g = w, O.b = F, O.a = P, O = O.next;
                for (o = 1; I > o; o++) c = l + ((o > L ? L : o) << 2), u += (O.r = b = k[c]) * (T = I - o), f += (O.g = w = k[c + 1]) * T, g += (O.b = F = k[c + 2]) * T, p += (O.a = P = k[c + 3]) * T, y += b, S += w, C += F, x += P, O = O.next;
                for (E = N, B = U, r = 0; A > r; r++) k[l + 3] = P = p * H >> W, 0 !== P ? (P = 255 / P, k[l] = (u * H >> W) * P, k[l + 1] = (f * H >> W) * P, k[l + 2] = (g * H >> W) * P) : k[l] = k[l + 1] = k[l + 2] = 0, u -= v, f -= m, g -= _, p -= K, v -= E.r, m -= E.g, _ -= E.b, K -= E.a, c = d + ((c = r + a + 1) < L ? c : L) << 2, y += E.r = k[c], S += E.g = k[c + 1], C += E.b = k[c + 2], x += E.a = k[c + 3], u += y, f += S, g += C, p += x, E = E.next, v += b = B.r, m += w = B.g, _ += F = B.b, K += P = B.a, y -= b, S -= w, C -= F, x -= P, B = B.next, l += 4;
                d += A
            }
            for (r = 0; A > r; r++) {
                for (S = C = x = y = f = g = p = u = 0, l = r << 2, v = I * (b = k[l]), m = I * (w = k[l + 1]), _ = I * (F = k[l + 2]), K = I * (P = k[l + 3]), u += R * b, f += R * w, g += R * F, p += R * P, O = N, o = 0; I > o; o++) O.r = b, O.g = w, O.b = F, O.a = P, O = O.next;
                for (h = A, o = 1; a >= o; o++) l = h + r << 2, u += (O.r = b = k[l]) * (T = I - o), f += (O.g = w = k[l + 1]) * T, g += (O.b = F = k[l + 2]) * T, p += (O.a = P = k[l + 3]) * T, y += b, S += w, C += F, x += P, O = O.next, G > o && (h += A);
                for (l = r, E = N, B = U, s = 0; M > s; s++) c = l << 2, k[c + 3] = P = p * H >> W, P > 0 ? (P = 255 / P, k[c] = (u * H >> W) * P, k[c + 1] = (f * H >> W) * P, k[c + 2] = (g * H >> W) * P) : k[c] = k[c + 1] = k[c + 2] = 0, u -= v, f -= m, g -= _, p -= K, v -= E.r, m -= E.g, _ -= E.b, K -= E.a, c = r + ((c = s + I) < G ? c : G) * A << 2, u += y += E.r = k[c], f += S += E.g = k[c + 1], g += C += E.b = k[c + 2], p += x += E.a = k[c + 3], E = E.next, v += b = B.r, m += w = B.g, _ += F = B.b, K += P = B.a, y -= b, S -= w, C -= F, x -= P, B = B.next, l += A
            }
        }
        var i = [512, 512, 456, 512, 328, 456, 335, 512, 405, 328, 271, 456, 388, 335, 292, 512, 454, 405, 364, 328, 298, 271, 496, 456, 420, 388, 360, 335, 312, 292, 273, 512, 482, 454, 428, 405, 383, 364, 345, 328, 312, 298, 284, 271, 259, 496, 475, 456, 437, 420, 404, 388, 374, 360, 347, 335, 323, 312, 302, 292, 282, 273, 265, 512, 497, 482, 468, 454, 441, 428, 417, 405, 394, 383, 373, 364, 354, 345, 337, 328, 320, 312, 305, 298, 291, 284, 278, 271, 265, 259, 507, 496, 485, 475, 465, 456, 446, 437, 428, 420, 412, 404, 396, 388, 381, 374, 367, 360, 354, 347, 341, 335, 329, 323, 318, 312, 307, 302, 297, 292, 287, 282, 278, 273, 269, 265, 261, 512, 505, 497, 489, 482, 475, 468, 461, 454, 447, 441, 435, 428, 422, 417, 411, 405, 399, 394, 389, 383, 378, 373, 368, 364, 359, 354, 350, 345, 341, 337, 332, 328, 324, 320, 316, 312, 309, 305, 301, 298, 294, 291, 287, 284, 281, 278, 274, 271, 268, 265, 262, 259, 257, 507, 501, 496, 491, 485, 480, 475, 470, 465, 460, 456, 451, 446, 442, 437, 433, 428, 424, 420, 416, 412, 408, 404, 400, 396, 392, 388, 385, 381, 377, 374, 370, 367, 363, 360, 357, 354, 350, 347, 344, 341, 338, 335, 332, 329, 326, 323, 320, 318, 315, 312, 310, 307, 304, 302, 299, 297, 294, 292, 289, 287, 285, 282, 280, 278, 275, 273, 271, 269, 267, 265, 263, 261, 259],
            n = [9, 11, 12, 13, 13, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24];
        Kinetic.Filters.Blur = function(t) {
            var i = Math.round(this.blurRadius());
            i > 0 && e(t, i)
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "blurRadius", 0, null, Kinetic.Factory.afterSetFilter)
    }(), function() {
        function t(t, e, i) {
            var n = 4 * (i * t.width + e),
                a = [];
            return a.push(t.data[n++], t.data[n++], t.data[n++], t.data[n++]), a
        }

        function e(t, e) {
            return Math.sqrt(Math.pow(t[0] - e[0], 2) + Math.pow(t[1] - e[1], 2) + Math.pow(t[2] - e[2], 2))
        }

        function i(t) {
            for (var e = [0, 0, 0], i = 0; i < t.length; i++) e[0] += t[i][0], e[1] += t[i][1], e[2] += t[i][2];
            return e[0] /= t.length, e[1] /= t.length, e[2] /= t.length, e
        }

        function n(n, a) {
            var r = t(n, 0, 0),
                s = t(n, n.width - 1, 0),
                o = t(n, 0, n.height - 1),
                c = t(n, n.width - 1, n.height - 1),
                h = a || 10;
            if (e(r, s) < h && e(s, c) < h && e(c, o) < h && e(o, r) < h) {
                for (var l = i([s, r, c, o]), d = [], u = 0; u < n.width * n.height; u++) {
                    var f = e(l, [n.data[4 * u], n.data[4 * u + 1], n.data[4 * u + 2]]);
                    d[u] = h > f ? 0 : 255
                }
                return d
            }
        }

        function a(t, e) {
            for (var i = 0; i < t.width * t.height; i++) t.data[4 * i + 3] = e[i]
        }

        function r(t, e, i) {
            for (var n = [1, 1, 1, 1, 0, 1, 1, 1, 1], a = Math.round(Math.sqrt(n.length)), r = Math.floor(a / 2), s = [], o = 0; i > o; o++)
                for (var c = 0; e > c; c++) {
                    for (var h = o * e + c, l = 0, d = 0; a > d; d++)
                        for (var u = 0; a > u; u++) {
                            var f = o + d - r,
                                g = c + u - r;
                            if (f >= 0 && i > f && g >= 0 && e > g) {
                                var p = f * e + g,
                                    v = n[d * a + u];
                                l += t[p] * v
                            }
                        }
                    s[h] = 2040 === l ? 255 : 0
                }
            return s
        }

        function s(t, e, i) {
            for (var n = [1, 1, 1, 1, 1, 1, 1, 1, 1], a = Math.round(Math.sqrt(n.length)), r = Math.floor(a / 2), s = [], o = 0; i > o; o++)
                for (var c = 0; e > c; c++) {
                    for (var h = o * e + c, l = 0, d = 0; a > d; d++)
                        for (var u = 0; a > u; u++) {
                            var f = o + d - r,
                                g = c + u - r;
                            if (f >= 0 && i > f && g >= 0 && e > g) {
                                var p = f * e + g,
                                    v = n[d * a + u];
                                l += t[p] * v
                            }
                        }
                    s[h] = l >= 1020 ? 255 : 0
                }
            return s
        }

        function o(t, e, i) {
            for (var n = [1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9], a = Math.round(Math.sqrt(n.length)), r = Math.floor(a / 2), s = [], o = 0; i > o; o++)
                for (var c = 0; e > c; c++) {
                    for (var h = o * e + c, l = 0, d = 0; a > d; d++)
                        for (var u = 0; a > u; u++) {
                            var f = o + d - r,
                                g = c + u - r;
                            if (f >= 0 && i > f && g >= 0 && e > g) {
                                var p = f * e + g,
                                    v = n[d * a + u];
                                l += t[p] * v
                            }
                        }
                    s[h] = l
                }
            return s
        }
        Kinetic.Filters.Mask = function(t) {
            var e = this.threshold(),
                i = n(t, e);
            return i && (i = r(i, t.width, t.height), i = s(i, t.width, t.height), i = o(i, t.width, t.height), a(t, i)), t
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "threshold", 0, null, Kinetic.Factory.afterSetFilter)
    }(), function() {
        Kinetic.Filters.RGB = function(t) {
            var e, i, n = t.data,
                a = n.length,
                r = this.red(),
                s = this.green(),
                o = this.blue();
            for (e = 0; a > e; e += 4) i = (.34 * n[e] + .5 * n[e + 1] + .16 * n[e + 2]) / 255, n[e] = i * r, n[e + 1] = i * s, n[e + 2] = i * o, n[e + 3] = n[e + 3]
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "red", 0, function(t) {
            return this._filterUpToDate = !1, t > 255 ? 255 : 0 > t ? 0 : Math.round(t)
        }), Kinetic.Factory.addGetterSetter(Kinetic.Node, "green", 0, function(t) {
            return this._filterUpToDate = !1, t > 255 ? 255 : 0 > t ? 0 : Math.round(t)
        }), Kinetic.Factory.addGetterSetter(Kinetic.Node, "blue", 0, Kinetic.Validators.RGBComponent, Kinetic.Factory.afterSetFilter)
    }(), function() {
        Kinetic.Filters.HSV = function(t) {
            var e, i, n, a, r, s = t.data,
                o = s.length,
                c = Math.pow(2, this.value()),
                h = Math.pow(2, this.saturation()),
                l = Math.abs(this.hue() + 360) % 360,
                d = c * h * Math.cos(l * Math.PI / 180),
                u = c * h * Math.sin(l * Math.PI / 180),
                f = .299 * c + .701 * d + .167 * u,
                g = .587 * c - .587 * d + .33 * u,
                p = .114 * c - .114 * d - .497 * u,
                v = .299 * c - .299 * d - .328 * u,
                m = .587 * c + .413 * d + .035 * u,
                _ = .114 * c - .114 * d + .293 * u,
                K = .299 * c - .3 * d + 1.25 * u,
                y = .587 * c - .586 * d - 1.05 * u,
                S = .114 * c + .886 * d - .2 * u;
            for (e = 0; o > e; e += 4) i = s[e + 0], n = s[e + 1], a = s[e + 2], r = s[e + 3], s[e + 0] = f * i + g * n + p * a, s[e + 1] = v * i + m * n + _ * a, s[e + 2] = K * i + y * n + S * a, s[e + 3] = r
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "hue", 0, null, Kinetic.Factory.afterSetFilter), Kinetic.Factory.addGetterSetter(Kinetic.Node, "saturation", 0, null, Kinetic.Factory.afterSetFilter), Kinetic.Factory.addGetterSetter(Kinetic.Node, "value", 0, null, Kinetic.Factory.afterSetFilter)
    }(), function() {
        Kinetic.Factory.addGetterSetter(Kinetic.Node, "hue", 0, null, Kinetic.Factory.afterSetFilter), Kinetic.Factory.addGetterSetter(Kinetic.Node, "saturation", 0, null, Kinetic.Factory.afterSetFilter), Kinetic.Factory.addGetterSetter(Kinetic.Node, "luminance", 0, null, Kinetic.Factory.afterSetFilter), Kinetic.Filters.HSL = function(t) {
            var e, i, n, a, r, s = t.data,
                o = s.length,
                c = 1,
                h = Math.pow(2, this.saturation()),
                l = Math.abs(this.hue() + 360) % 360,
                d = 127 * this.luminance(),
                u = c * h * Math.cos(l * Math.PI / 180),
                f = c * h * Math.sin(l * Math.PI / 180),
                g = .299 * c + .701 * u + .167 * f,
                p = .587 * c - .587 * u + .33 * f,
                v = .114 * c - .114 * u - .497 * f,
                m = .299 * c - .299 * u - .328 * f,
                _ = .587 * c + .413 * u + .035 * f,
                K = .114 * c - .114 * u + .293 * f,
                y = .299 * c - .3 * u + 1.25 * f,
                S = .587 * c - .586 * u - 1.05 * f,
                C = .114 * c + .886 * u - .2 * f;
            for (e = 0; o > e; e += 4) i = s[e + 0], n = s[e + 1], a = s[e + 2], r = s[e + 3], s[e + 0] = g * i + p * n + v * a + d, s[e + 1] = m * i + _ * n + K * a + d, s[e + 2] = y * i + S * n + C * a + d, s[e + 3] = r
        }
    }(), function() {
        Kinetic.Filters.Emboss = function(t) {
            var e = 10 * this.embossStrength(),
                i = 255 * this.embossWhiteLevel(),
                n = this.embossDirection(),
                a = this.embossBlend(),
                r = 0,
                s = 0,
                o = t.data,
                c = t.width,
                h = t.height,
                l = 4 * c,
                d = h;
            switch (n) {
                case "top-left":
                    r = -1, s = -1;
                    break;
                case "top":
                    r = -1, s = 0;
                    break;
                case "top-right":
                    r = -1, s = 1;
                    break;
                case "right":
                    r = 0, s = 1;
                    break;
                case "bottom-right":
                    r = 1, s = 1;
                    break;
                case "bottom":
                    r = 1, s = 0;
                    break;
                case "bottom-left":
                    r = 1, s = -1;
                    break;
                case "left":
                    r = 0, s = -1
            }
            do {
                var u = (d - 1) * l,
                    f = r;
                1 > d + f && (f = 0), d + f > h && (f = 0);
                var g = (d - 1 + f) * c * 4,
                    p = c;
                do {
                    var v = u + 4 * (p - 1),
                        m = s;
                    1 > p + m && (m = 0), p + m > c && (m = 0);
                    var _ = g + 4 * (p - 1 + m),
                        K = o[v] - o[_],
                        y = o[v + 1] - o[_ + 1],
                        S = o[v + 2] - o[_ + 2],
                        C = K,
                        x = C > 0 ? C : -C,
                        b = y > 0 ? y : -y,
                        w = S > 0 ? S : -S;
                    if (b > x && (C = y), w > x && (C = S), C *= e, a) {
                        var F = o[v] + C,
                            P = o[v + 1] + C,
                            T = o[v + 2] + C;
                        o[v] = F > 255 ? 255 : 0 > F ? 0 : F, o[v + 1] = P > 255 ? 255 : 0 > P ? 0 : P, o[v + 2] = T > 255 ? 255 : 0 > T ? 0 : T
                    } else {
                        var k = i - C;
                        0 > k ? k = 0 : k > 255 && (k = 255), o[v] = o[v + 1] = o[v + 2] = k
                    }
                } while (--p)
            } while (--d)
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "embossStrength", .5, null, Kinetic.Factory.afterSetFilter), Kinetic.Factory.addGetterSetter(Kinetic.Node, "embossWhiteLevel", .5, null, Kinetic.Factory.afterSetFilter), Kinetic.Factory.addGetterSetter(Kinetic.Node, "embossDirection", "top-left", null, Kinetic.Factory.afterSetFilter), Kinetic.Factory.addGetterSetter(Kinetic.Node, "embossBlend", !1, null, Kinetic.Factory.afterSetFilter)
    }(), function() {
        function t(t, e, i, n, a) {
            var r, s = i - e,
                o = a - n;
            return 0 === s ? n + o / 2 : 0 === o ? n : (r = (t - e) / s, r = o * r + n)
        }
        Kinetic.Filters.Enhance = function(e) {
            var i, n, a, r, s = e.data,
                o = s.length,
                c = s[0],
                h = c,
                l = s[1],
                d = l,
                u = s[2],
                f = u,
                g = this.enhance();
            if (0 !== g) {
                for (r = 0; o > r; r += 4) i = s[r + 0], c > i ? c = i : i > h && (h = i), n = s[r + 1], l > n ? l = n : n > d && (d = n), a = s[r + 2], u > a ? u = a : a > f && (f = a);
                h === c && (h = 255, c = 0), d === l && (d = 255, l = 0), f === u && (f = 255, u = 0);
                var p, v, m, _, K, y, S, C, x;
                for (g > 0 ? (v = h + g * (255 - h), m = c - g * (c - 0), K = d + g * (255 - d), y = l - g * (l - 0), C = f + g * (255 - f), x = u - g * (u - 0)) : (p = .5 * (h + c), v = h + g * (h - p), m = c + g * (c - p), _ = .5 * (d + l), K = d + g * (d - _), y = l + g * (l - _), S = .5 * (f + u), C = f + g * (f - S), x = u + g * (u - S)), r = 0; o > r; r += 4) s[r + 0] = t(s[r + 0], c, h, m, v), s[r + 1] = t(s[r + 1], l, d, y, K), s[r + 2] = t(s[r + 2], u, f, x, C)
            }
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "enhance", 0, null, Kinetic.Factory.afterSetFilter)
    }(), function() {
        Kinetic.Filters.Posterize = function(t) {
            var e, i = Math.round(254 * this.levels()) + 1,
                n = t.data,
                a = n.length,
                r = 255 / i;
            for (e = 0; a > e; e += 1) n[e] = Math.floor(n[e] / r) * r
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "levels", .5, null, Kinetic.Factory.afterSetFilter)
    }(), function() {
        Kinetic.Filters.Noise = function(t) {
            var e, i = 255 * this.noise(),
                n = t.data,
                a = n.length,
                r = i / 2;
            for (e = 0; a > e; e += 4) n[e + 0] += r - 2 * r * Math.random(), n[e + 1] += r - 2 * r * Math.random(), n[e + 2] += r - 2 * r * Math.random()
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "noise", .2, null, Kinetic.Factory.afterSetFilter)
    }(), function() {
        Kinetic.Filters.Pixelate = function(t) {
            var e, i, n, a, r, s, o, c, h, l, d, u, f, g, p = Math.ceil(this.pixelSize()),
                v = t.width,
                m = t.height,
                _ = Math.ceil(v / p),
                K = Math.ceil(m / p);
            for (t = t.data, u = 0; _ > u; u += 1)
                for (f = 0; K > f; f += 1) {
                    for (a = 0, r = 0, s = 0, o = 0, c = u * p, h = c + p, l = f * p, d = l + p, g = 0, e = c; h > e; e += 1)
                        if (!(e >= v))
                            for (i = l; d > i; i += 1) i >= m || (n = 4 * (v * i + e), a += t[n + 0], r += t[n + 1], s += t[n + 2], o += t[n + 3], g += 1);
                    for (a /= g, r /= g, s /= g, e = c; h > e; e += 1)
                        if (!(e >= v))
                            for (i = l; d > i; i += 1) i >= m || (n = 4 * (v * i + e), t[n + 0] = a, t[n + 1] = r, t[n + 2] = s, t[n + 3] = o)
                }
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "pixelSize", 8, null, Kinetic.Factory.afterSetFilter)
    }(), function() {
        Kinetic.Filters.Threshold = function(t) {
            var e, i = 255 * this.threshold(),
                n = t.data,
                a = n.length;
            for (e = 0; a > e; e += 1) n[e] = n[e] < i ? 0 : 255
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "threshold", .5, null, Kinetic.Factory.afterSetFilter)
    }(), function() {
        Kinetic.Filters.Sepia = function(t) {
            var e, i, n, a, r, s, o, c, h, l = t.data,
                d = t.width,
                u = t.height,
                f = 4 * d;
            do {
                e = (u - 1) * f, i = d;
                do n = e + 4 * (i - 1), a = l[n], r = l[n + 1], s = l[n + 2], o = .393 * a + .769 * r + .189 * s, c = .349 * a + .686 * r + .168 * s, h = .272 * a + .534 * r + .131 * s, l[n] = o > 255 ? 255 : o, l[n + 1] = c > 255 ? 255 : c, l[n + 2] = h > 255 ? 255 : h, l[n + 3] = l[n + 3]; while (--i)
            } while (--u)
        }
    }(), function() {
        Kinetic.Filters.Solarize = function(t) {
            var e = t.data,
                i = t.width,
                n = t.height,
                a = 4 * i,
                r = n;
            do {
                var s = (r - 1) * a,
                    o = i;
                do {
                    var c = s + 4 * (o - 1),
                        h = e[c],
                        l = e[c + 1],
                        d = e[c + 2];
                    h > 127 && (h = 255 - h), l > 127 && (l = 255 - l), d > 127 && (d = 255 - d), e[c] = h, e[c + 1] = l, e[c + 2] = d
                } while (--o)
            } while (--r)
        }
    }(), function() {
        var t = function(t, e, i) {
                var n, a, r, s, o = t.data,
                    c = e.data,
                    h = t.width,
                    l = t.height,
                    d = i.polarCenterX || h / 2,
                    u = i.polarCenterY || l / 2,
                    f = 0,
                    g = 0,
                    p = 0,
                    v = 0,
                    m = Math.sqrt(d * d + u * u);
                a = h - d, r = l - u, s = Math.sqrt(a * a + r * r), m = s > m ? s : m;
                var _, K, y, S, C = l,
                    x = h,
                    b = 360 / x * Math.PI / 180;
                for (K = 0; x > K; K += 1)
                    for (y = Math.sin(K * b), S = Math.cos(K * b), _ = 0; C > _; _ += 1) a = Math.floor(d + m * _ / C * S), r = Math.floor(u + m * _ / C * y), n = 4 * (r * h + a), f = o[n + 0], g = o[n + 1], p = o[n + 2], v = o[n + 3], n = 4 * (K + _ * h), c[n + 0] = f, c[n + 1] = g, c[n + 2] = p, c[n + 3] = v
            },
            e = function(t, e, i) {
                var n, a, r, s, o, c, h = t.data,
                    l = e.data,
                    d = t.width,
                    u = t.height,
                    f = i.polarCenterX || d / 2,
                    g = i.polarCenterY || u / 2,
                    p = 0,
                    v = 0,
                    m = 0,
                    _ = 0,
                    K = Math.sqrt(f * f + g * g);
                a = d - f, r = u - g, c = Math.sqrt(a * a + r * r), K = c > K ? c : K;
                var y, S, C, x, b = u,
                    w = d,
                    F = i.polarRotation || 0;
                for (a = 0; d > a; a += 1)
                    for (r = 0; u > r; r += 1) s = a - f, o = r - g, y = Math.sqrt(s * s + o * o) * b / K, S = (180 * Math.atan2(o, s) / Math.PI + 360 + F) % 360, S = S * w / 360, C = Math.floor(S), x = Math.floor(y), n = 4 * (x * d + C), p = h[n + 0], v = h[n + 1], m = h[n + 2], _ = h[n + 3], n = 4 * (r * d + a), l[n + 0] = p, l[n + 1] = v, l[n + 2] = m, l[n + 3] = _
            },
            i = Kinetic.Util.createCanvasElement();
        Kinetic.Filters.Kaleidoscope = function(n) {
            var a, r, s, o, c, h, l, d, u, f, g = n.width,
                p = n.height,
                v = Math.round(this.kaleidoscopePower()),
                m = Math.round(this.kaleidoscopeAngle()),
                _ = Math.floor(g * (m % 360) / 360);
            if (!(1 > v)) {
                i.width = g, i.height = p;
                var K = i.getContext("2d").getImageData(0, 0, g, p);
                t(n, K, {
                    polarCenterX: g / 2,
                    polarCenterY: p / 2
                });
                for (var y = g / Math.pow(2, v); 8 >= y;) y = 2 * y, v -= 1;
                y = Math.ceil(y);
                var S = y,
                    C = 0,
                    x = S,
                    b = 1;
                for (_ + y > g && (C = S, x = 0, b = -1), r = 0; p > r; r += 1)
                    for (a = C; a !== x; a += b) s = Math.round(a + _) % g, u = 4 * (g * r + s), c = K.data[u + 0], h = K.data[u + 1], l = K.data[u + 2], d = K.data[u + 3], f = 4 * (g * r + a), K.data[f + 0] = c, K.data[f + 1] = h, K.data[f + 2] = l, K.data[f + 3] = d;
                for (r = 0; p > r; r += 1)
                    for (S = Math.floor(y), o = 0; v > o; o += 1) {
                        for (a = 0; S + 1 > a; a += 1) u = 4 * (g * r + a), c = K.data[u + 0], h = K.data[u + 1], l = K.data[u + 2], d = K.data[u + 3], f = 4 * (g * r + 2 * S - a - 1), K.data[f + 0] = c, K.data[f + 1] = h, K.data[f + 2] = l, K.data[f + 3] = d;
                        S *= 2
                    }
                e(K, n, {
                    polarRotation: 0
                })
            }
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "kaleidoscopePower", 2, null, Kinetic.Factory.afterSetFilter), Kinetic.Factory.addGetterSetter(Kinetic.Node, "kaleidoscopeAngle", 0, null, Kinetic.Factory.afterSetFilter)
    }(), function() {
        function t(t) {
            setTimeout(t, 1e3 / 60)
        }

        function e() {
            return a.apply(Kinetic.root, arguments)
        }
        var i = 500,
            n = function() {
                return Kinetic.root.performance && Kinetic.root.performance.now ? function() {
                    return Kinetic.root.performance.now()
                } : function() {
                    return (new Date).getTime()
                }
            }(),
            a = function() {
                return Kinetic.root.requestAnimationFrame || Kinetic.root.webkitRequestAnimationFrame || Kinetic.root.mozRequestAnimationFrame || Kinetic.root.oRequestAnimationFrame || Kinetic.root.msRequestAnimationFrame || t
            }();
        Kinetic.Animation = function(t, e) {
            var i = Kinetic.Animation;
            this.func = t, this.setLayers(e), this.id = i.animIdCounter++, this.frame = {
                time: 0,
                timeDiff: 0,
                lastTime: n()
            }
        }, Kinetic.Animation.prototype = {
            setLayers: function(t) {
                var e = [];
                e = t ? t.length > 0 ? t : [t] : [], this.layers = e
            },
            getLayers: function() {
                return this.layers
            },
            addLayer: function(t) {
                var e, i, n = this.layers;
                if (n) {
                    for (e = n.length, i = 0; e > i; i++)
                        if (n[i]._id === t._id) return !1
                } else this.layers = [];
                return this.layers.push(t), !0
            },
            isRunning: function() {
                var t, e = Kinetic.Animation,
                    i = e.animations,
                    n = i.length;
                for (t = 0; n > t; t++)
                    if (i[t].id === this.id) return !0;
                return !1
            },
            start: function() {
                var t = Kinetic.Animation;
                this.stop(), this.frame.timeDiff = 0, this.frame.lastTime = n(), t._addAnimation(this)
            },
            stop: function() {
                Kinetic.Animation._removeAnimation(this)
            },
            _updateFrameObject: function(t) {
                this.frame.timeDiff = t - this.frame.lastTime, this.frame.lastTime = t, this.frame.time += this.frame.timeDiff, this.frame.frameRate = 1e3 / this.frame.timeDiff
            }
        }, Kinetic.Animation.animations = [], Kinetic.Animation.animIdCounter = 0, Kinetic.Animation.animRunning = !1, Kinetic.Animation._addAnimation = function(t) {
            this.animations.push(t), this._handleAnimation()
        }, Kinetic.Animation._removeAnimation = function(t) {
            var e, i = t.id,
                n = this.animations,
                a = n.length;
            for (e = 0; a > e; e++)
                if (n[e].id === i) {
                    this.animations.splice(e, 1);
                    break
                }
        }, Kinetic.Animation._runFrames = function() {
            var t, e, i, a, r, s, o, c, h, l = {},
                d = this.animations;
            for (a = 0; a < d.length; a++)
                if (t = d[a], e = t.layers, i = t.func, t._updateFrameObject(n()), s = e.length, h = i ? i.call(t, t.frame) !== !1 : !0)
                    for (r = 0; s > r; r++) o = e[r], void 0 !== o._id && (l[o._id] = o);
            for (c in l) l[c].draw()
        }, Kinetic.Animation._animationLoop = function() {
            var t = Kinetic.Animation;
            t.animations.length ? (e(t._animationLoop), t._runFrames()) : t.animRunning = !1
        }, Kinetic.Animation._handleAnimation = function() {
            var t = this;
            this.animRunning || (this.animRunning = !0, t._animationLoop())
        };
        var r = Kinetic.Node.prototype.moveTo;
        Kinetic.Node.prototype.moveTo = function(t) {
            r.call(this, t)
        }, Kinetic.BaseLayer.prototype.batchDraw = function() {
            var t = this,
                e = Kinetic.Animation;
            this.batchAnim || (this.batchAnim = new e(function() {
                t.lastBatchDrawTime && n() - t.lastBatchDrawTime > i && t.batchAnim.stop()
            }, this)), this.lastBatchDrawTime = n(), this.batchAnim.isRunning() || (this.draw(), this.batchAnim.start())
        }, Kinetic.Stage.prototype.batchDraw = function() {
            this.getChildren().each(function(t) {
                t.batchDraw()
            })
        }
    }(this), function() {
        var t = {
                node: 1,
                duration: 1,
                easing: 1,
                onFinish: 1,
                yoyo: 1
            },
            e = 1,
            i = 2,
            n = 3,
            a = 0;
        Kinetic.Tween = function(e) {
            var i, n, s = this,
                o = e.node,
                c = o._id,
                h = e.easing || Kinetic.Easings.Linear,
                l = !!e.yoyo;
            i = "undefined" == typeof e.duration ? 1 : 0 === e.duration ? .001 : e.duration, this.node = o, this._id = a++, this.anim = new Kinetic.Animation(function() {
                s.tween.onEnterFrame()
            }, o.getLayer() || (o instanceof Kinetic.Stage ? o.getLayers() : null)), this.tween = new r(n, function(t) {
                s._tweenFunc(t)
            }, h, 0, 1, 1e3 * i, l), this._addListeners(), Kinetic.Tween.attrs[c] || (Kinetic.Tween.attrs[c] = {}), Kinetic.Tween.attrs[c][this._id] || (Kinetic.Tween.attrs[c][this._id] = {}), Kinetic.Tween.tweens[c] || (Kinetic.Tween.tweens[c] = {});
            for (n in e) void 0 === t[n] && this._addAttr(n, e[n]);
            this.reset(), this.onFinish = e.onFinish, this.onReset = e.onReset
        }, Kinetic.Tween.attrs = {}, Kinetic.Tween.tweens = {}, Kinetic.Tween.prototype = {
            _addAttr: function(t, e) {
                var i, n, a, r, s, o = this.node,
                    c = o._id;
                if (a = Kinetic.Tween.tweens[c][t], a && delete Kinetic.Tween.attrs[c][a][t], i = o.getAttr(t), Kinetic.Util._isArray(e))
                    for (n = [], s = e.length, r = 0; s > r; r++) n.push(e[r] - i[r]);
                else n = e - i;
                Kinetic.Tween.attrs[c][this._id][t] = {
                    start: i,
                    diff: n
                }, Kinetic.Tween.tweens[c][t] = this._id
            },
            _tweenFunc: function(t) {
                var e, i, n, a, r, s, o, c = this.node,
                    h = Kinetic.Tween.attrs[c._id][this._id];
                for (e in h) {
                    if (i = h[e], n = i.start, a = i.diff, Kinetic.Util._isArray(n))
                        for (r = [], o = n.length, s = 0; o > s; s++) r.push(n[s] + a[s] * t);
                    else r = n + a * t;
                    c.setAttr(e, r)
                }
            },
            _addListeners: function() {
                var t = this;
                this.tween.onPlay = function() {
                    t.anim.start()
                }, this.tween.onReverse = function() {
                    t.anim.start()
                }, this.tween.onPause = function() {
                    t.anim.stop()
                }, this.tween.onFinish = function() {
                    t.onFinish && t.onFinish()
                }, this.tween.onReset = function() {
                    t.onReset && t.onReset()
                }
            },
            play: function() {
                return this.tween.play(), this
            },
            reverse: function() {
                return this.tween.reverse(), this
            },
            reset: function() {
                return this.tween.reset(), this
            },
            seek: function(t) {
                return this.tween.seek(1e3 * t), this
            },
            pause: function() {
                return this.tween.pause(), this
            },
            finish: function() {
                return this.tween.finish(), this
            },
            destroy: function() {
                var t, e = this.node._id,
                    i = this._id,
                    n = Kinetic.Tween.tweens[e];
                this.pause();
                for (t in n) delete Kinetic.Tween.tweens[e][t];
                delete Kinetic.Tween.attrs[e][i]
            }
        };
        var r = function(t, e, i, n, a, r, s) {
            this.prop = t, this.propFunc = e, this.begin = n, this._pos = n, this.duration = r, this._change = 0, this.prevPos = 0, this.yoyo = s, this._time = 0, this._position = 0, this._startTime = 0, this._finish = 0, this.func = i, this._change = a - this.begin, this.pause()
        };
        r.prototype = {
            fire: function(t) {
                var e = this[t];
                e && e()
            },
            setTime: function(t) {
                t > this.duration ? this.yoyo ? (this._time = this.duration, this.reverse()) : this.finish() : 0 > t ? this.yoyo ? (this._time = 0, this.play()) : this.reset() : (this._time = t, this.update())
            },
            getTime: function() {
                return this._time
            },
            setPosition: function(t) {
                this.prevPos = this._pos, this.propFunc(t), this._pos = t
            },
            getPosition: function(t) {
                return void 0 === t && (t = this._time), this.func(t, this.begin, this._change, this.duration)
            },
            play: function() {
                this.state = i, this._startTime = this.getTimer() - this._time, this.onEnterFrame(), this.fire("onPlay")
            },
            reverse: function() {
                this.state = n, this._time = this.duration - this._time, this._startTime = this.getTimer() - this._time, this.onEnterFrame(), this.fire("onReverse")
            },
            seek: function(t) {
                this.pause(), this._time = t, this.update(), this.fire("onSeek")
            },
            reset: function() {
                this.pause(), this._time = 0, this.update(), this.fire("onReset")
            },
            finish: function() {
                this.pause(), this._time = this.duration, this.update(), this.fire("onFinish")
            },
            update: function() {
                this.setPosition(this.getPosition(this._time))
            },
            onEnterFrame: function() {
                var t = this.getTimer() - this._startTime;
                this.state === i ? this.setTime(t) : this.state === n && this.setTime(this.duration - t)
            },
            pause: function() {
                this.state = e, this.fire("onPause")
            },
            getTimer: function() {
                return (new Date).getTime()
            }
        }, Kinetic.Easings = {
            BackEaseIn: function(t, e, i, n) {
                var a = 1.70158;
                return i * (t /= n) * t * ((a + 1) * t - a) + e
            },
            BackEaseOut: function(t, e, i, n) {
                var a = 1.70158;
                return i * ((t = t / n - 1) * t * ((a + 1) * t + a) + 1) + e
            },
            BackEaseInOut: function(t, e, i, n) {
                var a = 1.70158;
                return (t /= n / 2) < 1 ? i / 2 * t * t * (((a *= 1.525) + 1) * t - a) + e : i / 2 * ((t -= 2) * t * (((a *= 1.525) + 1) * t + a) + 2) + e
            },
            ElasticEaseIn: function(t, e, i, n, a, r) {
                var s = 0;
                return 0 === t ? e : 1 == (t /= n) ? e + i : (r || (r = .3 * n), !a || a < Math.abs(i) ? (a = i, s = r / 4) : s = r / (2 * Math.PI) * Math.asin(i / a), -(a * Math.pow(2, 10 * (t -= 1)) * Math.sin(2 * (t * n - s) * Math.PI / r)) + e)
            },
            ElasticEaseOut: function(t, e, i, n, a, r) {
                var s = 0;
                return 0 === t ? e : 1 == (t /= n) ? e + i : (r || (r = .3 * n), !a || a < Math.abs(i) ? (a = i, s = r / 4) : s = r / (2 * Math.PI) * Math.asin(i / a), a * Math.pow(2, -10 * t) * Math.sin(2 * (t * n - s) * Math.PI / r) + i + e)
            },
            ElasticEaseInOut: function(t, e, i, n, a, r) {
                var s = 0;
                return 0 === t ? e : 2 == (t /= n / 2) ? e + i : (r || (r = .3 * n * 1.5), !a || a < Math.abs(i) ? (a = i, s = r / 4) : s = r / (2 * Math.PI) * Math.asin(i / a), 1 > t ? -.5 * a * Math.pow(2, 10 * (t -= 1)) * Math.sin(2 * (t * n - s) * Math.PI / r) + e : a * Math.pow(2, -10 * (t -= 1)) * Math.sin(2 * (t * n - s) * Math.PI / r) * .5 + i + e)
            },
            BounceEaseOut: function(t, e, i, n) {
                return (t /= n) < 1 / 2.75 ? 7.5625 * i * t * t + e : 2 / 2.75 > t ? i * (7.5625 * (t -= 1.5 / 2.75) * t + .75) + e : 2.5 / 2.75 > t ? i * (7.5625 * (t -= 2.25 / 2.75) * t + .9375) + e : i * (7.5625 * (t -= 2.625 / 2.75) * t + .984375) + e
            },
            BounceEaseIn: function(t, e, i, n) {
                return i - Kinetic.Easings.BounceEaseOut(n - t, 0, i, n) + e
            },
            BounceEaseInOut: function(t, e, i, n) {
                return n / 2 > t ? .5 * Kinetic.Easings.BounceEaseIn(2 * t, 0, i, n) + e : .5 * Kinetic.Easings.BounceEaseOut(2 * t - n, 0, i, n) + .5 * i + e
            },
            EaseIn: function(t, e, i, n) {
                return i * (t /= n) * t + e
            },
            EaseOut: function(t, e, i, n) {
                return -i * (t /= n) * (t - 2) + e
            },
            EaseInOut: function(t, e, i, n) {
                return (t /= n / 2) < 1 ? i / 2 * t * t + e : -i / 2 * (--t * (t - 2) - 1) + e
            },
            StrongEaseIn: function(t, e, i, n) {
                return i * (t /= n) * t * t * t * t + e
            },
            StrongEaseOut: function(t, e, i, n) {
                return i * ((t = t / n - 1) * t * t * t * t + 1) + e
            },
            StrongEaseInOut: function(t, e, i, n) {
                return (t /= n / 2) < 1 ? i / 2 * t * t * t * t * t + e : i / 2 * ((t -= 2) * t * t * t * t + 2) + e
            },
            Linear: function(t, e, i, n) {
                return i * t / n + e
            }
        }
    }(), function() {
        Kinetic.DD = {
            anim: new Kinetic.Animation(function() {
                var t = this.dirty;
                return this.dirty = !1, t
            }),
            isDragging: !1,
            justDragged: !1,
            offset: {
                x: 0,
                y: 0
            },
            node: null,
            _drag: function(t) {
                var e = Kinetic.DD,
                    i = e.node;
                if (i) {
                    if (!e.isDragging) {
                        var n = i.getStage().getPointerPosition(),
                            a = i.dragDistance(),
                            r = Math.max(Math.abs(n.x - e.startPointerPos.x), Math.abs(n.y - e.startPointerPos.y));
                        if (a > r) return
                    }
                    i._setDragPosition(t), e.isDragging || (e.isDragging = !0, i.fire("dragstart", {
                        type: "dragstart",
                        target: i,
                        evt: t
                    }, !0)), i.fire("dragmove", {
                        type: "dragmove",
                        target: i,
                        evt: t
                    }, !0)
                }
            },
            _endDragBefore: function(t) {
                var e, i, n = Kinetic.DD,
                    a = n.node;
                a && (e = a.nodeType, i = a.getLayer(), n.anim.stop(), n.isDragging && (n.isDragging = !1, n.justDragged = !0, Kinetic.listenClickTap = !1, t && (t.dragEndNode = a)), delete n.node, (i || a).draw())
            },
            _endDragAfter: function(t) {
                t = t || {};
                var e = t.dragEndNode;
                t && e && e.fire("dragend", {
                    type: "dragend",
                    target: e,
                    evt: t
                }, !0)
            }
        }, Kinetic.Node.prototype.startDrag = function() {
            var t = Kinetic.DD,
                e = this.getStage(),
                i = this.getLayer(),
                n = e.getPointerPosition(),
                a = this.getAbsolutePosition();
            n && (t.node && t.node.stopDrag(), t.node = this, t.startPointerPos = n, t.offset.x = n.x - a.x, t.offset.y = n.y - a.y, t.anim.setLayers(i || this.getLayers()), t.anim.start(), this._setDragPosition())
        }, Kinetic.Node.prototype._setDragPosition = function(t) {
            var e = Kinetic.DD,
                i = this.getStage().getPointerPosition(),
                n = this.getDragBoundFunc();
            if (i) {
                var a = {
                    x: i.x - e.offset.x,
                    y: i.y - e.offset.y
                };
                void 0 !== n && (a = n.call(this, a, t)), this.setAbsolutePosition(a), this._lastPos && this._lastPos.x === a.x && this._lastPos.y === a.y || (e.anim.dirty = !0), this._lastPos = a
            }
        }, Kinetic.Node.prototype.stopDrag = function() {
            var t = Kinetic.DD,
                e = {};
            t._endDragBefore(e), t._endDragAfter(e)
        }, Kinetic.Node.prototype.setDraggable = function(t) {
            this._setAttr("draggable", t), this._dragChange()
        };
        var t = Kinetic.Node.prototype.destroy;
        Kinetic.Node.prototype.destroy = function() {
            var e = Kinetic.DD;
            e.node && e.node._id === this._id && this.stopDrag(), t.call(this)
        }, Kinetic.Node.prototype.isDragging = function() {
            var t = Kinetic.DD;
            return !(!t.node || t.node._id !== this._id || !t.isDragging)
        }, Kinetic.Node.prototype._listenDrag = function() {
            var t = this;
            this._dragCleanup(), "Stage" === this.getClassName() ? this.on("contentMousedown.kinetic contentTouchstart.kinetic", function(e) {
                Kinetic.DD.node || t.startDrag(e)
            }) : this.on("mousedown.kinetic touchstart.kinetic", function(e) {
                1 !== e.evt.button && 2 !== e.evt.button && (Kinetic.DD.node || t.startDrag(e))
            })
        }, Kinetic.Node.prototype._dragChange = function() {
            if (this.attrs.draggable) this._listenDrag();
            else {
                this._dragCleanup();
                var t = this.getStage(),
                    e = Kinetic.DD;
                t && e.node && e.node._id === this._id && e.node.stopDrag()
            }
        }, Kinetic.Node.prototype._dragCleanup = function() {
            "Stage" === this.getClassName() ? (this.off("contentMousedown.kinetic"), this.off("contentTouchstart.kinetic")) : (this.off("mousedown.kinetic"), this.off("touchstart.kinetic"))
        }, Kinetic.Factory.addGetterSetter(Kinetic.Node, "dragBoundFunc"), Kinetic.Factory.addGetter(Kinetic.Node, "draggable", !1), Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Node, "draggable");
        var e = Kinetic.document.documentElement;
        e.addEventListener("mouseup", Kinetic.DD._endDragBefore, !0), e.addEventListener("touchend", Kinetic.DD._endDragBefore, !0), e.addEventListener("mouseup", Kinetic.DD._endDragAfter, !1), e.addEventListener("touchend", Kinetic.DD._endDragAfter, !1)
    }(), function() {
        Kinetic.Util.addMethods(Kinetic.Container, {
            __init: function(t) {
                this.children = new Kinetic.Collection, Kinetic.Node.call(this, t)
            },
            getChildren: function(t) {
                if (t) {
                    var e = new Kinetic.Collection;
                    return this.children.each(function(i) {
                        t(i) && e.push(i)
                    }), e
                }
                return this.children
            },
            hasChildren: function() {
                return this.getChildren().length > 0
            },
            removeChildren: function() {
                for (var t, e = Kinetic.Collection.toCollection(this.children), i = 0; i < e.length; i++) t = e[i], delete t.parent, t.index = 0, t.hasChildren() && t.removeChildren(), t.remove();
                return e = null, this.children = new Kinetic.Collection, this
            },
            destroyChildren: function() {
                for (var t, e = Kinetic.Collection.toCollection(this.children), i = 0; i < e.length; i++) t = e[i], delete t.parent, t.index = 0, t.destroy();
                return e = null, this.children = new Kinetic.Collection, this
            },
            add: function(t) {
                if (arguments.length > 1) {
                    for (var e = 0; e < arguments.length; e++) this.add(arguments[e]);
                    return this
                }
                if (t.getParent()) return t.moveTo(this), this;
                var i = this.children;
                return this._validateAdd(t), t.index = i.length, t.parent = this, i.push(t), this._fire("add", {
                    child: t
                }), this
            },
            destroy: function() {
                this.hasChildren() && this.destroyChildren(), Kinetic.Node.prototype.destroy.call(this)
            },
            find: function(t) {
                var e, i, n, a, r, s, o, c = [],
                    h = t.replace(/ /g, "").split(","),
                    l = h.length;
                for (e = 0; l > e; e++)
                    if (n = h[e], "#" === n.charAt(0)) r = this._getNodeById(n.slice(1)), r && c.push(r);
                    else if ("." === n.charAt(0)) a = this._getNodesByName(n.slice(1)), c = c.concat(a);
                else
                    for (s = this.getChildren(), o = s.length, i = 0; o > i; i++) c = c.concat(s[i]._get(n));
                return Kinetic.Collection.toCollection(c)
            },
            _getNodeById: function(t) {
                var e = Kinetic.ids[t];
                return void 0 !== e && this.isAncestorOf(e) ? e : null
            },
            _getNodesByName: function(t) {
                var e = Kinetic.names[t] || [];
                return this._getDescendants(e)
            },
            _get: function(t) {
                for (var e = Kinetic.Node.prototype._get.call(this, t), i = this.getChildren(), n = i.length, a = 0; n > a; a++) e = e.concat(i[a]._get(t));
                return e
            },
            toObject: function() {
                var t = Kinetic.Node.prototype.toObject.call(this);
                t.children = [];
                for (var e = this.getChildren(), i = e.length, n = 0; i > n; n++) {
                    var a = e[n];
                    t.children.push(a.toObject())
                }
                return t
            },
            _getDescendants: function(t) {
                for (var e = [], i = t.length, n = 0; i > n; n++) {
                    var a = t[n];
                    this.isAncestorOf(a) && e.push(a)
                }
                return e
            },
            isAncestorOf: function(t) {
                for (var e = t.getParent(); e;) {
                    if (e._id === this._id) return !0;
                    e = e.getParent()
                }
                return !1
            },
            clone: function(t) {
                var e = Kinetic.Node.prototype.clone.call(this, t);
                return this.getChildren().each(function(t) {
                    e.add(t.clone())
                }), e
            },
            getAllIntersections: function(t) {
                var e = [];
                return this.find("Shape").each(function(i) {
                    i.isVisible() && i.intersects(t) && e.push(i)
                }), e
            },
            _setChildrenIndices: function() {
                this.children.each(function(t, e) {
                    t.index = e
                })
            },
            drawScene: function(t, e) {
                var i = this.getLayer(),
                    n = t || i && i.getCanvas(),
                    a = n && n.getContext(),
                    r = this._cache.canvas,
                    s = r && r.scene;
                return this.isVisible() && (s ? this._drawCachedSceneCanvas(a) : this._drawChildren(n, "drawScene", e)), this
            },
            drawHit: function(t, e) {
                var i = this.getLayer(),
                    n = t || i && i.hitCanvas,
                    a = n && n.getContext(),
                    r = this._cache.canvas,
                    s = r && r.hit;
                return this.shouldDrawHit(n) && (i && i.clearHitCache(), s ? this._drawCachedHitCanvas(a) : this._drawChildren(n, "drawHit", e)), this
            },
            _drawChildren: function(t, e, i) {
                var n, a, r = this.getLayer(),
                    s = t && t.getContext(),
                    o = this.getClipWidth(),
                    c = this.getClipHeight(),
                    h = o && c;
                h && r && (n = this.getClipX(), a = this.getClipY(), s.save(), r._applyTransform(this, s), s.beginPath(), s.rect(n, a, o, c), s.clip(), s.reset()), this.children.each(function(n) {
                    n[e](t, i)
                }), h && s.restore()
            },
            shouldDrawHit: function(t) {
                var e = this.getLayer();
                return t && t.isCache || e && e.hitGraphEnabled() && this.isVisible() && !Kinetic.isDragging()
            }
        }), Kinetic.Util.extend(Kinetic.Container, Kinetic.Node), Kinetic.Container.prototype.get = Kinetic.Container.prototype.find, Kinetic.Factory.addComponentsGetterSetter(Kinetic.Container, "clip", ["x", "y", "width", "height"]), Kinetic.Factory.addGetterSetter(Kinetic.Container, "clipX"), Kinetic.Factory.addGetterSetter(Kinetic.Container, "clipY"), Kinetic.Factory.addGetterSetter(Kinetic.Container, "clipWidth"), Kinetic.Factory.addGetterSetter(Kinetic.Container, "clipHeight"), Kinetic.Collection.mapMethods(Kinetic.Container)
    }(), function() {
        function t(t) {
            t.fill()
        }

        function e(t) {
            t.stroke()
        }

        function i(t) {
            t.fill()
        }

        function n(t) {
            t.stroke()
        }

        function a() {
            this._clearCache(r)
        }
        var r = "hasShadow";
        Kinetic.Util.addMethods(Kinetic.Shape, {
            __init: function(r) {
                this.nodeType = "Shape", this._fillFunc = t, this._strokeFunc = e, this._fillFuncHit = i, this._strokeFuncHit = n;
                for (var s, o = Kinetic.shapes; s = Kinetic.Util.getRandomColor(), !s || s in o;);
                this.colorKey = s, o[s] = this, Kinetic.Node.call(this, r), this.on("shadowColorChange.kinetic shadowBlurChange.kinetic shadowOffsetChange.kinetic shadowOpacityChange.kinetic shadowEnabledChange.kinetic", a)
            },
            hasChildren: function() {
                return !1
            },
            getChildren: function() {
                return []
            },
            getContext: function() {
                return this.getLayer().getContext()
            },
            getCanvas: function() {
                return this.getLayer().getCanvas()
            },
            hasShadow: function() {
                return this._getCache(r, this._hasShadow)
            },
            _hasShadow: function() {
                return this.getShadowEnabled() && 0 !== this.getShadowOpacity() && !!(this.getShadowColor() || this.getShadowBlur() || this.getShadowOffsetX() || this.getShadowOffsetY())
            },
            hasFill: function() {
                return !!(this.getFill() || this.getFillPatternImage() || this.getFillLinearGradientColorStops() || this.getFillRadialGradientColorStops())
            },
            hasStroke: function() {
                return !!(this.stroke() || this.strokeRed() || this.strokeGreen() || this.strokeBlue())
            },
            intersects: function(t) {
                var e, i = this.getStage(),
                    n = i.bufferHitCanvas;
                return n.getContext().clear(), this.drawScene(n), e = n.context.getImageData(Math.round(t.x), Math.round(t.y), 1, 1).data, e[3] > 0
            },
            destroy: function() {
                Kinetic.Node.prototype.destroy.call(this), delete Kinetic.shapes[this.colorKey]
            },
            _useBufferCanvas: function() {
                return (this.hasShadow() || 1 !== this.getAbsoluteOpacity()) && this.hasFill() && this.hasStroke() && this.getStage()
            },
            drawScene: function(t, e) {
                var i, n, a, r = this.getLayer(),
                    s = t || r.getCanvas(),
                    o = s.getContext(),
                    c = this._cache.canvas,
                    h = this.sceneFunc(),
                    l = this.hasShadow();
                if (this.isVisible())
                    if (c) this._drawCachedSceneCanvas(o);
                    else if (h) {
                    if (o.save(), this._useBufferCanvas()) {
                        if (i = this.getStage(), n = i.bufferCanvas, a = n.getContext(), a.clear(), a.save(), a._applyLineJoin(this), r) r._applyTransform(this, a, e);
                        else {
                            var d = this.getAbsoluteTransform(e).getMatrix();
                            o.transform(d[0], d[1], d[2], d[3], d[4], d[5])
                        }
                        h.call(this, a), a.restore(), l && !s.hitCanvas && (o.save(), o._applyShadow(this), o.drawImage(n._canvas, 0, 0), o.restore()), o._applyOpacity(this), o.drawImage(n._canvas, 0, 0)
                    } else {
                        if (o._applyLineJoin(this), r) r._applyTransform(this, o, e);
                        else {
                            var u = this.getAbsoluteTransform(e).getMatrix();
                            o.transform(u[0], u[1], u[2], u[3], u[4], u[5])
                        }
                        l && !s.hitCanvas && (o.save(), o._applyShadow(this), h.call(this, o), o.restore()), o._applyOpacity(this), h.call(this, o)
                    }
                    o.restore()
                }
                return this
            },
            drawHit: function(t, e) {
                var i = this.getLayer(),
                    n = t || i.hitCanvas,
                    a = n.getContext(),
                    r = this.hitFunc() || this.sceneFunc(),
                    s = this._cache.canvas,
                    o = s && s.hit;
                if (this.shouldDrawHit(n))
                    if (i && i.clearHitCache(), o) this._drawCachedHitCanvas(a);
                    else if (r) {
                    if (a.save(), a._applyLineJoin(this), i) i._applyTransform(this, a, e);
                    else {
                        var c = this.getAbsoluteTransform(e).getMatrix();
                        a.transform(c[0], c[1], c[2], c[3], c[4], c[5])
                    }
                    r.call(this, a), a.restore()
                }
                return this
            },
            drawHitFromCache: function(t) {
                var e, i, n, a, r, s, o, c, h = t || 0,
                    l = this._cache.canvas,
                    d = this._getCachedSceneCanvas(),
                    u = d.getContext(),
                    f = l.hit,
                    g = f.getContext(),
                    p = d.getWidth(),
                    v = d.getHeight();
                g.clear();
                try {
                    for (e = u.getImageData(0, 0, p, v), i = e.data, n = g.getImageData(0, 0, p, v), a = n.data, r = i.length, s = Kinetic.Util._hexToRgb(this.colorKey), o = 0; r > o; o += 4) c = i[o + 3], c > h && (a[o] = s.r, a[o + 1] = s.g, a[o + 2] = s.b, a[o + 3] = 255);
                    g.putImageData(n, 0, 0)
                } catch (m) {
                    Kinetic.Util.warn("Unable to draw hit graph from cached scene canvas. " + m.message)
                }
                return this
            }
        }), Kinetic.Util.extend(Kinetic.Shape, Kinetic.Node), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "stroke"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "strokeRed", 0, Kinetic.Validators.RGBComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "strokeGreen", 0, Kinetic.Validators.RGBComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "strokeBlue", 0, Kinetic.Validators.RGBComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "strokeAlpha", 1, Kinetic.Validators.alphaComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "strokeWidth", 2), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "lineJoin"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "lineCap"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "sceneFunc"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "hitFunc"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "dash"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "shadowColor"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "shadowRed", 0, Kinetic.Validators.RGBComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "shadowGreen", 0, Kinetic.Validators.RGBComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "shadowBlue", 0, Kinetic.Validators.RGBComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "shadowAlpha", 1, Kinetic.Validators.alphaComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "shadowBlur"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "shadowOpacity"), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Shape, "shadowOffset", ["x", "y"]), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "shadowOffsetX", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "shadowOffsetY", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillPatternImage"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fill"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillRed", 0, Kinetic.Validators.RGBComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillGreen", 0, Kinetic.Validators.RGBComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillBlue", 0, Kinetic.Validators.RGBComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillAlpha", 1, Kinetic.Validators.alphaComponent), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillPatternX", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillPatternY", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillLinearGradientColorStops"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillRadialGradientStartRadius", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillRadialGradientEndRadius", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillRadialGradientColorStops"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillPatternRepeat", "repeat"), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillEnabled", !0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "strokeEnabled", !0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "shadowEnabled", !0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "dashEnabled", !0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "strokeScaleEnabled", !0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillPriority", "color"), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Shape, "fillPatternOffset", ["x", "y"]), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillPatternOffsetX", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillPatternOffsetY", 0), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Shape, "fillPatternScale", ["x", "y"]), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillPatternScaleX", 1), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillPatternScaleY", 1), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Shape, "fillLinearGradientStartPoint", ["x", "y"]), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillLinearGradientStartPointX", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillLinearGradientStartPointY", 0), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Shape, "fillLinearGradientEndPoint", ["x", "y"]), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillLinearGradientEndPointX", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillLinearGradientEndPointY", 0), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Shape, "fillRadialGradientStartPoint", ["x", "y"]), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillRadialGradientStartPointX", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillRadialGradientStartPointY", 0), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Shape, "fillRadialGradientEndPoint", ["x", "y"]), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillRadialGradientEndPointX", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillRadialGradientEndPointY", 0), Kinetic.Factory.addGetterSetter(Kinetic.Shape, "fillPatternRotation", 0), Kinetic.Factory.backCompat(Kinetic.Shape, {
            dashArray: "dash",
            getDashArray: "getDash",
            setDashArray: "getDash",
            drawFunc: "sceneFunc",
            getDrawFunc: "getSceneFunc",
            setDrawFunc: "setSceneFunc",
            drawHitFunc: "hitFunc",
            getDrawHitFunc: "getHitFunc",
            setDrawHitFunc: "setHitFunc"
        }), Kinetic.Collection.mapMethods(Kinetic.Shape)
    }(), function() {
        function t(t, e) {
            t.content.addEventListener(e, function(i) {
                t[N + e](i)
            }, !1)
        }
        var e = "Stage",
            i = "string",
            n = "px",
            a = "mouseout",
            r = "mouseleave",
            s = "mouseover",
            o = "mouseenter",
            c = "mousemove",
            h = "mousedown",
            l = "mouseup",
            d = "click",
            u = "dblclick",
            f = "touchstart",
            g = "touchend",
            p = "tap",
            v = "dbltap",
            m = "touchmove",
            _ = "DOMMouseScroll",
            K = "mousewheel",
            y = "wheel",
            S = "contentMouseout",
            C = "contentMouseover",
            x = "contentMousemove",
            b = "contentMousedown",
            w = "contentMouseup",
            F = "contentClick",
            P = "contentDblclick",
            T = "contentTouchstart",
            k = "contentTouchend",
            A = "contentDbltap",
            M = "contentTouchmove",
            D = "div",
            L = "relative",
            G = "inline-block",
            I = "kineticjs-content",
            R = " ",
            N = "_",
            U = "container",
            O = "",
            E = [h, c, l, a, f, m, g, s, _, K, y],
            B = E.length;
        Kinetic.Util.addMethods(Kinetic.Stage, {
            ___init: function(t) {
                this.nodeType = e, Kinetic.Container.call(this, t), this._id = Kinetic.idCounter++, this._buildDOM(), this._bindContentEvents(), this._enableNestedTransforms = !1, Kinetic.stages.push(this)
            },
            _validateAdd: function(t) {
                "Layer" !== t.getType() && Kinetic.Util.error("You may only add layers to the stage.")
            },
            setContainer: function(t) {
                if (typeof t === i) {
                    var e = t;
                    if (t = Kinetic.document.getElementById(t), !t) throw "Can not find container in document with id " + e
                }
                return this._setAttr(U, t), this
            },
            shouldDrawHit: function() {
                return !0
            },
            draw: function() {
                return Kinetic.Node.prototype.draw.call(this), this
            },
            setHeight: function(t) {
                return Kinetic.Node.prototype.setHeight.call(this, t), this._resizeDOM(), this
            },
            setWidth: function(t) {
                return Kinetic.Node.prototype.setWidth.call(this, t), this._resizeDOM(), this
            },
            clear: function() {
                var t, e = this.children,
                    i = e.length;
                for (t = 0; i > t; t++) e[t].clear();
                return this
            },
            clone: function(t) {
                return t || (t = {}), t.container = Kinetic.document.createElement(D), Kinetic.Container.prototype.clone.call(this, t)
            },
            destroy: function() {
                var t = this.content;
                Kinetic.Container.prototype.destroy.call(this), t && Kinetic.Util._isInDocument(t) && this.getContainer().removeChild(t);
                var e = Kinetic.stages.indexOf(this);
                e > -1 && Kinetic.stages.splice(e, 1)
            },
            getPointerPosition: function() {
                return this.pointerPos
            },
            getStage: function() {
                return this
            },
            getContent: function() {
                return this.content
            },
            toDataURL: function(t) {
                function e(a) {
                    var r = c[a],
                        h = r.toDataURL(),
                        l = new Kinetic.window.Image;
                    l.onload = function() {
                        o.drawImage(l, 0, 0), a < c.length - 1 ? e(a + 1) : t.callback(s.toDataURL(i, n))
                    }, l.src = h
                }
                t = t || {};
                var i = t.mimeType || null,
                    n = t.quality || null,
                    a = t.x || 0,
                    r = t.y || 0,
                    s = new Kinetic.SceneCanvas({
                        width: t.width || this.getWidth(),
                        height: t.height || this.getHeight(),
                        pixelRatio: 1
                    }),
                    o = s.getContext()._context,
                    c = this.children;
                (a || r) && o.translate(-1 * a, -1 * r), e(0)
            },
            toImage: function(t) {
                var e = t.callback;
                t.callback = function(t) {
                    Kinetic.Util._getImage(t, function(t) {
                        e(t)
                    })
                }, this.toDataURL(t)
            },
            getIntersection: function(t) {
                var e, i, n = this.getChildren(),
                    a = n.length,
                    r = a - 1;
                for (e = r; e >= 0; e--)
                    if (i = n[e].getIntersection(t)) return i;
                return null
            },
            _resizeDOM: function() {
                if (this.content) {
                    var t, e, i = this.getWidth(),
                        a = this.getHeight(),
                        r = this.getChildren(),
                        s = r.length;
                    for (this.content.style.width = i + n, this.content.style.height = a + n, this.bufferCanvas.setSize(i, a), this.bufferHitCanvas.setSize(i, a), t = 0; s > t; t++) e = r[t], e.setSize(i, a), e.draw()
                }
            },
            add: function(t) {
                if (!(arguments.length > 1)) return Kinetic.Container.prototype.add.call(this, t), t._setCanvasSize(this.width(), this.height()), t.draw(), this.content.appendChild(t.canvas._canvas), this;
                for (var e = 0; e < arguments.length; e++) this.add(arguments[e])
            },
            getParent: function() {
                return null
            },
            getLayer: function() {
                return null
            },
            getLayers: function() {
                return this.getChildren()
            },
            _bindContentEvents: function() {
                for (var e = 0; B > e; e++) t(this, E[e])
            },
            _mouseover: function(t) {
                Kinetic.UA.mobile || (this._setPointerPosition(t), this._fire(C, {
                    evt: t
                }))
            },
            _mouseout: function(t) {
                if (!Kinetic.UA.mobile) {
                    this._setPointerPosition(t);
                    var e = this.targetShape;
                    e && !Kinetic.isDragging() && (e._fireAndBubble(a, {
                        evt: t
                    }), e._fireAndBubble(r, {
                        evt: t
                    }), this.targetShape = null), this.pointerPos = void 0, this._fire(S, {
                        evt: t
                    })
                }
            },
            _mousemove: function(t) {
                if (Kinetic.UA.ieMobile) return this._touchmove(t);
                if (("undefined" == typeof t.webkitMovementX && "undefined" == typeof t.webkitMovementY || 0 !== t.webkitMovementY || 0 !== t.webkitMovementX) && !Kinetic.UA.mobile) {
                    this._setPointerPosition(t);
                    var e, i = Kinetic.DD;
                    Kinetic.isDragging() || (e = this.getIntersection(this.getPointerPosition()), e && e.isListening() ? Kinetic.isDragging() || this.targetShape && this.targetShape._id === e._id ? e._fireAndBubble(c, {
                        evt: t
                    }) : (this.targetShape && (this.targetShape._fireAndBubble(a, {
                        evt: t
                    }, e), this.targetShape._fireAndBubble(r, {
                        evt: t
                    }, e)), e._fireAndBubble(s, {
                        evt: t
                    }, this.targetShape), e._fireAndBubble(o, {
                        evt: t
                    }, this.targetShape), this.targetShape = e) : this.targetShape && !Kinetic.isDragging() && (this.targetShape._fireAndBubble(a, {
                        evt: t
                    }), this.targetShape._fireAndBubble(r, {
                        evt: t
                    }), this.targetShape = null), this._fire(x, {
                        evt: t
                    })), i && i._drag(t), t.preventDefault && t.preventDefault()
                }
            },
            _mousedown: function(t) {
                if (Kinetic.UA.ieMobile) return this._touchstart(t);
                if (!Kinetic.UA.mobile) {
                    this._setPointerPosition(t);
                    var e = this.getIntersection(this.getPointerPosition());
                    Kinetic.listenClickTap = !0, e && e.isListening() && (this.clickStartShape = e, e._fireAndBubble(h, {
                        evt: t
                    })), this._fire(b, {
                        evt: t
                    })
                }
                t.preventDefault && t.preventDefault()
            },
            _mouseup: function(t) {
                if (Kinetic.UA.ieMobile) return this._touchend(t);
                if (!Kinetic.UA.mobile) {
                    this._setPointerPosition(t);
                    var e = this.getIntersection(this.getPointerPosition()),
                        i = this.clickStartShape,
                        n = !1,
                        a = Kinetic.DD;
                    Kinetic.inDblClickWindow ? (n = !0, Kinetic.inDblClickWindow = !1) : a && a.justDragged ? a && (a.justDragged = !1) : Kinetic.inDblClickWindow = !0, setTimeout(function() {
                        Kinetic.inDblClickWindow = !1
                    }, Kinetic.dblClickWindow), e && e.isListening() && (e._fireAndBubble(l, {
                        evt: t
                    }), Kinetic.listenClickTap && i && i._id === e._id && (e._fireAndBubble(d, {
                        evt: t
                    }), n && e._fireAndBubble(u, {
                        evt: t
                    }))), this._fire(w, {
                        evt: t
                    }), Kinetic.listenClickTap && (this._fire(F, {
                        evt: t
                    }), n && this._fire(P, {
                        evt: t
                    })), Kinetic.listenClickTap = !1
                }
                t.preventDefault && t.preventDefault()
            },
            _touchstart: function(t) {
                this._setPointerPosition(t);
                var e = this.getIntersection(this.getPointerPosition());
                Kinetic.listenClickTap = !0, e && e.isListening() && (this.tapStartShape = e, e._fireAndBubble(f, {
                    evt: t
                }), e.isListening() && t.preventDefault && t.preventDefault()), this._fire(T, {
                    evt: t
                })
            },
            _touchend: function(t) {
                this._setPointerPosition(t);
                var e = this.getIntersection(this.getPointerPosition()),
                    i = !1;
                Kinetic.inDblClickWindow ? (i = !0, Kinetic.inDblClickWindow = !1) : Kinetic.inDblClickWindow = !0, setTimeout(function() {
                    Kinetic.inDblClickWindow = !1
                }, Kinetic.dblClickWindow), e && e.isListening() && (e._fireAndBubble(g, {
                    evt: t
                }), Kinetic.listenClickTap && e._id === this.tapStartShape._id && (e._fireAndBubble(p, {
                    evt: t
                }), i && e._fireAndBubble(v, {
                    evt: t
                })), e.isListening() && t.preventDefault && t.preventDefault()), Kinetic.listenClickTap && (this._fire(k, {
                    evt: t
                }), i && this._fire(A, {
                    evt: t
                })), Kinetic.listenClickTap = !1
            },
            _touchmove: function(t) {
                this._setPointerPosition(t);
                var e, i = Kinetic.DD;
                Kinetic.isDragging() || (e = this.getIntersection(this.getPointerPosition()), e && e.isListening() && (e._fireAndBubble(m, {
                    evt: t
                }), e.isListening() && t.preventDefault && t.preventDefault()), this._fire(M, {
                    evt: t
                })), i && (i._drag(t), Kinetic.isDragging() && t.preventDefault())
            },
            _DOMMouseScroll: function(t) {
                this._mousewheel(t)
            },
            _mousewheel: function(t) {
                this._setPointerPosition(t);
                var e = this.getIntersection(this.getPointerPosition());
                e && e.isListening() && e._fireAndBubble(K, {
                    evt: t
                })
            },
            _wheel: function(t) {
                this._mousewheel(t)
            },
            _setPointerPosition: function(t) {
                var e, i = this._getContentPosition(),
                    n = t.offsetX,
                    a = t.clientX,
                    r = null,
                    s = null;
                t = t ? t : window.event, void 0 !== t.touches ? t.touches.length > 0 && (e = t.touches[0], r = e.clientX - i.left, s = e.clientY - i.top) : void 0 !== n ? (r = n, s = t.offsetY) : "mozilla" === Kinetic.UA.browser ? (r = t.layerX, s = t.layerY) : void 0 !== a && i && (r = a - i.left, s = t.clientY - i.top), null !== r && null !== s && (this.pointerPos = {
                    x: r,
                    y: s
                })
            },
            _getContentPosition: function() {
                var t = this.content.getBoundingClientRect ? this.content.getBoundingClientRect() : {
                    top: 0,
                    left: 30
                };
                return {
                    top: t.top,
                    left: t.left
                }
            },
            _buildDOM: function() {
                var t = this.getContainer();
                if (!t) {
                    if (Kinetic.Util.isBrowser()) throw "Stage has no container. A container is required.";
                    t = Kinetic.document.createElement(D)
                }
                t.innerHTML = O, this.content = Kinetic.document.createElement(D), this.content.style.position = L, this.content.style.display = G, this.content.className = I, this.content.setAttribute("role", "presentation"), this.content.setAttribute("id", "map_floor_image"), t.appendChild(this.content), this.bufferCanvas = new Kinetic.SceneCanvas({
                    pixelRatio: 1
                }), this.bufferHitCanvas = new Kinetic.HitCanvas, this._resizeDOM()
            },
            _onContent: function(t, e) {
                var i, n, a = t.split(R),
                    r = a.length;
                for (i = 0; r > i; i++) n = a[i], this.content.addEventListener(n, e, !1)
            },
            cache: function() {
                Kinetic.Util.warn("Cache function is not allowed for stage. You may use cache only for layers, groups and shapes.")
            },
            clearCache: function() {}
        }), Kinetic.Util.extend(Kinetic.Stage, Kinetic.Container), Kinetic.Factory.addGetter(Kinetic.Stage, "container"), Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Stage, "container")
    }(), function() {
        Kinetic.Util.addMethods(Kinetic.BaseLayer, {
            ___init: function(t) {
                this.nodeType = "Layer", Kinetic.Container.call(this, t)
            },
            createPNGStream: function() {
                return this.canvas._canvas.createPNGStream()
            },
            getCanvas: function() {
                return this.canvas
            },
            getHitCanvas: function() {
                return this.hitCanvas
            },
            getContext: function() {
                return this.getCanvas().getContext()
            },
            clear: function(t) {
                return this.getContext().clear(t), this.getHitCanvas().getContext().clear(t), this
            },
            clearHitCache: function() {
                this._hitImageData = void 0
            },
            setZIndex: function(t) {
                Kinetic.Node.prototype.setZIndex.call(this, t);
                var e = this.getStage();
                return e && (e.content.removeChild(this.getCanvas()._canvas), t < e.getChildren().length - 1 ? e.content.insertBefore(this.getCanvas()._canvas, e.getChildren()[t + 1].getCanvas()._canvas) : e.content.appendChild(this.getCanvas()._canvas)), this
            },
            moveToTop: function() {
                Kinetic.Node.prototype.moveToTop.call(this);
                var t = this.getStage();
                t && (t.content.removeChild(this.getCanvas()._canvas), t.content.appendChild(this.getCanvas()._canvas))
            },
            moveUp: function() {
                if (Kinetic.Node.prototype.moveUp.call(this)) {
                    var t = this.getStage();
                    t && (t.content.removeChild(this.getCanvas()._canvas), this.index < t.getChildren().length - 1 ? t.content.insertBefore(this.getCanvas()._canvas, t.getChildren()[this.index + 1].getCanvas()._canvas) : t.content.appendChild(this.getCanvas()._canvas))
                }
            },
            moveDown: function() {
                if (Kinetic.Node.prototype.moveDown.call(this)) {
                    var t = this.getStage();
                    if (t) {
                        var e = t.getChildren();
                        t.content.removeChild(this.getCanvas()._canvas), t.content.insertBefore(this.getCanvas()._canvas, e[this.index + 1].getCanvas()._canvas)
                    }
                }
            },
            moveToBottom: function() {
                if (Kinetic.Node.prototype.moveToBottom.call(this)) {
                    var t = this.getStage();
                    if (t) {
                        var e = t.getChildren();
                        t.content.removeChild(this.getCanvas()._canvas), t.content.insertBefore(this.getCanvas()._canvas, e[1].getCanvas()._canvas)
                    }
                }
            },
            getLayer: function() {
                return this
            },
            remove: function() {
                var t = this.getCanvas()._canvas;
                return Kinetic.Node.prototype.remove.call(this), t && t.parentNode && Kinetic.Util._isInDocument(t) && t.parentNode.removeChild(t), this
            },
            getStage: function() {
                return this.parent
            },
            setSize: function(t, e) {
                this.canvas.setSize(t, e)
            },
            getWidth: function() {
                return this.parent ? this.parent.getWidth() : void 0
            },
            setWidth: function() {
                Kinetic.Util.warn('Can not change width of layer. Use "stage.width(value)" function instead.')
            },
            getHeight: function() {
                return this.parent ? this.parent.getHeight() : void 0
            },
            setHeight: function() {
                Kinetic.Util.warn('Can not change height of layer. Use "stage.height(value)" function instead.')
            }
        }), Kinetic.Util.extend(Kinetic.BaseLayer, Kinetic.Container), Kinetic.Factory.addGetterSetter(Kinetic.BaseLayer, "clearBeforeDraw", !0), Kinetic.Collection.mapMethods(Kinetic.BaseLayer)
    }(), function() {
        var t = "#",
            e = "beforeDraw",
            i = "draw",
            n = [{
                x: 0,
                y: 0
            }, {
                x: -1,
                y: 0
            }, {
                x: -1,
                y: -1
            }, {
                x: 0,
                y: -1
            }, {
                x: 1,
                y: -1
            }, {
                x: 1,
                y: 0
            }, {
                x: 1,
                y: 1
            }, {
                x: 0,
                y: 1
            }, {
                x: -1,
                y: 1
            }],
            a = n.length;
        Kinetic.Util.addMethods(Kinetic.Layer, {
            ____init: function(t) {
                this.nodeType = "Layer", this.canvas = new Kinetic.SceneCanvas, this.hitCanvas = new Kinetic.HitCanvas, Kinetic.BaseLayer.call(this, t)
            },
            _setCanvasSize: function(t, e) {
                this.canvas.setSize(t, e), this.hitCanvas.setSize(t, e)
            },
            _validateAdd: function(t) {
                var e = t.getType();
                "Group" !== e && "Shape" !== e && Kinetic.Util.error("You may only add groups and shapes to a layer.")
            },
            getIntersection: function(t) {
                var e, i, r, s;
                if (!this.hitGraphEnabled() || !this.isVisible()) return null;
                for (var o = 1, c = !1;;) {
                    for (i = 0; a > i; i++) {
                        if (r = n[i], e = this._getIntersection({
                                x: t.x + r.x * o,
                                y: t.y + r.y * o
                            }), s = e.shape) return s;
                        e.antialiased && (c = !0)
                    }
                    if (!c) return;
                    o += 1
                }
            },
            _getImageData: function(t, e) {
                var i = this.hitCanvas.width || 1,
                    n = this.hitCanvas.height || 1,
                    a = Math.round(e) * i + Math.round(t);
                return this._hitImageData || (this._hitImageData = this.hitCanvas.context.getImageData(0, 0, i, n)), [this._hitImageData.data[4 * a + 0], this._hitImageData.data[4 * a + 1], this._hitImageData.data[4 * a + 2], this._hitImageData.data[4 * a + 3]]
            },
            _getIntersection: function(e) {
                var i, n, a = this.hitCanvas.context.getImageData(e.x, e.y, 1, 1).data,
                    r = a[3];
                return 255 === r ? (i = Kinetic.Util._rgbToHex(a[0], a[1], a[2]), n = Kinetic.shapes[t + i], {
                    shape: n
                }) : r > 0 ? {
                    antialiased: !0
                } : {}
            },
            drawScene: function(t, n) {
                var a = this.getLayer(),
                    r = t || a && a.getCanvas();
                return this._fire(e, {
                    node: this
                }), this.getClearBeforeDraw() && r.getContext().clear(), Kinetic.Container.prototype.drawScene.call(this, r, n), this._fire(i, {
                    node: this
                }), this
            },
            _applyTransform: function(t, e, i) {
                var n = t.getAbsoluteTransform(i).getMatrix();
                e.transform(n[0], n[1], n[2], n[3], n[4], n[5])
            },
            drawHit: function(t, e) {
                var i = this.getLayer(),
                    n = t || i && i.hitCanvas;
                return i && i.getClearBeforeDraw() && i.getHitCanvas().getContext().clear(), Kinetic.Container.prototype.drawHit.call(this, n, e), this.imageData = null, this
            },
            clear: function(t) {
                return this.getContext().clear(t), this.getHitCanvas().getContext().clear(t), this.imageData = null, this
            },
            setVisible: function(t) {
                return Kinetic.Node.prototype.setVisible.call(this, t), t ? (this.getCanvas()._canvas.style.display = "block", this.hitCanvas._canvas.style.display = "block") : (this.getCanvas()._canvas.style.display = "none", this.hitCanvas._canvas.style.display = "none"), this
            },
            enableHitGraph: function() {
                return this.setHitGraphEnabled(!0), this
            },
            disableHitGraph: function() {
                return this.setHitGraphEnabled(!1), this
            },
            setSize: function(t, e) {
                Kinetic.BaseLayer.prototype.setSize.call(this, t, e), this.hitCanvas.setSize(t, e)
            }
        }), Kinetic.Util.extend(Kinetic.Layer, Kinetic.BaseLayer), Kinetic.Factory.addGetterSetter(Kinetic.Layer, "hitGraphEnabled", !0), Kinetic.Collection.mapMethods(Kinetic.Layer)
    }(), function() {
        Kinetic.Util.addMethods(Kinetic.FastLayer, {
            ____init: function(t) {
                this.nodeType = "Layer", this.canvas = new Kinetic.SceneCanvas, Kinetic.BaseLayer.call(this, t)
            },
            _validateAdd: function(t) {
                var e = t.getType();
                "Shape" !== e && Kinetic.Util.error("You may only add shapes to a fast layer.")
            },
            _setCanvasSize: function(t, e) {
                this.canvas.setSize(t, e)
            },
            hitGraphEnabled: function() {
                return !1
            },
            getIntersection: function() {
                return null
            },
            drawScene: function(t) {
                var e = this.getLayer(),
                    i = t || e && e.getCanvas();
                return this.getClearBeforeDraw() && i.getContext().clear(), Kinetic.Container.prototype.drawScene.call(this, i), this
            },
            _applyTransform: function(t, e, i) {
                if (!i || i._id !== this._id) {
                    var n = t.getTransform().getMatrix();
                    e.transform(n[0], n[1], n[2], n[3], n[4], n[5])
                }
            },
            draw: function() {
                return this.drawScene(), this
            },
            clear: function(t) {
                return this.getContext().clear(t), this
            },
            setVisible: function(t) {
                return Kinetic.Node.prototype.setVisible.call(this, t), this.getCanvas()._canvas.style.display = t ? "block" : "none", this
            }
        }), Kinetic.Util.extend(Kinetic.FastLayer, Kinetic.BaseLayer), Kinetic.Collection.mapMethods(Kinetic.FastLayer)
    }(), function() {
        Kinetic.Util.addMethods(Kinetic.Group, {
            ___init: function(t) {
                this.nodeType = "Group", Kinetic.Container.call(this, t)
            },
            _validateAdd: function(t) {
                var e = t.getType();
                "Group" !== e && "Shape" !== e && Kinetic.Util.error("You may only add groups and shapes to groups.")
            }
        }), Kinetic.Util.extend(Kinetic.Group, Kinetic.Container), Kinetic.Collection.mapMethods(Kinetic.Group)
    }(), function() {
        Kinetic.Rect = function(t) {
            this.___init(t)
        }, Kinetic.Rect.prototype = {
            ___init: function(t) {
                Kinetic.Shape.call(this, t), this.className = "Rect", this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(t) {
                var e = this.getCornerRadius(),
                    i = this.getWidth(),
                    n = this.getHeight();
                t.beginPath(), e ? (t.moveTo(e, 0), t.lineTo(i - e, 0), t.arc(i - e, e, e, 3 * Math.PI / 2, 0, !1), t.lineTo(i, n - e), t.arc(i - e, n - e, e, 0, Math.PI / 2, !1), t.lineTo(e, n), t.arc(e, n - e, e, Math.PI / 2, Math.PI, !1), t.lineTo(0, e), t.arc(e, e, e, Math.PI, 3 * Math.PI / 2, !1)) : t.rect(0, 0, i, n), t.closePath(), t.fillStrokeShape(this)
            }
        }, Kinetic.Util.extend(Kinetic.Rect, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.Rect, "cornerRadius", 0), Kinetic.Collection.mapMethods(Kinetic.Rect)
    }(), function() {
        var t = 2 * Math.PI - 1e-4,
            e = "Circle";
        Kinetic.Circle = function(t) {
            this.___init(t)
        }, Kinetic.Circle.prototype = {
            ___init: function(t) {
                Kinetic.Shape.call(this, t), this.className = e, this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(e) {
                e.beginPath(), e.arc(0, 0, this.getRadius(), 0, t, !1), e.closePath(), e.fillStrokeShape(this)
            },
            getWidth: function() {
                return 2 * this.getRadius()
            },
            getHeight: function() {
                return 2 * this.getRadius()
            },
            setWidth: function(t) {
                Kinetic.Node.prototype.setWidth.call(this, t), this.radius() !== t / 2 && this.setRadius(t / 2)
            },
            setHeight: function(t) {
                Kinetic.Node.prototype.setHeight.call(this, t), this.radius() !== t / 2 && this.setRadius(t / 2)
            },
            setRadius: function(t) {
                this._setAttr("radius", t), this.setWidth(2 * t), this.setHeight(2 * t)
            }
        }, Kinetic.Util.extend(Kinetic.Circle, Kinetic.Shape), Kinetic.Factory.addGetter(Kinetic.Circle, "radius", 0), Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Circle, "radius"), Kinetic.Collection.mapMethods(Kinetic.Circle)
    }(), function() {
        var t = 2 * Math.PI - 1e-4,
            e = "Ellipse";
        Kinetic.Ellipse = function(t) {
            this.___init(t)
        }, Kinetic.Ellipse.prototype = {
            ___init: function(t) {
                Kinetic.Shape.call(this, t), this.className = e, this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(e) {
                var i = this.getRadiusX(),
                    n = this.getRadiusY();
                e.beginPath(), e.save(), i !== n && e.scale(1, n / i), e.arc(0, 0, i, 0, t, !1), e.restore(), e.closePath(), e.fillStrokeShape(this)
            },
            getWidth: function() {
                return 2 * this.getRadiusX()
            },
            getHeight: function() {
                return 2 * this.getRadiusY()
            },
            setWidth: function(t) {
                Kinetic.Node.prototype.setWidth.call(this, t), this.setRadius({
                    x: t / 2
                })
            },
            setHeight: function(t) {
                Kinetic.Node.prototype.setHeight.call(this, t), this.setRadius({
                    y: t / 2
                })
            }
        }, Kinetic.Util.extend(Kinetic.Ellipse, Kinetic.Shape), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Ellipse, "radius", ["x", "y"]), Kinetic.Factory.addGetterSetter(Kinetic.Ellipse, "radiusX", 0), Kinetic.Factory.addGetterSetter(Kinetic.Ellipse, "radiusY", 0), Kinetic.Collection.mapMethods(Kinetic.Ellipse)
    }(), function() {
        var t = 2 * Math.PI - 1e-4;
        Kinetic.Ring = function(t) {
            this.___init(t)
        }, Kinetic.Ring.prototype = {
            ___init: function(t) {
                Kinetic.Shape.call(this, t), this.className = "Ring", this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(e) {
                e.beginPath(), e.arc(0, 0, this.getInnerRadius(), 0, t, !1), e.moveTo(this.getOuterRadius(), 0), e.arc(0, 0, this.getOuterRadius(), t, 0, !0), e.closePath(), e.fillStrokeShape(this)
            },
            getWidth: function() {
                return 2 * this.getOuterRadius()
            },
            getHeight: function() {
                return 2 * this.getOuterRadius()
            },
            setWidth: function(t) {
                Kinetic.Node.prototype.setWidth.call(this, t), this.outerRadius() !== t / 2 && this.setOuterRadius(t / 2)
            },
            setHeight: function(t) {
                Kinetic.Node.prototype.setHeight.call(this, t), this.outerRadius() !== t / 2 && this.setOuterRadius(t / 2)
            },
            setOuterRadius: function(t) {
                this._setAttr("outerRadius", t), this.setWidth(2 * t), this.setHeight(2 * t)
            }
        }, Kinetic.Util.extend(Kinetic.Ring, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.Ring, "innerRadius", 0), Kinetic.Factory.addGetter(Kinetic.Ring, "outerRadius", 0), Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Ring, "outerRadius"), Kinetic.Collection.mapMethods(Kinetic.Ring)
    }(), function() {
        Kinetic.Wedge = function(t) {
            this.___init(t)
        }, Kinetic.Wedge.prototype = {
            ___init: function(t) {
                Kinetic.Shape.call(this, t), this.className = "Wedge", this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(t) {
                t.beginPath(), t.arc(0, 0, this.getRadius(), 0, Kinetic.getAngle(this.getAngle()), this.getClockwise()), t.lineTo(0, 0), t.closePath(), t.fillStrokeShape(this)
            }
        }, Kinetic.Util.extend(Kinetic.Wedge, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.Wedge, "radius", 0), Kinetic.Factory.addGetterSetter(Kinetic.Wedge, "angle", 0), Kinetic.Factory.addGetterSetter(Kinetic.Wedge, "clockwise", !1), Kinetic.Factory.backCompat(Kinetic.Wedge, {
            angleDeg: "angle",
            getAngleDeg: "getAngle",
            setAngleDeg: "setAngle"
        }), Kinetic.Collection.mapMethods(Kinetic.Wedge)
    }(), function() {
        Kinetic.Arc = function(t) {
            this.___init(t)
        }, Kinetic.Arc.prototype = {
            ___init: function(t) {
                Kinetic.Shape.call(this, t), this.className = "Arc", this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(t) {
                var e = Kinetic.getAngle(this.angle()),
                    i = this.clockwise();
                t.beginPath(), t.arc(0, 0, this.getOuterRadius(), 0, e, i), t.arc(0, 0, this.getInnerRadius(), e, 0, !i), t.closePath(), t.fillStrokeShape(this)
            }
        }, Kinetic.Util.extend(Kinetic.Arc, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.Arc, "innerRadius", 0), Kinetic.Factory.addGetterSetter(Kinetic.Arc, "outerRadius", 0), Kinetic.Factory.addGetterSetter(Kinetic.Arc, "angle", 0), Kinetic.Factory.addGetterSetter(Kinetic.Arc, "clockwise", !1), Kinetic.Collection.mapMethods(Kinetic.Arc)
    }(), function() {
        var t = "Image";
        Kinetic.Image = function(t) {
            this.___init(t)
        }, Kinetic.Image.prototype = {
            ___init: function(e) {
                Kinetic.Shape.call(this, e), this.className = t, this.sceneFunc(this._sceneFunc), this.hitFunc(this._hitFunc)
            },
            _useBufferCanvas: function() {
                return (this.hasShadow() || 1 !== this.getAbsoluteOpacity()) && this.hasStroke() && this.getStage()
            },
            _sceneFunc: function(t) {
                var e, i, n, a = this.getWidth(),
                    r = this.getHeight(),
                    s = this.getImage();
                s && (e = this.getCropWidth(), i = this.getCropHeight(), n = e && i ? [s, this.getCropX(), this.getCropY(), e, i, 0, 0, a, r] : [s, 0, 0, a, r]), (this.hasFill() || this.hasStroke() || this.hasShadow()) && (t.beginPath(), t.rect(0, 0, a, r), t.closePath(), t.fillStrokeShape(this)), s && t.drawImage.apply(t, n)
            },
            _hitFunc: function(t) {
                var e = this.getWidth(),
                    i = this.getHeight();
                t.beginPath(), t.rect(0, 0, e, i), t.closePath(), t.fillStrokeShape(this)
            },
            getWidth: function() {
                var t = this.getImage();
                return this.attrs.width || (t ? t.width : 0)
            },
            getHeight: function() {
                var t = this.getImage();
                return this.attrs.height || (t ? t.height : 0)
            }
        }, Kinetic.Util.extend(Kinetic.Image, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.Image, "image"), Kinetic.Factory.addComponentsGetterSetter(Kinetic.Image, "crop", ["x", "y", "width", "height"]), Kinetic.Factory.addGetterSetter(Kinetic.Image, "cropX", 0), Kinetic.Factory.addGetterSetter(Kinetic.Image, "cropY", 0), Kinetic.Factory.addGetterSetter(Kinetic.Image, "cropWidth", 0), Kinetic.Factory.addGetterSetter(Kinetic.Image, "cropHeight", 0), Kinetic.Collection.mapMethods(Kinetic.Image)
    }(), function() {
        function t(t) {
            t.fillText(this.partialText, 0, 0)
        }

        function e(t) {
            t.strokeText(this.partialText, 0, 0)
        }
        var i = "auto",
            n = "center",
            a = "Change.kinetic",
            r = "2d",
            s = "-",
            o = "",
            c = "left",
            h = "text",
            l = "Text",
            d = "middle",
            u = "normal",
            f = "px ",
            g = " ",
            p = "right",
            v = "word",
            m = "char",
            _ = "none",
            K = ["fontFamily", "fontSize", "fontStyle", "fontVariant", "padding", "align", "lineHeight", "text", "width", "height", "wrap"],
            y = K.length,
            S = Kinetic.Util.createCanvasElement().getContext(r);
        Kinetic.Text = function(t) {
            this.___init(t)
        }, Kinetic.Text.prototype = {
            ___init: function(n) {
                var r = this;
                void 0 === n.width && (n.width = i), void 0 === n.height && (n.height = i), Kinetic.Shape.call(this, n), this._fillFunc = t, this._strokeFunc = e, this.className = l;
                for (var s = 0; y > s; s++) this.on(K[s] + a, r._setTextData);
                this._setTextData(), this.sceneFunc(this._sceneFunc), this.hitFunc(this._hitFunc)
            },
            _sceneFunc: function(t) {
                var e, i = this.getPadding(),
                    a = this.getTextHeight(),
                    r = this.getLineHeight() * a,
                    s = this.textArr,
                    o = s.length,
                    h = this.getWidth();
                for (t.setAttr("font", this._getContextFont()), t.setAttr("textBaseline", d), t.setAttr("textAlign", c), t.save(), t.translate(i, 0), t.translate(0, i + a / 2), e = 0; o > e; e++) {
                    var l = s[e],
                        u = l.text,
                        f = l.width;
                    t.save(), this.getAlign() === p ? t.translate(h - f - 2 * i, 0) : this.getAlign() === n && t.translate((h - f - 2 * i) / 2, 0), this.partialText = u, t.fillStrokeShape(this), t.restore(), t.translate(0, r)
                }
                t.restore()
            },
            _hitFunc: function(t) {
                var e = this.getWidth(),
                    i = this.getHeight();
                t.beginPath(), t.rect(0, 0, e, i), t.closePath(), t.fillStrokeShape(this)
            },
            setText: function(t) {
                var e = Kinetic.Util._isString(t) ? t : t.toString();
                return this._setAttr(h, e), this
            },
            getWidth: function() {
                return this.attrs.width === i ? this.getTextWidth() + 2 * this.getPadding() : this.attrs.width
            },
            getHeight: function() {
                return this.attrs.height === i ? this.getTextHeight() * this.textArr.length * this.getLineHeight() + 2 * this.getPadding() : this.attrs.height
            },
            getTextWidth: function() {
                return this.textWidth
            },
            getTextHeight: function() {
                return this.textHeight
            },
            _getTextSize: function(t) {
                var e, i = S,
                    n = this.getFontSize();
                return i.save(), i.font = this._getContextFont(), e = i.measureText(t), i.restore(), {
                    width: e.width,
                    height: parseInt(n, 10)
                }
            },
            _getContextFont: function() {
                return this.getFontStyle() + g + this.getFontVariant() + g + this.getFontSize() + f + this.getFontFamily()
            },
            _addTextLine: function(t, e) {
                return this.textArr.push({
                    text: t,
                    width: e
                })
            },
            _getTextWidth: function(t) {
                return S.measureText(t).width
            },
            _setTextData: function() {
                var t = this.getText().split("\n"),
                    e = +this.getFontSize(),
                    n = 0,
                    a = this.getLineHeight() * e,
                    r = this.attrs.width,
                    o = this.attrs.height,
                    c = r !== i,
                    h = o !== i,
                    l = this.getPadding(),
                    d = r - 2 * l,
                    u = o - 2 * l,
                    f = 0,
                    p = this.getWrap(),
                    v = p !== _,
                    K = p !== m && v;
                this.textArr = [], S.save(), S.font = this._getContextFont();
                for (var y = 0, C = t.length; C > y; ++y) {
                    var x = t[y],
                        b = this._getTextWidth(x);
                    if (c && b > d)
                        for (; x.length > 0;) {
                            for (var w = 0, F = x.length, P = "", T = 0; F > w;) {
                                var k = w + F >>> 1,
                                    A = x.slice(0, k + 1),
                                    M = this._getTextWidth(A);
                                d >= M ? (w = k + 1, P = A, T = M) : F = k
                            }
                            if (!P) break;
                            if (K) {
                                var D = Math.max(P.lastIndexOf(g), P.lastIndexOf(s)) + 1;
                                D > 0 && (w = D, P = P.slice(0, w), T = this._getTextWidth(P))
                            }
                            if (this._addTextLine(P, T), n = Math.max(n, T), f += a, !v || h && f + a > u) break;
                            if (x = x.slice(w), x.length > 0 && (b = this._getTextWidth(x), d >= b)) {
                                this._addTextLine(x, b), f += a, n = Math.max(n, b);
                                break
                            }
                        } else this._addTextLine(x, b), f += a, n = Math.max(n, b);
                    if (h && f + a > u) break
                }
                S.restore(), this.textHeight = e, this.textWidth = n
            }
        }, Kinetic.Util.extend(Kinetic.Text, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.Text, "fontFamily", "Arial"), Kinetic.Factory.addGetterSetter(Kinetic.Text, "fontSize", 12), Kinetic.Factory.addGetterSetter(Kinetic.Text, "fontStyle", u), Kinetic.Factory.addGetterSetter(Kinetic.Text, "fontVariant", u), Kinetic.Factory.addGetterSetter(Kinetic.Text, "padding", 0), Kinetic.Factory.addGetterSetter(Kinetic.Text, "align", c), Kinetic.Factory.addGetterSetter(Kinetic.Text, "lineHeight", 1), Kinetic.Factory.addGetterSetter(Kinetic.Text, "wrap", v), Kinetic.Factory.addGetter(Kinetic.Text, "text", o), Kinetic.Factory.addOverloadedGetterSetter(Kinetic.Text, "text"), Kinetic.Collection.mapMethods(Kinetic.Text)
    }(), function() {
        Kinetic.Line = function(t) {
            this.___init(t)
        }, Kinetic.Line.prototype = {
            ___init: function(t) {
                Kinetic.Shape.call(this, t), this.className = "Line", this.on("pointsChange.kinetic tensionChange.kinetic closedChange.kinetic", function() {
                    this._clearCache("tensionPoints")
                }), this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(t) {
                var e, i, n, a = this.getPoints(),
                    r = a.length,
                    s = this.getTension(),
                    o = this.getClosed();
                if (t.beginPath(), t.moveTo(a[0], a[1]), 0 !== s && r > 4) {
                    for (e = this.getTensionPoints(), i = e.length, n = o ? 0 : 4, o || t.quadraticCurveTo(e[0], e[1], e[2], e[3]); i - 2 > n;) t.bezierCurveTo(e[n++], e[n++], e[n++], e[n++], e[n++], e[n++]);
                    o || t.quadraticCurveTo(e[i - 2], e[i - 1], a[r - 2], a[r - 1])
                } else
                    for (n = 2; r > n; n += 2) t.lineTo(a[n], a[n + 1]);
                o ? (t.closePath(), t.fillStrokeShape(this)) : t.strokeShape(this)
            },
            getTensionPoints: function() {
                return this._getCache("tensionPoints", this._getTensionPoints)
            },
            _getTensionPoints: function() {
                return this.getClosed() ? this._getTensionPointsClosed() : Kinetic.Util._expandPoints(this.getPoints(), this.getTension())
            },
            _getTensionPointsClosed: function() {
                var t = this.getPoints(),
                    e = t.length,
                    i = this.getTension(),
                    n = Kinetic.Util,
                    a = n._getControlPoints(t[e - 2], t[e - 1], t[0], t[1], t[2], t[3], i),
                    r = n._getControlPoints(t[e - 4], t[e - 3], t[e - 2], t[e - 1], t[0], t[1], i),
                    s = Kinetic.Util._expandPoints(t, i),
                    o = [a[2], a[3]].concat(s).concat([r[0], r[1], t[e - 2], t[e - 1], r[2], r[3], a[0], a[1], t[0], t[1]]);
                return o
            }
        }, Kinetic.Util.extend(Kinetic.Line, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.Line, "closed", !1), Kinetic.Factory.addGetterSetter(Kinetic.Line, "tension", 0), Kinetic.Factory.addGetterSetter(Kinetic.Line, "points"), Kinetic.Collection.mapMethods(Kinetic.Line)
    }(), function() {
        Kinetic.Sprite = function(t) {
            this.___init(t)
        }, Kinetic.Sprite.prototype = {
            ___init: function(t) {
                Kinetic.Shape.call(this, t), this.className = "Sprite", this._updated = !0;
                var e = this;
                this.anim = new Kinetic.Animation(function() {
                    var t = e._updated;
                    return e._updated = !1, t
                }), this.on("animationChange.kinetic", function() {
                    this.frameIndex(0)
                }), this.on("frameIndexChange.kinetic", function() {
                    this._updated = !0
                }), this.on("frameRateChange.kinetic", function() {
                    this.anim.isRunning() && (clearInterval(this.interval), this._setInterval())
                }), this.sceneFunc(this._sceneFunc), this.hitFunc(this._hitFunc)
            },
            _sceneFunc: function(t) {
                var e = this.getAnimation(),
                    i = this.frameIndex(),
                    n = 4 * i,
                    a = this.getAnimations()[e],
                    r = a[n + 0],
                    s = a[n + 1],
                    o = a[n + 2],
                    c = a[n + 3],
                    h = this.getImage();
                h && t.drawImage(h, r, s, o, c, 0, 0, o, c)
            },
            _hitFunc: function(t) {
                var e = this.getAnimation(),
                    i = this.frameIndex(),
                    n = 4 * i,
                    a = this.getAnimations()[e],
                    r = a[n + 2],
                    s = a[n + 3];
                t.beginPath(), t.rect(0, 0, r, s), t.closePath(), t.fillShape(this)
            },
            _useBufferCanvas: function() {
                return (this.hasShadow() || 1 !== this.getAbsoluteOpacity()) && this.hasStroke()
            },
            _setInterval: function() {
                var t = this;
                this.interval = setInterval(function() {
                    t._updateIndex()
                }, 1e3 / this.getFrameRate())
            },
            start: function() {
                var t = this.getLayer();
                this.anim.setLayers(t), this._setInterval(), this.anim.start()
            },
            stop: function() {
                this.anim.stop(), clearInterval(this.interval)
            },
            isRunning: function() {
                return this.anim.isRunning()
            },
            _updateIndex: function() {
                var t = this.frameIndex(),
                    e = this.getAnimation(),
                    i = this.getAnimations(),
                    n = i[e],
                    a = n.length / 4;
                this.frameIndex(a - 1 > t ? t + 1 : 0)
            }
        }, Kinetic.Util.extend(Kinetic.Sprite, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.Sprite, "animation"), Kinetic.Factory.addGetterSetter(Kinetic.Sprite, "animations"), Kinetic.Factory.addGetterSetter(Kinetic.Sprite, "image"), Kinetic.Factory.addGetterSetter(Kinetic.Sprite, "frameIndex", 0), Kinetic.Factory.addGetterSetter(Kinetic.Sprite, "frameRate", 17), Kinetic.Factory.backCompat(Kinetic.Sprite, {
            index: "frameIndex",
            getIndex: "getFrameIndex",
            setIndex: "setFrameIndex"
        }), Kinetic.Collection.mapMethods(Kinetic.Sprite)
    }(), function() {
        Kinetic.Path = function(t) {
            this.___init(t)
        }, Kinetic.Path.prototype = {
            ___init: function(t) {
                this.dataArray = [];
                var e = this;
                Kinetic.Shape.call(this, t), this.className = "Path", this.dataArray = Kinetic.Path.parsePathData(this.getData()), this.on("dataChange.kinetic", function() {
                    e.dataArray = Kinetic.Path.parsePathData(this.getData())
                }), this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(t) {
                var e = this.dataArray,
                    i = !1;
                t.beginPath();
                for (var n = 0; n < e.length; n++) {
                    var a = e[n].command,
                        r = e[n].points;
                    switch (a) {
                        case "L":
                            t.lineTo(r[0], r[1]);
                            break;
                        case "M":
                            t.moveTo(r[0], r[1]);
                            break;
                        case "C":
                            t.bezierCurveTo(r[0], r[1], r[2], r[3], r[4], r[5]);
                            break;
                        case "Q":
                            t.quadraticCurveTo(r[0], r[1], r[2], r[3]);
                            break;
                        case "A":
                            var s = r[0],
                                o = r[1],
                                c = r[2],
                                h = r[3],
                                l = r[4],
                                d = r[5],
                                u = r[6],
                                f = r[7],
                                g = c > h ? c : h,
                                p = c > h ? 1 : c / h,
                                v = c > h ? h / c : 1;
                            t.translate(s, o), t.rotate(u), t.scale(p, v), t.arc(0, 0, g, l, l + d, 1 - f), t.scale(1 / p, 1 / v), t.rotate(-u), t.translate(-s, -o);
                            break;
                        case "z":
                            t.closePath(), i = !0
                    }
                }
                i ? t.fillStrokeShape(this) : t.strokeShape(this)
            }
        }, Kinetic.Util.extend(Kinetic.Path, Kinetic.Shape), Kinetic.Path.getLineLength = function(t, e, i, n) {
            return Math.sqrt((i - t) * (i - t) + (n - e) * (n - e))
        }, Kinetic.Path.getPointOnLine = function(t, e, i, n, a, r, s) {
            void 0 === r && (r = e), void 0 === s && (s = i);
            var o = (a - i) / (n - e + 1e-8),
                c = Math.sqrt(t * t / (1 + o * o));
            e > n && (c *= -1);
            var h, l = o * c;
            if (n === e) h = {
                x: r,
                y: s + l
            };
            else if ((s - i) / (r - e + 1e-8) === o) h = {
                x: r + c,
                y: s + l
            };
            else {
                var d, u, f = this.getLineLength(e, i, n, a);
                if (1e-8 > f) return void 0;
                var g = (r - e) * (n - e) + (s - i) * (a - i);
                g /= f * f, d = e + g * (n - e), u = i + g * (a - i);
                var p = this.getLineLength(r, s, d, u),
                    v = Math.sqrt(t * t - p * p);
                c = Math.sqrt(v * v / (1 + o * o)), e > n && (c *= -1), l = o * c, h = {
                    x: d + c,
                    y: u + l
                }
            }
            return h
        }, Kinetic.Path.getPointOnCubicBezier = function(t, e, i, n, a, r, s, o, c) {
            function h(t) {
                return t * t * t
            }

            function l(t) {
                return 3 * t * t * (1 - t)
            }

            function d(t) {
                return 3 * t * (1 - t) * (1 - t)
            }

            function u(t) {
                return (1 - t) * (1 - t) * (1 - t)
            }
            var f = o * h(t) + r * l(t) + n * d(t) + e * u(t),
                g = c * h(t) + s * l(t) + a * d(t) + i * u(t);
            return {
                x: f,
                y: g
            }
        }, Kinetic.Path.getPointOnQuadraticBezier = function(t, e, i, n, a, r, s) {
            function o(t) {
                return t * t
            }

            function c(t) {
                return 2 * t * (1 - t)
            }

            function h(t) {
                return (1 - t) * (1 - t)
            }
            var l = r * o(t) + n * c(t) + e * h(t),
                d = s * o(t) + a * c(t) + i * h(t);
            return {
                x: l,
                y: d
            }
        }, Kinetic.Path.getPointOnEllipticalArc = function(t, e, i, n, a, r) {
            var s = Math.cos(r),
                o = Math.sin(r),
                c = {
                    x: i * Math.cos(a),
                    y: n * Math.sin(a)
                };
            return {
                x: t + (c.x * s - c.y * o),
                y: e + (c.x * o + c.y * s)
            }
        }, Kinetic.Path.parsePathData = function(t) {
            if (!t) return [];
            var e = t,
                i = ["m", "M", "l", "L", "v", "V", "h", "H", "z", "Z", "c", "C", "q", "Q", "t", "T", "s", "S", "a", "A"];
            e = e.replace(new RegExp(" ", "g"), ",");
            for (var n = 0; n < i.length; n++) e = e.replace(new RegExp(i[n], "g"), "|" + i[n]);
            var a = e.split("|"),
                r = [],
                s = 0,
                o = 0;
            for (n = 1; n < a.length; n++) {
                var c = a[n],
                    h = c.charAt(0);
                c = c.slice(1), c = c.replace(new RegExp(",-", "g"), "-"), c = c.replace(new RegExp("-", "g"), ",-"), c = c.replace(new RegExp("e,-", "g"), "e-");
                var l = c.split(",");
                l.length > 0 && "" === l[0] && l.shift();
                for (var d = 0; d < l.length; d++) l[d] = parseFloat(l[d]);
                for (; l.length > 0 && !isNaN(l[0]);) {
                    var u, f, g, p, v, m, _, K, y, S, C = null,
                        x = [],
                        b = s,
                        w = o;
                    switch (h) {
                        case "l":
                            s += l.shift(), o += l.shift(), C = "L", x.push(s, o);
                            break;
                        case "L":
                            s = l.shift(), o = l.shift(), x.push(s, o);
                            break;
                        case "m":
                            var F = l.shift(),
                                P = l.shift();
                            if (s += F, o += P, C = "M", r.length > 2 && "z" === r[r.length - 1].command)
                                for (var T = r.length - 2; T >= 0; T--)
                                    if ("M" === r[T].command) {
                                        s = r[T].points[0] + F, o = r[T].points[1] + P;
                                        break
                                    }
                            x.push(s, o), h = "l";
                            break;
                        case "M":
                            s = l.shift(), o = l.shift(), C = "M", x.push(s, o), h = "L";
                            break;
                        case "h":
                            s += l.shift(), C = "L", x.push(s, o);
                            break;
                        case "H":
                            s = l.shift(), C = "L", x.push(s, o);
                            break;
                        case "v":
                            o += l.shift(), C = "L", x.push(s, o);
                            break;
                        case "V":
                            o = l.shift(), C = "L", x.push(s, o);
                            break;
                        case "C":
                            x.push(l.shift(), l.shift(), l.shift(), l.shift()), s = l.shift(), o = l.shift(), x.push(s, o);
                            break;
                        case "c":
                            x.push(s + l.shift(), o + l.shift(), s + l.shift(), o + l.shift()), s += l.shift(), o += l.shift(), C = "C", x.push(s, o);
                            break;
                        case "S":
                            f = s, g = o, u = r[r.length - 1], "C" === u.command && (f = s + (s - u.points[2]), g = o + (o - u.points[3])), x.push(f, g, l.shift(), l.shift()), s = l.shift(), o = l.shift(), C = "C", x.push(s, o);
                            break;
                        case "s":
                            f = s, g = o, u = r[r.length - 1], "C" === u.command && (f = s + (s - u.points[2]), g = o + (o - u.points[3])), x.push(f, g, s + l.shift(), o + l.shift()), s += l.shift(), o += l.shift(), C = "C", x.push(s, o);
                            break;
                        case "Q":
                            x.push(l.shift(), l.shift()), s = l.shift(), o = l.shift(), x.push(s, o);
                            break;
                        case "q":
                            x.push(s + l.shift(), o + l.shift()), s += l.shift(), o += l.shift(), C = "Q", x.push(s, o);
                            break;
                        case "T":
                            f = s, g = o, u = r[r.length - 1], "Q" === u.command && (f = s + (s - u.points[0]), g = o + (o - u.points[1])), s = l.shift(), o = l.shift(), C = "Q", x.push(f, g, s, o);
                            break;
                        case "t":
                            f = s, g = o, u = r[r.length - 1], "Q" === u.command && (f = s + (s - u.points[0]), g = o + (o - u.points[1])), s += l.shift(), o += l.shift(), C = "Q", x.push(f, g, s, o);
                            break;
                        case "A":
                            p = l.shift(), v = l.shift(), m = l.shift(), _ = l.shift(), K = l.shift(), y = s, S = o, s = l.shift(), o = l.shift(), C = "A", x = this.convertEndpointToCenterParameterization(y, S, s, o, _, K, p, v, m);
                            break;
                        case "a":
                            p = l.shift(), v = l.shift(), m = l.shift(), _ = l.shift(), K = l.shift(), y = s, S = o, s += l.shift(), o += l.shift(), C = "A", x = this.convertEndpointToCenterParameterization(y, S, s, o, _, K, p, v, m)
                    }
                    r.push({
                        command: C || h,
                        points: x,
                        start: {
                            x: b,
                            y: w
                        },
                        pathLength: this.calcLength(b, w, C || h, x)
                    })
                }("z" === h || "Z" === h) && r.push({
                    command: "z",
                    points: [],
                    start: void 0,
                    pathLength: 0
                })
            }
            return r
        }, Kinetic.Path.calcLength = function(t, e, i, n) {
            var a, r, s, o, c = Kinetic.Path;
            switch (i) {
                case "L":
                    return c.getLineLength(t, e, n[0], n[1]);
                case "C":
                    for (a = 0, r = c.getPointOnCubicBezier(0, t, e, n[0], n[1], n[2], n[3], n[4], n[5]), o = .01; 1 >= o; o += .01) s = c.getPointOnCubicBezier(o, t, e, n[0], n[1], n[2], n[3], n[4], n[5]), a += c.getLineLength(r.x, r.y, s.x, s.y), r = s;
                    return a;
                case "Q":
                    for (a = 0, r = c.getPointOnQuadraticBezier(0, t, e, n[0], n[1], n[2], n[3]), o = .01; 1 >= o; o += .01) s = c.getPointOnQuadraticBezier(o, t, e, n[0], n[1], n[2], n[3]), a += c.getLineLength(r.x, r.y, s.x, s.y), r = s;
                    return a;
                case "A":
                    a = 0;
                    var h = n[4],
                        l = n[5],
                        d = n[4] + l,
                        u = Math.PI / 180;
                    if (Math.abs(h - d) < u && (u = Math.abs(h - d)), r = c.getPointOnEllipticalArc(n[0], n[1], n[2], n[3], h, 0), 0 > l)
                        for (o = h - u; o > d; o -= u) s = c.getPointOnEllipticalArc(n[0], n[1], n[2], n[3], o, 0), a += c.getLineLength(r.x, r.y, s.x, s.y), r = s;
                    else
                        for (o = h + u; d > o; o += u) s = c.getPointOnEllipticalArc(n[0], n[1], n[2], n[3], o, 0), a += c.getLineLength(r.x, r.y, s.x, s.y), r = s;
                    return s = c.getPointOnEllipticalArc(n[0], n[1], n[2], n[3], d, 0), a += c.getLineLength(r.x, r.y, s.x, s.y)
            }
            return 0
        }, Kinetic.Path.convertEndpointToCenterParameterization = function(t, e, i, n, a, r, s, o, c) {
            var h = c * (Math.PI / 180),
                l = Math.cos(h) * (t - i) / 2 + Math.sin(h) * (e - n) / 2,
                d = -1 * Math.sin(h) * (t - i) / 2 + Math.cos(h) * (e - n) / 2,
                u = l * l / (s * s) + d * d / (o * o);
            u > 1 && (s *= Math.sqrt(u), o *= Math.sqrt(u));
            var f = Math.sqrt((s * s * o * o - s * s * d * d - o * o * l * l) / (s * s * d * d + o * o * l * l));
            a === r && (f *= -1), isNaN(f) && (f = 0);
            var g = f * s * d / o,
                p = f * -o * l / s,
                v = (t + i) / 2 + Math.cos(h) * g - Math.sin(h) * p,
                m = (e + n) / 2 + Math.sin(h) * g + Math.cos(h) * p,
                _ = function(t) {
                    return Math.sqrt(t[0] * t[0] + t[1] * t[1])
                },
                K = function(t, e) {
                    return (t[0] * e[0] + t[1] * e[1]) / (_(t) * _(e))
                },
                y = function(t, e) {
                    return (t[0] * e[1] < t[1] * e[0] ? -1 : 1) * Math.acos(K(t, e))
                },
                S = y([1, 0], [(l - g) / s, (d - p) / o]),
                C = [(l - g) / s, (d - p) / o],
                x = [(-1 * l - g) / s, (-1 * d - p) / o],
                b = y(C, x);
            return K(C, x) <= -1 && (b = Math.PI), K(C, x) >= 1 && (b = 0), 0 === r && b > 0 && (b -= 2 * Math.PI), 1 === r && 0 > b && (b += 2 * Math.PI), [v, m, s, o, S, b, h, r]
        }, Kinetic.Factory.addGetterSetter(Kinetic.Path, "data"), Kinetic.Collection.mapMethods(Kinetic.Path)
    }(), function() {
        function t(t) {
            t.fillText(this.partialText, 0, 0)
        }

        function e(t) {
            t.strokeText(this.partialText, 0, 0)
        }
        var i = "",
            n = "normal";
        Kinetic.TextPath = function(t) {
            this.___init(t)
        }, Kinetic.TextPath.prototype = {
            ___init: function(i) {
                var n = this;
                this.dummyCanvas = Kinetic.Util.createCanvasElement(), this.dataArray = [], Kinetic.Shape.call(this, i), this._fillFunc = t, this._strokeFunc = e, this._fillFuncHit = t, this._strokeFuncHit = e, this.className = "TextPath", this.dataArray = Kinetic.Path.parsePathData(this.attrs.data), this.on("dataChange.kinetic", function() {
                    n.dataArray = Kinetic.Path.parsePathData(this.attrs.data)
                }), this.on("textChange.kinetic textStroke.kinetic textStrokeWidth.kinetic", n._setTextData), n._setTextData(), this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(t) {
                t.setAttr("font", this._getContextFont()), t.setAttr("textBaseline", "middle"), t.setAttr("textAlign", "left"), t.save();
                for (var e = this.glyphInfo, i = 0; i < e.length; i++) {
                    t.save();
                    var n = e[i].p0;
                    t.translate(n.x, n.y), t.rotate(e[i].rotation), this.partialText = e[i].text, t.fillStrokeShape(this), t.restore()
                }
                t.restore()
            },
            getTextWidth: function() {
                return this.textWidth
            },
            getTextHeight: function() {
                return this.textHeight
            },
            setText: function(t) {
                Kinetic.Text.prototype.setText.call(this, t)
            },
            _getTextSize: function(t) {
                var e = this.dummyCanvas,
                    i = e.getContext("2d");
                i.save(), i.font = this._getContextFont();
                var n = i.measureText(t);
                return i.restore(), {
                    width: n.width,
                    height: parseInt(this.attrs.fontSize, 10)
                }
            },
            _setTextData: function() {
                var t = this,
                    e = this._getTextSize(this.attrs.text);
                this.textWidth = e.width, this.textHeight = e.height, this.glyphInfo = [];
                for (var i, n, a, r = this.attrs.text.split(""), s = -1, o = 0, c = function() {
                        o = 0;
                        for (var e = t.dataArray, n = s + 1; n < e.length; n++) {
                            if (e[n].pathLength > 0) return s = n, e[n];
                            "M" == e[n].command && (i = {
                                x: e[n].points[0],
                                y: e[n].points[1]
                            })
                        }
                        return {}
                    }, h = function(e) {
                        var r = t._getTextSize(e).width,
                            s = 0,
                            h = 0;
                        for (n = void 0; Math.abs(r - s) / r > .01 && 25 > h;) {
                            h++;
                            for (var l = s; void 0 === a;) a = c(), a && l + a.pathLength < r && (l += a.pathLength, a = void 0);
                            if (a === {} || void 0 === i) return void 0;
                            var d = !1;
                            switch (a.command) {
                                case "L":
                                    Kinetic.Path.getLineLength(i.x, i.y, a.points[0], a.points[1]) > r ? n = Kinetic.Path.getPointOnLine(r, i.x, i.y, a.points[0], a.points[1], i.x, i.y) : a = void 0;
                                    break;
                                case "A":
                                    var u = a.points[4],
                                        f = a.points[5],
                                        g = a.points[4] + f;
                                    0 === o ? o = u + 1e-8 : r > s ? o += Math.PI / 180 * f / Math.abs(f) : o -= Math.PI / 360 * f / Math.abs(f), (0 > f && g > o || f >= 0 && o > g) && (o = g, d = !0), n = Kinetic.Path.getPointOnEllipticalArc(a.points[0], a.points[1], a.points[2], a.points[3], o, a.points[6]);
                                    break;
                                case "C":
                                    0 === o ? o = r > a.pathLength ? 1e-8 : r / a.pathLength : r > s ? o += (r - s) / a.pathLength : o -= (s - r) / a.pathLength, o > 1 && (o = 1, d = !0), n = Kinetic.Path.getPointOnCubicBezier(o, a.start.x, a.start.y, a.points[0], a.points[1], a.points[2], a.points[3], a.points[4], a.points[5]);
                                    break;
                                case "Q":
                                    0 === o ? o = r / a.pathLength : r > s ? o += (r - s) / a.pathLength : o -= (s - r) / a.pathLength, o > 1 && (o = 1, d = !0), n = Kinetic.Path.getPointOnQuadraticBezier(o, a.start.x, a.start.y, a.points[0], a.points[1], a.points[2], a.points[3])
                            }
                            void 0 !== n && (s = Kinetic.Path.getLineLength(i.x, i.y, n.x, n.y)), d && (d = !1, a = void 0)
                        }
                    }, l = 0; l < r.length && (h(r[l]), void 0 !== i && void 0 !== n); l++) {
                    var d = Kinetic.Path.getLineLength(i.x, i.y, n.x, n.y),
                        u = 0,
                        f = Kinetic.Path.getPointOnLine(u + d / 2, i.x, i.y, n.x, n.y),
                        g = Math.atan2(n.y - i.y, n.x - i.x);
                    this.glyphInfo.push({
                        transposeX: f.x,
                        transposeY: f.y,
                        text: r[l],
                        rotation: g,
                        p0: i,
                        p1: n
                    }), i = n
                }
            }
        }, Kinetic.TextPath.prototype._getContextFont = Kinetic.Text.prototype._getContextFont, Kinetic.Util.extend(Kinetic.TextPath, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.TextPath, "fontFamily", "Arial"), Kinetic.Factory.addGetterSetter(Kinetic.TextPath, "fontSize", 12), Kinetic.Factory.addGetterSetter(Kinetic.TextPath, "fontStyle", n), Kinetic.Factory.addGetterSetter(Kinetic.TextPath, "fontVariant", n), Kinetic.Factory.addGetter(Kinetic.TextPath, "text", i), Kinetic.Collection.mapMethods(Kinetic.TextPath)
    }(), function() {
        Kinetic.RegularPolygon = function(t) {
            this.___init(t)
        }, Kinetic.RegularPolygon.prototype = {
            ___init: function(t) {
                Kinetic.Shape.call(this, t), this.className = "RegularPolygon", this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(t) {
                var e, i, n, a = this.attrs.sides,
                    r = this.attrs.radius;
                for (t.beginPath(), t.moveTo(0, 0 - r), e = 1; a > e; e++) i = r * Math.sin(2 * e * Math.PI / a), n = -1 * r * Math.cos(2 * e * Math.PI / a), t.lineTo(i, n);
                t.closePath(), t.fillStrokeShape(this)
            }
        }, Kinetic.Util.extend(Kinetic.RegularPolygon, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.RegularPolygon, "radius", 0), Kinetic.Factory.addGetterSetter(Kinetic.RegularPolygon, "sides", 0), Kinetic.Collection.mapMethods(Kinetic.RegularPolygon)
    }(), function() {
        Kinetic.Star = function(t) {
            this.___init(t)
        }, Kinetic.Star.prototype = {
            ___init: function(t) {
                Kinetic.Shape.call(this, t), this.className = "Star", this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(t) {
                var e = this.innerRadius(),
                    i = this.outerRadius(),
                    n = this.numPoints();
                t.beginPath(), t.moveTo(0, 0 - i);
                for (var a = 1; 2 * n > a; a++) {
                    var r = a % 2 === 0 ? i : e,
                        s = r * Math.sin(a * Math.PI / n),
                        o = -1 * r * Math.cos(a * Math.PI / n);
                    t.lineTo(s, o)
                }
                t.closePath(), t.fillStrokeShape(this)
            }
        }, Kinetic.Util.extend(Kinetic.Star, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.Star, "numPoints", 5), Kinetic.Factory.addGetterSetter(Kinetic.Star, "innerRadius", 0), Kinetic.Factory.addGetterSetter(Kinetic.Star, "outerRadius", 0), Kinetic.Collection.mapMethods(Kinetic.Star)
    }(), function() {
        var t = ["fontFamily", "fontSize", "fontStyle", "padding", "lineHeight", "text"],
            e = "Change.kinetic",
            i = "none",
            n = "up",
            a = "right",
            r = "down",
            s = "left",
            o = "Label",
            c = t.length;
        Kinetic.Label = function(t) {
            this.____init(t)
        }, Kinetic.Label.prototype = {
            ____init: function(t) {
                var e = this;
                Kinetic.Group.call(this, t), this.className = o, this.on("add.kinetic", function(t) {
                    e._addListeners(t.child), e._sync()
                })
            },
            getText: function() {
                return this.find("Text")[0]
            },
            getTag: function() {
                return this.find("Tag")[0]
            },
            _addListeners: function(i) {
                var n, a = this,
                    r = function() {
                        a._sync()
                    };
                for (n = 0; c > n; n++) i.on(t[n] + e, r)
            },
            getWidth: function() {
                return this.getText().getWidth()
            },
            getHeight: function() {
                return this.getText().getHeight()
            },
            _sync: function() {
                var t, e, i, o, c, h, l, d = this.getText(),
                    u = this.getTag();
                if (d && u) {
                    switch (t = d.getWidth(), e = d.getHeight(), i = u.getPointerDirection(), o = u.getPointerWidth(), l = u.getPointerHeight(), c = 0, h = 0, i) {
                        case n:
                            c = t / 2, h = -1 * l;
                            break;
                        case a:
                            c = t + o, h = e / 2;
                            break;
                        case r:
                            c = t / 2, h = e + l;
                            break;
                        case s:
                            c = -1 * o, h = e / 2
                    }
                    u.setAttrs({
                        x: -1 * c,
                        y: -1 * h,
                        width: t,
                        height: e
                    }), d.setAttrs({
                        x: -1 * c,
                        y: -1 * h
                    })
                }
            }
        }, Kinetic.Util.extend(Kinetic.Label, Kinetic.Group), Kinetic.Collection.mapMethods(Kinetic.Label), Kinetic.Tag = function(t) {
            this.___init(t)
        }, Kinetic.Tag.prototype = {
            ___init: function(t) {
                Kinetic.Shape.call(this, t), this.className = "Tag", this.sceneFunc(this._sceneFunc)
            },
            _sceneFunc: function(t) {
                var e = this.getWidth(),
                    i = this.getHeight(),
                    o = this.getPointerDirection(),
                    c = this.getPointerWidth(),
                    h = this.getPointerHeight(),
                    l = this.getCornerRadius();
                t.beginPath(), t.moveTo(0, 0), o === n && (t.lineTo((e - c) / 2, 0), t.lineTo(e / 2, -1 * h), t.lineTo((e + c) / 2, 0)), l ? (t.lineTo(e - l, 0), t.arc(e - l, l, l, 3 * Math.PI / 2, 0, !1)) : t.lineTo(e, 0), o === a && (t.lineTo(e, (i - h) / 2), t.lineTo(e + c, i / 2), t.lineTo(e, (i + h) / 2)), l ? (t.lineTo(e, i - l), t.arc(e - l, i - l, l, 0, Math.PI / 2, !1)) : t.lineTo(e, i), o === r && (t.lineTo((e + c) / 2, i), t.lineTo(e / 2, i + h), t.lineTo((e - c) / 2, i)), l ? (t.lineTo(l, i), t.arc(l, i - l, l, Math.PI / 2, Math.PI, !1)) : t.lineTo(0, i), o === s && (t.lineTo(0, (i + h) / 2), t.lineTo(-1 * c, i / 2), t.lineTo(0, (i - h) / 2)), l && (t.lineTo(0, l), t.arc(l, l, l, Math.PI, 3 * Math.PI / 2, !1)), t.closePath(), t.fillStrokeShape(this)
            }
        }, Kinetic.Util.extend(Kinetic.Tag, Kinetic.Shape), Kinetic.Factory.addGetterSetter(Kinetic.Tag, "pointerDirection", i), Kinetic.Factory.addGetterSetter(Kinetic.Tag, "pointerWidth", 0), Kinetic.Factory.addGetterSetter(Kinetic.Tag, "pointerHeight", 0), Kinetic.Factory.addGetterSetter(Kinetic.Tag, "cornerRadius", 0), Kinetic.Collection.mapMethods(Kinetic.Tag)
    }(), function() {
        Kinetic.Arrow = function(t) {
            this.____init(t)
        }, Kinetic.Arrow.prototype = {
            ____init: function(t) {
                Kinetic.Line.call(this, t), this.className = "Arrow"
            },
            _sceneFunc: function(t) {
                var e = 2 * Math.PI,
                    i = this.points(),
                    n = i.length,
                    a = i[n - 2] - i[n - 4],
                    r = i[n - 1] - i[n - 3],
                    s = (Math.atan2(r, a) + e) % e,
                    o = this.pointerLength(),
                    c = this.pointerWidth();
                t.save(), t.beginPath(), t.translate(i[n - 2], i[n - 1]), t.rotate(s), t.moveTo(0, 0), t.lineTo(-o, c / 2), t.lineTo(-o, -c / 2), t.closePath(), t.restore(), this.pointerAtBeginning() && (t.save(), t.translate(i[0], i[1]), a = i[2] - i[0], r = i[3] - i[1], t.rotate((Math.atan2(-r, -a) + e) % e), t.moveTo(0, 0), t.lineTo(-10, 6), t.lineTo(-10, -6), t.closePath(), t.restore()), t.fillStrokeShape(this), Kinetic.Line.prototype._sceneFunc.apply(this, arguments)
            }
        }, Kinetic.Util.extend(Kinetic.Arrow, Kinetic.Line), Kinetic.Factory.addGetterSetter(Kinetic.Arrow, "pointerLength", 10), Kinetic.Factory.addGetterSetter(Kinetic.Arrow, "pointerWidth", 10), Kinetic.Factory.addGetterSetter(Kinetic.Arrow, "pointerAtBeginning", !1), Kinetic.Collection.mapMethods(Kinetic.Arrow)
    }(), Mall.create = function(t, e) {
        var i = $('<div class="form-group"><input type="text" placeholder="New Mall Name" class="form-control" /></div>'),
            n = LT.Popup.create({
                header: "Create New Mall",
                body: i,
                save: function() {
                    var a = i.find("input").val();
                    if ("" == a.trim()) return !1;
                    var r = {
                        name: a.trim()
                    };
                    t = $.extend(!0, {}, r, t);
                    var s = new Mall(t);
                    return s.save(), e(s), n.hide(), !0
                },
                modal: {
                    show: !0,
                    save_text: "Create New Mall"
                }
            })
    }, Mall.load = function(t, e, i) {
        var n, a = {
            build: function() {
                return '<div class="alert alert-danger"><b>Warning:</b> There was an error loading your mall.</div>'
            }
        };
        return n = a, $.ajax({
            url: e + "json_load/" + t,
            dataType: "json",
            type: "GET",
            async: !1,
            success: function(t) {
                if (t && t.id) {
                    var e = $.extend(!0, {}, i, t);
                    n = new Mall(e)
                }
            }
        }), n
    }, Mall.prototype.save = function() {
        var t = this,
            e = this.build_save_object();
        $.post(this.options.controller + "json_save_mall", e, function(e) {
            e && e.mall && e.mall.success && e.mall.id && (t.options.id = e.mall.id)
        }, "json")
    }, Mall.prototype.build_save_object = function() {
        var t = {
            mall: this.get_save_data()
        };
        return t
    }, Mall.prototype.get_save_data = function() {
        var t = {
            mall_id: this.options.id,
            mall_name: this.options.name,
            mall_latitude: this.options.latitude,
            mall_longitude: this.options.longitude,
            levels: this.get_level_save_data()
        };
        return t
    }, Mall.prototype.get_level_save_data = function() {
        var t = [];
        for (var e in this.options.levels) {
            var i = this.options.levels[e];
            t.push(i.get_save_data())
        }
        return t
    }, Mall.prototype.build = function() {
        var t = this;
        for (var e in this.options.available_assets) ! function(e) {
            var i = t.options.available_assets[e],
                n = $("<img style='cursor:pointer;' />");
            n.hide(), image = new Image, image.onload = function() {
                n.show()
            }, image.src = i.icon, n.draggable({
                helper: "clone"
            }), n.data("url", i.icon), n.data("width", "32"), n.data("height", "33"), n.data("image", image), n.data("asset_id", i.ass_id), n.attr("src", i.icon);
            var a = $("<li class='list-group-item-indoor'>");
            a.append(n).append(i.ass_description), "function" == typeof t.options.in_menu_asset_click && a.on("click", function() {
                t.options.in_menu_asset_click(i)
            }), t.$html.find(".js-asset-types").append(a)
        }(e);
        return this.$html
    }, Mall.prototype.create_level = function() {
        var t = this,
            e = "",
            i = $('<div class="row"><input id="mall-level-number" placeholder="Level Number" class="form-control"/><input id="mall-level-name" placeholder="Level Name" class="form-control"/><div id="mall-level-image"><form action="' + this.options.controller + 'upload_mall_image" class="dropzone"><div class="fallback"><input type="file" style="min-height: 300px;border: 1px #aaa solid;"/></div></form></div></div>');
        i.find("form").fileUpload({
            callbacks: {
                complete: function(n, a) {
                    i.find("#mall-level-image").html('<img src="' + t.options.image_url + a.image_url + '"/>'), e = a.image_url
                }
            }
        });
        var n = LT.Popup.create({
            save: function() {
                var a = {
                        floor_number: i.find("#mall-level-number").val(),
                        floor_name: i.find("#mall-level-name").val(),
                        image_url: e
                    },
                    r = t.add_level(a);
                r.success ? n.remove() : i.before('<div class="alert alert-danger">' + r.messages.join("<br/>") + "</div>")
            },
            body: i,
            header: "Create New Mall Level",
            modal: {
                show: !0
            }
        })
    }, Mall.prototype.add_level = function(t) {
        var e = {
            success: !0,
            messages: []
        };
        t.mall = this, "" == t.floor_name.trim() && (e.success = !1, e.messages.push("Please enter a valid level name.")), ("" == t.floor_number.trim() || isNaN(t.floor_number)) && (e.success = !1, e.messages.push("Please enter a valid numeric level number."));
        for (var i in this.options.levels) this.options.levels[i].options.floor_number == t.floor_number && (e.messages.push("Please enter a level number that does not already exist."), e.success = !1);
        if (!e.success) return e;
        var n = new Mall.Level(t);
        return this.options.levels.push(n), this.$html.find(".js-level-list").append(n.menu_item()), e
    }, Mall.prototype.display_level = function(t) {
    	
    	//$('#mall_level_assets_table tbody').empty();

        this.$html.find(".js-level-holder").html(t.display())
    }, Mall.Level = function(t) {
        var e = this,
            i = {
                id: 0,
                mall: !1,
                floor_number: 0,
                floor_name: "",
                floor_description: "",
                image_url: "",
                assets: []
            };
        this.options = $.extend(!0, {}, i, t), this.full_background_image_url = this.options.mall.options.image_url + this.options.image_url, this.stage = !1;
        var n = this.options.assets;
        this.options.assets = [];
        $('#mall_level_assets_table tbody').empty(); 
        var a = function() {
        	//$('#mall_level_assets_table tbody').empty(); 
            for (var t in n) {
            	e.add_asset(n[t]);
            	var asset_id = n[t].asset_id;
            	console.log(' Asset added: ' + n[t].asset_id);
            	var table_row = '<tr>';
					table_row +='<td>'+ n[t].asset_id +'</td>';
					table_row +='<td>'+ n[t].id +'</td>';
					table_row +='<td>'+ 'X:' + n[t].x + 'Y:' + n[t].y + '</td>';
					table_row +='<td nowrap="nowrap" align="left">';
					table_row +='<a href="#" data-id="'+asset_id+'" data-target="#frmAssetOptions" data-toggle="modal" title="Create an Auction for this Asset">';
					table_row +='<span class="h4 glyphicon glyphicon-list-alt"></span>&nbsp;Processing Options';
					table_row +='</a>';
					//table_row +='<a href="#" data-id="'+asset_id+'" data-target="#frmAssetOptions" data-toggle="modal" title="Activate/Deactivate this Asset">';
					//table_row +='<span class="h4 glyphicon glyphicon-check">&nbsp;</span>';
					//table_row +='</a>';
					//table_row +='<a href="#" title="Work still in progress">';
					//table_row +='<span class="h4 glyphicon glyphicon-edit">&nbsp;</span>';
					//table_row +='</a>';
					//table_row +='<a href="#" title="Work still in progress">';
					//table_row +='<span class="h4 glyphicon glyphicon-book">&nbsp;</span></a>';
					table_row +='</td></tr>';
				
				$("#mall_level_assets_table tbody").append(table_row);
            }
        };
        "" != this.options.image_url && this.load_image(this.full_background_image_url, a), this.image = !1, this.width = 600, this.height = 600, this.holder = document.createElement("div")
    }, Mall.Level.prototype.get_save_data = function() {
        var t = {
            mall_level_id: this.options.id,
            mall_id: this.options.mall.id,
            mall_level_description: this.options.floor_description,
            mall_level_floor_name: this.options.floor_name,
            mall_level_floor_number: this.options.floor_number,
            mall_level_image_url: this.options.image_url,
            mall_level_asset_count: this.options.assets.count,
            assets: this.get_asset_save_data()
        };
        return t
    }, Mall.Level.prototype.get_asset_save_data = function() {
        var t = [];
        for (var e in this.options.assets) {
            var i = this.options.assets[e];
            t.push(i.get_save_data())
        }
        return t
    }, Mall.Level.prototype.load_image = function(t, e) {
        t = t || this.options.image_url;
        var i = this;
        return this.image = new Image, this.image.onload = function() {
            i.width = this.width, i.height = this.height, i.build_floor(), e()
        }, this.image.src = t, this.image
    }, Mall.Level.prototype.build_floor = function() {
        function t(t, i) {
            console.log("drop"), e.add_new_asset(t, i)
        }
        var e = this;
        this.$stageContainer = $(this.holder), this.stage = new Kinetic.Stage({
            container: this.holder,
            width: this.width,
            height: this.height
        }), this.layer = new Kinetic.Layer, this.stage.add(this.layer), this.$stageContainer.droppable({
            drop: t
        }), this.$stageContainer.find("canvas").css({
            backgroundImage: "url(" + this.full_background_image_url + ")",
            border: "1px solid #ccc"
        })
    }, Mall.Level.prototype.menu_item = function() {
        var t = $('<br/><img src="' + this.full_background_image_url + '" width="32px" height="32px" style="width: 32px;height:32px"/>'),
            e = $('<li role="presentation" style="border-top: 1px solid #ccc"><a href="javascript:" class="js-level" data-floor-number="' + this.options.floor_number + '">Level ' + this.options.floor_number + " (" + this.options.floor_name + ")</a></li>");
        return e.find("a").append(t), e
    }, Mall.Level.prototype.display = function() {
        return this.holder
    }, Mall.Level.prototype.add_new_asset = function(t, e) {
        var i = this.$stageContainer.offset(),
            n = i.left,
            a = i.top;
        console.log("Dropped", t);
        var r = parseInt(e.offset.left - n),
            s = parseInt(e.offset.top - a),
            o = e.draggable,
            c = new Mall.Asset({
                mall: this.options.mall,
                x: r,
                y: s,
                asset_id: o.data("asset_id"),
                image: o.data("image"),
                layer: this.layer,
                level: this
            });
        this.options.assets.push(c)
    }, Mall.Level.prototype.add_asset = function(t) {
        var e = {
            mall: this.options.mall,
            x: 0,
            y: 0,
            asset_id: 0,
            image: "",
            layer: this.layer,
            level: this
        };
        t = $.extend(!0, {}, e, t), console.log(t);
        var i = new Mall.Asset(t);
        this.options.assets.push(i)
    }, Mall.Asset = function(t) {
        var e = this,
            i = {
                id: 0,
                asset_id: 0,
                x: 0,
                y: 0,
                layer: !1,
                image: !1,
                mall: !1,
                level: !1
            };
        if (this.options = $.extend(!0, {}, i, t), this.kinetic_image, this.options.image && "" != this.options.image || (this.options.image = this.options.mall.options.image_url + "../images/generic_marker.png"), "string" == typeof this.options.image) {
            var n = new Image;
            n.onload = function() {
                e.options.image = n, e.display_marker()
            }, n.src = this.options.image
        } else this.display_marker()
    }, Mall.Asset.prototype.get_save_data = function() {
        var t = {
            mall_level_asset_id: this.options.id,
            mall_level_id: this.options.level.id,
            asset_id: this.options.asset_id,
            mall_level_asset_x_coordinate: this.options.x,
            mall_level_asset_y_coordinate: this.options.y
        };
        return t
    }, Mall.Asset.prototype.display_marker = function() {
        var t = this;
        $(this.options.image).draggable({
            helper: "clone"
        }), this.kinetic_image = new Kinetic.Image({
            x: parseInt(this.options.x),
            y: parseInt(this.options.y),
            image: this.options.image,
            draggable: !0
        }), this.kinetic_image.on("dblclick", function() {
            t.kinetic_image.remove(), t.options.layer.draw();
            for (var e in t.options.level.assets) t.options.level.assets[e] == t && delete t.options.level.assets[e];
            t.options.id > 0 && $.post(t.options.mall.options.controller + "json_delete_asset/" + t.options.id, {}, function(t) {
                console.log('deleted:'+t)
            }, "json")
        }), this.kinetic_image.on("click", function() {
            var e = t.options.asset_id,
                i = !1;
                //console.log('marker clicked'+e);
                modalshow(e);
            for (var n in t.options.mall.options.available_assets)
                if (t.options.mall.options.available_assets[n].ass_id == e) {
                    i = t.options.mall.options.available_assets[n];
                    break
                }
                "function" == typeof t.options.mall.options.on_level_asset_click && t.options.mall.options.on_level_asset_click(i)
        }), this.kinetic_image.on("dragend", function(e) {
            t.options.x = e.evt.layerX, t.options.y = e.evt.layerY, t.options.layer.draw()
        }), this.options.layer.add(this.kinetic_image), this.options.layer.draw()
    }, function(t) {
        function e(e, n, a) {
            function r(t) {
                s(t.target.files)
            }

            function s(i) {
                var r = new FormData;
                for (var s in a) r.append(s, a[s]);
                for (var s = 0; s < i.length; s++) f[i[s].name] = {
                    $elem: t('<div class="lt-upload-file"><span class="glyphicon "></span></div>'),
                    success: 0
                }, u.test.formdata && r.append("file[]", i[s]);
                u.test.formdata && t.ajax({
                    url: n.url,
                    async: !0,
                    data: r,
                    processData: !1,
                    contentType: !1,
                    dataType: "json",
                    success: function(t) {
                        d.update(100), "function" == typeof n.callbacks.complete && (console.log("Calling callback"), n.callbacks.complete(e, t))
                    },
                    type: "POST",
                    xhr: function() {
                        var e = t.ajaxSettings.xhr();
                        return u.test.progress && (e.upload.onprogress = function(t) {
                            if (t.lengthComputable) {
                                var e = t.loaded / t.total * 100 | 0;
                                d.update(e)
                            }
                        }), e
                    },
                    complete: function() {
                        d.update(0), d.hide()
                    }
                })
            }

            function o() {
                var i, a = !1;
                return u.test.formdata && u.test.dnd ? (t(e).find('input[type="file"]').on("change", r), n.elements.parent !== !1 ? h = t(n.elements.parent) : (h = t("<div>"), a = !0), d = t('<div class="progress" style="width: 100%;"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"</div>'), d.update = n.callbacks.progress, d.hide(), h.append(d), l = h.find(n.elements.drop), 0 === l.length && (i = c(n.elements.drop), l = t("<div " + i + ' style="opacity: 0.5; width:100%; height: 100%; top: 0; left:30px; position:absolute; background-color: #fff">')), t("body").on("dragover", function(t) {
                    t.preventDefault(), t.stopPropagation(), l.show()
                }), l.on("drop", function(e) {
                    d.show(), e.originalEvent.dataTransfer && e.originalEvent.dataTransfer.files.length && (e.preventDefault(), e.stopPropagation(), s(e.originalEvent.dataTransfer.files)), t(n.elements.drop).hide()
                }), l.hide(), h.append(l), a && t(e).after(h), u) : !1
            }

            function c(t) {
                var e, i = t.substr(0, 1);
                switch (i) {
                    case "#":
                        i = 'id="%s"', t = t.substr(1);
                        break;
                    case ".":
                        i = 'class="%s"', t = t.substr(1);
                        break;
                    default:
                        i = "%s"
                }
                return e = i.replace("%s", t)
            }
            var h, l, d, u = (i.length, this),
                f = {};
            return this.test = {
                filereader: "undefined" != typeof FileReader,
                dnd: "draggable" in document.createElement("span"),
                formdata: !!window.FormData,
                progress: "upload" in new XMLHttpRequest
            }, this.display_dropzone = function(t) {
                t ? (l.addClass("lt-upload-drop-active"), l.show()) : (l.hide(), l.removeClass("lt-upload-drop-active"))
            }, o()
        }
        var i = [];
        t.fn.fileUpload = function(n) {
            var a = {
                url: !1,
                elements: {
                    parent: !1,
                    holder: ".lt-upload-holder",
                    drop: ".lt-upload-drop",
                    progress: ".lt-upload-progress",
                    file: ".lt-upload-file"
                },
                callbacks: {
                    drag: !1,
                    drop: !1,
                    progress: function(t) {
                        this.find(".progress-bar").css("width", t + "%")
                    },
                    success: !1,
                    error: !1,
                    complete: !1
                },
                ignore: [],
                acceptedTypes: []
            };
            return n = t.extend(!0, {}, a, n), this.each(function() {
                ! function(a) {
                    n.url = n.url || t(a).attr("action");
                    var r = {};
                    t(a).find('input, select, input[type="checkbox"]:checked').each(function() {
                        -1 !== n.ignore.indexOf(t(this).attr("name")) || t(this).attr("data-ignore") || (r[t(this).attr("name")] = t(this).val())
                    }), i.push(new e(a, n, r))
                }(this)
            })
        }, t(function() {
            t('form[data-upload="upload"]').fileUpload();
            var e = 0;
            t(document).on("dragenter", function() {
                if (0 === e++)
                    for (var t in i) {
                        var n = i[t];
                        n.display_dropzone(!0)
                    }
            }), t(document).on("dragleave", function() {
                if (0 === --e)
                    for (var t in i) {
                        var n = i[t];
                        n.display_dropzone(!1)
                    }
            }), t(document).on("dragover", function(t) {
                t.stopPropagation(), t.preventDefault()
            })
        })
    }(jQuery), "undefined" == typeof LT) var LT = {};
LT.Popup = {}, LT.Popup.popups = {}, LT.Popup.history = [], LT.Popup.current = !1, LT.Popup.create = function(t) {
    var e = {
        id: Math.floor(1001 * Math.random()),
        header: "",
        body: "",
        open: !1,
        save: !1,
        show_popup_list: !1,
        modal: {
            show: !1,
            width: !1,
            open_next_on_close: !1,
            keyboard: !1,
            backdrop: !0,
            save_text: "Save Changes",
            hide_close: !1
        },
        scrollable: !1
    };
    t = $.extend(!0, {}, e, t), this.Popup = function(t) {
        var e = this;
        this.id = t.id, this.has_been_opened = !1, this.$popup = LT.Popup.elements.$popup(e, t), this.$popup.find(".modal-content .modal-header button, .modal-footer button.js-lt-popup-close").on("click", function() {
            e.remove()
        }), this.show = function() {
            LT.Popup.current = this, this.has_been_opened || ("function" == typeof t.open && t.open(e, t), this.has_been_opened = !0), this.$popup.modal("show")
        }, this.hide = function() {
            this.$popup.modal("hide"), LT.Popup.current = !1
        }, this.remove = function() {
            var t = this;
            LT.Popup.popups.hasOwnProperty(t.id) && (LT.Popup.current == t && (LT.Popup.current = null), delete LT.Popup.popups[t.id], t.$popup.modal("hide")), setTimeout(function() {
                t.$popup && t.$popup.remove()
            }, 2e3)
        }
    };
    var i = new this.Popup(t);
    return LT.Popup.popups[t.id] = i, i
}, LT.Popup.elements = {
    $popup: function(t, e) {
        var i = {
            dialog: ""
        };
        e.modal.width && (i = {
            dialog: "width: " + e.modal.width + ";"
        });
        var n = "";
        e.modal.save_text !== !1 && (n = '<button type="button" class="btn btn-success lt-popup-btn-save">' + e.modal.save_text + "</button>");
        var a = '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>',
            r = '<button type="button" class="btn btn-default js-lt-popup-close">Close</button>';
        e.modal.hide_close && (a = "", r = "");
        var s = '<div class="modal fade" id="lt-popup-%id%" tabindex="-1" role="dialog" aria-labelledby="lt-popup-label-%id%" aria-hidden="true"><div class="modal-dialog" style="' + i.dialog + '"><div class="modal-content"><div class="modal-header">' + a + '<h4 class="modal-title" id="lt-popup-label-%id%"></h4></div><div class="modal-body"></div><div class="modal-footer">' + r + n + "</div></div></div></div>";
        s = s.replace(/%id%/g, e.id);
        var o = $(s);
        return o.find(".modal-title").append(e.header), o.find(".modal-body").append(e.body), "function" == typeof e.save && o.find(".lt-popup-btn-save").on("click", function() {
            e.save(t)
        }), o.modal(e.modal), o
    },
    $popup_list: function() {
        var t = $('<div class="lt-popup-popup-list" style="position: absolute; left:30px; top: 0; width: 500px; overflow:auto; height: 32px; margin: 10px;"></div>');
        for (var e in LT.Popup.popups) {
            var i = "#fff";
            LT.Popup.current.id == e && (i = "#0f0"), t.append('<a href="javascript:" style="padding:2px;" data-popup-id="' + e + '"><span style="font-size: 32px; color: ' + i + '" class="glyphicon glyphicon-folder-close"></span></a>')
        }
        return t.on("click", "a", function() {
            var t = $(this).attr("data-popup-id");
            t != LT.Popup.current.id && (LT.Popup.current.hide(), LT.Popup.popups[$(this).attr("data-popup-id")].show())
        }), t
    }
};

//... a helper object for zooming
var zoomHelper = {
    stage: null,
    scale: 1,
    zoomFactor: 1.1,
    origin: {
        x: 0,
        y: 0
    },
    zoom: function(event) {
        event.preventDefault();
        var delta;
        if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
            if (event.originalEvent.detail > 0) {
                //scroll down
                delta = 0.2;
            } else {
                //scroll up
                delta = 0;
            }
        } else {
            if (event.originalEvent.wheelDelta < 0) {
                //scroll down
                delta = 0.2;
            } else {
                //scroll up
                delta = 0;
            }
        }
        var evt = event.originalEvent,
            mx = evt.clientX - zoomHelper.stage.getX(),
            my = evt.clientY - zoomHelper.stage.getY(),
            zoom = (zoomHelper.zoomFactor - delta),
            newscale = zoomHelper.scale * zoom;
        zoomHelper.origin.x = mx / zoomHelper.scale + zoomHelper.origin
            .x - mx / newscale;
        zoomHelper.origin.y = my / zoomHelper.scale + zoomHelper.origin
            .y - my / newscale;
        zoomHelper.stage.setOffset({
            x: zoomHelper.origin.x,
            y: zoomHelper.origin.y
        });
        zoomHelper.stage.setScale({
            x: newscale,
            y: newscale
        });
        zoomHelper.stage.draw();
        zoomHelper.scale *= zoom;
    }
};