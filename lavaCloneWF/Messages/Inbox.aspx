<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Inbox.aspx.cs"
    Inherits="lavaCloneWF.Messages.Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="<%= ResolveUrl("~/Content/auth-premium.css") %>" rel="stylesheet" />

    <div class="app-page inbox-page-premium">
        <div class="app-shell">

            <div class="app-hero">
                <div class="app-badge">Messagerie</div>
                <h1 class="app-title">Boîte de réception</h1>
                <p class="app-subtitle">
                    Consultez vos messages reçus et gérez vos conversations en toute simplicité.
                </p>
            </div>

            <div class="premium-card">
                <div class="section-title">Messages reçus</div>

                <div class="table-wrap">
                    <asp:Repeater ID="rptInbox" runat="server" OnItemCommand="rptInbox_ItemCommand">
                        <HeaderTemplate>
                            <table class="premium-gridview premium-repeater-table">
                                <thead>
                                    <tr>
                                        <th>De</th>
                                        <th>Message</th>
                                        <th>Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("SenderName") %></td>

                                <td>
                                    <a href='<%# ResolveUrl("~/Messages/Read.aspx?id=" + Eval("Id")) %>'>
                                        <%# Eval("Body") %>
                                    </a>
                                </td>

                                <td><%# Eval("SentAt", "{0:yyyy-MM-dd HH:mm}") %></td>

                                <td class="message-actions-cell">
                                    <a href='<%# ResolveUrl("~/Messages/Read.aspx?id=" + Eval("Id")) %>'>Lire</a>
                                    <span class="action-separator">|</span>
                                    <a href='<%# ResolveUrl("~/Messages/Compose.aspx?to=" + Eval("FromId")) %>'>Répondre</a>
                                    <span class="action-separator">|</span>

                                    <asp:LinkButton ID="lnkDelete" runat="server"
                                        Text="Supprimer"
                                        CommandName="DEL"
                                        CommandArgument='<%# Eval("Id") %>'
                                        OnClientClick="return confirm('Supprimer ce message ?');" />
                                </td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>

        </div>
    </div>

</asp:Content>