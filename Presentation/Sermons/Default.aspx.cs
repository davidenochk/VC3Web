using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Presentation_Sermons_Default : System.Web.UI.Page
{
    string seriesID;
    string sermonID;
    bool _isSeries;
    List<Sermon> sermons = new List<Sermon>();
    #region Series Details
    //Series Details
    string seriesName;
    string seriesBy;
    string seriesDesc;
    public string seriesArtLink;
    string seriesArtSmallLink;
    DataSet dsSeries;
    #endregion
    #region Sermon Details
    //Sermon Details
    string sermonName;
    string sermonBy;
    string sermonDesc;
    string sermonDate;
    string sermonImageLink;
    public string sermonArtLink;
    string sermonAudioLink;
    string sermonVideoLink;
    DataTable dsSermon;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            #region Divs Invisibility
            divSermonWrap.Visible = false;
            divMessage.Visible = false;
            divSeriesWrap.Visible = false;
            #endregion
            #region Set Series and SermonID
            if (Request.QueryString["SeriesID"] != null)
                seriesID = Request.QueryString["SeriesID"];
            if (Request.QueryString["SermonID"] != null)
                sermonID = Request.QueryString["SermonID"];
            #endregion
            #region What details to fetch and display
            if (sermonID == null && seriesID == null)
            {
                sermonID = "latest";
                ValidateSermon(sermonID);
            }
            else if (sermonID != null && seriesID == null)
                ValidateSermon(sermonID);
            else if (sermonID == null && seriesID != null)
            {
                ValidateSeries(seriesID);
                if (!_isSeries)
                {
                    sermonID = "latest";
                    ValidateSermon(sermonID);
                }
            }
            else if (sermonID != null && seriesID != null)
                ValidateSermon(sermonID);
            #endregion
            #region Get Series and Sermon Details
            if (_isSeries)
                GetSeries(seriesID);
            if (_isSeries)
            {
                LoadSeries();
                FillSeries();
            }
            if (!(sermonID == null && seriesID != null))
                GetSermon(sermonID);
            #endregion
            #region Load Series and Sermon Details
            if (!(sermonID == null && seriesID != null))
            {
                LoadSermon();
                FillSermon();
            }
            #endregion
            #region Change Title According to the series or sermon
            if (seriesID == "0")
                Title = sermonName + " by " + sermonBy;
            else
            {
                if (sermonID == null)
                    Title = "Series - " + seriesName + " by " + seriesBy;
                else
                    Title = sermonName + " of " + seriesName + " series by " + sermonBy;
            }
            #endregion
        }
        catch (Exception ex)
        {
            divMessage.InnerText = ex.Message;
            divMessage.Visible = true;
        }
    }
    private void ValidateSeries(string seriesid)
    {
        //
        DataLink link = new DataLink();
        if (link.ValidateSeries(seriesid))
            _isSeries = true;
        else
            _isSeries = false;
    }
    private void ValidateSermon(string sermonid)
    {
        //
        DataLink link = new DataLink();
        if (link.ValidateSermon(sermonid))
        {
            if ((new DataLink()).GetSeriesForSermon(sermonID) != "0")
            {
                _isSeries = true;
                seriesID = (new DataLink()).GetSeriesForSermon(sermonID);
            }
        }
        else
            sermonID = "latest";
    }
    private void GetSeries(string seriesid)
    {
        DataLink link = new DataLink();
        dsSeries = link.GetSeries(seriesid);
    }
    private void GetSermon(string sermonid)
    {
        DataLink link = new DataLink();
        dsSermon = link.GetSermon(sermonid).Tables[0];
    }
    private void LoadSeries()
    {
        #region Load Series Details
        seriesName = GetColumnValue(dsSeries, "SeriesName");
        seriesDesc = GetColumnValue(dsSeries, "SeriesDescription");
        seriesBy = GetColumnValue(dsSeries, "SeriesBy");
        seriesArtLink = GetColumnValue(dsSeries, "ArtLink");
        seriesArtSmallLink = GetColumnValue(dsSeries, "ArtSmallLink");
        #endregion
        #region Load the sermons under this series
        if (dsSeries.Tables[1].Rows.Count > 0)
        {
            sermons.Clear();
            foreach (DataRow row in dsSeries.Tables[1].Rows)
            {
                Sermon sermon = new Sermon(
                    row["SermonID"].ToString(),
                    row["SermonName"].ToString(),
                    row["SermonDescription"].ToString(),
                    row["SermonBy"].ToString(),
                    row["SermonDate"].ToString(),
                    row["ImageLink"].ToString(),
                    row["AudioLink"].ToString(),
                    row["VideoLink"].ToString(),
                    row["ArtLink"].ToString(),
                    row["ArtSmallLink"].ToString());
                sermons.Add(sermon);
            }
        }
        #endregion
    }
    private void LoadSermon()
    {
        DataLink link = new DataLink();
        dsSermon = link.GetSermon(sermonID).Tables[0];
        #region Sermon Details Loading
        sermonName = GetCV(dsSermon, "SermonName");
        sermonBy = GetCV(dsSermon, "SermonBy");
        sermonDate = GetCV(dsSermon, "SermonDate");
        sermonDesc = GetCV(dsSermon, "SermonDescription");
        sermonImageLink = GetCV(dsSermon, "ImageLink");
        sermonAudioLink = GetCV(dsSermon, "AudioLink");
        sermonVideoLink = GetCV(dsSermon, "VideoLink");
        sermonArtLink = GetCV(dsSermon, "ArtLink");
        #endregion
    }
    private void FillSeries()
    {
        #region Fill Series Details
        lblSeriesName.Text = seriesName;
        lblSeriesBy.Text = seriesBy;
        lblSeriesDesc.Text = seriesDesc;
        imgSeriesArt.ImageUrl = seriesArtLink;
        imgSeriesArt.AlternateText = seriesName + " - " + seriesBy;
        #endregion

        #region Fill Sermons Under Series
        if (sermons.Count > 0)
        {
            divSermonsUnderSeries.InnerHtml = "<ul>";
            int i = 1;
            foreach (Sermon sermon in sermons)
            {
                divSermonsUnderSeries.InnerHtml += "<li><a href='Default.aspx?SermonID=" + sermon.ID + "'>Part " + i.ToString() + "</a></li>";
                i++;
            }
            divSermonsUnderSeries.InnerHtml += "</ul>";
            divSermonsUnderSeries.Visible = true;
        }
        #endregion
        if (_isSeries)
            divSeriesWrap.Visible = true;
        if (sermonID == null)
            divSermonWrap.Visible = false;
    }
    private void FillSermon()
    {
        #region Fill Sermon Details
        lblSermonTitle.Text = sermonName;
        lblSermonSpeaker.Text = sermonBy;
        lblSermonDescription.Text = sermonDesc;
        lblSermonDate.Text = (Convert.ToDateTime(sermonDate)).ToShortDateString();
        if (sermonImageLink != "" && sermonImageLink != null)
            imgSermonArt.ImageUrl = sermonImageLink;
        else
            if (sermonArtLink != "" && sermonArtLink != null)
                imgSermonArt.ImageUrl = sermonArtLink;
            else
                imgSermonArt.ImageUrl = "https://lh4.googleusercontent.com/-9mKI6Mi3dqM/UzGJKjQPcqI/AAAAAAAALCU/VZAZIJrl0X4/w920-h270-no/noSermonArtLessHeight.jpg";
        imgSermonArt.AlternateText = sermonName + " - " + sermonBy;
        hdYoutubeMain.Value = sermonVideoLink;
        divListen.InnerHtml = "<audio controls><source src='" + sermonAudioLink + "'></audio>";
        if (sermonAudioLink != "" && sermonAudioLink != null)
        { listenButton.Visible = true; liDownloadButton.Visible = true; liDownloadButton.InnerHtml = "<a href='" + sermonAudioLink + "' download='C3Victory - " + seriesName + " - " + sermonName + "'>Download Audio</a>"; }
        else
        { listenButton.Visible = false; liDownloadButton.Visible = false; }
        if (sermonVideoLink != "" && sermonVideoLink != null)
            liWatchButton.Visible = true;
        else
            liWatchButton.Visible = false;
        #endregion
        divSermonWrap.Visible = true;
        if (!_isSeries)
            divSeriesWrap.Visible = false;
    }
    private string GetColumnValue(DataSet ds, string columnName)
    {
        return ds.Tables[0].Rows[0][columnName].ToString();
    }
    private string GetCV(DataTable dt, string colName)
    {
        return dt.Rows[0][colName].ToString();
    }
}