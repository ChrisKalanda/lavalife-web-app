<%@ Page Title="Modifier mon profil"
    Language="C#"
    AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="ModifierProfil.aspx.cs"
    Inherits="lavaCloneWF.ModifierProfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-shell edit-profile-page">
        <!-- Colonne image (hérite du CSS .page-left) -->
        <div class="page-left"></div>

        <!-- Colonne formulaire -->
        <div class="page-right">
            <div class="page-card">

                <h1>Modifier mon profil</h1>
                <p class="page-subtitle">
                    Mettez à jour vos informations pour que les autres membres vous trouvent plus facilement.
                </p>

                <!-- Messages d’info / erreur -->
                <asp:Label ID="lblError" runat="server" CssClass="page-error" />
                <asp:Label ID="lblInfo" runat="server" CssClass="page-info" />

                <!-- Sexe -->
                <div class="form-group">
                    <label for="ddlSex">Sexe</label>
                    <asp:DropDownList ID="ddlSex" runat="server"></asp:DropDownList>
                </div>

                <!-- Groupe d'âge -->
                <div class="form-group">
                    <label for="ddlAgeGroup">Groupe d'âge</label>
                    <asp:DropDownList ID="ddlAgeGroup" runat="server"></asp:DropDownList>
                </div>

                <!-- Groupe ethnique -->
                <div class="form-group">
                    <label for="ddlGroupName">Groupe ethnique</label>
                    <asp:DropDownList ID="ddlGroupName" runat="server"></asp:DropDownList>
                </div>

                <!-- Raison -->
                <div class="form-group">
                    <label for="ddlReason">Raison</label>
                    <asp:DropDownList ID="ddlReason" runat="server"></asp:DropDownList>
                </div>

                <!-- Intérêts -->
                <div class="form-group">
                    <label for="txtInterests">Intérêts</label>
                    <asp:TextBox ID="txtInterests" runat="server"
                                 TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>

                <!-- Ville -->
                <div class="form-group">
                    <label for="txtCity">Ville</label>
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                </div>

                <!-- Bouton Enregistrer -->
                <asp:Button ID="btnSave"
                            runat="server"
                            Text="Enregistrer"
                            CssClass="btn-main"
                            OnClick="btnSave_Click" />
            </div>
        </div>
    </div>

</asp:Content>
