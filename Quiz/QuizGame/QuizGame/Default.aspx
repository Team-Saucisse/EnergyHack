<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="QuizGame._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Bienvenue sur l'Energy-QUIZZZ !
    </h2>
    <p>
        <asp:Label ID="Question" runat="server"></asp:Label>

        <asp:Repeater ID="Reponses" OnItemDataBound="ResponseOnItemDataBound" runat="server">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>

            <ItemTemplate>
                <li>
                    <asp:RadioButton GroupName="ReponsesGroup" Checked="false" runat="server" />
                    <asp:Label ID="ContenuRep" runat="server" />
                </li>
            </ItemTemplate>
            
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>

        <asp:Button ID="Next" Text="Suivant" OnClick="NextButtonClick" runat="server" />
    </p>
</asp:Content>
