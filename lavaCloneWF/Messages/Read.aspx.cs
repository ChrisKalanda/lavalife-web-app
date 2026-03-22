using System;
using System.Web;

namespace lavaCloneWF.Messages
{
    public partial class Read : System.Web.UI.Page
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
                LoadMessage();
        }

        private void LoadMessage()
        {
            //Lire l'ID depuis l'URL: Read.aspx?id=123
            if (!int.TryParse(Request.QueryString["id"], out int msgId) || msgId <= 0)
            {
                ShowError("Message introuvable (id invalide).");
                return;
            }

            //Charger le message (sécurisé: ToId doit être l'utilisateur connecté)
            var msg = Data.GetMessageByIdForUser(msgId, CurrentUserId);

            if (msg == null)
            {
                ShowError("Message introuvable ou accès refusé.");
                return;
            }

            
            lblFrom.Text = HttpUtility.HtmlEncode(msg.SenderName);
            lblDate.Text = msg.SentAt.ToString("yyyy-MM-dd HH:mm");

            
            string safeBody = HttpUtility.HtmlEncode(msg.Body ?? "");
            litBody.Text = safeBody.Replace("\r\n", "<br/>").Replace("\n", "<br/>");

            
            lnkReply.NavigateUrl = ResolveUrl("~/Messages/Compose.aspx?to=" + msg.FromId);

            pnlOk.Visible = true;
            pnlError.Visible = false;

          
        }

        private void ShowError(string message)
        {
            pnlOk.Visible = false;
            pnlError.Visible = true;
            lblError.Text = HttpUtility.HtmlEncode(message);
        }
    }
}
