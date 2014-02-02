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
                                    CommandArgument="Games" runat="server">Les jeux</asp:LinkButton></li>
                            <li runat="server" id="m_liDisconnect">
                                <asp:LinkButton ID="m_aDisconnect" PostBackUrl="~/Login.aspx" OnClick="MenuItem_SetActive"
                                    CommandArgument="Disconnect" runat="server">Se déconnecter</asp:LinkButton></li>
                        </ul>
                    </div>
                    <!-- //MENU -->
                    <!-- GAMES LIST -->
                    <div class="col-md-10">
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img class="img-thumbnail" src="Images/capture_tankop.png" alt="...">
                                <div class="caption">
                                    <h3>
                                        Tank OP</h3>
                                    <p class="text-primary">
                                        Détruiser le camp adverse avant que l'ennemie ne détruise le votre.</p>
                                    <p style="margin-left: 50px">
                                        <asp:HyperLink ID="playTank" CssClass="btn btn-primary btn-xs" runat="server"
                                            role="button">Jouer</asp:HyperLink>
                                        - Coût : <b>0</b><asp:Image ID="Image2" Width="24px" runat="server" ImageAlign="AbsMiddle"
                                            ImageUrl="~/Images/EnergyCoinEclair.png" /></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                               <img class="img-thumbnail" src="Images/foodchain_capture.png" alt="...">
                                <div class="caption">
                                    <h3>
                                        Tank OP</h3>
                                    <p class="text-primary">
                                        Détruiser le camp adverse avant que l'ennemie ne détruise le votre.</p>
                                    <p style="margin-left: 50px">
                                        <asp:HyperLink ID="LinkButton1" CssClass="btn btn-primary btn-xs" runat="server"
                                            role="button">Jouer</asp:HyperLink>
                                        - Coût : <b>5</b><asp:Image ID="Image1" Width="24px" runat="server" ImageAlign="AbsMiddle"
                                            ImageUrl="~/Images/EnergyCoinEclair.png" /></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img class="img-thumbnail" src="Images/Tankop.png" alt="...">
                                <div class="caption">
                                    <h3>
                                        Tank OP</h3>
                                    <p class="text-primary">
                                        Détruiser le camp adverse avant que l'ennemie ne détruise le votre.</p>
                                    <p style="margin-left: 50px">
                                        <asp:HyperLink ID="HyperLink1" CssClass="btn btn-primary btn-xs" runat="server"
                                            role="button">Jouer</asp:HyperLink>
                                        - Coût : <b>7</b><asp:Image ID="Image3" Width="24px" runat="server" ImageAlign="AbsMiddle"
                                            ImageUrl="~/Images/EnergyCoinEclair.png" /></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img class="img-thumbnail" src="Images/Tankop.png" alt="...">
                                <div class="caption">
                                    <h3>
                                        Tank OP</h3>
                                    <p class="text-primary">
                                        Détruiser le camp adverse avant que l'ennemie ne détruise le votre.</p>
                                    <p style="margin-left: 50px">
                                        <asp:HyperLink ID="HyperLink2" CssClass="btn btn-primary btn-xs" runat="server"
                                            role="button">Jouer</asp:HyperLink>
                                        - Coût : <b>3</b><asp:Image ID="Image4" Width="24px" runat="server" ImageAlign="AbsMiddle"
                                            ImageUrl="~/Images/EnergyCoinEclair.png" /></p>
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
