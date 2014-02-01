/*
* jQuery SuperCombo UI Widget 1.0
* Copyright (c) 2012-2013 SoftFluent S.A.S.
* 
* initially forked from:
* jQuery MultiSelect UI Widget 1.12, Copyright (c) 2011 Eric Hynds
* http://www.erichynds.com/jquery/jquery-ui-multiselect-widget/
*
* Depends:
*   - jQuery 1.7.1+
*   - jQuery UI 1.8 widget factory
*
* Dual licensed under the MIT and GPL licenses:
*   http://www.opensource.org/licenses/mit-license.php
*   http://www.gnu.org/licenses/gpl.html
*
*/

(function($, undefined) {
    var supercomboID = 0;
    var lastPageIndex = Math.pow(2, 31) - 1;

    // hook jquery's standard val() function    
    var origValHooks = $.valHooks['select'];
    $.valHooks['select'] = {
        get: function(el) {
            var sel = $('#' + el.id);
            var sc = sel.data('supercombo'); // is it the standard one or ours?
            if (!sc) return origValHooks.get(el); // standard, call original val() function
            return sel.supercombo('val'); // call our val() function
        },
        set: function(el, value) {
            var sel = $('#' + el.id);
            var sc = sel.data('supercombo'); // is it the standard one or ours?
            if (!sc) return origValHooks.set(el, value); // standard, call original val(value) function
            sel.supercombo('val', value); // call our val(value) function
        }
    };

    function scPageSet() {
        this.pages = {};
        this.currentPageIndex = -1;
        this.pageSize = 20;
        this.paramPageIndex = 'pageIndex';
        this.paramPageSize = 'pageSize';
        this.totalRecordCount = -1; // if >= 0 it means we know how many records are in the backoffice
        this.totalPageCount = -1;
        this.waitForPages = function(pageIndex, pageCount) {
            if (this.options.loadUrl === null) throw 'loadUrl must be defined.';
            var params = {};
            var readCount = this.pageSize * pageCount;
            params[this.paramPageIndex] = pageIndex;
            params[this.paramPageSize] = readCount;
            params = $.param(params);
            var url;
            var pages = this.pages;
            if (this.options.loadUrl.indexOf('?') >= 0) url = this.options.loadUrl + '&' + params; else url = this.options.loadUrl + '?' + params;
            $.ajax({
                url: url,
                async: false,
                dataType: 'json',
                context: this,
                cache: false,
                success: function(data, textStatus, jqXHR) {
                    pages[pageIndex] = data.rows;
                    if (data.records == 2147483647) data.records = -1; // int.MaxValue
                    if (data.records >= 0) this.totalRecordCount = data.records; // may be < 0
                    if (data.rows.length >= 0) {
                        if ((data.rows.length < readCount) && (this.totalRecordCount < 0)) { // last page reached?
                            this.totalRecordCount = this.pageSize * pageIndex + data.rows.length;
                        }
                    }
                    if (this.totalRecordCount >= 0) {
                        this.totalPageCount = Math.floor(this.totalRecordCount / this.pageSize);
                        if ((this.totalRecordCount == 0) || ((this.totalRecordCount % this.pageSize) != 0)) {
                            this.totalPageCount++;
                        }
                    }
                }
            });
        };
        this.getPage = function(pageIndex) {
            if (this.pages[pageIndex] == null) {
                this.waitForPages(pageIndex, 1);
            }
            return this.pages[pageIndex];
        };
    };


    $.widget("softfluent.supercombo", {

        // default options
        options: {
            header: true,
            height: 175,
            minWidth: 225,
            maxWidth: 225,
            classes: '',
            checkAllText: 'Check all',
            uncheckAllText: 'Uncheck all',
            noneSelectedText: 'Select options',
            selectedValuesSeparator: '|',
            selectedText: '# selected',
            selectedList: lastPageIndex,
            titleColumn: 'Title',
            valueColumn: 'Value',
            descriptionColumn: 'Description',
            show: '',
            hide: '',
            multiple: true,
            position: {},
            loadUrl: null, // Json datasource (jqGrid format)
            allowNoSelection: true, // with multiple = false only
            unselectedTitle: 'n/a', // the text for <no selection>
            unselectedValue: '',
            unselectedDescription: 'Not associated',
            originalTitle: null,
            val: null,
            combinedValue: false
        },

        _create: function() {
            //console.log('sc create');
            var el = this.element.hide(),
			o = this.options;

            el._pageSet = new scPageSet();
            el._pageSet.options = o;

            this.speed = $.fx.speeds._default; // default speed for effects
            this._isOpen = false; // assume no

            var 
			button = (this.button = $('<button type="button""><span class="ui-icon ui-icon-triangle-2-n-s"></span></button>'))
				.addClass('ui-supercombo ui-widget ui-state-default ui-corner-all')
				.addClass(o.classes)
				.attr({ 'title': el.attr('title'), 'aria-haspopup': true, 'tabIndex': el.attr('tabIndex') })
				.insertAfter(el),

			buttonlabel = (this.buttonlabel = $('<span />'))
				.html(o.noneSelectedText)
				.appendTo(button),

			menu = (this.menu = $('<div />'))
				.addClass('ui-supercombo-menu ui-widget ui-widget-content ui-corner-all')
				.addClass(o.classes)
				.appendTo(document.body),

			header = (this.header = $('<div />'))
				.addClass('ui-widget-header ui-corner-all ui-supercombo-header ui-helper-clearfix')
				.appendTo(menu),

            headerLinkContainer = (o.loadUrl === null) ?
                (this.headerLinkContainer = $('<ul />'))
				    .addClass('ui-helper-reset')
				    .html(function() {
				        if (o.header === true) {
				            return '<li><a class="ui-supercombo-all" href="#"><span class="ui-icon ui-icon-check"></span><span>' + o.checkAllText + '</span></a></li><li><a class="ui-supercombo-none" href="#"><span class="ui-icon ui-icon-closethick"></span><span>' + o.uncheckAllText + '</span></a></li>';
				        } else if (typeof o.header === "string") {
				            return '<li>' + o.header + '</li>';
				        } else {
				            return '';
				        }
				    })
				    .append('<li class="ui-supercombo-close"><a href="#" class="ui-supercombo-close"><span class="ui-icon ui-icon-circle-close"></span></a></li>')
				    .appendTo(header) :
                (this.headerLinkContainer = $('<ul />'))
				    .addClass('ui-helper-reset')
				    .html(function() {
				        return '<li>' +
				    '<a href="#" class="ui-supercombo-first" title="Go to first page"><span class="ui-icon ui-icon-seek-first"></span><a>' +
				    '<a href="#" class="ui-supercombo-prev" title="Go to previous page"><span class="ui-icon ui-icon-seek-prev"></span><a>' +
				    '<input type="text" value="' + (el._pageSet.currentPageIndex + 1) + '"></input>' +
				    '<a href="#" class="ui-supercombo-next" title="Go to next page"><span class="ui-icon ui-icon-seek-next"></span><a>' +
				    '<a href="#" class="ui-supercombo-end" title="Go to last page"><span class="ui-icon ui-icon-seek-end"></span><a>' +
				    '<span class="ui-supercombo-total">Total: ?</span></li>';
				    })
				    .append('<li class="ui-supercombo-close"><a href="#" class="ui-supercombo-close" title="Close"><span class="ui-icon ui-icon-circle-close"></span></a></li>')
				    .appendTo(header),

			checkboxContainer = (this.checkboxContainer = $('<ul />'))
				.addClass('ui-supercombo-checkboxes ui-helper-reset')
				.appendTo(menu);

            if ((o.multiple) && (o.loadUrl !== null)) {
                headerLinkContainer.append('<li class="ui-supercombo-clear"><a href="#" class="ui-supercombo-clear" title="Unselect All"><span class="ui-icon ui-icon-closethick"></span></a></li>');
            }

            // perform event bindings
            this._bindEvents();

            // build menu
            this.reload(true);

            if (this._hasNoSelection() && (o.originalTitle === null)) {
                this.buttonlabel.html(o.unselectedTitle);
            }

            if (o.originalTitle !== null) {
                this.buttonlabel.html(o.originalTitle);
            }

            // some addl. logic for single selects
            if (!o.multiple) {
                menu.addClass('ui-supercombo-single');
            }
        },

        _init: function() {
            //console.log('sc init');
            if (this.options.header === false) {
                this.header.hide();
            }
            if (!this.options.multiple) {
                this.headerLinkContainer.find('.ui-supercombo-all, .ui-supercombo-none').hide();
            }
            if (this.element.is(':disabled')) {
                this.disable();
                return;
            }

            this.val(this.options.val);
        },

        val: function(values) {
            var self = this, o = this.options, target;
            if (values === undefined) {
                // getter
                var val = '';
                if (this.element.selectedValues !== undefined) {
                    for (var key in this.element.selectedValues) {
                        if (val !== '') val += o.selectedValuesSeparator;
                        val += key;
                    }
                }
                //console.log("sc get val:" + val);
                return val;
            }
            //console.log("sc set val:" + values);

            // reset
            this.element.selectedValues = {};
            this.uncheckAll();

            // setter
            if ((o.combinedValue) && ($.isNumeric(values))) { // direct value, support for combination of values multiple
                var num = parseInt(values, 10);
                this.element.selectedValues[num] = num;
                this.checkboxContainer.find('input').each(function(i) {
                    //console.log(" +mnumeric value=" + this.value + " num=" + num);
                    if ((this.value != 0) && (this.value & num) == this.value) {
                        this.click();
                    }
                });
            }
            else if (values != null) {
                //console.log(" +other value=" + this.value + " v=" + values);
                if (o.multiple) {
                    var varAr = values.toString().split(o.selectedValuesSeparator);
                    for (var i = 0; i < varAr.length; i++) {
                        var num = varAr[i];
                        //console.log(" +other split num=" + num);
                        this.element.selectedValues[num] = num;
                        this.checkboxContainer.find('input').each(function(i) {
                            //console.log(" +mother value=" + this.value + " num=" + num);
                            if (this.value == num) {
                                this.click();
                            }
                        });
                    }
                }
                else {
                    this.element.selectedValues[values] = values;
                    this.checkboxContainer.find('input').each(function(i) {
                        //console.log(" +numeric value=" + this.value + " v=" + values);
                        if (this.value == values) {
                            this.click();
                        }
                    });
                }
            }

            // select the item representing 'no selection'
            if ((!o.multiple) && (o.allowNoSelection)) {
                if (this.buttonlabel !== undefined) {
                    this.buttonlabel.html(o.unselectedTitle);
                }
                this.checkboxContainer.find('input').each(function(i) {
                    //console.log(" +value=" + this.value + " v=" + values);
                    if (this.value === values) {
                        //console.log(" +set title=" + this.title);
                        target = this;
                    }
                    else {
                        $(this).removeClass('ui-state-active');
                        //console.log(" +unset class=" + this.title);
                    }
                });
                if (target !== undefined) target.click(); // select 'no selection'
                return;
            }
        },

        // determine if a value is in the list of selected values
        _isSelectedValue: function(value) {
            if (this.element.selectedValues === undefined) return false;
            return this.element.selectedValues[value] !== undefined;
        },

        // determine if nothing is selected
        _hasNoSelection: function() {
            if (this.element.selectedValues === undefined) return true;
            for (var key in this.element.selectedValues) return false; // is there any key?
            return true;
        },

        // update selected values from all inputs
        _updateTitle: function() {
            var title = '';
            for (var key in this.element.selectedValues) {
                if (title !== '') title += ', ';
                title += this.element.selectedValues[key];
            }
            this.buttonlabel.html(title);
        },

        // update selected values from all inputs
        _updateSelectedValues: function(el) {
            var self = this, o = this.options;
            if (this.element.selectedValues === undefined) this.element.selectedValues = {};
            if (o.multiple) {
                this.checkboxContainer.find('input').each(function(i) {
                    if (this.checked) {
                        self.element.selectedValues[this.value] = this.title;
                    }
                    else {
                        delete self.element.selectedValues[this.value];
                    }
                });
            }
            else if (el !== undefined) {
                self.element.selectedValues = {};
                self.element.selectedValues[el.value] = el.title;
            }
        },

        // go to page No index
        _setPage: function(index) { // 0-based
            if (index < 0) index = 0;
            var totalPageCount = this.element._pageSet.totalPageCount;
            if (totalPageCount >= 0) {
                if ((index > 0) && (index >= totalPageCount)) {
                    index = totalPageCount - 1;
                }
            }
            else if (index == lastPageIndex) {
                index = 0;
            }

            //console.log("sc _setPage index:" + index);
            if (index == this.element._pageSet.currentPageIndex)
                return;

            this._updateSelectedValues();

            var checkboxContainer = this.checkboxContainer,
			html = [],
			self = this,
			id = this.element.attr('id') || supercomboID++; // unique ID for the label & option tags
            o = this.options;

            if ((!o.multiple) && (o.allowNoSelection)) {
                //console.log(" + add unselectedValue:" + o.unselectedValue);
                var inputID = this.id || 'ui-supercombo-' + id + '-option-x';
                html.push('<li>');
                html.push('<label for="' + inputID + '" title="' + o.unselectedDescription + '" class="ui-corner-all' + (this._hasNoSelection() ? ' ui-state-active' : '') + '">');
                html.push('<input id="' + inputID + '" name="supercombo_' + id + '" type="radio" value="' + o.unselectedValue + '" title="' + o.unselectedDescription + '"');
                html.push(' /><span>' + o.unselectedTitle + '</span></label></li>');
            }

            if (o.loadUrl === null) {
                this.element.find('option').each(function(i) {
                    var description = this.title,
                    title = this.innerHTML,
    				value = this.value,
    				checked = self._isSelectedValue(value),
    				labelClasses = checked && (!o.multiple) ? ['ui-corner-all', 'ui-state-active'] : ['ui-corner-all'],
				    inputID = this.id || 'ui-supercombo-' + id + '-option-' + i;

                    if (title == '') title = value;
                    if (description == '') description = title;

                    //console.log(" + add value:" + value);

                    html.push('<li>');

                    // create the label
                    html.push('<label for="' + inputID + '" title="' + description + '" class="' + labelClasses.join(' ') + '">');
                    html.push('<input id="' + inputID + '" ' + (checked ? 'checked="checked" ' : '') + 'name="supercombo_' + id + '" type="' + (o.multiple ? "checkbox" : "radio") + '" value="' + value + '" title="' + title + '"');

                    // add the title and close everything off
                    html.push(' /><span>' + title + '</span></label></li>');

                    // insert into the DOM
                    checkboxContainer.html(html.join(''));
                });
            }
            else {
                $(this.element._pageSet.getPage(index)).each(function(i) {
                    var description = this[o.descriptionColumn],
                    title = this[o.titleColumn],
    				value = this[o.valueColumn],
    				checked = self._isSelectedValue(value),
    				labelClasses = checked && (!o.multiple) ? ['ui-corner-all', 'ui-state-active'] : ['ui-corner-all'],
				    inputID = this.id || 'ui-supercombo-' + id + '-option-' + i;

                    if (title === undefined) title = value;
                    if (description === undefined) description = title;

                    //console.log(" + add value:" + value);

                    html.push('<li>');

                    // create the label
                    html.push('<label for="' + inputID + '" title="' + description + '" class="' + labelClasses.join(' ') + '">');
                    html.push('<input id="' + inputID + '" ' + (checked ? 'checked="checked" ' : '') + 'name="supercombo_' + id + '" type="' + (o.multiple ? "checkbox" : "radio") + '" value="' + value + '" title="' + title + '"');

                    // add the title and close everything off
                    html.push(' /><span>' + title + '</span></label></li>');

                    // insert into the DOM
                    checkboxContainer.html(html.join(''));
                });

                if (this.element._pageSet.totalRecordCount >= 0) { // last page known
                    if (this.element._pageSet.totalRecordCount <= this.element._pageSet.pageSize) { // hide the header
                        this.header.hide();
                    } else {
                        this.headerLinkContainer.find('span.ui-supercombo-total').show().html('&nbsp;Total&nbsp;:' + this.element._pageSet.totalRecordCount);
                        this.headerLinkContainer.find('a.ui-supercombo-end').show();
                        if (index >= this.element._pageSet.totalPageCount) index = this.element._pageSet.totalPageCount - 1;
                    }
                }
                else {
                    this.headerLinkContainer.find('span.ui-supercombo-total').hide();
                    this.headerLinkContainer.find('a.ui-supercombo-end').hide();
                }
            }

            // update data
            this.header.find('input').val(index + 1);
            this.element._pageSet.currentPageIndex = index;

            // cache some moar useful elements
            this.labels = this.menu.find('label');
        },

        reload: function(init) {
            this._setPage(0);

            // set widths
            this._setButtonWidth();
            this._setMenuWidth();

            // remember default value
            this.button[0].defaultValue = this.update();

            // broadcast reload event; useful for widgets
            if (!init) {
                this._trigger('reload');
            }
        },

        // updates the button text. call reload() to rebuild
        update: function() {
            var o = this.options,
			$inputs = this.labels.find('input'),
			$checked = $inputs.filter('[checked]'),
			numChecked = $checked.length,
			value;

            if (numChecked === 0) {
                value = o.noneSelectedText;
            } else {
                if ($.isFunction(o.selectedText)) {
                    value = o.selectedText.call(this, numChecked, $inputs.length, $checked.get());
                } else if (/\d/.test(o.selectedList) && o.selectedList > 0 && numChecked <= o.selectedList) {
                    value = $checked.map(function() { return $(this).next().text(); }).get().join(', ');
                } else {
                    value = o.selectedText.replace('#', numChecked).replace('#', $inputs.length);
                }
            }

            this.buttonlabel.html(value);
            return value;
        },

        // binds events
        _bindEvents: function() {
            var self = this, button = this.button;

            function clickHandler() {
                self[self._isOpen ? 'close' : 'open']();
                return false;
            }

            // webkit doesn't like it when you click on the span :(
            button
    			.find('span')
	    		.bind('click.supercombo', clickHandler);

            // button events
            button.bind({
                click: clickHandler,
                keypress: function(e) {
                    switch (e.which) {
                        case 27: // esc
                        case 38: // up
                        case 37: // left
                            self.close();
                            break;
                        case 39: // right
                        case 40: // down
                            self.open();
                            break;
                    }
                },
                mouseenter: function() {
                    if (!button.hasClass('ui-state-disabled')) {
                        $(this).addClass('ui-state-hover');
                    }
                },
                mouseleave: function() {
                    $(this).removeClass('ui-state-hover');
                },
                focus: function() {
                    if (!button.hasClass('ui-state-disabled')) {
                        $(this).addClass('ui-state-focus');
                    }
                },
                blur: function() {
                    $(this).removeClass('ui-state-focus');
                }
            });

            // header links
            this.header
			    .delegate('a', 'click.supercombo', function(e) {
			        if ($(this).hasClass('ui-supercombo-close')) {
			            self.close();
			        }
			        else if ($(this).hasClass('ui-supercombo-clear')) {
			            self.uncheckAll();
			            self.labels.removeClass('ui-state-active');
			            self.element.selectedValues = {};
			            self.close();
			            self.element.trigger('change');
			        }
			        else if ($(this).hasClass('ui-supercombo-first')) {
			            self._setPage(0);
			        }
			        else if ($(this).hasClass('ui-supercombo-prev')) {
			            self._setPage(self.element._pageSet.currentPageIndex - 1);
			        }
			        else if ($(this).hasClass('ui-supercombo-next')) {
			            self._setPage(self.element._pageSet.currentPageIndex + 1);
			        }
			        else if ($(this).hasClass('ui-supercombo-end')) {
			            self._setPage(lastPageIndex);
			        }
			        else {
			            self[$(this).hasClass('ui-supercombo-all') ? 'checkAll' : 'uncheckAll']();
			        }

			        e.preventDefault();
			    });

            // pager input
            this.header
			.delegate('input', 'keypress.supercombo', function(e) {
			    if (e.which == 13) { // Enter pressed
			        $(this).trigger('change');
			        return;
			    }
			    // only allow 0 to 9, backspace, tab, escape, and ctrl+a
			    if ((e.which >= 48 && e.which <= 57) || (e.which == 8) || (e.which == 9) || (e.which == 27) || (e.which == 64 && e.ctrlKey)) {
			        // auto size
			        var text = $('<span>').html($(this).val()).appendTo(this.parentNode);
			        var w = text.innerWidth();
			        text.remove();
			        $(this).width(w + 15);
			        return;
			    }
			    e.preventDefault();
			})
            .delegate('input', 'change.supercombo', function(e) {
                var index = parseInt($(this).val(), 10); if ((isNaN(index)) || (index <= 0)) index = 0; else index = index - 1; $(this).val(index + 1);
                // auto size
                var text = $('<span>').html($(this).val()).appendTo(this.parentNode);
                var w = text.innerWidth();
                text.remove();
                $(this).width(w + 15);
                self._setPage(index);
            });

            // label toggle support
            this.menu
			.delegate('label', 'mouseenter.supercombo', function() {
			    if (!$(this).hasClass('ui-state-disabled')) {
			        self.labels.removeClass('ui-state-hover');
			        $(this).addClass('ui-state-hover').find('input').focus();
			    }
			})
			.delegate('label', 'keydown.supercombo', function(e) {
			    e.preventDefault();

			    switch (e.which) {
			        case 9: // tab
			        case 27: // esc
			            self.close();
			            break;
			        case 38: // up
			        case 40: // down
			        case 37: // left
			        case 39: // right
			            self._traverse(e.which, this);
			            break;
			        case 13: // enter
			            $(this).find('input')[0].click();
			            break;
			    }
			})
			.delegate('input[type="checkbox"], input[type="radio"]', 'click.supercombo', function(e) {
			    var $this = $(this),
					val = this.value,
					checked = this.checked,
					tags = self.element.find('option');

			    // bail if this input is disabled or the event is cancelled
			    if (this.disabled || self._trigger('click', e, { value: val, text: this.title, checked: checked }) === false) {
			        e.preventDefault();
			        return;
			    }

			    // make sure the input has focus. otherwise, the esc key
			    // won't close the menu after clicking an item.
			    $this.focus();

			    // toggle aria state
			    $this.attr('aria-selected', checked);

			    // change state on the original option tags
			    tags.each(function() {
			        if (this.value === val) {
			            this.selected = checked;
			        } else if (!self.options.multiple) {
			            this.selected = false;
			        }
			    });

			    self._updateSelectedValues(this);
			    self._updateTitle();

			    // some additional single select-specific logic
			    if (!self.options.multiple) {
			        self.labels.removeClass('ui-state-active');
			        $this.closest('label').toggleClass('ui-state-active', checked);

			        // close menu
			        self.close();
			    }

			    // fire change on the select box
			    self.element.trigger("change");

			    // setTimeout is to fix multiselect issue #14 and #47. caused by jQuery issue #3827
			    // http://bugs.jquery.com/ticket/3827 
			    setTimeout($.proxy(self.update, self), 10);
			});

            // close each widget when clicking on any other element/anywhere else on the page
            $(document).bind('mousedown.supercombo', function(e) {
                if (self._isOpen && !$.contains(self.menu[0], e.target) && !$.contains(self.button[0], e.target) && e.target !== self.button[0]) {
                    self.close();
                }
            });

            // deal with form resets.  the problem here is that buttons aren't
            // restored to their defaultValue prop on form reset, and the reset
            // handler fires before the form is actually reset.  delaying it a bit
            // gives the form inputs time to clear.
            $(this.element[0].form).bind('reset.supercombo', function() {
                setTimeout($.proxy(self.reload, self), 10);
            });
        },

        // set button width
        _setButtonWidth: function() {
            var width = this.element.outerWidth(),
			o = this.options;

            if (/\d/.test(o.minWidth) && width < o.minWidth) {
                width = o.minWidth;
            }

            if (/\d/.test(o.maxWidth)) {
                this.button.css('max-width', o.maxWidth);
            }

            // set widths
            this.button.width(width);
        },

        // set menu width
        _setMenuWidth: function() {
            var m = this.menu,
			width = this.button.outerWidth() -
				parseInt(m.css('padding-left'), 10) -
				parseInt(m.css('padding-right'), 10) -
				parseInt(m.css('border-right-width'), 10) -
				parseInt(m.css('border-left-width'), 10);

            m.width(width || this.button.outerWidth());
        },

        // move up or down within the menu
        _traverse: function(which, start) {
            var $start = $(start),
			moveToLast = which === 38 || which === 37,

            // select the first li that isn't an optgroup label / disabled
			$next = $start.parent()[moveToLast ? 'prevAll' : 'nextAll']('li:not(.ui-supercombo-disabled)')[moveToLast ? 'last' : 'first']();

            // if at the first/last element
            if (!$next.length) {
                var $container = this.menu.find('ul').last();

                // move to the first/last
                this.menu.find('label')[moveToLast ? 'last' : 'first']().trigger('mouseover');

                // set scroll position
                $container.scrollTop(moveToLast ? $container.height() : 0);

            } else {
                $next.find('label').trigger('mouseover');
            }
        },

        // This is an internal function to toggle the checked property and
        // other related attributes of a checkbox.
        //
        // The context of this function should be a checkbox; do not proxy it.
        _toggleState: function(prop, flag) {
            return function() {
                if (!this.disabled) {
                    this[prop] = flag;
                }

                if (flag) {
                    this.setAttribute('aria-selected', true);
                } else {
                    this.removeAttribute('aria-selected');
                }
            };
        },

        _toggleChecked: function(flag, group) {
            var $inputs = (group && group.length) ?
			group :
			this.labels.find('input'),

			self = this;

            // toggle state on inputs
            $inputs.each(this._toggleState('checked', flag));

            // give the first input focus
            $inputs.eq(0).focus();

            // update button text
            this.update();

            // gather an array of the values that actually changed
            var values = $inputs.map(function() {
                return this.value;
            }).get();

            // toggle state on original option tags
            this.element
			.find('option')
			.each(function() {
			    if (!this.disabled && $.inArray(this.value, values) > -1) {
			        self._toggleState('selected', flag).call(this);
			    }
			});

            // trigger the change event on the select
            if ($inputs.length) {
                this.element.trigger("change");
            }

            this._updateSelectedValues();
        },

        _toggleDisabled: function(flag) {
            this.button
			.attr({ 'disabled': flag, 'aria-disabled': flag })[flag ? 'addClass' : 'removeClass']('ui-state-disabled');

            this.menu
			.find('input')
			.attr({ 'disabled': flag, 'aria-disabled': flag })
			.parent()[flag ? 'addClass' : 'removeClass']('ui-state-disabled');

            this.element
			.attr({ 'disabled': flag, 'aria-disabled': flag });
        },

        // open the menu
        open: function(e) {
            var self = this,
			button = this.button,
			menu = this.menu,
			speed = this.speed,
			o = this.options;

            // bail if the multiselectopen event returns false, this widget is disabled, or is already open 
            if (this._trigger('beforeopen') === false || button.hasClass('ui-state-disabled') || this._isOpen) {
                return;
            }

            var $container = menu.find('ul').last(),
			effect = o.show,
			pos = button.offset();

            // figure out opening effects/speeds
            if ($.isArray(o.show)) {
                effect = o.show[0];
                speed = o.show[1] || self.speed;
            }

            // set the scroll of the checkbox container
            $container.scrollTop(0).height(o.height);

            // position and show menu
            if ($.ui.position && !$.isEmptyObject(o.position)) {
                o.position.of = o.position.of || button;

                menu
				.show()
				.position(o.position)
				.hide()
				.show(effect, speed);

                // if position utility is not available...
            } else {
                menu.css({
                    top: pos.top + button.outerHeight(),
                    left: pos.left
                }).show(effect, speed);
            }

            // select the first option
            // triggering both mouseover and mouseover because 1.4.2+ has a bug where triggering mouseover
            // will actually trigger mouseenter.  the mouseenter trigger is there for when it's eventually fixed
            this.labels.eq(0).trigger('mouseover').trigger('mouseenter').find('input').trigger('focus');

            button.addClass('ui-state-active');
            this._isOpen = true;
            this._trigger('open');
        },

        // close the menu
        close: function() {
            if (this._trigger('beforeclose') === false) {
                return;
            }

            var o = this.options, effect = o.hide, speed = this.speed;

            // figure out opening effects/speeds
            if ($.isArray(o.hide)) {
                effect = o.hide[0];
                speed = o.hide[1] || this.speed;
            }

            this.menu.hide(effect, speed);
            this.button.removeClass('ui-state-active').trigger('blur').trigger('mouseleave');
            this._isOpen = false;
            this._trigger('close');
        },

        enable: function() {
            this._toggleDisabled(false);
        },

        disable: function() {
            this._toggleDisabled(true);
        },

        checkAll: function(e) {
            var self = this;
            this.element.selectedValues = {}; // need to set this before events
            this.checkboxContainer.find('input').each(function(i) {
                self.element.selectedValues[this.value] = this.title;
            });
            this._toggleChecked(true);
            this._trigger('checkAll');
        },

        uncheckAll: function() {
            this.element.selectedValues = {}; // need to set this before events
            this._toggleChecked(false);
            this._trigger('uncheckAll');
        },

        getChecked: function() {
            return this.menu.find('input').filter('[checked]');
        },

        destroy: function() {

            this.element._pageSet = null;

            // remove classes + data
            $.Widget.prototype.destroy.call(this);

            this.button.remove();
            this.menu.remove();
            this.element.show();

            return this;
        },

        isOpen: function() {
            return this._isOpen;
        },

        widget: function() {
            return this.menu;
        },

        // react to option changes after initialization
        _setOption: function(key, value) {
            var menu = this.menu;

            switch (key) {
                case 'header':
                    menu.find('div.ui-supercombo-header')[value ? 'show' : 'hide']();
                    break;
                case 'checkAllText':
                    menu.find('a.ui-supercombo-all span').eq(-1).text(value);
                    break;
                case 'uncheckAllText':
                    menu.find('a.ui-supercombo-none span').eq(-1).text(value);
                    break;
                case 'height':
                    menu.find('ul').last().height(parseInt(value, 10));
                    break;
                case 'maxWidth':
                case 'minWidth':
                    this.options[key] = parseInt(value, 10);
                    this._setButtonWidth();
                    this._setMenuWidth();
                    break;
                case 'selectedText':
                case 'selectedList':
                case 'noneSelectedText':
                    this.options[key] = value; // these all needs to update immediately for the update() call
                    this.update();
                    break;
                case 'classes':
                    menu.add(this.button).removeClass(this.options.classes).addClass(value);
                    break;
            }

            $.Widget.prototype._setOption.apply(this, arguments);
        }
    });

})(jQuery);
