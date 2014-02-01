<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true"
    CodeBehind="Games.aspx.cs" Inherits="FrontOffice.Games" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">
                    <!-- MENU -->
                    <div class="col-md-2">
                        <ul class="nav nav-pills nav-stacked">
                            <li runat="server" id="m_liEcoins">
                                <asp:LinkButton ID="m_aMyEcoins" PostBackUrl="~/Home.aspx" runat="server" CommandArgument="eCoins"
                                    OnClick="MenuItem_SetActive">Mes eCoins</asp:LinkButton></li>
                            <li runat="server" id="m_liGames">
                                <asp:LinkButton ID="m_aGames" PostBackUrl="~/Games.aspx" OnClick="MenuItem_SetActive"
                                    CommandArgument="Games" runat="server">Les Jeux</asp:LinkButton></li>
                            <li runat="server" id="m_liDisconnect">
                                <asp:LinkButton ID="m_aDisconnect" PostBackUrl="~/Login.aspx"  OnClick="MenuItem_SetActive" CommandArgument="Disconnect"
                                    runat="server">Se Déconnecter</asp:LinkButton></li>
                        </ul>
                    </div>
                    <!-- //MENU -->
                    <!-- GAMES LIST -->
                    <div class="col-md-10">
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src="Images/tank.png" alt="...">
                                <div class="caption">
                                    <h3>
                                        Tank OP</h3>
                                    <p class="text-primary">
                                        Détruiser le camp adverse avant que l'ennemie ne détruise le votre.</p>
                                    <p>
                                        <a class="btn btn-primary btn-xs" href="games/TankOp/index.html" role="button">Web</a>
                                        <a href="#" class="btn btn-default btn-xs" role="button">Android</a> <a href="#" class="btn btn-default btn-xs"
                                            role="button">iOS</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src="Images/tank.png" alt="...">
                                <div class="caption">
                                    <h3>
                                        Tank OP</h3>
                                    <p class="text-primary">
                                        Détruiser le camp adverse avant que l'ennemie ne détruise le votre.</p>
                                    <p>
                                    <p>
                                        <a href="#" class="btn btn-primary btn-xs" role="button">Web</a> <a href="#" class="btn btn-default btn-xs"
                                            role="button">Android</a> <a href="#" class="btn btn-default btn-xs" role="button">iOS</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src="Images/tank.png" alt="...">
                                <div class="caption">
                                    <h3>
                                        Tank OP</h3>
                                    <p class="text-primary">
                                        Détruiser le camp adverse avant que l'ennemie ne détruise le votre.</p>
                                    <p>
                                    <p>
                                        <a href="#" class="btn btn-primary btn-xs" role="button">Web</a> <a href="#" class="btn btn-default btn-xs"
                                            role="button">Android</a> <a href="#" class="btn btn-default btn-xs" role="button">iOS</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src="Images/tank.png" alt="...">
                                <div class="caption">
                                    <h3>
                                        Tank OP</h3>
                                    <p class="text-primary">
                                        Détruiser le camp adverse avant que l'ennemie ne détruise le votre.</p>
                                    <p>
                                    <p>
                                        <a href="#" class="btn btn-primary btn-xs" role="button">Web</a> <a href="#" class="btn btn-default btn-xs"
                                            role="button">Android</a> <a href="#" class="btn btn-default btn-xs" role="button">iOS</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- //GAMES LIST -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
