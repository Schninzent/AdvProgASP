﻿using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Data;
using System.Web.Services;
using System.Configuration;


namespace Graph
{
    /// <summary>
    /// Zusammenfassungsbeschreibung für JHUservice
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Wenn der Aufruf dieses Webdiensts aus einem Skript zulässig sein soll, heben Sie mithilfe von ASP.NET AJAX die Kommentarmarkierung für die folgende Zeile auf.
    [System.Web.Script.Services.ScriptService]
    public class JHUservice : System.Web.Services.WebService
    {

        [WebMethod]
        public ArrayList getJHUData(string countryOne, string countryTwo, string option, string isChecked)
        {
            string extra = "month >=3";

            if (isChecked == "true" && option == "cases")
            {
                option = "totalCases";
            }
            else if (isChecked == "true" && option == "deaths")
            {
                option = "totalDeaths";
            }

            System.Diagnostics.Debug.WriteLine("test");

            // List<object> iData = new List<object>();
            // List<string> labels = new List<string>();
            ArrayList iData = new ArrayList();
            ArrayList labels = new ArrayList();

            //get labels
            string query1 = String.Format("select concat(day ,'.' , month ) as date from AdvancedProgramming.Hopkins_Data where country='Germany' AND {0} Order by month, day,year",extra);
            DataTable dtLabels = GetData(query1);
            foreach (DataRow drow in dtLabels.Rows)
            {
                labels.Add(drow["date"].ToString());
            }
            iData.Add(labels);

            //get first data set
            string queryDataSet1 = String.Format("select {0} as 'quantity' from AdvancedProgramming.Hopkins_Data where country='{1}' AND {2} Order by month, day,year", option, countryOne,extra);

            DataTable dtDataItemsSets1 = GetData(queryDataSet1);
            ArrayList lstdataItem1 = new ArrayList();
            
            foreach (DataRow dr in dtDataItemsSets1.Rows)
            {
                lstdataItem1.Add(dr["quantity"].ToString());
            }
            iData.Add(lstdataItem1);

            //get second data set
            string queryDataSet2 = String.Format("select {0} as 'quantity' from AdvancedProgramming.Hopkins_Data where country='{1}' AND {2} Order by month, day,year", option, countryTwo,extra);

            DataTable dtDataItemsSets2 = GetData(queryDataSet2);
            ArrayList lstdataItem2 = new ArrayList();
            // List<string> lstdataItem2 = new List<string>();
            foreach (DataRow dr in dtDataItemsSets2.Rows)
            {
                // lstdataItem2.Add(Convert.ToInt32(dr["quantity"].ToString()));
                lstdataItem2.Add(dr["quantity"].ToString());
            }
            iData.Add(lstdataItem2);

            return iData;
        }

        //method to fill a dataset according to a query string
        public DataTable GetData(string strQuery)
        {
            string conn = ConfigurationManager.ConnectionStrings["AdvancedProgrammingConnectionString"].ConnectionString;
            MySqlConnection con = new MySqlConnection(conn);

            MySqlDataAdapter adapter = new MySqlDataAdapter(strQuery, con);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            return dataSet.Tables[0];
        }
    }
}