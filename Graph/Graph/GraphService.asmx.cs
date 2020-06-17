using System;
using System.Collections;
//using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using MySql.Data.MySqlClient;

namespace Graph
{
    /// <summary>
    /// Zusammenfassungsbeschreibung für WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Wenn der Aufruf dieses Webdiensts aus einem Skript zulässig sein soll, heben Sie mithilfe von ASP.NET AJAX die Kommentarmarkierung für die folgende Zeile auf. 
    [System.Web.Script.Services.ScriptService]
    public class GraphService : System.Web.Services.WebService
    {
        private protected MySqlConnection con = new MySqlConnection("Database=dashboard;Data Source=localhost;User Id=root");

        [WebMethod]


        public ArrayList getLineChartData(string countryOne, string countryTwo, string option)
        {
            System.Diagnostics.Debug.WriteLine("test");

            // List<object> iData = new List<object>();
            ArrayList iData = new ArrayList();
            // List<string> labels = new List<string>();
            ArrayList labels = new ArrayList();

            //get labels
            string query1 = "select concat(day ,'.' , month ) as date from ecdc_data where geoID='DE' Order by month, day,year";
            DataTable dtLabels = CommonFuntionGetData(query1);
            foreach (DataRow drow in dtLabels.Rows)
            {
                labels.Add(drow["date"].ToString());
            }
            iData.Add(labels);

            //get first data set
            string queryDataSet1 = String.Format("select {0} as 'quantity' from ecdc_data where geoID='{1}' Order by month, day,year", option, countryOne);

            DataTable dtDataItemsSets1 = CommonFuntionGetData(queryDataSet1);
            System.Diagnostics.Debug.WriteLine(dtDataItemsSets1.Rows.Count);
            ArrayList lstdataItem1 = new ArrayList();
            // List<string> lstdataItem1 = new List<string>();
            foreach (DataRow dr in dtDataItemsSets1.Rows)
            {
                // lstdataItem1.Add(Convert.ToInt32(dr["quantity"].ToString()));
                lstdataItem1.Add(dr["quantity"].ToString());
            }
            iData.Add(lstdataItem1);


            //get second data set
            string queryDataSet2 = String.Format("select {0} as 'quantity' from ecdc_data where geoID='{1}' Order by month, day,year", option, countryTwo);

            DataTable dtDataItemsSets2 = CommonFuntionGetData(queryDataSet2);
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
        public DataTable CommonFuntionGetData(string strQuery)
        {
            MySqlDataAdapter adap = new MySqlDataAdapter(strQuery, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            return ds.Tables[0];
        }
    }
}

