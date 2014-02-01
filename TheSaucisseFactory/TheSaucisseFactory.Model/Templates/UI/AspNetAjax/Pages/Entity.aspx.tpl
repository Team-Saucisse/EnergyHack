[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + Template.FileExtension' inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%@ namespace name="CodeFluent.Model.Code" %]
[%@ namespace name="CodeFluent.Runtime.UI" %]
<%@ Page Title="[%=DisplayName(entity)%] Management" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="[%=entity.Name%].aspx.cs" Inherits="[%=Producer.WebNamespace(entity)%].[%=entity.Name%]" %>
[%foreach(VisibleForm form in GetVisibleForms(entity)){ if (!form.IsCreateOrDefault) continue;%]
<%@ Register Src="~/Forms/[%=RelativeUrl(form.Form)%].ascx" TagPrefix="forms" TagName="[%=form.IdentifierName%]" %>
[%}%]
[%foreach(VisibleMethod method in GetVisibleMethods(entity)){ if (!method.NeedsForm) continue;%]
[%foreach(VisibleForm form in GetVisibleForms(method.Method)){ if (!form.IsCreateOrDefault) continue;%]
<%@ Register Src="~/Forms/[%=RelativeUrl(form.Form)%].ascx" TagPrefix="[%=method.Id%]forms" TagName="[%=form.IdentifierName%]" %>
[%}}%]
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%ClientScript.GetPostBackEventReference(new PostBackOptions(this), false); %>
<cfe:EntityDataSource runat="server" ID="EntityDataSource" TypeName="[%=entity.ClrFullTypeName%]"/>
    <div class="ui-widget" id="grid-parent">
        <table cellspacing="0" cellpadding="0">
            <tr>
                <td class="methods">
                    <dl>
						<script type="text/javascript">
							$(function() {
						        $('#btn-new').button().click(function() {
						            $("#form-new").dialog("open");
						            return false;
						        });
								[%foreach(VisibleMethod method in GetVisibleMethods(entity)){%]
								$('#btn-[%=method.Id%]').button().click(function() {
						            [%if(method.NeedsForm){%]$("#form-[%=method.Id%]").dialog("open");
						            [%}else{%]window.location = "?Method=[%=method.Name%]&View=[%=entity.DefaultView.Name%]";
						            [%}%]return false;
						        });
								[%}%]
								[%if (GetVisibleViews(entity).Count > 1) {%]
						        $('#btn-change-view').supercombo({
						            multiple:false,
						            header: false,
						            allowNoSelection: false,
						            noneSelectedText: '<asp:literal runat="server" Text="<%$ Resources:WebResources, SelectView %>" />'
						        });
								[%}%]
						        $('.select-form').supercombo({
						            maxWidth: 150,
						            height: 100,
						            multiple: false,
						            header: false,
						            allowNoSelection: false,
						            noneSelectedText: '...'
						        });
							});
						</script>
						
                        <dt class="ui-state-highlight ui-corner-top ui-corner-bottom" style="text-indent:10px;text-align:center;"><a style="text-decoration:none;" href="?">[%=DisplayName(entity)%]</a> <b><asp:literal runat="server" Text="<%$ Resources:WebResources, Actions %>" /></b></dt>
                        <dt><button id="btn-new" class="ui-button-method"><b><asp:literal runat="server" Text="<%$ Resources:WebResources, AddNew %>" /></b></button></dt>
                        [%foreach(VisibleMethod method in GetVisibleMethods(entity)){%]
                        <dt><button id="btn-[%=method.Id%]" class="ui-button-method">[%=DisplayName(method)%]</button></dt>
                        [%}%]
                    </dl>
                    [%if (GetVisibleViews(entity).Count > 1) {%]
                    <%if (!string.IsNullOrEmpty(Request["Method"])) { %>
                    <dl>
						<dt id="dt-change-view"><select id="btn-change-view" class="ui-button-method" onchange="cfNavFromView($(this), '<%=Request["Method"] %>', '<%=Request["View"] %>');">
						[%foreach(VisibleView view in GetVisibleViews(entity)) {%]
							<option value="[%=view.Name%]">[%=view.DisplayName%]</option>
						[%}%]
                        </select></dt>
                    </dl>
                    <%} %>
                    [%}%]
                </td>
                <td class="entity" style="vertical-align:top;padding-top:13px;">
                    <cfe:BooleanControl runat="server" Value='<%#string.IsNullOrEmpty(Request["Method"])%>' AutoBind="true">
                    <TrueTemplate>
						<h2 class="ui-widget-header ui-corner-top ui-corner-bottom" style="text-indent:10px;margin-top:13px;">
							[%=DisplayName(entity)%]
						</h2><%=string.Format((string)GetGlobalResourceObject("WebResources", "EntityPresentation"), "[%=DisplayName(entity)%]") %>

						<h2 class="ui-widget-header ui-corner-top ui-corner-bottom" style="text-indent:10px;margin-top:13px;">
							[%=DisplayName(entity)%] - <asp:literal runat="server" Text="<%$ Resources:WebResources, EntityLayout %>" />
						</h2><%=string.Format((string)GetGlobalResourceObject("WebResources", "EntityPresentation2"), "[%=entity.ClrFullTypeName%]", ResolveUrl("~/Images/[%=entity.ClrFullTypeName%].png")) %>
					
                    </TrueTemplate>
                    <FalseTemplate>
					    [%foreach(VisibleView view in GetVisibleViews(entity)){%]
                        <table id="view-[%=view.Name%]"></table>
                        <div id="view-[%=view.Name%]-pg"></div> 
                        [%}%]
                        <span id="customReturn"></span>
                        <br/><span id="jqgrid-error" style="color:red"></span>
                    </FalseTemplate>
                    </cfe:BooleanControl>
                </td>
            </tr>
        </table>
    </div>

    <script runat="server">
        private string UriMethodParameters;
        private string CultureName;
        protected void Page_Load(object sender, EventArgs e)
        {
			CultureName = System.Threading.Thread.CurrentThread.CurrentUICulture.Name;
            UriMethodParameters = CodeFluent.Runtime.Model.ProjectInvokeOptions.GetUriMethodParameters(Request);
            Control ctl = Master.FindControl("Content").FindControl("New");
            if (ctl != null)
            {
                ((FormView)ctl.FindControl("EntityFormView")).ChangeMode(FormViewMode.Insert);
            }
            ctl = Master.FindControl("Content").FindControl("Edit");
            if (ctl != null)
            {
                ((FormView)ctl.FindControl("EntityFormView")).ChangeMode(FormViewMode.Edit);
            }
        }
    </script>
    
    [%foreach(VisibleView view in GetVisibleViews(entity)){%]
    <%if (Request["View"] == "[%=view.Name%]") {%>
    <script type="text/javascript">
        $(function() {
            $("#view-[%=view.Name%]").jqGrid({
                url: '/Services/[%=RelativeUrl(entity)%].svc/JsonGet?method=<%=Request["Method"]%>&culture=<%=CultureName%>&view=[%=view.Name%]&roptions=0x3324<%=UriMethodParameters%>',
                editurl: '/Services/[%=RelativeUrl(entity)%].svc/JsonPost?roptions=0x1020&culture=<%=CultureName%>',
                datatype: "json",
                jsonReader: {
                    cell: '',
                    id: "0",
                    repeatitems: false
                },
                rowNum: 10,
                height: "auto",
                pager: "#view-default-pg",
        		pgtext : "Page {0}",
                emptyrecords: "The query returned no records",
                colModel: [[%foreach(JqGridColumn column in GetJqGridColumns(view)){%]
                    { name: '[%=column.Name%]', index: '[%=column.Name%]', label: '[%=column.Label%]' [%=column.ColModelEnd%]},[%}%]
                    { name: '_rowid', index: '_rowid', key: true, hidden: true }
                    ],
                multiselect: false,
                caption: "<asp:literal runat="server" Text="<%$ Resources:WebResources, MethodResults %>" />",
                ondblClickRow: function(rowid){
                    jQuery.data($("#form-edit")[0], "srcGrid", $("#view-[%=view.Name%]"));
					$("#form-edit").dialog("open");
					},
				loadError: function(xhr, st, str) {
					    $("#jqgrid-error").html("A server error has occured trying to load the grid: " + jQuery.parseJSON(xhr.responseText).FullMessage);
					}
            }).navGrid('#view-default-pg', {
                search: false,
                addfunc: function() {
                    jQuery.data($("#form-new")[0], "srcGrid", $("#view-[%=view.Name%]"));
                    $("#form-new").dialog("open");
                },
                editfunc: function() {
                    jQuery.data($("#form-edit")[0], "srcGrid", $("#view-[%=view.Name%]"));
                    $("#form-edit").dialog("open");
                }
            });

			$(window).bind('resize', function() {
				$("#view-[%=view.Name%]").setGridWidth($("#grid-parent").width() - 300);
			}).trigger('resize');
        });
	    </script>
    <%}%>
    
    [%}%]

    <%if ((Request["View"] == null) && (Request["Method"] != null)){%>
    <script type="text/javascript">
        $(function() {
            $.ajax({
                url: '/Services/[%=RelativeUrl(entity)%].svc/JsonGet?method=<%=Request["Method"]%>&culture=<%=CultureName%>&roptions=0x2001<%=UriMethodParameters%>',
                async: true,
                contentType: "json",
                success: function(data, textStatus, jqxhr) {
                    result = jQuery.parseJSON(jqxhr.responseText);
                    if (result.IsJsonExceptionObject) { // error
                        result = result.fullMessage;
                    }
                    if (result != null) {
                        $("#customReturn").html(result);
                    }
                },
                error: function(jqxhr, errorText, ex) {
                    result = { Message: jQuery.parseJSON(jqxhr.responseText).FullMessage };
                    if (result != null) {
                        $("#customReturn").html(result);
                    }
                }
            });
        });
    </script>
    <%}%>


    <style type="text/css">
		.ui-button-icon-only .ui-button-text { margin-bottom:-1px; padding: 0} 
		.ui-autocomplete-input { margin: 0.35em 0 0 0; padding: 0; width:50px; }
		.ui-button-icon { max-width:14px; }
	</style>
	
	<script type="text/javascript">
        $(function() {
            $("#form-new").dialog({autoOpen: false, height: 'auto', width: 'auto', modal: true, title: $('#form-new-title'),
                buttons: {
                    "Create": function() {
						var result = ($(this).saveDialog({
							url: '/Services/[%=RelativeUrl(entity)%].svc/JsonPost?type=EntitySaveCall&culture=<%=CultureName%>',
							baseId: '<%=Master.FindControl("Content").FindControl("New").FindControl("EntityFormView").ClientID %>',
							idMappings: [[%foreach(VisibleField field in GetVisibleFields(entity.DefaultForm, FormMode.Insert)){%]
								{ name: '[%=field.Name%]', id: '[%=Producer.GetId(field.Field.TypedObject, FormMode.Insert)%]' [%WriteIf(field.IsFocused, ", focus:true");%][%WriteIfNotNull(field.Format, ", format:'" + field.Format + "'");%]},
							[%}%]
								{ name: '_dummy', id: ''}
							]
						}));
                        if (result != null) {
                            $('.validation').css('display', 'block');
                            $('.validationt').html(result.Message);
                        }
                        else
                        {
                            $('.validation').css('display', 'none');
                            $(this).dialog("close");
                            var grid = jQuery.data($(this)[0], "srcGrid");
                            if (grid !== undefined) {
                                grid.trigger("reloadGrid");
                            }
                        }
                    },
                    "Cancel": function() {
                        $('.validation').css('display', 'none');
                        $(this).dialog("close");
                    }
                },
                open: function() {
                    $(this).parent().appendTo("form");
                    [%foreach(VisibleField field in GetVisibleFields(entity.CreateForm, FormMode.Insert)){ if (!field.IsRelation) continue;if (field.IsRelatedEntityLightWeight) continue;%]
                    $("#<%=Master.FindControl("Content").FindControl("New").FindControl("EntityFormView").ClientID %>_[%=Producer.GetId(field.Field.TypedObject, FormMode.Insert)%]").supercombo({
                        multiple: [%=field.UIType == UIType.Association ? "true" : "false"%],
                        loadUrl: '/Services/[%=RelativeUrl(field.RelatedEntity)%].svc/JsonGet?Method=[%=field.ChoiceMethod.Name%]&culture=<%=CultureName%>&roptions=0x3620&Properties=[%=field.RelatedEntity.DisplayPropertyExpression%]',
                        valueColumn: 'EntityKey',
                        titleColumn: '[%=field.RelatedEntity.DisplayPropertyExpression%]'
                    });
                    [%}%]
                    [%foreach(VisibleField field in GetVisibleFields(entity.CreateForm, FormMode.Insert)){ if (!field.IsChoice) continue;%]
                    $("#<%=Master.FindControl("Content").FindControl("New").FindControl("EntityFormView").ClientID %>_[%=Producer.GetId(field.Field.TypedObject, FormMode.Insert)%]").supercombo({
                        multiple: [%=field.UIType == UIType.MultiChoice ? "true" : "false"%],
                        header: [%=field.UIType == UIType.MultiChoice ? "true" : "false"%],
                        combinedValue: [%=field.UIType == UIType.MultiChoice ? "true" : "false"%]
                    });
                    [%}%]
                    $(this).initDialog({
                        baseId: '<%=Master.FindControl("Content").FindControl("Edit").FindControl("EntityFormView").ClientID %>',
                        idMappings: [[%foreach(VisibleField field in GetVisibleFields(entity.CreateForm, FormMode.Insert)){ %]
                            { name: '[%=field.Name%]', id: '[%=Producer.GetId(field.Field.TypedObject, FormMode.Edit)%]' [%WriteIf(field.IsFocused, ", focus:true");%][%WriteIfNotNull(field.DefaultValue, ", value:'" + field.DefaultValue + "'");%]},
                        [%}%]
							{ name: '_dummy', id: ''}
                        ]
                    });
                }
            });
            $("#form-edit").dialog({autoOpen: false, height: 'auto', width: 'auto', modal: true, title: $('#form-edit-title'),
                buttons: {
                    "Save": function() {
						var result = ($(this).saveDialog({
							url: '/Services/[%=RelativeUrl(entity)%].svc/JsonPost?type=EntitySaveCall&culture=<%=CultureName%>',
							baseId: '<%=Master.FindControl("Content").FindControl("Edit").FindControl("EntityFormView").ClientID %>',
							idMappings: [[%foreach(VisibleField field in GetVisibleFields(entity.DefaultForm, FormMode.Edit)){%]
								{ name: '[%=field.Name%]', id: '[%=Producer.GetId(field.Field.TypedObject, FormMode.Edit)%]' [%WriteIf(field.IsFocused, ", focus:true");%][%WriteIfNotNull(field.Format, ", format:'" + field.Format + "'");%]},
							[%}%]
								{ name: 'EntityKey', id: '[%=Producer.GetId(entity.ClrFullTypeName + ":EntityKey", FormMode.Edit)%]'}
								[%if (entity.ConcurrencyMode == ConcurrencyMode.Optimistic){%], { name: 'RowVersion', id: '[%=Producer.GetId(entity.ClrFullTypeName + ":RowVersion", FormMode.Edit)%]'}[%}%]
							]
						}));
                        if (result != null) {
                            $('.validation').css('display', 'block');
                            $('.validationt').html(result.Message);
                        }
                        else
                        {
                            $('.validation').css('display', 'none');
                            $(this).dialog("close");
                            jQuery.data($(this)[0], "srcGrid").trigger("reloadGrid");
                        }
                    },
                    "Cancel": function() {
                        $('.validation').css('display', 'none');
                        $(this).dialog("close");
                    }
                },
                open: function() {
                    $(this).parent().appendTo("form");
                    [%foreach(VisibleField field in GetVisibleFields(entity.DefaultForm, FormMode.Edit)){ if (!field.IsRelation) continue;if (field.IsRelatedEntityLightWeight) continue;%]
                    $("#<%=Master.FindControl("Content").FindControl("Edit").FindControl("EntityFormView").ClientID %>_[%=Producer.GetId(field.Field.TypedObject, FormMode.Edit)%]").supercombo({
                        multiple: [%=field.UIType == UIType.Association ? "true" : "false"%],
                        loadUrl: '/Services/[%=RelativeUrl(field.RelatedEntity)%].svc/JsonGet?Method=[%=field.ChoiceMethod.Name%]&culture=<%=CultureName%>&roptions=0x3620&Properties=[%=field.RelatedEntity.DisplayPropertyExpression%]',
                        valueColumn: 'EntityKey',
                        titleColumn: '[%=field.RelatedEntity.DisplayPropertyExpression%]'
                    });
                    [%}%]
                    [%foreach(VisibleField field in GetVisibleFields(entity.DefaultForm, FormMode.Edit)){ if (!field.IsChoice) continue;%]
                    $("#<%=Master.FindControl("Content").FindControl("Edit").FindControl("EntityFormView").ClientID %>_[%=Producer.GetId(field.Field.TypedObject, FormMode.Edit)%]").supercombo({
                        multiple: [%=field.UIType == UIType.MultiChoice ? "true" : "false"%],
                        header: [%=field.UIType == UIType.MultiChoice ? "true" : "false"%],
                        combinedValue: [%=field.UIType == UIType.MultiChoice ? "true" : "false"%]
                    });
                    [%}%]
                    $(this).fillDialog({
                        url: '/Services/[%=RelativeUrl(entity)%].svc/JsonGet?Method=LoadByEntityKey&culture=<%=CultureName%>&roptions=0x80&_p_key=' + cfEKFromRI(jQuery.data($(this)[0], "srcGrid").jqGrid('getGridParam', 'selrow')),
                        baseId: '<%=Master.FindControl("Content").FindControl("Edit").FindControl("EntityFormView").ClientID %>',
                        idMappings: [[%foreach(VisibleField field in GetVisibleFields(entity.DefaultForm, FormMode.Edit)){ %]
                            { name: '[%=field.Name%]', id: '[%=Producer.GetId(field.Field.TypedObject, FormMode.Edit)%]' [%WriteIf(field.IsFocused, ", focus:true");%][%WriteIfNotNull(field.Format, ", format:'" + field.Format + "'");%]},
                        [%}%]
							{ name: 'EntityKey', id: '[%=Producer.GetId(entity.ClrFullTypeName + ":EntityKey", FormMode.Edit)%]'}
							[%if (entity.ConcurrencyMode == ConcurrencyMode.Optimistic){%], { name: 'RowVersion', id: '[%=Producer.GetId(entity.ClrFullTypeName + ":RowVersion", FormMode.Edit)%]'}[%}%]
                        ]
                    });
                }
            });
            
		[%foreach(VisibleMethod method in GetVisibleMethods(entity)){ if (!method.NeedsForm) continue; %]
            $("#form-[%=method.Id%]").dialog({autoOpen: false, height: 'auto', width: 'auto', modal: true, title: $('#form-[%=method.Id%]-title'),
                buttons: {
                    "OK": function() {
						var baseId = '<%=Master.FindControl("Content").FindControl("[%=method.Id%]").FindControl("FreeFormView").ClientID %>';
						var idMappings = [[%foreach(VisibleField field in GetVisibleFields(method.DefaultForm, FormMode.Insert)){%]
                            { name: '[%=field.Name%]', id: '[%=Producer.GetId(field.Field.TypedObject, FormMode.Insert)%]' [%WriteIf(field.IsFocused, ", focus:true");%][%WriteIfNotNull(field.Format, ", format:'" + field.Format + "'");%]},
                        [%}%]
							{ name: '_dummy', id: ''}
						];
						[%if (method.ReturnsEntityOrCollection){%]
						window.location.href = "?Method=[%=method.Id%]&View=<%=Request["View"] ?? "[%=entity.DefaultView.Name%]"%>" + cfBuildParameters(baseId, idMappings);
						[%}else{%]
						window.location.href = "?Method=[%=method.Id%]" + cfBuildParameters(baseId, idMappings);
						[%}%]
                    },
                    "Cancel": function() {
                        $(this).dialog("close");
                    }
                },
                open: function() {
                    $(this).parent().appendTo("form");
                    [%foreach(VisibleField field in GetVisibleFields(method.DefaultForm, FormMode.Insert)){ if (!field.IsRelation) continue;if (field.IsRelatedEntityLightWeight) continue;%]
                    $("#<%=Master.FindControl("Content").FindControl("[%=method.Id%]").FindControl("FreeFormView").ClientID %>_[%=Producer.GetId(field.Field.TypedObject, FormMode.Insert)%]").supercombo({
                        multiple: [%=field.UIType == UIType.Association ? "true" : "false"%],
                        loadUrl: '/Services/[%=RelativeUrl(field.RelatedEntity)%].svc/JsonGet?Method=[%=field.ChoiceMethod.Name%]&culture=<%=CultureName%>&roptions=0x3620&Properties=[%=field.RelatedEntity.DisplayPropertyExpression%]',
                        valueColumn: 'EntityKey',
                        titleColumn: '[%=field.RelatedEntity.DisplayPropertyExpression%]'
                    });
                    [%}%]
                }
            });
		[%}%]
        });
    </script>    

    <div id="form-new">
		<div id="form-new-title"><asp:literal runat="server" Text="<%$ Resources:WebResources, AddNew %>" /> [%=DisplayName(entity)%]</div>
		 <div class="ui-widget validation" style="padding:0 0 0.3em;">
	        <div class="ui-state-error ui-corner-all" style="padding: 0pt 0.7em"> 
		        <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span>
    		    <span class="validationt" style="width:100%"></span></p>
    	    </div>
        </div>
		<forms:[%=entity.CreateForm.IdentifierName%] runat="server" ID="New" />
    </div>

    <div id="form-edit">
		<div id="form-edit-title"><asp:literal runat="server" Text="<%$ Resources:WebResources, Modify %>" /> [%=DisplayName(entity)%]</div>
		 <div class="ui-widget validation" style="padding:0 0 0.3em;">
	        <div class="ui-state-error ui-corner-all" style="padding: 0pt 0.7em"> 
		        <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span>
    		    <span class="validationt" style="width:100%"></span></p>
    	    </div>
        </div>
		<forms:[%=entity.DefaultForm.IdentifierName%] runat="server" ID="Edit" />
    </div>

	[%foreach(VisibleMethod method in GetVisibleMethods(entity)){ if (!method.NeedsForm) continue;%]
    <div id="form-[%=method.Id%]">
		<div id="form-[%=method.Id%]-title">[%=DisplayName(method)%]</div>
		<[%=method.Id%]forms:[%=method.DefaultForm.IdentifierName%] runat="server" ID="[%=method.Id%]" />
    </div>
	[%}%]

</asp:Content>
