<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Inbox.aspx.cs"
    Inherits="lavaCloneWF.Messages.Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="margin:20px 0;">Boîte de réception</h2>

    <asp:Repeater ID="rptInbox" runat="server" OnItemCommand="rptInbox_ItemCommand">
        <HeaderTemplate>
            <table style="width:100%; border-collapse:collapse;">
                <tr style="background:#eee; font-weight:bold;">
                    <td style="padding:8px;">De</td>
                    <td style="padding:8px;">Message</td>
                    <td style="padding:8px;">Date</td>
                    <td style="padding:8px;">Actions</td>
                </tr>
        </HeaderTemplate>

        <ItemTemplate>
            <tr style="border-bottom:1px solid #ddd;">
                <td style="padding:8px;"><%# Eval("SenderName") %></td>

                
                <td style="padding:8px;">
                    <a href='<%# ResolveUrl("~/Messages/Read.aspx?id=" + Eval("Id")) %>'>
                        <%# Eval("Body") %>
                    </a>
                </td>

                <td style="padding:8px;"><%# Eval("SentAt", "{0:yyyy-MM-dd HH:mm}") %></td>

                <td style="padding:8px;">
                    <!-- Lire -->
                    <a href='<%# ResolveUrl("~/Messages/Read.aspx?id=" + Eval("Id")) %>'>Lire</a>
                    |
                    
                    <a href='<%# ResolveUrl("~/Messages/Compose.aspx?to=" + Eval("FromId")) %>'>Répondre</a>
                    |
                    <!-- Supprimer via ItemCommand -->
                    <asp:LinkButton ID="lnkDelete" runat="server"
                        Text="Supprimer"
                        CommandName="DEL"
                        CommandArgument='<%# Eval("Id") %>'
                        OnClientClick="return confirm('Supprimer ce message ?');" />
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>

</asp:Content>
