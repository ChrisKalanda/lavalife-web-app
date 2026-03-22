<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Register.aspx.cs"
    Inherits="lavaCloneWF.Account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* PAGE INSCRIPTION STYLE LAVALIFE */
        .reg-page {
            background: #000000;
            min-height: calc(100vh - 40px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 10px;
        }

        .reg-card {
            width: 100%;
            max-width: 1100px;
            background: #111111;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            box-shadow: 0 0 25px rgba(0,0,0,0.8);
        }

        .reg-left {
            flex: 1.3;
            background: url('~/Content/lavalife-login.jpg') center center no-repeat;
            background-size: cover;
            min-height: 450px;
        }

        .reg-right {
            flex: 1;
            background: #000000;
            color: #ffffff;
            padding: 35px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .reg-logo {
            text-align: center;
            margin-bottom: 20px;
            font-size: 22px;
            font-weight: bold;
            letter-spacing: 1px;
            color: #ff0000;
        }

        .reg-title {
            text-align: left;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .reg-subtitle {
            font-size: 13px;
            color: #bbbbbb;
            margin-bottom: 25px;
        }

        .reg-field {
            margin-bottom: 12px;
        }

        .reg-field label {
            display: block;
            font-size: 13px;
            margin-bottom: 4px;
        }

        .reg-input,
        .reg-select,
        .reg-textarea {
            width: 100%;
            background: #111111;
            border: 1px solid #333333;
            border-radius: 4px;
            padding: 8px 10px;
            color: #ffffff;
            font-size: 13px;
            box-sizing: border-box;
        }

        .reg-input:focus,
        .reg-select:focus,
        .reg-textarea:focus {
            outline: none;
            border-color: #ff0000;
        }

        .reg-radio {
            font-size: 13px;
        }

        .reg-btn-main {
            width: 100%;
            background: #ff0000;
            color: #ffffff;
            border: none;
            border-radius: 30px;
            padding: 10px 0;
            font-size: 15px;
            font-weight: bold;
            margin-top: 15px;
            cursor: pointer;
        }

        .reg-btn-main:hover {
            background: #ff3333;
        }

        .reg-bottom-text {
            font-size: 12px;
            color: #888888;
            text-align: center;
            margin-top: 15px;
        }

        .reg-error {
            color: #ff5555;
            font-size: 12px;
            margin-bottom: 8px;
            display: block;
        }

        @media (max-width: 900px) {
            .reg-card {
                flex-direction: column;
            }
            .reg-left {
                min-height: 260px;
            }
        }
    </style>

    <div class="reg-page">
        <div class="reg-card">

            <!-- IMAGE GAUCHE -->
            <div class="reg-left"></div>

            <!-- FORMULAIRE DROITE -->
            <div class="reg-right">

                <div class="reg-logo">
                    <span>lavalife</span>
                </div>

                <!-- TITRE -->
                <div class="reg-title">Inscription</div>

                <div class="reg-subtitle">
                    Créez votre profil pour rejoindre la communauté. Tous les champs marqués sont requis.
                </div>

                <asp:Label ID="lblError" runat="server" CssClass="reg-error"></asp:Label>

                <!-- Nom d'utilisateur -->
                <div class="reg-field">
                    <label>Nom d'utilisateur</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="reg-input"></asp:TextBox>
                </div>

                <!-- Mot de passe -->
                <div class="reg-field">
                    <label>Mot de passe</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="reg-input"></asp:TextBox>
                </div>

                <!-- Confirmation -->
                <div class="reg-field">
                    <label>Confirmer le mot de passe</label>
                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" CssClass="reg-input"></asp:TextBox>
                </div>

                <!-- Sexe -->
                <div class="reg-field reg-radio">
                    <label>Sexe</label>
                    <asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="M">Homme</asp:ListItem>
                        <asp:ListItem Value="F">Femme</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <!-- Age -->
                <div class="reg-field">
                    <label>Tranche d'âge</label>
                    <asp:DropDownList ID="ddlAgeGroup" runat="server" CssClass="reg-select"></asp:DropDownList>
                </div>

                <!-- Groupe -->
                <div class="reg-field">
                    <label>Groupe / Origine</label>
                    <asp:TextBox ID="txtGroupName" runat="server" CssClass="reg-input"></asp:TextBox>
                </div>

                <!-- Raison -->
                <div class="reg-field">
                    <label>Objectif</label>
                    <asp:DropDownList ID="ddlReason" runat="server" CssClass="reg-select">
                        <asp:ListItem Value="">Sélectionner...</asp:ListItem>
                        <asp:ListItem>Amitié</asp:ListItem>
                        <asp:ListItem>Rencontre</asp:ListItem>
                        <asp:ListItem>Relation sérieuse</asp:ListItem>
                        <asp:ListItem>Autre</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- Intérêts -->
                <div class="reg-field">
                    <label>Intérêts</label>
                    <asp:TextBox ID="txtInterests" runat="server" CssClass="reg-textarea" TextMode="MultiLine" Rows="2"></asp:TextBox>
                </div>

                <!-- Ville -->
                <div class="reg-field">
                    <label>Ville</label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="reg-input"></asp:TextBox>
                </div>

                <!-- Bouton -->
                <asp:Button ID="btnRegister" runat="server"
                    Text="Créer un compte"
                    CssClass="reg-btn-main"
                    OnClick="btnRegister_Click" />

                <!-- Bas -->
                <div class="reg-bottom-text">
                    Déjà membre ? 
                    <a href="~/Accounts/Login.aspx" runat="server" style="color:#ff0000;">
                        Se connecter
                    </a>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
