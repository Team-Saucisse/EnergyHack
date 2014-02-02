<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="QuizGame._Default" %>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Bienvenue sur l'Energy-QUIZZZ !
    </h2>
    <h3>
        <asp:Label ID="QuestionId" runat="server" />/<asp:Label ID="QuestionTotal" runat="server" />
    </h3>
    <p>
        <asp:Label ID="Question" runat="server"></asp:Label>

        <asp:RadioButtonList ID="RadioButtonListReponses" DataValueField="Id" DataTextField="Contenu" runat="server">
        </asp:RadioButtonList>

        <asp:Label ID="Summary" runat="server" />

        <asp:Button ID="Next" Text="Suivant" OnClick="NextButtonClick" runat="server" />
        <asp:Label ID="Erreur" Text="" runat="server" ForeColor="Red" />
    </p>
</asp:Content>
