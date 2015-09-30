using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class Presentation_Sermons_Archive_Default : System.Web.UI.Page
{
    #region Declarations
    DataSet dsSermons = new DataSet();
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        //LoadSermonComps();
    }

    private void LoadSermonComps()
    {
        GetSermons();
        foreach (DataRow row in dsSermons.Tables[0].Rows)
        {
            sermonsgrid.Controls.Add(MakeSermonComp(row["SermonID"].ToString(), row["ArtSmall"].ToString(), row["IsSeries"].ToString(), row["SeriesID"].ToString(), row["PreachedDate"].ToString()));
        }
        //sermonsgrid.Controls.Add(MakeSermonComp("1", "../../Images/album-art.png", "true", "1"));
    }
    private Panel MakeSermonComp(string sermonID, string albumArtPath, string isSeries, string seriesID, string preachedDate)
    {
        Panel innerpnl = new Panel();
        innerpnl.CssClass = "sermon-grid-comp";
        HtmlGenericControl a = new HtmlGenericControl("a");
        #region Link To Series Or Sermon
        if (isSeries == "true")
            a.Attributes.Add("href", "../Sermons/Default.aspx?seriesID=" + seriesID);
        else
            a.Attributes.Add("href", "../Sermons/Default.aspx?sermonID=" + sermonID);
        #endregion

        Panel artpnl = new Panel();
        artpnl.CssClass = "sermons-art";
        Image img = new Image();
        img.ImageUrl = albumArtPath;
        artpnl.Controls.Add(img);
        Panel typepnl = new Panel();
        typepnl.CssClass = "grid-type";
        if (isSeries == "true")
        {
            Label lblSeries = new Label();
            lblSeries.CssClass = "issermon";
            lblSeries.Text = "Sermon Series";
            typepnl.Controls.Add(lblSeries);
        }
        else
        {
            Label lblSermon = new Label();
            lblSermon.CssClass = "issermon";
            lblSermon.Text = "Sermon";
            typepnl.Controls.Add(lblSermon);
        }
        Label lblDate = new Label();
        lblDate.Text = preachedDate != "" ? Convert.ToDateTime(preachedDate).ToShortDateString() : "";
        lblDate.CssClass = "date";
        typepnl.Controls.Add(lblDate);
        a.Controls.Add(artpnl);
        a.Controls.Add(new HiddenField { Value = sermonID });
        a.Controls.Add(typepnl);
        innerpnl.Controls.Add(a);
        return innerpnl;
    }

    private void GetSermons()
    {
        DataLink link = new DataLink();
        dsSermons = link.GetSermons();
    }
    private string GetColumnValue(DataSet ds, string columnName)
    {
        return ds.Tables[0].Rows[0][columnName].ToString();
    }
}