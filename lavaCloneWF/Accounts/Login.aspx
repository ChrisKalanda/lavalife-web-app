<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Login.aspx.cs"
    Inherits="lavaCloneWF.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link href="<%= ResolveUrl("~/Content/auth-premium.css") %>" rel="stylesheet" />

<div class="login-page">
    <div class="login-card">

        <!-- IMAGE À GAUCHE -->
        <div class="login-left" style='background-image:url("<%= ResolveUrl("~/Content/lavalifeAcceuil.png") %>");'>
            <div class="login-left-content">
                <div class="login-left-text">
                    <div class="left-badge">Rencontres • Messages • Profil</div>
                    <h2>Rencontrez des personnes qui vous ressemblent</h2>
                    <p>
                        Accédez à votre espace, échangez avec vos matchs potentiels
                        et gérez votre profil dans une interface moderne et élégante.
                    </p>
                </div>
            </div>
        </div>

        <!-- FORMULAIRE À DROITE -->
        <div class="login-right">
            <div class="login-form">

                <div class="login-logo">lavalife</div>
                <div class="login-title">Connexion</div>
                <div class="login-subtitle">
                    Connectez-vous pour accéder à votre espace, vos messages et vos rencontres.
                </div>

                <asp:Label ID="lblError" runat="server" CssClass="login-error"></asp:Label>

                <div class="login-field">
                    <label class="login-label">Adresse courriel / Nom d'utilisateur</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control login-input"></asp:TextBox>
                </div>

                <div class="login-field">
                    <label class="login-label">Mot de passe</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control login-input"></asp:TextBox>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Se connecter" CssClass="login-btn" OnClick="btnLogin_Click" />

                <div class="login-links">
                    <div style="margin-bottom:8px;">
                        <a href="#">Mot de passe oublié ?</a>
                    </div>
                    <div>
                        Vous n’avez pas de compte ?
                        <a href="Register.aspx">S’inscrire</a>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>

</asp:Content>