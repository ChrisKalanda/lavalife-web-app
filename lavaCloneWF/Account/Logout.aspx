<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<% Session.Clear(); Session.Abandon(); Response.Redirect("~/Default.aspx"); %>
</asp:Content>
