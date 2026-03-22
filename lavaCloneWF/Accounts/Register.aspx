<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Register.aspx.cs"
    Inherits="lavaCloneWF.Account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link href="<%= ResolveUrl("~/Content/auth-premium.css") %>" rel="stylesheet" />

<div class="reg-page">
    <div class="reg-card">

        <!-- IMAGE GAUCHE -->
        <div class="reg-left" style='background-image:url("<%= ResolveUrl("~/Content/lavalife-login.jpg") %>");'>
            <div class="reg-left-content">
                <div class="reg-left-text">
                    <div class="left-badge">Créer • Découvrir • Connecter</div>
                    <h2>Créez votre profil et commencez l’aventure</h2>
                    <p>
                        Rejoignez Lavalife et commencez à rencontrer des personnes
                        qui partagent vos intérêts.
                    </p>
                </div>
            </div>
        </div>

        <!-- FORMULAIRE -->
        <div class="reg-right">
            <div class="reg-form">

                <div class="reg-logo">lavalife</div>
                <div class="reg-title">Inscription</div>
                <div class="reg-subtitle">
                    Créez votre compte pour accéder à la plateforme.
                </div>

                <!-- ERROR -->
                <asp:Label ID="lblError" runat="server" CssClass="reg-error"></asp:Label>

                <!-- USERNAME -->
                <div class="reg-field">
                    <label class="reg-label">Nom d'utilisateur</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control reg-input"></asp:TextBox>
                </div>

                <!-- PASSWORD -->
                <div class="reg-field">
                    <label class="reg-label">Mot de passe</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control reg-input"></asp:TextBox>
                </div>

                <!-- CONFIRM -->
                <div class="reg-field">
                    <label class="reg-label">Confirmer le mot de passe</label>
                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" CssClass="form-control reg-input"></asp:TextBox>
                </div>

                <!-- SEX -->
                <div class="reg-field">
                    <label class="reg-label">Sexe</label>
                    <asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal" CssClass="reg-radio-group">
                        <asp:ListItem Text="Homme" Value="M" />
                        <asp:ListItem Text="Femme" Value="F" />
                    </asp:RadioButtonList>
                </div>

                <!-- AGE -->
                <div class="reg-field">
                    <label class="reg-label">Tranche d'âge</label>
                    <asp:DropDownList ID="ddlAgeGroup" runat="server" CssClass="form-select reg-select"></asp:DropDownList>
                </div>

                <!-- GROUP -->
                <div class="reg-field">
                    <label class="reg-label">Groupe / Origine</label>
                    <asp:TextBox ID="txtGroupName" runat="server" CssClass="form-control reg-input"></asp:TextBox>
                </div>

                <!-- OBJECTIF -->
                <div class="reg-field">
                    <label class="reg-label">Objectif</label>
                    <asp:DropDownList ID="ddlReason" runat="server" CssClass="form-select reg-select">
                        <asp:ListItem Text="Sélectionner..." Value="" />
                        <asp:ListItem Text="Amitié" Value="Amitié" />
                        <asp:ListItem Text="Rencontre" Value="Rencontre" />
                        <asp:ListItem Text="Relation sérieuse" Value="Relation sérieuse" />
                        <asp:ListItem Text="Autre" Value="Autre" />
                    </asp:DropDownList>
                </div>

                <!-- INTERESTS -->
                <div class="reg-field">
                    <label class="reg-label">Intérêts</label>
                    <asp:TextBox ID="txtInterests" runat="server" TextMode="MultiLine" CssClass="form-control reg-textarea"></asp:TextBox>
                </div>

                <!-- CITY -->
                <div class="reg-field">
                    <label class="reg-label">Ville</label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control reg-input"></asp:TextBox>
                </div>

                <!-- BUTTON -->
                <asp:Button ID="btnRegister" runat="server"
                    Text="Créer un compte"
                    CssClass="reg-btn"
                    OnClick="btnRegister_Click" />

                <!-- LINKS -->
                <div class="reg-links">
                    Déjà membre ?
                    <a href="Login.aspx">Se connecter</a>
                </div>

            </div>
        </div>

    </div>
</div>

</asp:Content>
