<%@ Page Title="Profil"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Profil.aspx.cs"
    Inherits="lavaCloneWF.Account.Profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="auth-wrapper profile-page">

        <div class="auth-card">

            <!-- Colonne gauche (style Lavalife comme Login/Register) -->
            <div class="auth-left profile-left">
            
                <h2>Mon profil</h2>
                <p>
                    Consultez et vérifiez les informations de votre compte.<br />
                    Lavalife Édition.
                </p>
            </div>

            <!-- Colonne droite : infos du profil -->
            <div class="auth-right">

                <h3>Détails du profil</h3>

                <asp:Panel ID="pnlProfile" runat="server" CssClass="profile-wrapper">
                    <p><strong>Nom d'utilisateur : </strong>
                       <asp:Label ID="lblUsername" runat="server" /></p>

                    <p><strong>Sexe : </strong>
                       <asp:Label ID="lblSex" runat="server" /></p>

                    <p><strong>Groupe d'âge : </strong>
                       <asp:Label ID="lblAgeGroup" runat="server" /></p>

                    <p><strong>Groupe ethnique : </strong>
                       <asp:Label ID="lblGroupName" runat="server" /></p>

                    <p><strong>Raison : </strong>
                       <asp:Label ID="lblReason" runat="server" /></p>

                    <p><strong>Intérêts : </strong>
                       <asp:Label ID="lblInterests" runat="server" /></p>

                    <p><strong>Ville : </strong>
                       <asp:Label ID="lblCity" runat="server" /></p>

                    <p><strong>Membre depuis : </strong>
                       <asp:Label ID="lblCreatedAt" runat="server" /></p>
                </asp:Panel>

            </div>

        </div>

    </div>

</asp:Content>
