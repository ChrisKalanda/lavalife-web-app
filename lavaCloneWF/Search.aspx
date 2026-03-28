<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Search.aspx.cs"
    Inherits="lavaCloneWF.Search" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="<%= ResolveUrl("~/Content/auth-premium.css") %>" rel="stylesheet" />
    <div class="app-page">
        <div class="app-shell">

            <div class="app-hero">
                <div class="app-badge">Recherche avancée</div>
                <h1 class="app-title">Recherche de membres</h1>
                <p class="app-subtitle">
                    Trouvez des profils selon vos préférences et commencez à échanger
                    avec des membres qui vous correspondent.
                </p>
            </div>

            <div class="premium-card">
                <div class="section-title">Filtres de recherche</div>

                <div class="filter-grid">

                    <div class="filter-field">
                        <label for="<%= ddlSex.ClientID %>">Sexe</label>
                        <asp:DropDownList ID="ddlSex" runat="server" CssClass="premium-select">
                            <asp:ListItem Text="(Tous)" Value=""></asp:ListItem>
                            <asp:ListItem Text="Homme" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Femme" Value="F"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="filter-field">
                        <label for="<%= ddlAgeGroup.ClientID %>">Groupe d'âge</label>
                        <asp:DropDownList ID="ddlAgeGroup" runat="server" CssClass="premium-select">
                            <asp:ListItem Text="(Tous)" Value=""></asp:ListItem>
                            <asp:ListItem Text="18-25" Value="18-25"></asp:ListItem>
                            <asp:ListItem Text="26-35" Value="26-35"></asp:ListItem>
                            <asp:ListItem Text="36-45" Value="36-45"></asp:ListItem>
                            <asp:ListItem Text="46+" Value="46+"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="filter-field">
                        <label for="<%= ddlGroupName.ClientID %>">Groupe ethnique</label>
                        <asp:DropDownList ID="ddlGroupName" runat="server" CssClass="premium-select">
                            <asp:ListItem Text="(Tous)" Value=""></asp:ListItem>
                            <asp:ListItem Text="Africain" Value="Africain"></asp:ListItem>
                            <asp:ListItem Text="Asiatique" Value="Asiatique"></asp:ListItem>
                            <asp:ListItem Text="Blanc" Value="Blanc"></asp:ListItem>
                            <asp:ListItem Text="Caucasien" Value="Caucasien"></asp:ListItem>
                            <asp:ListItem Text="Latino" Value="Latino"></asp:ListItem>
                            <asp:ListItem Text="Noir" Value="Noir"></asp:ListItem>
                            <asp:ListItem Text="Autre" Value="Autre"></asp:ListItem>
                            
                        </asp:DropDownList>
                    </div>

                    <div class="filter-field">
                        <label for="<%= ddlReason.ClientID %>">Raison</label>
                        <asp:DropDownList ID="ddlReason" runat="server" CssClass="premium-select">
                            <asp:ListItem Text="(Tous)" Value=""></asp:ListItem>
                            <asp:ListItem Text="Autre" Value="Autre"></asp:ListItem>
                            <asp:ListItem Text="Amitié" Value="Amitié"></asp:ListItem>
                            <asp:ListItem Text="Rencontre" Value="Rencontre"></asp:ListItem>
                            <asp:ListItem Text="Relation sérieuse" Value="Relation Sérieuse"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="filter-field filter-field-full">
                        <label for="<%= txtCity.ClientID %>">Ville</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="premium-input"></asp:TextBox>
                    </div>

                </div>

                <div style="margin-top:20px;">
                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Rechercher"
                        CssClass="premium-btn"
                        OnClick="btnSearch_Click" />
                </div>
            </div>

            <div class="premium-card">
                <div class="section-title">Résultats</div>

                <div class="table-wrap">
                    <asp:GridView
                        ID="gv"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="premium-gridview"
                        GridLines="None"
                        EmptyDataText="Aucun membre trouvé.">
                        <Columns>
                            <asp:BoundField DataField="Username" HeaderText="Nom d'utilisateur" />
                            <asp:BoundField DataField="Sex" HeaderText="Sexe" />
                            <asp:BoundField DataField="AgeGroup" HeaderText="Âge" />
                            <asp:BoundField DataField="GroupName" HeaderText="Groupe" />
                            <asp:BoundField DataField="Reason" HeaderText="Raison" />
                            <asp:BoundField DataField="City" HeaderText="Ville" />
                            <asp:HyperLinkField
                                HeaderText="Action"
                                Text="Écrire"
                                DataNavigateUrlFields="Id"
                                DataNavigateUrlFormatString="~/Messages/Compose.aspx?toId={0}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>

</asp:Content>