using System;
using System.Collections;
using System.Configuration;
using System.Web.UI;
using MySql.Data.MySqlClient;



namespace CoronaDashboard
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Date();
        }
        // public ArrayList LabelList = new ArrayList();
        //
        // // Put SQL Data Labels in String  
        // public String DataStringLabels()
        // {
        //     String data = "";
        //     foreach (var elem in LabelList)
        //     {
        //
        //         data += (String)elem + ", ";
        //     }
        //     return data;
        // }
        //
        // //SQL Query to get Data labels
        // public void Date()
        // {
        //     MySqlConnection con = new MySqlConnection("Database=dashboard;Data Source=localhost;User Id=root");
        //     con.Open();
        //     string comm = "select concat(day ,'.' , month ) as date from ecdc_data where geoID='DE' Order by month, day,year";
        //     MySqlCommand command = con.CreateCommand();
        //     // command.CommandText = "select day, month from ecdc_data where geoID='DE' Order by month, day,year";
        //     command.CommandText = comm;
        //     MySqlDataReader reader = command.ExecuteReader();
        //     while (reader.Read())
        //     {
        //         LabelList.Add(reader.GetString(0));
        //         // LabelList.Add(reader.GetString(reader.GetOrdinal("month")));
        //         // LabelList.Add(reader.GetString(reader.GetOrdinal("day")));
        //     }
        //     reader.Close();
        //
        // }
    }
}