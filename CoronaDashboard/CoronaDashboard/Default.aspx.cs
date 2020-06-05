using System;
using System.Collections;
using System.Configuration;
using System.Web.UI;
using MySql.Data.MySqlClient;



namespace CoronaDashboard
{
    public partial class data : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cases();
            Length();
            Date();
        }

        public ArrayList CaseList = new ArrayList();
        public ArrayList LabelList = new ArrayList();

        //Get Array length
        public int Length()
        {
            int length = CaseList.Count;
            System.Diagnostics.Debug.WriteLine(length);
            return length;
        }

        // Put SQL Data in String  
        public String DataStringCases()
        {
            String data = "";
            foreach (var elem in CaseList)
            {
                
                data += (String)elem + ", ";
            }
            return data;
        }
        // Put SQL Data Labels in String  
        public String DataStringLabels()
        {
            String data = "";
            foreach (var elem in LabelList)
            {

                data += (String)elem + ", ";
            }
            return data;
        }

        //SQL Query to get Data points
        public void Cases()
        {

            MySqlConnection con = new MySqlConnection("Database=dashboard;Data Source=localhost;User Id=root");
            con.Open();
            
            MySqlCommand command = con.CreateCommand();
            command.CommandText = "select cases from ecdc_data where geoID='DE' Order by month, day,year";
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                CaseList.Add(reader.GetString(0));                
            }
            reader.Close();
            
        }
        //SQL Query to get Data labels
        public void Date()
        {
            MySqlConnection con = new MySqlConnection("Database=dashboard;Data Source=localhost;User Id=root");
            con.Open();
            string comm = "select concat(day ,'.' , month ) as date from ecdc_data where geoID='DE' Order by month, day,year";
            MySqlCommand command = con.CreateCommand();
            // command.CommandText = "select day, month from ecdc_data where geoID='DE' Order by month, day,year";
            command.CommandText = comm;
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                LabelList.Add(reader.GetString(0));
                // LabelList.Add(reader.GetString(reader.GetOrdinal("month")));
                // LabelList.Add(reader.GetString(reader.GetOrdinal("day")));
            }
            reader.Close();

        }

    }


}

