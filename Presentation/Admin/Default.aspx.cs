using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Presentation_Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
            //Populate Speakers
            FillDropdown(ddlSpeakers, "Speakers");
            //Populate Series
            FillDropdown(ddlSeries, "AllSeries");
            //Populate Series By
            FillDropdown(ddlSeriesBy, "Speakers");
        //}
    }
    protected void btnAddSermonBlock_Click(object sender, EventArgs e)
    {
        DataLink DBLink = new DataLink();
        if (DBLink.AddSermon(txtSermonTitle.Text, txtSermonDescr.Text, ddlSpeakers.SelectedValue, ddlSeries.SelectedValue, txtSermonPlace.Text, txtSermonDate.Text, txtSermonAudioLink.Text, txtSermonImageLink.Text, txtSermonVideoLink.Text, txtSermonArtLink.Text, txtSermonArtSmallLink.Text))
        {
            lblMessage.Text = "Successfully added the sermon";
            lblMessage.Visible = true;
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "OOPS, there was something wrong in the system";
        }
    }
    protected void btnAddSeries_Click(object sender, EventArgs e)
    {
        DataLink DBLink = new DataLink();
        if (DBLink.AddSeries(txtSeriesName.Text, txtSeriesDescr.Text, txtSeriesImage.Text, txtSeriesBanner.Text, "No Preview Video", ddlSeriesBy.SelectedValue, txtArtSmallLink.Text))
        {
            lblMessage.Text = "Successfully added the series";
            lblMessage.Visible = true;
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "OOPS, there was something wrong in the system";
        }
    }
    protected void btnAddSpeaker_Click(object sender, EventArgs e)
    {
        DataLink DBLink = new DataLink();
        if (DBLink.AddSpeaker(txtSpeakerName.Text, txtSpeakerEmail.Text, txtSpeakerInfo.Text, txtSpeakerImage.Text, txtFacebookAddress.Text, txtTwitter.Text, txtWebsite.Text))
        {
            lblMessage.Text = "Successfully added the speaker";
            lblMessage.Visible = true;
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "OOPS, there was something wrong in the system";
        }
    }

    protected void FillDropdown(DropDownList ddl, String fillWith)
    {
        ddl.Items.Clear();
        if (fillWith == "Speakers")
        {
            foreach (DataRow row in (new DataLink()).GetSpeakers().Tables[0].Rows)
            {
                ddl.Items.Add(new ListItem(row["SpeakerName"].ToString(), row["SpeakerID"].ToString()));
            }
        }
        else if (fillWith == "Series")
        {
            foreach (DataRow row in (new DataLink()).GetSeries().Tables[0].Rows)
            {
                ddl.Items.Add(new ListItem(row["SeriesName"].ToString(), row["SeriesID"].ToString()));
            }
            ddl.Items.Insert(0, new ListItem("No Series", "0"));
        }
        else if (fillWith == "AllSeries")
        {
            //[c3victory].[Proc_GetAllSeries]
            foreach (DataRow row in (new DataLink()).GetAllSeries().Tables[0].Rows)
            {
                ddl.Items.Add(new ListItem(row["SeriesName"].ToString(), row["SeriesID"].ToString()));
            }
            ddl.Items.Insert(0, new ListItem("No Series", "0"));
        }
    }
}