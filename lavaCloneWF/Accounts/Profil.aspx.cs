using System;

namespace lavaCloneWF.Account
{
    public partial class Profil : System.Web.UI.Page
    {
        // Récupère l'Id de l’utilisateur connecté via la Session
        protected int CurrentUserId
        {
            get { return Session["UserId"] == null ? 0 : (int)Session["UserId"]; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUserId == 0)
            {
                // Si pas connecté → retour au login
                Response.Redirect("~/Accounts/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            // Member et Data viennent de App_Code (Models.cs + Data.cs)
            Member m = Data.GetMemberById(CurrentUserId);

            if (m == null)
            {
                pnlProfile.Visible = false;
                
                return;
            }

            lblUsername.Text = m.Username;
            lblSex.Text = m.Sex;
            lblAgeGroup.Text = m.AgeGroup;
            lblGroupName.Text = m.GroupName;
            lblReason.Text = m.Reason;
            lblInterests.Text = m.Interests;
            lblCity.Text = m.City;
            lblCreatedAt.Text = m.CreatedAt.ToString("dd MMMM yyyy");
        }
    }
}
