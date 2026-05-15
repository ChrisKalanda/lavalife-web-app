<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Read.aspx.cs"
    Inherits="lavaCloneWF.Messages.Read" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="<%= ResolveUrl("~/Content/auth-premium.css") %>" rel="stylesheet" />

    <div class="app-page read-page-premium">
        <div class="app-shell">

            <div class="app-hero">
                <div class="app-badge">Messagerie</div>
                <h1 class="app-title">Lecture du message</h1>
                <p class="app-subtitle">
                    Consultez le contenu du message reçu et répondez en un clic.
                </p>
            </div>

            <asp:Panel ID="pnlOk" runat="server" Visible="true">

                <div class="premium-card">
                    <div class="section-title">Détails</div>

                    <div class="profile-details-grid">

                        <div class="info-block">
                            <span class="info-label">De</span>
                            <span class="info-value"><asp:Label ID="lblFrom" runat="server" /></span>
                        </div>

                        <div class="info-block">
                            <span class="info-label">Date</span>
                            <span class="info-value"><asp:Label ID="lblDate" runat="server" /></span>
                        </div>

                        <div class="info-block info-block-full">
                            <span class="info-label">Message</span>
                            <span class="info-value"><asp:Literal ID="litBody" runat="server" /></span>
                        </div>

                    </div>

                    <div class="profile-actions" style="display:flex; gap:14px; flex-wrap:wrap;">
                        <asp:HyperLink ID="lnkReply" runat="server" CssClass="premium-btn" Text="Répondre" />
                        <asp:HyperLink ID="lnkBack" runat="server" CssClass="premium-btn" Text="Retour à la boîte" NavigateUrl="~/Messages/Inbox.aspx" />
                    </div>
                </div>

            </asp:Panel>

            <asp:Panel ID="pnlError" runat="server" Visible="false">

                <div class="premium-card">
                    <asp:Label ID="lblError" runat="server" CssClass="premium-alert premium-alert-error" />
                    <div style="margin-top:16px;">
                        <asp:HyperLink ID="lnkBack2" runat="server" CssClass="premium-btn" Text="Retour à la boîte" NavigateUrl="~/Messages/Inbox.aspx" />
                    </div>
                </div>

            </asp:Panel>

        </div>
    </div>

</asp:Content>
