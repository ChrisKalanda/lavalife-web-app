<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Default.aspx.cs"
    Inherits="lavaCloneWF._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="<%= ResolveUrl("~/Content/auth-premium.css") %>" rel="stylesheet" />

    <!-- WRAPPER GENERAL TYPE LOGIN / REGISTER -->
    <div class="page-shell home-page">

        <!-- Colonne gauche : image plein écran -->
        <div class="page-left"></div>

        <!-- Colonne droite : carte centrale -->
        <div class="page-right">
            <div class="page-card">

        <!-- PANEL 1 : LANDING (utilisateur NON connecté) -->
<asp:Panel ID="pnlLanding" runat="server">
    <div class="landing">

        <div class="landing-left">
            <div class="landing-badge">Rencontres • Messages • Profil</div>

            <h1>RENCONTREZ DES CÉLIBATAIRES SYMPAS !</h1>

            <p>
                APPELEZ · CLIQUEZ · CONNECTEZ-VOUS<br />
                ESSAYEZ GRATUITEMENT !
            </p>

            <p>
                Nous vous aidons à rencontrer des personnes qui vous ressemblent.
            </p>

            <a class="btn-main-big btn-red" href="~/Accounts/Register.aspx" runat="server">
                Commencer maintenant
            </a>
        </div>

        <div class="landing-right">
            <h2>REDONNEZ DU PLAISIR AUX RENCONTRES !</h2>

            <p>
                Inscrivez-vous, créez votre profil et commencez à discuter
                avec des personnes qui partagent vos intérêts.
            </p>

            <div class="landing-actions">
                <a class="btn-main-big btn-red" href="~/Accounts/Login.aspx" runat="server">
                    Se connecter
                </a>

                <a class="btn-main-big btn-white" href="~/Accounts/Register.aspx" runat="server">
                    S’inscrire
                </a>
            </div>
        </div>

    </div>
</asp:Panel>

                <!-- PANEL 2 : DASHBOARD (utilisateur connecté) -->
                <asp:Panel ID="pnlDashboard" runat="server" Visible="false">
                    <div class="app-page">
                        <div class="app-shell">

                            <div class="app-hero">
                                <div class="app-badge">Espace membre</div>
                                <h1 class="app-title">
                                    Bonjour, <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label> !
                                </h1>
                                <p class="app-subtitle">
                                    Bienvenue dans votre espace Friendbook / Lavalife. Accédez rapidement
                                    à vos fonctionnalités principales.
                                </p>
                            </div>

                            <div class="premium-card">
                                <div class="section-title">Actions rapides</div>

                                <div class="dashboard-menu">
                                    <a href="~/Search.aspx" runat="server">Voir les membres</a>
                                    <a href="~/Messages/Inbox.aspx" runat="server">Mes messages</a>
                                    <a href="~/Messages/Compose.aspx" runat="server">Écrire un message</a>
                                    <a href="~/Accounts/ModifierProfil.aspx" runat="server">Modifier mon profil</a>
                                    <a href="~/Accounts/Logout.aspx" runat="server">Déconnexion</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </asp:Panel>

            </div>
        </div>
    </div>

</asp:Content>