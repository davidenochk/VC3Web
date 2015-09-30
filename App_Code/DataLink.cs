using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataLink
/// </summary>
public class DataLink
{
    DataAccess da;
    DataSet resultDS = new DataSet();
    public DataLink()
    {
        da = new DataAccess();
    }

    public bool AddSeries(string title, string descr, string imageLink, string bannerLink, string videoPreviewLink, string by, string artSmallLink)
    {
        SqlParameter[] parameters = new SqlParameter[8];
        parameters[0] = new SqlParameter("@seriesName", title);
        parameters[1] = new SqlParameter("@seriesDescription", descr);
        parameters[2] = new SqlParameter("@seriesBy", by);
        parameters[3] = new SqlParameter("@seriesPlace", "");
        parameters[4] = new SqlParameter("@category", "");
        parameters[5] = new SqlParameter("@imageLink", imageLink);
        parameters[6] = new SqlParameter("@bannerLink", bannerLink);
        parameters[7] = new SqlParameter("@artSmallLink", artSmallLink);
        try
        {
            DataSet resultDS = da.GetDataSet("Sermon_AddNewSeries", parameters);
            string stringResult = resultDS.Tables[0].Rows[0][0].ToString();
            if (stringResult == "SUCCESS")
                return true;
            else if (stringResult == "ERROR")
                return false;
            else return false;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public DataTable GetSlides()
    {
        try
        {
            DataTable resultDT = da.GetDataSet("c3victory.GetSlides", null).Tables[0];
            return resultDT;
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    public bool AddSermon(string title, string descr, string by, string seriesID, string sermonPlace, string sermonDate, string audioLink, string imageLink, string videoLink, string artLink, string artSmallLink)
    {
        SqlParameter[] parameters = new SqlParameter[11];
        parameters[0] = new SqlParameter("@sermonName", title);
        parameters[1] = new SqlParameter("@sermonDescription", descr);
        parameters[2] = new SqlParameter("@sermonBy", by);
        parameters[3] = new SqlParameter("@seriesID", seriesID);
        parameters[4] = new SqlParameter("@sermonPlace", "Hyderabad");
        parameters[5] = new SqlParameter("@sermonDate", Convert.ToDateTime(sermonDate));
        parameters[6] = new SqlParameter("@audioLink", audioLink);
        parameters[7] = new SqlParameter("@imageLink", imageLink);
        parameters[8] = new SqlParameter("@videoLink", videoLink);
        parameters[9] = new SqlParameter("@artLink", artLink);
        parameters[10] = new SqlParameter("@artSmallLink", artSmallLink);
        try
        {
            DataSet resultDS = da.GetDataSet("c3victory.Sermon_AddNewSermon", parameters);
            if (resultDS.Tables[0].Rows[0][0].ToString() != "0")
                return true;
            else
                return false;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public DataSet GetSermonDetails(string sermonID)
    {
        SqlParameter[] parameters = new SqlParameter[1];
        parameters[0] = new SqlParameter("@sermonID", sermonID);
        try
        {
            DataSet resultDS = da.GetDataSet("c3victory.Sermon_GetSermonDetails", parameters);
            if (resultDS.Tables[0].Rows[0][0].ToString() != "ERROR")
                return resultDS;
            else return null;
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    public DataSet GetSpeakers()
    {
        try
        {
            DataSet resultDS = da.GetDataSet("c3victory.GetSpeakers");
            if (resultDS.Tables[0].Rows[0][0].ToString() != "ERROR")
                return resultDS;
            else return null;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public DataSet GetSeries()
    {
        return GetSeries("latest");
    }
    public DataSet GetSeries(string seriesID)
    {
        try
        {
            DataSet resultDS = da.GetDataSet("c3victory.Proc_GetSeries", new object[] { new SqlParameter("@seriesID", seriesID) });
            if (resultDS.Tables[0].Rows[0][0].ToString() != "ERROR")
                return resultDS;
            else return null;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public DataSet GetAllSeries()
    {
        try
        {
            DataSet resultDS = da.GetDataSet("C3Victory.Proc_GetAllSeries", new object[] { });
            if (resultDS.Tables[0].Rows[0][0].ToString() != "ERROR")
                return resultDS;
            else return null;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public DataSet GetSermon(string sermonID)
    {
        try
        {
            DataSet resultDS = da.GetDataSet("c3victory.Proc_GetSermon", new object[] { new SqlParameter("@sermonID", sermonID) });
            if (resultDS.Tables[0].Rows[0][0].ToString() != "ERROR")
                return resultDS;
            else return null;
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    public DataSet GetSpeakerDetails(string speakerName, string speakerID)
    {
        SqlParameter[] parameters = new SqlParameter[2];
        parameters[0] = new SqlParameter("@speakerID", speakerID);
        parameters[1] = new SqlParameter("@speakerName", speakerName);
        try
        {
            DataSet resultDS = da.GetDataSet("c3victory.Sermon_GetSpeakerInformation", parameters);
            if (resultDS.Tables[0].Rows[0][0].ToString() != "ERROR")
                return resultDS;
            else return null;
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    public bool AddSpeaker(string speakerName, string speakerEmail, string speakerDescr, string speakerImage, string speakerFacebook, string speakerTwitter, string speakerWebsite)
    {
        SqlParameter[] parameters = new SqlParameter[7];
        parameters[0] = new SqlParameter("@speakerName", speakerName);
        parameters[1] = new SqlParameter("@speakerEmail", speakerEmail);
        parameters[2] = new SqlParameter("@speakerDescription", speakerDescr);
        parameters[3] = new SqlParameter("@speakerImage", speakerImage);
        parameters[4] = new SqlParameter("@speakerFacebook", speakerFacebook);
        parameters[5] = new SqlParameter("@speakerTwitter", speakerTwitter);
        parameters[6] = new SqlParameter("@speakerWebsite", speakerWebsite);
        try
        {
            DataSet resultDS = da.GetDataSet("c3victory.Sermon_AddNewSpeaker", parameters);
            string stringResult = resultDS.Tables[0].Rows[0][0].ToString();
            if (stringResult == "SUCCESS")
                return true;
            else if (stringResult == "ERROR")
                return false;
            else return false;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public bool PostPrayerRequest(string name, string email, string number, string request)
    {
        SqlParameter[] parameters = new SqlParameter[4];
        parameters[0] = new SqlParameter("@name", name);
        parameters[1] = new SqlParameter("@email", email);
        parameters[2] = new SqlParameter("@number", number);
        parameters[3] = new SqlParameter("@request", request);
        try
        {
            DataSet resultDS = da.GetDataSet("c3victory.PostPrayerRequest", parameters);
            string stringResult = resultDS.Tables[0].Rows[0][0].ToString();
            if (stringResult == "SUCCESS")
                return true;
            else if (stringResult == "ERROR")
                return false;
            else return false;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public DataSet GetSermonsUnderSeries(string seriesID)
    {
        SqlParameter[] parameters = new SqlParameter[1];
        parameters[0] = new SqlParameter("@seriesID", seriesID);
        try
        {
            DataSet resultDS = da.GetDataSet("c3victory.Proc_GetSermonsUnderSeries", parameters);
            if (resultDS.Tables[0].Rows[0][0].ToString() != "ERROR")
                return resultDS;
            else return null;
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    public DataSet GetSermons()
    {
        //try
        //{
        DataSet resultDS = da.GetDataSet("c3victory.Proc_GetSermons");
        if (resultDS.Tables[0].Rows[0][0].ToString() != "ERROR")
            return resultDS;
        else return null;
        //}
        //catch (Exception ex)
        //{
        //    return null;
        //}
    }

    public bool ValidateSeries(string seriesid)
    {
        SqlParameter[] parameters = new SqlParameter[1];
        SqlParameter param = new SqlParameter("seriesID", seriesid);
        param.SqlDbType = SqlDbType.NVarChar;
        parameters[0] = param;
        string result = da.GetScalar("c3victory.Proc_ValidateSeries", parameters);
        if (result == "true")
            return true;
        else
            return false;
    }

    public bool ValidateSermon(string sermonid)
    {
        SqlParameter[] parameters = new SqlParameter[1];
        SqlParameter param = new SqlParameter("sermonID", sermonid);
        param.SqlDbType = SqlDbType.NVarChar;
        parameters[0] = param;
        parameters[0] = new SqlParameter("sermonID", sermonid);
        string result = da.GetScalar("c3victory.Proc_ValidateSermon", parameters);
        if (result == "true")
            return true;
        else
            return false;
    }

    public string GetSeriesForSermon(string sermonid)
    {
        SqlParameter[] parameters = new SqlParameter[1];
        SqlParameter param = new SqlParameter("sermonID", sermonid);
        param.SqlDbType = SqlDbType.NVarChar;
        parameters[0] = param;
        parameters[0] = new SqlParameter("sermonID", sermonid);
        string result = da.GetScalar("c3victory.Proc_GetSeriesForSermon", parameters);
        return result;
    }

}