<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="$safeprojectname$._Upload" %>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <link rel="stylesheet" href="<%=ResolveUrl("~/Styles/home.css")%>" />
    <script type="text/javascript" src="<%=ResolveUrl("~/Scripts/jquery.fileupload.js")%>"></script>
    <script type="text/javascript" src="<%=ResolveUrl("~/Scripts/jquery.iframe-transport.js")%>"></script>
    <script type="text/javascript">
        function reloadPreview(){
            $.ajax({
                url: '<%=ResolveUrl("~/Services/" + Request["svc"] + ".svc/JsonGet?Method=LoadByEntityKey&roptions=0x4&properties=" + Request["Property"] + ",HtmlAutoThumbBlank&_p_key=" + Request["ek"])%>',
                async: false,
                contentType: "json", // this is needed to fool WCF to believe it's not json...
                success: function(data, textStatus, jqxhr) {
                    var result = jQuery.parseJSON(jqxhr.responseText);
                    if (result.IsJsonExceptionObject) {
                        $("#previewImg").html('<asp:literal runat="server" Text="<%$ Resources:WebResources, BlobDownloadError %>" />');
                    }
                    else { // contains the html code for an IMG element (thanks to HtmlAutoThumbBlank)
                        $("#previewImg").html(result.<%=Request["Property"] %>);
                    }
                },
                error: function(jqxhr, errorText, ex) {
                    result = { Message: jQuery.parseJSON(jqxhr.responseText).FullMessage };
                    $("#previewImg").html('<asp:literal runat="server" Text="<%$ Resources:WebResources, BlobDownloadError %>" />');
                }
            });
        }
        
        $(function() {
            $('#fileupload').fileupload({
                url: '<%=ResolveUrl("~/Services/" + Request["svc"] + ".svc/JsonPost?roptions=0x2000&Properties=" + Request["Property"] + "&_p_key=" + Request["ek"])%>',
                done: function(e, data) {
                    $('#error').text('');
                    $('#progress').text('');
                    $('#preview').text('<asp:literal runat="server" Text="<%$ Resources:WebResources, NewBlobPreview %>" />');
                    reloadPreview();
                },
                fail: function(e, data) {
                    $('#progress').text('');
                    $('#error').text('<asp:literal runat="server" Text="<%$ Resources:WebResources, BlobUploadError %>" />');
                },
                progress: function(e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    $('#progress').text(progress + '%');
                }
            });
            
            reloadPreview();
        });

    </script>

    <div class="ui-widget" id="home">
        <h1>
            <asp:literal runat="server" Text="<%$ Resources:WebResources, BlobUpload %>" /></h1>
        Entity: <%=Request["svc"]%><br />
        Property: <%=Request["Property"] %><br />
        <div>
            <hr align="left" style="width: 95%;" />
            <p>
                <span id='preview'><asp:literal runat="server" Text="<%$ Resources:WebResources, ExistingBlobPreview %>" /></span>
                <span id='previewImg'></span>
            </p>
                <span id='error' style='color:red;'></span>
                <span id='progress' style='color:green;'></span>
            <p>
                <input id="fileupload" type="file" name="files" title='<asp:literal runat="server" Text="<%$ Resources:WebResources, ChooseAFileToUpload %>" />' /><p></p>
                <input type="button" onclick="window.location.href='<%=Request["url"] %>';" value='<asp:literal runat="server" Text="<%$ Resources:WebResources, ReturnToPreviousPage %>" />' />
            </p>
        </div>
    </div>
</asp:Content>
