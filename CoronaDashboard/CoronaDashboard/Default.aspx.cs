﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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

        protected void Chart1_Load(object sender, EventArgs e)
        {

        }

        public ArrayList CaseList = new ArrayList();
        public ArrayList LabelList = new ArrayList();

        public int Length()
        {
            int length = CaseList.Count;
            System.Diagnostics.Debug.WriteLine(length);
            return length;
        }

        public String DataStringCases()
        {
            String data = "";
            foreach (var elem in CaseList)
            {
                
                data += (String)elem + ", ";
            }
            return data;
        }

        public String DataStringLabels()
        {
            String data = "";
            foreach (var elem in LabelList)
            {

                data += (String)elem + ", ";
            }
            return data;
        }

        public void Cases()
        {
            string connectionStr = ConfigurationManager.ConnectionStrings["coronadataConnectionString"].ConnectionString;
            MySqlConnection con = new MySqlConnection(connectionStr);
            con.Open();
            
            MySqlCommand command = con.CreateCommand();
            command.CommandText = "select cases from ecdc_data where geoID='DE' Order by month";
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                CaseList.Add(reader.GetString(0));                
            }
            reader.Close();
            
        }

        public void Date()
        {
            string connectionStr = ConfigurationManager.ConnectionStrings["coronadataConnectionString"].ConnectionString;
            MySqlConnection con = new MySqlConnection(connectionStr);
            con.Open();

            MySqlCommand command = con.CreateCommand();
            command.CommandText = "select day from ecdc_data where geoID='DE' Order by month";
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                LabelList.Add(reader.GetString(0));
            }
            reader.Close();

        }

    }



}

