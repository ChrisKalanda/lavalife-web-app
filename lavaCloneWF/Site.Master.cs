using System;

namespace lavaCloneWF
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = Request.AppRelativeCurrentExecutionFilePath ?? "";

            
            if (path.Equals("~/Default.aspx", StringComparison.OrdinalIgnoreCase))
            {
                pnlHeader.Visible = false;
                pnlFooter.Visible = false;
            }
            else
            {
                pnlHeader.Visible = true;
                pnlFooter.Visible = true;
            }
        }
    }
}
