using System;
using lavaCloneWF;   // accès à Data, Member, etc.

namespace lavaCloneWF.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblError.Text = "";

            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Veuillez entrer votre nom d'utilisateur et votre mot de passe.";
                return;
            }

            // Login via Data.cs
            lavaCloneWF.Member membre = Data.GetMemberByCredentials(username, password);

            if (membre == null)
            {
                lblError.Text = "Nom d'utilisateur ou mot de passe invalide.";
                return;
            }

            // Connexion OK
            Session["UserId"] = membre.Id;
            Session["Username"] = membre.Username;

            Response.Redirect("~/Default.aspx");
        }
    }
}
