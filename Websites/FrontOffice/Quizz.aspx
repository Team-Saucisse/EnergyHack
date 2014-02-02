<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true"
    CodeBehind="Quizz.aspx.cs" Inherits="FrontOffice.Quizz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="page-header">
                <h1>
                    Energy-QUIZZZ ! <small>
                        <asp:Label ID="QuestionId" runat="server" />/<asp:Label ID="QuestionTotal" runat="server" /></small></h1>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <asp:Label ID="Question" runat="server"></asp:Label></h3>
                </div>
                <div class="panel-body">
                    <div class="radio">
                        <asp:RadioButtonList RepeatLayout="Flow" CssClass="radio" ID="RadioButtonListReponses"
                            DataValueField="Id" DataTextField="Contenu" runat="server">
                        </asp:RadioButtonList>
                    </div>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="Next" Text="Suivant" CssClass="btn btn-sm" OnClick="NextButtonClick" runat="server" /></div>
            </div>
            <asp:Label ID="Erreur" Text="" runat="server" ForeColor="Red" />
             <asp:Label ID="Summary" runat="server" />
            <asp:LinkButton ID="Button1" Text="Retour Portail" CssClass="btn btn-default btn-xs" PostBackUrl="~/Home.aspx" runat="server" />

        </div>
    </div>
</asp:Content>
