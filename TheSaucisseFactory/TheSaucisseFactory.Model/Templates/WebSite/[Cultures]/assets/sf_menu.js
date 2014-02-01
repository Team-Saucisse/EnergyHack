// ---------------------------------------------------------------------------
// JSMenuFluent V1.1 Copyright (c) 2005-2013 SOFTFLUENT S.A.S. All rights reserved.
// Please contact support@softfluent.com for any information.
// http://www.softfluent.com
// ---------------------------------------------------------------------------
var SFShownMenuId = null;
var SFMenuTimer = null;

function SFCreateRootMenu(menu)
{
	document.write('<table id="sf-rootMenu" class="sf-rootMenu"><tr>');
	for (var i = 0; i < menu.length; i++)
	{
		var menu_item = menu[i];
		var link = menu_item[2];
		if (link == null)
		{
			link = '#'
		}
		document.write('<td class="' + menu_item[1] + '-off" nowrap'
			+ ' onmouseover="SFMenuPopup(m_' + i + ');"'
			+ ' onmouseout="SFMenuHide(m_' + i + ');"'
			+ ' id="m_' + i + '"'
			+ '>');
		
		if ((menu_item[0] != null) && (menu_item[0] != ''))
		{
			document.write('<a href="' + link +'"'
			+ '>');
			document.write(unescape(menu_item[0]));
			document.write('</a>');
		}
		document.write('</td>');
	}
	document.write('</tr></table>');

	for (var i = 0; i < menu.length; i++)
	{
		var menu_item = menu[i];
		if (menu_item[3] != null)
		{
			SFCreateMenu(menu_item[3], i);
		}		
	}
}

function SFCreateMenu(menu, menuName)
{
	document.write('<div style="'
		+ 'position: absolute;z-index:999;'
		+ 'visibility:hidden;'
		+ 'top: 0px; left: 0px;'		
		+ '"'
		+ ' id="m_' + menuName + '_s"'
		+ '><table class="' + menu[0][1] + '">');
	for (var i = 0; i < menu.length; i++)
	{
		var menu_item = menu[i];
		var link = menu_item[2];
		if (link == null)
		{
			link = '#'
		}
		link = link + SFRebuildQueryString();
		document.write('<tr><td class="' + menu_item[1] + '-off" nowrap'
				+ ' id="m_' + menuName + '_' + i + '"'
				+ ' onmouseover="SFMenuItemOver(m_' + menuName + '_' + i + ');"'
				+ ' onmouseout="SFMenuItemOut(m_' + menuName + '_' + i + ');"'
				+ '><a href="' + link + '"'
				+ '>');
		document.write(unescape(menu_item[0]));
		document.write('</a></td></tr>');
		//document.write('<tr><td></td></tr>');
	}
	document.write('</table></div>');

	for (var i = 0; i < menu.length; i++)
	{
		var menu_item = menu[i];
		if (menu_item[3] != null)
		{
			SFCreateMenu(menu_item[3], menuName + '_' + i);
		}
	}		
}

function SFMenuItemOver(td)
{
	SFClearTimer();
	SFSwitchClassOn(td);
}

function SFMenuItemOut(td)
{
	SFClearTimer();
	SFSwitchClassOff(td);
	SFMenuHide(document.getElementById(SFShownMenuId));
}

function SFMenuHide(td)
{
	SFMenuTimer = setTimeout('SFMenuHide2(\'' + td.id + '\')', 400);
}

function SFMenuHide2(id)
{
	SFClearTimer();
	var div = SFGetMenuDiv(id);
	if (div != null)
	{
		div.style.visibility = 'hidden';
	}
	var td = document.getElementById(id);
	if (td != null)
	{
		SFSwitchClassOff(td);
	}
}

function SFGetMenuDiv(id)
{
	return document.getElementById(id + '_s');
}

function SFSwitchClassOn(element)
{
	element.className = element.className.replace(new RegExp('-off', 'g'), '-on');
}

function SFSwitchClassOff(element)
{
	element.className = element.className.replace(new RegExp('-on', 'g'), '-off');
}

function SFClearTimer()
{
	if (SFMenuTimer != null)
	{
		clearTimeout(SFMenuTimer);
		SFMenuTimer = null;
	}
}

function SFMenuPopup(td)
{
	SFClearTimer();
	if (SFShownMenuId != null)
	{
		if (SFShownMenuId != td.id)
		{
			SFMenuHide2(SFShownMenuId);
			SFShownMenuId = null;
		}
	}
	SFSwitchClassOn(td);
	var div = SFGetMenuDiv(td.id);
	if (div != null)
	{
		div.style.visibility = 'visible';
	}
	var rootDiv = document.getElementById('sf-root');
	var rootMenuTable = document.getElementById('sf-rootMenu');
	if ((div != null) && (rootDiv != null))
	{
		if (navigator.userAgent.toLowerCase().indexOf('firefox') == - 1)
		{
			div.style.left = rootDiv.offsetLeft + td.offsetLeft - 2 + 'px';
		}
		else
		{
			div.style.left = rootDiv.offsetLeft + td.offsetLeft + 'px';
		}
	}
	if ((div != null) && (rootMenuTable != null))
	{
		div.style.top = rootMenuTable.offsetParent.offsetTop + td.clientHeight + 'px';
	}
	SFShownMenuId = td.id;
}

function SFRebuildQueryString()
{
	if (window.location.search == null)
		return "";
		
	if (window.location.search.length == 0)
		return "";
		
	var qs = new SFQueryString(window.location.search);
	var newQS = "?";
	
	// <CodeFluent specific
	var value = qs.getValue('cf-css');
	if (value)
	{
		if (newQS.substring(newQS.length - 1) != "?")
		{
			newQS += "&";
		}
		newQS += "cf-css=" + value;
	}
	// CodeFluent specific>
	return newQS;
}

function SFQueryString(search)
{
	this.keyValuePairs = new Array();
	if (search.length > 1)
	{
		this.search = search.substring(1, search.length);
		this.keyValuePairs = this.search.split("&");
	}
	else
	{
		this.search = null;
	}

	this.getKeyValuePairs = function() { return this.keyValuePairs;}
	
	this.getValue = function(key)
	{
		for(var j = this.keyValuePairs.length; j-- > 0;)
		{
			if(this.keyValuePairs[j].split("=")[0] == key)
			{
				return this.keyValuePairs[j].split("=")[1];
			}
		}
		return false;
	}
	
	this.getParameters = function()
	{
		var a = new Array(this.getLength());
		for(var j = this.keyValuePairs.length; j-- > 0;)
		{
			a[j] = this.keyValuePairs[j].split("=")[0];
		}
		return a;
	}
	
	this.getLength = function() { return this.keyValuePairs.length;}
}
