using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Presentation_Admin_Changes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindSeriesData();
    }

    private void BindSeriesData()
    {
        DataLink link = new DataLink();
        gdvSeries.DataSource = link.GetAllSeries().Tables[0];
        gdvSeries.DataBind();
    }
}