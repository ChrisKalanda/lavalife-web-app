<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Default.aspx.cs"
    Inherits="lavaCloneWF._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- WRAPPER GENERAL TYPE LOGIN / REGISTER -->
    <div class="page-shell home-page">
        <!-- Colonne gauche : image plein écran (gérée dans Site.css via .page-left) -->
        <div class="page-left" style="">
</div>


        <!-- Colonne droite : carte centrale (comme Login/Register) -->
        <div class="page-right">
            <div class="page-card">

                <!-- PANEL 1 : LANDING (utilisateur NON connecté) -->
                <asp:Panel ID="pnlLanding" runat="server">
                    <div class="landing style="background: url('/Content/lavalifeAcceuil.png') center center / cover no-repeat;">
                        <div class="landing-left">
                            <h1>MEET FUN SINGLES!</h1>
                            <p>CALL · CLICK · CONNECT<br />TRY IT FREE!</p>
                            <p>Nous vous aidons à rencontrer des gens qui vous ressemblent.</p>
                            <a class="btn-main-big btn-red" href="~/Account/Register.aspx" runat="server">
                                Start now
                            </a>
                        </div>

                        <div class="landing-right">
                            <h2>MAKE DATING FUN AGAIN!</h2>
                            <p>
                                Inscrivez-vous, créez votre profil et commencez à discuter
                                avec des personnes qui partagent vos intérêts.
                            </p>

                            <div>
                                <a class="btn-main-big btn-red" href="~/Account/Login.aspx" runat="server">
                                    Login
                                </a>
                                &nbsp;&nbsp;
                                <a class="btn-main-big btn-white" href="~/Account/Register.aspx" runat="server">
                                    Sign up
                                </a>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <!-- PANEL 2 : DASHBOARD (utilisateur connecté) -->
                <asp:Panel ID="pnlDashboard" runat="server" Visible="false">
                    <div class="content">
                        <div class="dashboard-title">
                            Bonjour, <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label> !
                        </div>
                        <p>Bienvenue dans votre espace Friendbook / Lavalife.</p>

                        <div class="dashboard-menu">
                            <a href="~/Search.aspx" runat="server">Voir les membres</a>
                            <a href="~/Messages/Inbox.aspx" runat="server">Mes messages</a>
                            <a href="~/Messages/Compose.aspx" runat="server">Écrire un message</a>
                            <a href="~/Accounts/ModifierProfil.aspx" runat="server">Modifier mon profil</a>
                            <a href="~/Accounts/Logout.aspx" runat="server">Déconnexion</a>
                        </div>
                    </div>
                </asp:Panel>

            </div> <!-- .page-card -->
        </div> <!-- .page-right -->
    </div> <!-- .page-shell -->

</asp:Content>
