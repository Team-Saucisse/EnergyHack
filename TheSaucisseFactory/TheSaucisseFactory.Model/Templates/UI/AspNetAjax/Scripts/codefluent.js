(function($) {

    $.fn.saveDialog = function(options) {
        var settings = {
            url: null,
            baseId: null,
            idMappings: []
        };

        if (options) {
            $.extend(settings, options);
        }

        var request = {};
        for (i = 0; i < settings.idMappings.length; i++) {
            var id = settings.idMappings[i].id;
            if (id == '') continue;
            var ctlId = '#' + settings.baseId + '_' + id;
            var ctl = cfGetCtl(ctlId);
            var value = cfGetCtlValue(ctl);
            //console.log('save ' + settings.idMappings[i].name + '=>' + value);
            request[settings.idMappings[i].name] = value;
        }

        var result = null;
        $.ajax({
            url: settings.url,
            async: false,
            dataType: "json",
            type: "POST",
            data: JSON.stringify(request),
            contentType: "json", // this is needed to fool WCF to believe it's not json...
            success: function(data, textStatus, jqxhr) {
                result = jQuery.parseJSON(jqxhr.responseText);
                if (!result.IsJsonExceptionObject) { // error
                    result = null;
                }
            },
            error: function(jqxhr, errorText, ex) {
                result = { Message: jQuery.parseJSON(jqxhr.responseText).FullMessage };
            }
        });
        return result;
    }

    $.fn.initDialog = function(options) {
        var settings = {
            baseId: null,
            idMappings: []
        };

        if (options) {
            $.extend(settings, options);
        }

        $(this).find('.cleditor').each(function(i) {
            $(this).cleditor();
        });

        for (var mapping in settings.idMappings) {
            var id = mapping.id;
            if (id == '') continue;
            if (mapping.defaultValue == null) continue;
            var value = mapping.defaultValue;
            var ctlId = '#' + settings.baseId + '_' + id;
            var ctl = cfGetCtl(ctlId);
            cfSetCtlValue(ctl, value);

            if (mapping.focus) {
                setTimeout("$('" + ctlId + "').focus();", 100)
            }
        }
    }

    $.fn.fillDialog = function(options) {

        var settings = {
            url: null,
            baseId: null,
            idMappings: []
        };

        if (options) {
            $.extend(settings, options);
        }

        $.ajax({
            url: settings.url,
            async: false,
            dataType: "json",
            cache: false,
            success: function(data, textStatus, jqxhr) {
                var result = jQuery.parseJSON(jqxhr.responseText);
                for (var prop in result) {
                    // propagate entitykey to all descendant of base id that have an EntityKey attribute
                    if (prop == "EntityKey") $('#' + settings.baseId + ' [' + prop + ']').attr(prop, result[prop]);
                    var mapping = fdGetMapping(prop);
                    if (mapping == null) continue;
                    var id = mapping.id;
                    if (id == '') continue;
                    var ctlId = '#' + settings.baseId + '_' + id;
                    var ctl = cfGetCtl(ctlId);
                    var value = result[prop];
                    //console.log('id:' + ctlId + ' value:' + value + ' norm:' + cfNormValue(value, mapping.format));
                    value = cfNormValue(value, mapping.format);

                    cfSetCtlValue(ctl, value);

                    if (mapping.focus) {
                        setTimeout("$('" + ctlId + "').focus();", 100)
                    }
                }
            },
            error: function(jqxhr, errorText, ex) {
                //console.log('error: ' + errorText);
                result = { Message: jQuery.parseJSON(jqxhr.responseText).FullMessage };
            }
        });

        function fdGetMapping(name) {
            for (i = 0; i < settings.idMappings.length; i++) {
                if (settings.idMappings[i].name == name) return settings.idMappings[i];
            }
            return null;
        }
    };

    $.fn.columnize = function(options) {

        var settings = {
            columns: 4
        };

        var col = 0;
        var line = 0;
        var columns = settings.columns;
        var maxHeight = 0;
        var computed = new Array();
        var parent = $(this).offsetParent();
        var padding = parseInt(parent.css('padding-left')) + parseInt(parent.css('padding-right'));
        var parentWidth = parent.innerWidth() - padding;
        var width = parentWidth;
        this.each(function() {
            if (options) {
                $.extend(settings, options);
            }

            if ($(this).height() > maxHeight) {
                maxHeight = $(this).height();
            }

            col++;
            width -= parseInt($(this).css('padding-left')) + parseInt($(this).css('padding-right')) + parseInt($(this).css('margin-right')) + parseInt($(this).css('margin-left'));
            if (col > settings.columns) {
                finishLine($(this));
            }
            else {
                computed[col] = $(this);
            }
        });

        if (line == 0) columns = col;
        finishLine($(this));
        return null;

        function finishLine(div) {
            for (var i = 0; i < computed.length; i++) {
                $(computed[i]).height(maxHeight);
                $(computed[i]).width(width / columns);
            }
            computed = new Array();
            line++; col = 0;
            computed[col] = div;
            width = parentWidth;
            maxHeight = div.height();
        }
    };


    $.widget("ui.combobox", {
        _create: function() {
            var self = this,
					select = this.element.hide(),
					selected = select.children(":selected"),
					value = selected.val() ? selected.text() : "";
            var input = this.input = $("<input>")
					.insertAfter(select)
					.val(value)
					.autocomplete({
					    delay: 0,
					    minLength: 0,
					    source: function(request, response) {
					        var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
					        response(select.children("option").map(function() {
					            var text = $(this).text();
					            if (this.value && (!request.term || matcher.test(text)))
					                return {
					                    label: text.replace(
											new RegExp(
												"(?![^&;]+;)(?!<[^<>]*)(" +
												$.ui.autocomplete.escapeRegex(request.term) +
												")(?![^<>]*>)(?![^&;]+;)", "gi"
											), "<strong>$1</strong>"),
					                    value: text,
					                    option: this
					                };
					        }));
					    },
					    select: function(event, ui) {
					        ui.item.option.selected = true;
					        self._trigger("selected", event, {
					            item: ui.item.option
					        });
					    },
					    change: function(event, ui) {
					        if (!ui.item) {
					            var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex($(this).val()) + "$", "i"),
									valid = false;
					            select.children("option").each(function() {
					                if ($(this).text().match(matcher)) {
					                    this.selected = valid = true;
					                    return false;
					                }
					            });
					            if (!valid) {
					                // remove invalid value, as it didn't match anything
					                $(this).val("");
					                select.val("");
					                input.data("autocomplete").term = "";
					                return false;
					            }
					        }
					    }
					})
					.addClass("ui-widget ui-widget-content ui-corner-left");

            input.data("autocomplete")._renderItem = function(ul, item) {
                return $("<li></li>")
						.data("item.autocomplete", item)
						.append("<a>" + item.label + "</a>")
						.appendTo(ul);
            };

            this.button = $("<button type='button'>&nbsp;</button>")
					.attr("tabIndex", -1)
					.attr("title", "Show All Items")
					.insertAfter(input)
					.button({
					    icons: {
					        primary: "ui-icon-triangle-1-s"
					    },
					    text: false
					})
					.removeClass("ui-corner-all")
					.addClass("ui-corner-right ui-button-icon")
					.click(function() {
					    // close if already visible
					    if (input.autocomplete("widget").is(":visible")) {
					        input.autocomplete("close");
					        return;
					    }

					    // work around a bug (likely same cause as #5265)
					    $(this).blur();

					    // pass empty string as value to search for, displaying all results
					    input.autocomplete("search", "");
					    input.focus();
					});
        },

        destroy: function() {
            this.input.remove();
            this.button.remove();
            this.element.show();
            $.Widget.prototype.destroy.call(this);
        }
    });
})(jQuery);

function cfNormValue(value, format) {
    try {
        //console.log('try date:' + value + ' format:' + format);
        if (value.indexOf('/Date(') == 0) {
            value = new Date(parseInt(value.replace(/\/Date\((-?\d+)\)\//gi, '$1')));
            //console.log('date:' + (value instanceof Date) + ' value:' + value);
        }
    }
    catch (err) {
    }
    if (Globalize !== undefined) { // req http://github.com/jquery/globalize
        if (format !== undefined) {
            if (value instanceof Date) {
                //console.log('is date');
                value = Globalize.format(value, format);
            }
            else if (typeof value === "number") {
                //console.log('is number');
                if (format != 't') { // hack for TimeSpan
                    value = Globalize.format(value, format);
                }
            }
        }
    }
    return value;
}

function cfGetCtlValue(ctl) {
    var value;
    if (ctl.is(':checkbox')) {
        value = ctl.attr('checked');
        if ((value === undefined) || (value == '')) {
            value = false;
        }
        else {
            value = true;
        }

        //console.log(ctl + ' is checkbox ->' + value);
        return value;
    }

    if (ctl.is('input') || ctl.is('select')) {
        value = ctl.val();
        //console.log(ctl + ' is input/select ->' + value);
        return value;
    }

    value = ctl.html();
    //console.log(ctl + ' is html ->' + value);
    return value;
}

function cfSetCtlValue(ctl, value) {
    if (ctl.is(':checkbox')) {
        ctl.attr('checked', value);
        //console.log(ctl + ' is checkbox ->' + value);
        return;
    }

    if (ctl.data('datetimepicker')) {
        //console.log(ctl + ' is datetimepicker');
    }

    if (ctl.data('datepicker')) {
        //console.log(ctl + ' is datepicker');
    }

    if (ctl.data('timepicker')) {
        //console.log(ctl + ' is timepicker');
    }

    if (ctl.is('input') || ctl.is('select')) {
        ctl.val(value);
        //console.log(ctl + ' is input/select <-' + value);
        return;
    }

    //console.log(ctl + ' is html <-' + value);
    ctl.html(value);
}

function cfGetCtl(id) {
    var ctl = $(id);

    if (ctl.is(':checkbox')) {
        //console.log(id + ' is checkbox');
        return ctl;
    }

    if (ctl.is('input') || ctl.is('select')) {
        //console.log(id + ' is input/select');
        return ctl;
    }

    // some ctl may be created with extra garbage (spans, etc.)
    // so, we need to pick the first one
    var deepCtl = ctl.find(':checkbox');
    if (deepCtl !== undefined) {
        //console.log(id + ' is deep checkbox');
        return deepCtl;
    }

    deepCtl = ctl.find('input');
    if (deepCtl !== undefined) {
        //console.log(id + ' is deep input/select');
        return deepCtl;
    }
    return ctl;
}

function cfNavFromView(sel, method, view) {
    var value = sel.val();
    if (value == '') return;
    if (view == '') view = 'default';
    if (view.toLowerCase() == value.toLowerCase()) return;
    //console.log('cfNavFromView' + value);
    window.location.href = '?Method=' + method + '&View=' + value;
}

function cfEKFromRI(ek) {
    if (ek == null) return null;
    ek = ek.toString();
    var i = ek.lastIndexOf('||');
    if (i < 0) return ek;
    return ek.substr(0, i);
}

function cfBuildParameters(baseId, idMappings) {
    var params = '';
    for (i = 0; i < idMappings.length; i++) {
        var id = idMappings[i].id;
        if (id == '') continue;
        var ctlId = '#' + baseId + '_' + id;
        var ctl = $(ctlId);
        params += '&_p_' + idMappings[i].name + '=' + ctl.val();
    }
    return params;
}

var JSON;JSON||(JSON={});
(function(){function d(a){return a<10?"0"+a:a}function n(a){o.lastIndex=0;return o.test(a)?'"'+a.replace(o,function(a){var c=p[a];return typeof c==="string"?c:"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4)})+'"':'"'+a+'"'}function j(d,i){var c,e,g,k,l=a,f,b=i[d];b&&typeof b==="object"&&typeof b.toJSON==="function"&&(b=b.toJSON(d));typeof h==="function"&&(b=h.call(i,d,b));switch(typeof b){case "string":return n(b);case "number":return isFinite(b)?String(b):"null";case "boolean":case "null":return String(b);case "object":if(!b)return"null";
a+=m;f=[];if(Object.prototype.toString.apply(b)==="[object Array]"){k=b.length;for(c=0;c<k;c+=1)f[c]=j(c,b)||"null";g=f.length===0?"[]":a?"[\n"+a+f.join(",\n"+a)+"\n"+l+"]":"["+f.join(",")+"]";a=l;return g}if(h&&typeof h==="object"){k=h.length;for(c=0;c<k;c+=1)typeof h[c]==="string"&&(e=h[c],(g=j(e,b))&&f.push(n(e)+(a?": ":":")+g))}else for(e in b)Object.prototype.hasOwnProperty.call(b,e)&&(g=j(e,b))&&f.push(n(e)+(a?": ":":")+g);g=f.length===0?"{}":a?"{\n"+a+f.join(",\n"+a)+"\n"+l+"}":"{"+f.join(",")+
"}";a=l;return g}}if(typeof Date.prototype.toJSON!=="function")Date.prototype.toJSON=function(){return isFinite(this.valueOf())?this.getUTCFullYear()+"-"+d(this.getUTCMonth()+1)+"-"+d(this.getUTCDate())+"T"+d(this.getUTCHours())+":"+d(this.getUTCMinutes())+":"+d(this.getUTCSeconds())+"Z":null},String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(){return this.valueOf()};var o=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
a,m,p={"\u0008":"\\b","\t":"\\t","\n":"\\n","\u000c":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},h;if(typeof JSON.stringify!=="function")JSON.stringify=function(d,i,c){var e;m=a="";if(typeof c==="number")for(e=0;e<c;e+=1)m+=" ";else typeof c==="string"&&(m=c);if((h=i)&&typeof i!=="function"&&(typeof i!=="object"||typeof i.length!=="number"))throw Error("JSON.stringify");return j("",{"":d})}})();