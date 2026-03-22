using System;
using System.Web.UI;

namespace lavaCloneWF
{
    public partial class Search : Page
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
                // Optionnel : afficher une première liste vide ou tous les membres
                BindResults();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindResults();
        }

        private void BindResults()
        {
            string sex = ddlSex.SelectedValue;              // M / F / ""
            string ageGroup = ddlAgeGroup.SelectedValue;    // 26-35 / "" ...
            string groupName = ddlGroupName.SelectedValue;  // Africain / ...
            string reason = ddlReason.SelectedValue;        // Autre / ...
            string city = (txtCity.Text ?? "").Trim();

            //on exclut l'utilisateur courant
            var results = Data.SearchMembers(ddlSex.SelectedValue, ddlAgeGroup.SelectedValue, ddlGroupName.SelectedValue, ddlReason.SelectedValue, txtCity.Text);


            gv.DataSource = results;
            gv.DataBind();
        }
    }
}
