<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="FrontOffice.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentBody" runat="server">
    <div class="container">
        <div class="row" style="margin-top: 20px">
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <fieldset>
                    <h2>
                        Résidence</h2>
                    <hr class="colorgraph">
                    <div class="form-group">
                        <select onchange="SelectedBatimentChanged(); return false;" class="form-control">
                            <option>Sélectionner votre bâtiment</option>
                            <option>Bat1</option>
                            <option>Bat2</option>
                            <option>Bat3</option>
                            <option>Bat4</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select onchange="SelectedAppartmentChanged(); return false;" id="appartmentsList" disabled="disabled" class="form-control">
                            <option>Sélectionner votre appartement</option>
                            <option>Apt1</option>
                            <option>Apt2</option>
                            <option>Apt3</option>
                            <option>Apt4</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="password" disabled="disabled" name="password" id="password" class="form-control input-lg"
                            placeholder="Mot de passe" />
                    </div>
                    <hr class="colorgraph">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <asp:Button CssClass="btn btn-lg btn-success btn-block" runat="server" Text="Se Connecter" ID="m_btnLogin" PostBackUrl="~/Home.aspx" />
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>

    <script type="text/javascript" language="javascript">
        function SelectedBatimentChanged() {
            $('#appartmentsList').removeAttr("disabled");
        }

        function SelectedAppartmentChanged() {
            $('#password').removeAttr("disabled");
        }
   
    </script>
</asp:Content>
