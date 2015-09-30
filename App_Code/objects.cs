using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for objects
/// </summary>
public class objects
{
    public objects()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}

public class Slide
{
    public int id { get; set; }
    public string title { get; set; }
    public string imgurl { get; set; }
    public string imgsmlurl { get; set; }
    public string imglink { get; set; }
    public DateTime validfrom { get; set; }
    public DateTime validto { get; set; }
}
