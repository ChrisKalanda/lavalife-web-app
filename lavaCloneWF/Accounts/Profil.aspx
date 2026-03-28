<%@ Page Title="Profil"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Profil.aspx.cs"
    Inherits="lavaCloneWF.Account.Profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="<%= ResolveUrl("~/Content/auth-premium.css") %>" rel="stylesheet" />

    <div class="app-page profile-view-page">
        <div class="app-shell">

            <div class="app-hero">
                <div class="app-badge">Compte utilisateur</div>
                <h1 class="app-title">Mon profil</h1>
                <p class="app-subtitle">
                    Consultez et vérifiez les informations de votre compte. Lavalife Édition.
                </p>
            </div>

            <div class="premium-card">
                <div class="section-title">Détails du profil</div>

                <asp:Panel ID="pnlProfile" runat="server" CssClass="profile-details-grid">

                    <div class="info-block">
                        <span class="info-label">Nom d'utilisateur</span>
                        <span class="info-value"><asp:Label ID="lblUsername" runat="server" /></span>
                    </div>

                    <div class="info-block">
                        <span class="info-label">Sexe</span>
                        <span class="info-value"><asp:Label ID="lblSex" runat="server" /></span>
                    </div>

                    <div class="info-block">
                        <span class="info-label">Groupe d'âge</span>
                        <span class="info-value"><asp:Label ID="lblAgeGroup" runat="server" /></span>
                    </div>

                    <div class="info-block">
                        <span class="info-label">Groupe ethnique</span>
                        <span class="info-value"><asp:Label ID="lblGroupName" runat="server" /></span>
                    </div>

                    <div class="info-block">
                        <span class="info-label">Raison</span>
                        <span class="info-value"><asp:Label ID="lblReason" runat="server" /></span>
                    </div>

                    <div class="info-block">
                        <span class="info-label">Ville</span>
                        <span class="info-value"><asp:Label ID="lblCity" runat="server" /></span>
                    </div>

                    <div class="info-block info-block-full">
                        <span class="info-label">Intérêts</span>
                        <span class="info-value"><asp:Label ID="lblInterests" runat="server" /></span>
                    </div>

                    <div class="info-block info-block-full">
                        <span class="info-label">Membre depuis</span>
                        <span class="info-value"><asp:Label ID="lblCreatedAt" runat="server" /></span>
                    </div>

                </asp:Panel>

                <div class="quick-actions" style="margin-top:22px;">
                    <a href="~/Accounts/ModifierProfil.aspx" runat="server" class="premium-btn">Modifier mon profil</a>
                </div>
            </div>

        </div>
    </div>

</asp:Content>