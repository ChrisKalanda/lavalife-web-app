using System;
using lavaCloneWF;   // pour Data et Member

namespace lavaCloneWF.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAgeGroups();
            }
        }

        private void BindAgeGroups()
        {
            ddlAgeGroup.Items.Clear();
            ddlAgeGroup.Items.Add("");
            ddlAgeGroup.Items.Add("18-25");
            ddlAgeGroup.Items.Add("26-35");
            ddlAgeGroup.Items.Add("36-45");
            ddlAgeGroup.Items.Add("46+");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lblError.Text = "";

            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;
            string confirm = txtConfirm.Text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Nom d'utilisateur et mot de passe sont obligatoires.";
                return;
            }

            if (password != confirm)
            {
                lblError.Text = "Les mots de passe ne correspondent pas.";
                return;
            }

            // vérifier si l'utilisateur existe déjà
            lavaCloneWF.Member existant = Data.GetMemberByUsername(username);
            if (existant != null)
            {
                lblError.Text = "Ce nom d'utilisateur est déjà utilisé.";
                return;
            }

            string passwordHash = password; // tu pourras le hasher plus tard si tu veux

            lavaCloneWF.Member m = new lavaCloneWF.Member
            {
                Username = username,
                PasswordHash = passwordHash,
                Sex = rblSex.SelectedValue,
                AgeGroup = ddlAgeGroup.SelectedValue,
                GroupName = txtGroupName.Text.Trim(),
                Reason = ddlReason.SelectedValue,
                Interests = txtInterests.Text.Trim(),
                City = txtCity.Text.Trim()
            };

            int newId = Data.CreateMember(m);

            // Rediriger vers la page de login
            Response.Redirect("~/Accounts/Login.aspx");
        }
    }
}
