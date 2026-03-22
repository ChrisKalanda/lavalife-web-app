<%@ Page Title="Profil"
    Language="C#"
    AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Profil.aspx.cs"
    Inherits="lavaCloneWF.Profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="profile-wrapper">
        <h1>Mon Profil</h1>

        <asp:Panel ID="pnlProfile" runat="server">
            <p><strong>Nom d'utilisateur : </strong><asp:Label ID="lblUsername" runat="server" /></p>
            <p><strong>Sexe : </strong><asp:Label ID="lblSex" runat="server" /></p>
            <p><strong>Groupe d'âge : </strong><asp:Label ID="lblAgeGroup" runat="server" /></p>
            <p><strong>Groupe ethnique : </strong><asp:Label ID="lblGroupName" runat="server" /></p>
            <p><strong>Raison : </strong><asp:Label ID="lblReason" runat="server" /></p>
            <p><strong>Intérêts : </strong><asp:Label ID="lblInterests" runat="server" /></p>
            <p><strong>Ville : </strong><asp:Label ID="lblCity" runat="server" /></p>
            <p><strong>Membre depuis : </strong><asp:Label ID="lblCreatedAt" runat="server" /></p>
        </asp:Panel>
    </div>

</asp:Content>
