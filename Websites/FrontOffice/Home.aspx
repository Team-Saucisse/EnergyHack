<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Front.Master" CodeBehind="Home.aspx.cs"
    Inherits="FrontOffice._Default" %>

<asp:Content ID="m_form" ContentPlaceHolderID="contentBody" runat="Server">
    <div class="container">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">
                    <!-- MENU -->
                    <div class="col-xs-2">
                        <ul class="nav nav-pills nav-stacked">
                            <li runat="server" id="m_liEcoins">
                                <asp:LinkButton ID="m_aMyEcoins" runat="server" CommandArgument="eCoins" OnClick="MenuItem_SetActive">Mes eCoins</asp:LinkButton></li>
                            <li runat="server" id="m_liGames">
                                <asp:LinkButton ID="m_aGames" PostBackUrl="~/Games.aspx" OnClick="MenuItem_SetActive" CommandArgument="Games"
                                    runat="server">Les Jeux</asp:LinkButton></li>
                            <li runat="server" id="m_liDisconnect">
                                <asp:LinkButton ID="m_aDisconnect" OnClick="MenuItem_SetActive" CommandArgument="Disconnect"
                                    runat="server">Se Déconnecter</asp:LinkButton></li>
                        </ul>
                    </div>
                    <!-- //MENU -->
                    <div class="col-xs-1">
                    <div class="menu-separator">&nbsp;</div>
                    </div>
                    <!-- ECOINS -->
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    Mes Gains</h3>
                            </div>
                            <div class="panel-body">
                                <ul>
                                    <li><a href="#"><span>
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/c1.png" Width="48px" /></span>eCoins
                                        d'Or </a></li>
                                    <li><a href="#"><span>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/c2.png" Width="48px" /></span>eCoins
                                        d'Argent </a></li>
                                    <li><a href="#"><span>
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/c3.png" Width="48px" /></span>eCoins
                                        de Bronze</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- //ECOINS -->
                    <!-- ILLUSTRATION -->
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    Détails</h3>
                            </div>
                            <div class="panel-body">
                                Affichage Illustration
                            </div>
                        </div>
                    </div>
                    <!-- //ILLUSTRATION -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
