<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Compose.aspx.cs"
    Inherits="lavaCloneWF.Messages.Compose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    /* --- PAGE BACKGROUND --- */
    body {
        background: #111; 
        font-family: Arial, sans-serif;
    }

    .compose-wrapper {
        width: 100%;
        min-height: 90vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 40px 0;
    }

    /* --- CARD --- */
    .compose-card {
        background: #000;
        width: 420px;
        padding: 30px 40px;
        border-radius: 14px;
        box-shadow: 0 0 25px rgba(0,0,0,0.6);
        color: white;
    }

    .compose-card h2 {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 25px;
    }

    /* --- LABELS --- */
    .compose-card label {
        font-size: 14px;
        font-weight: bold;
        display: block;
        margin-top: 12px;
        margin-bottom: 6px;
        color: #ddd;
    }

    /* --- INPUTS --- */
    .compose-card select,
    .compose-card textarea {
        width: 100%;
        padding: 10px 12px;
        border-radius: 8px;
        border: 1px solid #444;
        background: #1b1b1b;
        color: white;
        font-size: 14px;
        resize: none; 
    }

    /* --- BUTTON --- */
    .btn-main {
        width: 100%;
        background: #ff1a1a;
        border: none;
        color: white;
        padding: 12px;
        border-radius: 25px;
        font-size: 16px;
        cursor: pointer;
        margin-top: 20px;
        transition: 0.3s;
    }

    .btn-main:hover {
        background: #ff4040;
    }

    .msg-success {
        color: #7CFF7C;
        font-size: 14px;
        margin-bottom: 10px;
        display: block;
    }

    .msg-error {
        color: #FF4B4B;
        font-size: 14px;
        margin-bottom: 10px;
        display: block;
    }
</style>

<div class="compose-wrapper">

    <div class="compose-card">

        <h2>Nouveau message</h2>

        <asp:Label ID="lblInfo" runat="server" CssClass="msg-success"></asp:Label>
        <asp:Label ID="lblError" runat="server" CssClass="msg-error"></asp:Label>

        <!-- Destinataire -->
        <label>Destinataire</label>
        <asp:DropDownList ID="ddlTo" runat="server"></asp:DropDownList>

        <!-- Message -->
        <label>Message</label>
        <asp:TextBox ID="txtBody" runat="server"
                     TextMode="MultiLine"
                     Rows="5"></asp:TextBox>

        <!-- Bouton Envoyer -->
        <asp:Button ID="btnSend" runat="server"
                    Text="Envoyer"
                    CssClass="btn-main"
                    OnClick="btnSend_Click" />

    </div>
</div>

</asp:Content>
