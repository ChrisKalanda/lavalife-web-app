<%@ Page Title="Membres"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Members.aspx.cs"
    Inherits="lavaCloneWF.Members" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-shell members-page">
        <div class="page-left"></div>

        <div class="page-right">
            <div class="page-card">

                <h1>Découvre les membres</h1>
                <p class="page-subtitle">
                    Parcourez la liste des membres inscrits et cliquez sur
                    <strong>Envoyer un message</strong> pour démarrer la conversation.
                </p>

                <!-- Labels existants -->
                <asp:Label ID="lblInfo" runat="server" CssClass="page-info" />
                <asp:Label ID="lblError" runat="server" CssClass="page-error" />

                <!-- Répétiteur existant (garde les mêmes IDs !) -->
                <asp:Repeater ID="rptMembers" runat="server">
                    <ItemTemplate>
                        <div class="member-row">
                            <div class="member-avatar">
                                <%# Eval("Username").ToString().Substring(0,1).ToUpper() %>
                            </div>
                            <div>
                                <span class="member-name"><%# Eval("Username") %></span>
                                <div class="member-meta">
                                    <%# Eval("Sex") %> · <%# Eval("AgeGroup") %> · <%# Eval("City") %>
                                </div>
                            </div>
                            <div class="member-actions">
                                <asp:HyperLink ID="lnkMessage" runat="server"
                                               CssClass="btn-main"
                                               NavigateUrl='<%# "~/Messages/Compose.aspx?to=" + Eval("Id") %>'>
                                    Envoyer un message
                                </asp:HyperLink>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>
</asp:Content>


