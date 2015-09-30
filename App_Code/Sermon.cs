using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Sermon
/// </summary>
public class Sermon
{
    public string ID { get; set; }
    public string Name { get; set; }
    public string Desc { get; set; }
    public string By { get; set; }
    public string Date { get; set; }
    public string ImageLink { get; set; }
    public string AudioLink { get; set; }
    public string VideoLink { get; set; }
    public string ArtLink { get; set; }
    public string ArtSmallLink { get; set; }
    public Sermon()
    {
    }
    public Sermon(string id, string name, string desc, string by, string date, string image, string audio, string video, string art, string artSmall)
    {
        ID = id;
        Name = name;
        Desc = desc;
        By = by;
        Date = date;
        ImageLink = image;
        AudioLink = audio;
        VideoLink = video;
        ArtLink = art;
        ArtSmallLink = artSmall;
    }
}