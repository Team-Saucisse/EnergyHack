<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Front.Master" CodeBehind="Home.aspx.cs"
    Inherits="FrontOffice._Default" %>

<asp:Content ID="m_form" ContentPlaceHolderID="contentBody" runat="Server">
    <asp:ScriptManager EnablePageMethods="true" runat="server" ID="WebMethods">
    </asp:ScriptManager>
    <div class="container">
        <div class="row">
            <div class="panel panel-default">
            <div>
                Mon solde :
                <asp:Label ID="ecoinsTotal" runat="server" CssClass="solde"></asp:Label>
                <asp:Image ID="Image2" Width="24px" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/EnergyCoinEclair.png"
                    CssClass="soldeIcon" />
            </div>
                <div class="panel-body">
                    <!-- MENU -->
                    <div class="col-md-2">
                        <ul class="nav nav-pills nav-stacked">
                            <li runat="server" id="m_liEcoins">
                                <asp:LinkButton ID="m_aMyEcoins" runat="server" CommandArgument="eCoins" OnClick="MenuItem_SetActive">Mes eCoins</asp:LinkButton></li>
                            <li runat="server" id="m_liGames">
                                <asp:LinkButton ID="m_aGames" PostBackUrl="~/Games.aspx" OnClick="MenuItem_SetActive"
                                    CommandArgument="Games" runat="server">Les jeux</asp:LinkButton></li>
                            <li runat="server" id="m_liDisconnect">
                                <asp:LinkButton ID="m_aDisconnect" PostBackUrl="~/Login.aspx" OnClick="MenuItem_SetActive"
                                    CommandArgument="Disconnect" runat="server">Se déconnecter</asp:LinkButton></li>
                        </ul>
                    </div>
                    <!-- //MENU -->
                    <!-- ECOINS -->
                    <div class="col-md-4">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title">Mes gains</h3>
                            </div>
                            <div class="panel-body">
                                <asp:Repeater ID="m_rptChallenges" OnItemDataBound="ChallengesItemDataBound" runat="server">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="m_panelLink" runat="server" CssClass="panelLink">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="m_lblChallengeName" runat="server" CssClass="challengeName"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="m_lblChallengeGain" CssClass="textHover" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="imgCoin" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/EnergyCoinEclair.png" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:Label ID="m_meta" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <!-- //ECOINS -->
                    <!-- ILLUSTRATION -->
                    <div class="col-md-4" style="min-height: 500px; max-height: 500px;">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    Détails</h3>
                            </div>
                            <div id="challengeIllustrations" class="panel-body">
                                Sélectionner un challenge pour faire apparaitre les détails
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
