using System;
using System.Collections.Generic;
using System.Web.Services;
using Newtonsoft.Json;
using System.Web.Script.Services;
using System.Collections;
using System.Data;

/// <summary>
/// Summary description for vc3siteservice
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[ScriptService]
public class vc3siteservice : System.Web.Services.WebService
{

    public vc3siteservice()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string GetSlideImages()
    {
        DataLink DBLink = new DataLink();
        var json = DataTableToString(DBLink.GetSlides());
        //Get slide image links from DB
        //Filter the image slide according to their dates
        return json;
    }

    public string DataTableToString(DataTable dt)
    {
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (DataRow dr in dt.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in dt.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
        return serializer.Serialize(rows);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string GetSpeakers()
    {
        DataLink DBLink = new DataLink();
        var json = DataTableToString(DBLink.GetSpeakers().Tables[0]);
        return json;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string GetSeries()
    {
        DataLink DBLink = new DataLink();
        var json = DataTableToString(DBLink.GetAllSeries().Tables[0]);
        return json;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string AddSermon(string title, string descr, string by, string seriesID, string sermonPlace, string sermonDate, string audioLink, string imageLink, string videoLink, string artLink, string artSmallLink)
    {
        var json = "";
        DataLink DBLink = new DataLink();
        try
        {
            if (DBLink.AddSermon(NVL(title), NVL(descr), by, NVL(seriesID, "0"), NVL(sermonPlace), NVL(sermonDate, DateTime.Now.Date.ToString()), audioLink, NVL(imageLink), NVL(videoLink), artLink, artSmallLink))
                json = "Success";
            else
                json = "Failed";
        }
        catch (Exception) { json = "Failed"; }
        return json;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string SaveSermon(string title, string desc, string by, string seriesID, string place, string date, string audio, string image, string video, string art, string artsml)
    {
        DataLink dl = new DataLink();
        return dl.AddSermon(title, desc, by, seriesID, place, date, audio, image, video, art, artsml).ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string GetSermons()
    {
        DataLink link = new DataLink();
        return Newtonsoft.Json.JsonConvert.SerializeObject(link.GetSermons());
    }


    private string NVL(string val, string oval = "")
    {
        if (val == "undefined")
            return oval;
        else
            return val;
    }
}
