using System;
using lavaCloneWF; 

namespace lavaCloneWF
{
    public partial class ModifierProfil : System.Web.UI.Page
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
            {
                BindDropDowns();
                LoadProfile();
            }
        }

        private void BindDropDowns()
        {
            // ddlSex
            ddlSex.Items.Clear();
            ddlSex.Items.Add(new System.Web.UI.WebControls.ListItem("(Non spécifié)", ""));
            ddlSex.Items.Add(new System.Web.UI.WebControls.ListItem("Homme", "M"));
            ddlSex.Items.Add(new System.Web.UI.WebControls.ListItem("Femme", "F"));

            // ddlAgeGroup
            ddlAgeGroup.Items.Clear();
            ddlAgeGroup.Items.Add(new System.Web.UI.WebControls.ListItem("18–25", "18-25"));
            ddlAgeGroup.Items.Add(new System.Web.UI.WebControls.ListItem("26–35", "26-35"));
            ddlAgeGroup.Items.Add(new System.Web.UI.WebControls.ListItem("36–45", "36-45"));
            ddlAgeGroup.Items.Add(new System.Web.UI.WebControls.ListItem("46+", "46+"));

            // ddlGroupName (ethnie)
            ddlGroupName.Items.Clear();
            ddlGroupName.Items.Add(new System.Web.UI.WebControls.ListItem("(Non spécifié)", ""));
            ddlGroupName.Items.Add(new System.Web.UI.WebControls.ListItem("Caucasien", "Caucasien"));
            ddlGroupName.Items.Add(new System.Web.UI.WebControls.ListItem("Africain", "Africain"));
            ddlGroupName.Items.Add(new System.Web.UI.WebControls.ListItem("Asiatique", "Asiatique"));
            ddlGroupName.Items.Add(new System.Web.UI.WebControls.ListItem("Latino", "Latino"));
            ddlGroupName.Items.Add(new System.Web.UI.WebControls.ListItem("Blanc", "Blanc"));
            ddlGroupName.Items.Add(new System.Web.UI.WebControls.ListItem("Noir", "Noir"));
            ddlGroupName.Items.Add(new System.Web.UI.WebControls.ListItem("Autre", "Autre"));

            // ddlReason
            ddlReason.Items.Clear();
            ddlReason.Items.Add(new System.Web.UI.WebControls.ListItem("(Non spécifié)", ""));
            ddlReason.Items.Add(new System.Web.UI.WebControls.ListItem("Amitié", "Amitié"));
            ddlReason.Items.Add(new System.Web.UI.WebControls.ListItem("Rencontre", "Rencontre"));
            ddlReason.Items.Add(new System.Web.UI.WebControls.ListItem("Relation sérieuse", "Relation sérieuse"));
            ddlReason.Items.Add(new System.Web.UI.WebControls.ListItem("Autre", "Autre"));
        }

        private void LoadProfile()
        {
            lblError.Text = "";
            lblInfo.Text = "";

            Member m = Data.GetMemberById(CurrentUserId);
            if (m == null)
            {
                lblError.Text = "Profil introuvable.";
                return;
            }

            // Remplir les contrôles
            ddlSex.SelectedValue = m.Sex ?? "";
            ddlAgeGroup.SelectedValue = m.AgeGroup ?? "";
            ddlGroupName.SelectedValue = m.GroupName ?? "";
            ddlReason.SelectedValue = m.Reason ?? "";
            txtInterests.Text = m.Interests ?? "";
            txtCity.Text = m.City ?? "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            lblInfo.Text = "";

            Member m = Data.GetMemberById(CurrentUserId);
            if (m == null)
            {
                lblError.Text = "Profil introuvable.";
                return;
            }

            // Mise à jour des propriétés avec les contrôles de la page
            m.Sex = ddlSex.SelectedValue;
            m.AgeGroup = ddlAgeGroup.SelectedValue;
            m.GroupName = ddlGroupName.SelectedValue;
            m.Reason = ddlReason.SelectedValue;
            m.Interests = txtInterests.Text.Trim();
            m.City = txtCity.Text.Trim();

            // Enregistrement en BD
            bool ok = Data.UpdateMember(m);

            if (ok)
                lblInfo.Text = "Profil mis à jour avec succès.";
            else
                lblError.Text = "Une erreur s'est produite lors de l'enregistrement.";
        }

    }
}

