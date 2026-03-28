using System;
using System.Linq;
using System.Web.UI;

namespace lavaCloneWF
{
    public partial class Members : System.Web.UI.Page
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
                LoadMembers();
            }
        }

        private void LoadMembers()
        {
            try
            {
                var list = Data.SearchMembers(
                    sex: null,
                    ageGroup: null,
                    groupName: null,
                    reason: null,
                    city: null
                );

                var filteredList = list
                    .Where(m => m.Id != CurrentUserId)
                    .OrderBy(m => m.Username)
                    .ToList();

                string previousLetter = "";

                var groupedList = filteredList
                    .Select(m =>
                    {
                        string username = m.Username ?? "";
                        string currentLetter = string.IsNullOrWhiteSpace(username)
                            ? "#"
                            : username.Substring(0, 1).ToUpper();

                        bool showHeader = currentLetter != previousLetter;
                        previousLetter = currentLetter;

                        return new
                        {
                            Id = m.Id,
                            Username = m.Username,
                            Sex = m.Sex,
                            AgeGroup = m.AgeGroup,
                            City = m.City,
                            ShowLetterHeader = showHeader,
                            LetterHeader = currentLetter
                        };
                    })
                    .ToList();

                rptMembers.DataSource = groupedList;
                rptMembers.DataBind();

                lblError.Text = "";
                lblInfo.Text = groupedList.Any()
                    ? ""
                    : "Aucun autre membre n'est disponible pour le moment.";
            }
            catch (Exception ex)
            {
                lblError.Text = "Erreur lors du chargement des membres : " + ex.Message;
                lblInfo.Text = "";
            }
        }
    }
}