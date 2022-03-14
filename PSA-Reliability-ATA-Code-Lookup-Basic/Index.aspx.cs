using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PSA_Reliability_ATA_Code_Lookup_Basic
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // Create array of movies  
        static string[] movies = { "Star Wars", "Star Trek", "Superman", "Memento", "Shrek", "Shrek II" };

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string[] GetCompletionList(string prefixText, int count, string contextKey)
        {


            // Return matching movies  
            return (from m in movies where m.StartsWith(prefixText, StringComparison.CurrentCultureIgnoreCase) select m).Take(count).ToArray();
        }

        [WebMethod]
        public static List<string> GetEmployeeName(string empName)
        {
            //using (SqlConnection con = new SqlConnection(@"Data Source=SARSHA\SqlServer2k8;Integrated Security=true;Initial Catalog=Test"))
            //{
            //    using (SqlCommand cmd = new SqlCommand())
            //    {
            //        cmd.CommandText = "select Top 10 EmployeeName from Employee where EmployeeName LIKE ''+@SearchEmpName+'%'";
            //        cmd.Connection = con;
            //        con.Open();
            //        cmd.Parameters.AddWithValue("@SearchEmpName", empName);
            //        SqlDataReader dr = cmd.ExecuteReader();
            //        while (dr.Read())
            //        {
            //            empResult.Add(dr["EmployeeName"].ToString());
            //        }
            //        con.Close();
            //        return empResult;
            //    }
            //}

            return (from m in movies where m.StartsWith(empName, StringComparison.CurrentCultureIgnoreCase) select m).ToList();
        }
    }
}