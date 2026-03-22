using System;
using System.Collections.Generic;
using System.Linq;

namespace lavaCloneWF
{
    public partial class Members : System.Web.UI.Page
    {
        // Récupère l'ID de l'utilisateur connecté (comme sur Profil, Compose, etc.)
        protected int CurrentUserId
        {
            get { return Session["UserId"] == null ? 0 : (int)Session["UserId"]; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUserId == 0)
            {
                // Pas connecté → redirection vers Login
                Response.Redirect("~/Accounts/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadMembers();
            }
        }

        private void LoadMembers()
        {
            try
            {
                // On réutilise la fonction de recherche avec tous les critères à null
                var list = Data.SearchMembers(
                    sex: null,
                    ageGroup: null,
                    groupName: null,
                    reason: null,
                    city: null
                );

                // On enlève l'utilisateur courant de la liste
                list = list
                    .Where(m => m.Id != CurrentUserId)
                    .ToList();

                rptMembers.DataSource = list;
                rptMembers.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = "Erreur lors du chargement des membres : " + ex.Message;
            }
        }
    }
}
