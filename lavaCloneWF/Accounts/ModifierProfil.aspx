<%@ Page Title="Modifier mon profil"
    Language="C#"
    AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="ModifierProfil.aspx.cs"
    Inherits="lavaCloneWF.ModifierProfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="<%= ResolveUrl("~/Content/auth-premium.css") %>" rel="stylesheet" />

    <div class="app-page profile-edit-page">
        <div class="app-shell">

            <div class="app-hero">
                <div class="app-badge">Compte utilisateur</div>
                <h1 class="app-title">Modifier mon profil</h1>
                <p class="app-subtitle">
                    Mettez à jour vos informations pour que les autres membres vous trouvent plus facilement.
                </p>
            </div>

            <div class="premium-card premium-form-card">

                <asp:Label ID="lblError" runat="server" CssClass="page-error premium-alert premium-alert-error" />
                <asp:Label ID="lblInfo" runat="server" CssClass="page-info premium-alert premium-alert-success" />

                <div class="profile-form-grid">

                    <div class="filter-field">
                        <label for="<%= ddlSex.ClientID %>">Sexe</label>
                        <asp:DropDownList ID="ddlSex" runat="server" CssClass="premium-select"></asp:DropDownList>
                    </div>

                    <div class="filter-field">
                        <label for="<%= ddlAgeGroup.ClientID %>">Groupe d'âge</label>
                        <asp:DropDownList ID="ddlAgeGroup" runat="server" CssClass="premium-select"></asp:DropDownList>
                    </div>

                    <div class="filter-field">
                        <label for="<%= ddlGroupName.ClientID %>">Groupe ethnique</label>
                        <asp:DropDownList ID="ddlGroupName" runat="server" CssClass="premium-select"></asp:DropDownList>
                    </div>

                    <div class="filter-field">
                        <label for="<%= ddlReason.ClientID %>">Raison</label>
                        <asp:DropDownList ID="ddlReason" runat="server" CssClass="premium-select"></asp:DropDownList>
                    </div>

                    <div class="filter-field filter-field-full">
                        <label for="<%= txtInterests.ClientID %>">Intérêts</label>
                        <asp:TextBox ID="txtInterests" runat="server"
                            TextMode="MultiLine" Rows="4" CssClass="premium-textarea"></asp:TextBox>
                    </div>

                    <div class="filter-field filter-field-full">
                        <label for="<%= txtCity.ClientID %>">Ville</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="premium-input"></asp:TextBox>
                    </div>

                </div>

                <div class="profile-actions">
                    <asp:Button ID="btnSave"
                        runat="server"
                        Text="Enregistrer"
                        CssClass="premium-btn"
                        OnClick="btnSave_Click" />
                </div>

            </div>
        </div>
    </div>

</asp:Content>