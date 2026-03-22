using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace lavaCloneWF.Messages
{
    public partial class Inbox : System.Web.UI.Page
    {
        protected int CurrentUserId
        {
            get
            {
                return Session["UserId"] == null ? 0 : (int)Session["UserId"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUserId == 0)
            {
                Response.Redirect("~/Accounts/Login.aspx");
                return;
            }

            if (!IsPostBack)
                BindInbox();
        }

        private void BindInbox()
        {
            var inbox = Data.GetInbox(CurrentUserId);

            // Récupération des noms des expéditeurs
            var senderIds = inbox.Select(m => m.FromId).Distinct();
            Dictionary<int, string> mapNom = new Dictionary<int, string>();

            foreach (int id in senderIds)
            {
                var m = Data.GetMemberById(id);
                mapNom[id] = m != null ? m.Username : "(inconnu)";
            }

            var view = inbox.Select(m => new
            {
                m.Id,
                m.FromId,
                m.Body,
                m.SentAt,
                SenderName = mapNom[m.FromId]
            }).ToList();

            rptInbox.DataSource = view;
            rptInbox.DataBind();
        }

        // ✅ GESTION DU SUPPRIMER
        protected void rptInbox_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DEL")
            {
                int msgId = int.Parse(e.CommandArgument.ToString());

                Data.DeleteMessage(msgId, CurrentUserId);

                BindInbox(); // refresh
            }
        }
    }
}
