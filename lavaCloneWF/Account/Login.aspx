<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Login.aspx.cs"
    Inherits="lavaCloneWF.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* PAGE LOGIN STYLE LAVALIFE */
        .login-page {
            background: #000000;
            min-height: calc(100vh - 40px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 10px;
        }

        .login-card {
            width: 100%;
            max-width: 1100px;
            background: #111111;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            box-shadow: 0 0 25px rgba(0,0,0,0.8);
        }

        .login-left {
            flex: 1.3;
            /* même image que pour Register (tu peux changer le fichier si tu veux) */
            background: url('~/Content/lavalife-login.jpg') center center no-repeat;
            background-size: cover;
            min-height: 450px;
        }

        .login-right {
            flex: 1;
            background: #000000;
            color: #ffffff;
            padding: 35px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-logo {
            text-align: center;
            margin-bottom: 20px;
            font-size: 22px;
            font-weight: bold;
            letter-spacing: 1px;
            color: #ff0000;
        }

        .login-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .login-subtitle {
            font-size: 13px;
            color: #bbbbbb;
            margin-bottom: 20px;
        }

        .login-field {
            margin-bottom: 12px;
        }

        .login-field label {
            display: block;
            font-size: 13px;
            margin-bottom: 4px;
        }

        .login-input {
            width: 100%;
            background: #111111;
            border: 1px solid #333333;
            border-radius: 4px;
            padding: 8px 10px;
            color: #ffffff;
            font-size: 13px;
            box-sizing: border-box;
        }

        .login-input:focus {
            outline: none;
            border-color: #ff0000;
        }

        .login-btn-main {
            width: 100%;
            background: #ff0000;
            color: #ffffff;
            border: none;
            border-radius: 30px;
            padding: 10px 0;
            font-size: 15px;
            font-weight: bold;
            margin-top: 10px;
            cursor: pointer;
        }

        .login-btn-main:hover {
            background: #ff3333;
        }

        .login-error {
            color: #ff5555;
            font-size: 12px;
            margin-bottom: 8px;
            display: block;
        }

        .login-forgot {
            margin-top: 10px;
            font-size: 12px;
            text-align: right;
        }

        .login-forgot a {
            color: #ccccff;
            text-decoration: none;
        }

        .login-forgot a:hover {
            text-decoration: underline;
        }

        .login-bottom-text {
            font-size: 12px;
            color: #888888;
            text-align: center;
            margin-top: 20px;
        }

        .login-bottom-text a {
            color: #ff0000;
            text-decoration: none;
        }

        .login-bottom-text a:hover {
            text-decoration: underline;
        }

        @media (max-width: 900px) {
            .login-card {
                flex-direction: column;
            }
            .login-left {
                min-height: 260px;
            }
        }
    </style>

    <div class="login-page">
        <div class="login-card">

            <!-- IMAGE À GAUCHE -->
            <div class="login-left"></div>

            <!-- FORMULAIRE À DROITE -->
            <div class="login-right">

                <div class="login-logo">lavalife</div>

                <div class="login-title">Log In</div>
                <div class="login-subtitle">
                    Connectez-vous pour accéder à votre espace, vos messages et vos rencontres.
                </div>

                <asp:Label ID="lblError" runat="server" CssClass="login-error"></asp:Label>

                <!-- Username / email -->
                <div class="login-field">
                    <label>Email address / Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="login-input"></asp:TextBox>
                </div>

                <!-- Password -->
                <div class="login-field">
                    <label>Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="login-input"></asp:TextBox>
                </div>

                <!-- Bouton Log In -->
                <asp:Button ID="btnLogin" runat="server"
                    Text="Log In"
                    CssClass="login-btn-main"
                    OnClick="btnLogin_Click" />

                <div class="login-forgot">
                    <a href="#" onclick="return false;">Forgot password?</a>
                </div>

                <div class="login-bottom-text">
                    Don’t have an account?
                    <a href="~/Accounts/Register.aspx" runat="server">Sign up</a>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
