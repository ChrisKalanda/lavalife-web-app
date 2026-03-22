using System;

namespace lavaCloneWF
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool isLogged = (Session["UserId"] != null);

                pnlLanding.Visible = !isLogged;
                pnlDashboard.Visible = isLogged;

                if (isLogged && Session["Username"] != null)
                {
                    lblUsername.Text = Session["Username"].ToString();
                }
            }
        }
    }
}
