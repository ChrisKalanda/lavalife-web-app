using System;
using System.Collections.Generic;
using System.Linq;
using lavaCloneWF;

namespace lavaCloneWF.Messages 
{
    public partial class Compose : System.Web.UI.Page
    {
        protected int CurrentUserId
        {
            get { return Session["UserId"] == null ? 0 : (int)Session["UserId"]; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUserId == 0)
            {
                Response.Redirect("~/Accounts/Login.aspx");
                return;
            }

            if (!IsPostBack)
                BindDestinataires();
        }

        private void BindDestinataires()
        {
            // tous les membres
            List<lavaCloneWF.Member> membres = Data.SearchMembers(null, null, null, null, null);

            var dests = membres.Where(m => m.Id != CurrentUserId).ToList();

            ddlTo.DataSource = dests;
            ddlTo.DataTextField = "Username";
            ddlTo.DataValueField = "Id";
            ddlTo.DataBind();

           
            if (Request.QueryString["to"] != null)
            {
                string to = Request.QueryString["to"];
                var item = ddlTo.Items.FindByValue(to);
                if (item != null)
                {
                    ddlTo.ClearSelection();
                    item.Selected = true;
                }
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            lblInfo.Text = "";

            if (ddlTo.SelectedItem == null)
            {
                lblError.Text = "Veuillez choisir un destinataire.";
                return;
            }

            string body = txtBody.Text.Trim();
            if (string.IsNullOrEmpty(body))
            {
                lblError.Text = "Le message ne peut pas être vide.";
                return;
            }

            int toId = int.Parse(ddlTo.SelectedValue);

            Data.SendMessage(CurrentUserId, toId, body);

            txtBody.Text = "";
            lblInfo.Text = "Message envoyé !";
        }
    }
}
