<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"
    CodeBehind="Search.aspx.cs" Inherits="lavaCloneWF.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="auth-wrapper">
    <div class="auth-card search-page">
        <h2>Recherche de membres</h2>

        <!-- FILTRES -->
        <div class="profile-wrapper">
            <p>
                <strong>Sexe :</strong>
                <asp:DropDownList ID="ddlSex" runat="server">
                    <asp:ListItem Value="">(Tous)</asp:ListItem>
                    <asp:ListItem Value="M">Homme</asp:ListItem>
                    <asp:ListItem Value="F">Femme</asp:ListItem>
                </asp:DropDownList>
            </p>

            <p>
                <strong>Groupe d'âge :</strong>
                <asp:DropDownList ID="ddlAgeGroup" runat="server">
                    <asp:ListItem Value="">(Tous)</asp:ListItem>
                    <asp:ListItem Value="18-25">18-25</asp:ListItem>
                    <asp:ListItem Value="26-35">26-35</asp:ListItem>
                    <asp:ListItem Value="36-45">36-45</asp:ListItem>
                    <asp:ListItem Value="46+">46+</asp:ListItem>
                </asp:DropDownList>
            </p>

            <p>
                <strong>Groupe ethnique :</strong>
                <asp:DropDownList ID="ddlGroupName" runat="server">
                    <asp:ListItem Value="">(Tous)</asp:ListItem>
                    <asp:ListItem Value="Africain">Africain</asp:ListItem>
                    <asp:ListItem Value="Blanc">Blanc</asp:ListItem>
                    <asp:ListItem Value="Caucasien">Caucasien</asp:ListItem>
                    <asp:ListItem Value="Noir">Noir</asp:ListItem>
                    <asp:ListItem Value="Latino">Latino</asp:ListItem>
                    <asp:ListItem Value="Asiatique">Asiatique</asp:ListItem>
                    <asp:ListItem Value="Autre">Autre</asp:ListItem>
                </asp:DropDownList>
            </p>

            <p>
                <strong>Raison :</strong>
                <asp:DropDownList ID="ddlReason" runat="server">
                    <asp:ListItem Value="">(Tous)</asp:ListItem>
                    <asp:ListItem Value="Amour">Amour</asp:ListItem>
                    <asp:ListItem Value="Amitié">Amitié</asp:ListItem>
                    <asp:ListItem Value="Mariage">Mariage</asp:ListItem>
                    <asp:ListItem Value="Autre">Autre</asp:ListItem>
                </asp:DropDownList>
            </p>

            <p>
                <strong>Ville :</strong>
                <asp:TextBox ID="txtCity" runat="server" />
            </p>

            <p>
                <asp:Button ID="btnSearch" runat="server" Text="Rechercher" OnClick="btnSearch_Click" />
            </p>
        </div>

        <hr />

        <h3>Résultats</h3>

        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False"
            GridLines="Horizontal" Width="100%" EmptyDataText="Aucun membre trouvé."
            CssClass="table">

            <Columns>
                <asp:BoundField HeaderText="Nom d'utilisateur" DataField="Username" />
                <asp:BoundField HeaderText="Sexe" DataField="Sex" />
                <asp:BoundField HeaderText="Âge" DataField="AgeGroup" />
                <asp:BoundField HeaderText="Groupe" DataField="GroupName" />
                <asp:BoundField HeaderText="Raison" DataField="Reason" />
                <asp:BoundField HeaderText="Ville" DataField="City" />

                
                <asp:HyperLinkField HeaderText="Action"
                    Text="Écrire"
                    DataNavigateUrlFields="Id"
                    DataNavigateUrlFormatString="~/Messages/Compose.aspx?to={0}" />
            </Columns>

        </asp:GridView>

    </div>
</div>

</asp:Content>
