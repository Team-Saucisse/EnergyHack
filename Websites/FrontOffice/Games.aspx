<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true"
    CodeBehind="Games.aspx.cs" Inherits="FrontOffice.Games" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="panel panel-default">
                <div class="solde">
                    Mon solde :
                    <asp:Label ID="ecoinsTotal" runat="server"></asp:Label>
                    <asp:Image ID="Image4" Width="24px" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/EnergyCoinEclair.png"
                        CssClass="soldeIcon" />
                </div>
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
                                        TankOp</h3>
                                    <p class="text-primary" style="font-size: 14px;">
                                        Protégez votre quartier général de l'attaque des chars ennemis. Dépensez vos e-coin
                                        pour augmenter vos défenses.</p>
                                    <p>
                                        <asp:HyperLink ID="playTank" CssClass="btn btn-primary btn-sm" runat="server" role="button">Jouer</asp:HyperLink>
                                        <span style="margin-left: 100px;">Coût : <b>0</b><asp:Image ID="Image2" Width="24px"
                                            runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/EnergyCoinEclair.png" /></span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img class="img-thumbnail" src="Images/foodchain_capture.png" alt="...">
                                <div class="caption">
                                    <h3>
                                        FoodChain</h3>
                                    <p class="text-primary" style="font-size: 14px;">
                                        Dans la peau d'une grenouille dans sa mare, mangez les mouches en évitant de vous
                                        faire manger par le serpent.</p>
                                    <p>
                                        <asp:HyperLink ID="LinkButton1" CssClass="btn btn-primary btn-sm" runat="server"
                                            role="button">Jouer</asp:HyperLink>
                                        <span style="margin-left: 100px;">Coût : <b>5</b><asp:Image ID="Image1" Width="24px"
                                            runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/EnergyCoinEclair.png" /></span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img class="img-thumbnail" src="Images/quiz.png" alt="...">
                                <div class="caption">
                                    <h3>
                                        QuizzzGame</h3>
                                    <p class="text-primary" style="font-size: 14px;">
                                        Testez vos connaissances sur l'éconnomie d'énergie en répondant au mieux aux questions
                                        qui vous seront posées</p>
                                    <p>
                                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Quizz.aspx" CssClass="btn btn-primary btn-sm"
                                            runat="server" role="button">Jouer</asp:HyperLink>
                                        <span style="margin-left: 100px;">Coût : <b>2</b><asp:Image ID="Image3" Width="24px"
                                            runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/EnergyCoinEclair.png" /></span></p>
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
