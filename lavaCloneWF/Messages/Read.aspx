<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Read.aspx.cs"
    Inherits="lavaCloneWF.Messages.Read" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="max-width:900px; margin:20px auto; padding:18px; background:#fff; border-radius:10px; box-shadow:0 6px 18px rgba(0,0,0,.08);">

        <h2 style="margin:0 0 12px 0;">Lecture du message</h2>

        <asp:Panel ID="pnlOk" runat="server" Visible="true">

            <div style="display:flex; gap:20px; flex-wrap:wrap; margin-bottom:12px;">
                <div style="min-width:250px;">
                    <div style="font-weight:bold;">De</div>
                    <asp:Label ID="lblFrom" runat="server" />
                </div>

                <div>
                    <div style="font-weight:bold;">Date</div>
                    <asp:Label ID="lblDate" runat="server" />
                </div>
            </div>

            <hr />

            <div style="margin-top:12px;">
                <div style="font-weight:bold; margin-bottom:6px;">Message</div>

                <div style="padding:12px; border:1px solid #e6e6e6; border-radius:8px; background:#fafafa; line-height:1.5;">
                    <asp:Literal ID="litBody" runat="server" />
                </div>
            </div>

            <div style="margin-top:16px; display:flex; gap:10px; flex-wrap:wrap;">
                <asp:HyperLink ID="lnkReply" runat="server" CssClass="btn-main" Text="Répondre" />
                <asp:HyperLink ID="lnkBack" runat="server" CssClass="btn-main" Text="Retour à la boîte" NavigateUrl="~/Messages/Inbox.aspx" />
            </div>

        </asp:Panel>

        <asp:Panel ID="pnlError" runat="server" Visible="false">
            <div style="padding:12px; border:1px solid #f5c2c7; background:#f8d7da; border-radius:8px;">
                <asp:Label ID="lblError" runat="server" />
            </div>

            <div style="margin-top:12px;">
                <asp:HyperLink ID="lnkBack2" runat="server" CssClass="btn-main" Text="Retour à la boîte" NavigateUrl="~/Messages/Inbox.aspx" />
            </div>
        </asp:Panel>

    </div>

</asp:Content>
