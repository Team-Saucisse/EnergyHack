<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="FrontOffice.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentBody" runat="server">
    <div class="container">
        <div class="row" style="margin-top: 20px">
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <fieldset>
                    <h2>
                        Résidence Cergy Pontoise</h2>
                    <hr class="colorgraph">
                    <div class="form-group">
                        <asp:DropDownList CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="LoadAppartementList" ID="m_ddlBuildings" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="m_ddlApparments" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="SelectedAppartementChanged" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                            <asp:TextBox TextMode="Password" runat="server" ID="m_password" placeholder="Mot de passe" Enabled="false" CssClass="form-control input-lg"></asp:TextBox>
                    </div>
                    <hr class="colorgraph">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <asp:Button Enabled="false" CssClass="btn btn-lg btn-success btn-block" runat="server" Text="Se Connecter"
                                ID="m_btnLogin" PostBackUrl="~/Home.aspx" />
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="AppartmentID" runat="server" ClientIDMode="Static" />
    <script type="text/javascript" language="javascript">
        function SelectedBatimentChanged() {
            $('#appartmentsList').removeAttr("disabled");
        }

        function SelectedAppartmentChanged() {
            $('#password').removeAttr("disabled");
            var newVal = $('#appartmentsList').val();
            $('AppartmentID').value = newVal;
            $('AppartmentID').val(newVal);
            $('AppartmentID').text(newVal);
        }
   
    </script>
</asp:Content>
