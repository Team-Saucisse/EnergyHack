<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Front.Master" CodeBehind="Home.aspx.cs"
    Inherits="FrontOffice._Default" %>

<asp:Content ID="m_form" ContentPlaceHolderID="contentBody" runat="Server">
    <div class="container">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">
                    <!-- MENU -->
                    <div class="col-md-2">
                        <ul class="nav nav-pills nav-stacked">
                            <li runat="server" id="m_liEcoins">
                                <asp:LinkButton ID="m_aMyEcoins" runat="server" CommandArgument="eCoins" OnClick="MenuItem_SetActive">Mes eCoins</asp:LinkButton></li>
                            <li runat="server" id="m_liGames">
                                <asp:LinkButton ID="m_aGames" PostBackUrl="~/Games.aspx" OnClick="MenuItem_SetActive"
                                    CommandArgument="Games" runat="server">Les Jeux</asp:LinkButton></li>
                            <li runat="server" id="m_liDisconnect">
                                <asp:LinkButton ID="m_aDisconnect" OnClick="MenuItem_SetActive" CommandArgument="Disconnect"
                                    runat="server">Se Déconnecter</asp:LinkButton></li>
                        </ul>
                    </div>
                    <!-- //MENU -->
                    <!-- ECOINS -->
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    Mes Gains</h3>
                            </div>
                            <div class="panel-body">
                                <asp:Repeater ID="m_rptChallenges" OnItemDataBound="ChallengesItemDataBound" runat="server">
                                    <ItemTemplate>
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                <asp:Label ID="m_lblChallengeName" runat="server"></asp:Label></div>
                                            <div class="panel-body">
                                                Gain :<asp:Image ID="m_imgCoin" runat="server" CssClass="imgHover" ImageUrl="~/Images/EnergyCoinEclair.png" Width="128px" />
                                                <asp:Label ID="m_lblChallengeGain" CssClass="textHover" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
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
                <ol class="breadcrumb">
                    <li>Résidence Cergy Pontoise</li>
                    <li>BâtimentB</li>
                    <li>Appartement B146</li>
                </ol>
            </div>
        </div>
    </div>
</asp:Content>
