using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Graph
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cases();
        }

        public List<int> Bra = new List<int> { 12, 2, 3, 5, 19, 3 };

        public int Count()
        {
            int x =Bra.Count;
            return x;
        }

        public List<string> Test = new List<string>();

        public void Cases()
        {

            MySqlConnection con = new MySqlConnection("Database=dashboard;Data Source=localhost;User Id=root");
            con.Open();
            MySqlCommand command = con.CreateCommand();
            command.CommandText = "select cases from ecdc_data limit 20";
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Test.Add(reader.GetString(0));
            }
            reader.Close();
        }
    }
}