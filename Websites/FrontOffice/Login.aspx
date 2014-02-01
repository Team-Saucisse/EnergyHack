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
                        <select onchange="SelectedBatimentChanged(); return false;" class="form-control">
                            <option>Sélectionner votre bâtiment</option>
                            <option>BatimentA</option>
                            <option>BatimentB</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select onchange="SelectedAppartmentChanged(); return false;" id="appartmentsList"
                            disabled="disabled" class="form-control">
                            <option>Sélectionner votre appartement</option>
                            <option>B143</option>
                            <option>B144</option>
                            <option>B145</option>
                            <option>B146</option>
                            <option>B151</option>
                            <option>B152</option>
                            <option>B153</option>
                            <option>B154</option>
                            <option>B155</option>
                            <option>B156</option>
                            <option>B161</option>
                            <option>B162</option>
                            <option>B163</option>
                            <option>B164</option>
                            <option>B165</option>
                            <option>B166</option>
                            <option>A201</option>
                            <option>A202</option>
                            <option>A211</option>
                            <option>A212</option>
                            <option>A221</option>
                            <option>A222</option>
                            <option>A231</option>
                            <option>A232</option>
                            <option>A241</option>
                            <option>A242</option>
                            <option>A251</option>
                            <option>A261</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="password" disabled="disabled" name="password" id="password" class="form-control input-lg"
                            placeholder="Mot de passe" />
                    </div>
                    <hr class="colorgraph">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <asp:Button CssClass="btn btn-lg btn-success btn-block" runat="server" Text="Se Connecter"
                                ID="m_btnLogin" PostBackUrl="~/Home.aspx" />
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
