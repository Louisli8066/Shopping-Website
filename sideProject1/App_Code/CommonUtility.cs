using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CommonUtility
/// </summary>
public class CommonUtility
{
    public static string connectionString
    {
        get
        {
            return ConfigurationManager.ConnectionStrings["mydbConnectionString1"].ConnectionString;
        }
    }
}