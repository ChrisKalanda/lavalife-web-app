<%@ Page Title="Membres"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Members.aspx.cs"
    Inherits="lavaCloneWF.Members" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="<%= ResolveUrl("~/Content/auth-premium.css") %>" rel="stylesheet" />

    <div class="app-page members-page-premium">
        <div class="app-shell">

            <div class="app-hero">
                <div class="app-badge">Communauté</div>
                <h1 class="app-title">Découvre les membres</h1>
                <p class="app-subtitle">
                    Parcourez la liste des membres inscrits et cliquez sur <strong>Envoyer un message</strong>
                    pour démarrer la conversation.
                </p>
            </div>

            <div class="premium-card">

                <asp:Label ID="lblInfo" runat="server" CssClass="page-info premium-alert premium-alert-success" />
                <asp:Label ID="lblError" runat="server" CssClass="page-error premium-alert premium-alert-error" />

                <div class="members-list-premium">
                    <asp:Repeater ID="rptMembers" runat="server">
                        <ItemTemplate>

                            <asp:Panel ID="pnlLetterHeader" runat="server"
                                Visible='<%# Convert.ToBoolean(Eval("ShowLetterHeader")) %>'>
                                <div class="member-letter-group">
                                    <span class="member-letter-badge"><%# Eval("LetterHeader") %></span>
                                </div>
                            </asp:Panel>

                            <div class="member-row-premium">
                                <div class="member-avatar-premium">
                                    <%# Eval("Username").ToString().Substring(0,1).ToUpper() %>
                                </div>

                                <div class="member-main-premium">
                                    <span class="member-name-premium"><%# Eval("Username") %></span>
                                    <div class="member-meta-premium">
                                        <%# Eval("Sex") %> · <%# Eval("AgeGroup") %> · <%# Eval("City") %>
                                    </div>
                                </div>

                                <div class="member-actions-premium">
                                    <asp:HyperLink ID="lnkMessage" runat="server"
                                        CssClass="premium-btn member-message-btn"
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
    </div>

</asp:Content>