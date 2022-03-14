using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PSA_Reliability_ATA_Code_Lookup_Basic
{
    public partial class Default : System.Web.UI.Page
    {
        string AllAtas;
        static List<string> ATAs = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            AllAtas = Properties.Resources.ATA_Lookup_Export;

            try
            {
                string allAtas = Properties.Resources.ATA_Lookup_Export;


                string[] lines = allAtas.Split(
                    new string[] { "\r\n" },
                    StringSplitOptions.None
                    );

                if (lines.Length > 0)
                {
                    ATAs.Clear();

                    foreach (string line in lines)
                    {
                        string newstr = line.Replace("\"", "");
                        ATAs.Add(newstr);
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Couldn't import the file" + ex.Message);
            }

        }

        [WebMethod]
        public static List<string> getCustomerNames(string prefixText)
        {
            var filteredList = ATAs.Where(x => x.ToUpperInvariant().Contains(prefixText.ToUpperInvariant()));

            return filteredList.ToList();
        }
    }
}