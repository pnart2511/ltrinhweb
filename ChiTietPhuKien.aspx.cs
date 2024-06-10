using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSellPhone
{
    public partial class ChiTietPhuKien : System.Web.UI.Page
    {
        SQLDataContext dataWeb = new SQLDataContext("Server=LAPTOP-NPBITMJK\\PHAMNGUYEN;Database=webSellPhone;User Id=sa;Password=123;");
        public static tbPhuKien phukien = new tbPhuKien();
        public static List<tbPhuKien> ListPK = new List<tbPhuKien>();

        protected void Page_Load(object sender, EventArgs e)
        {
            load();
            sp_chung();
        }

        void load()
        {
            try
            {
                long idselect = Convert.ToInt64(Request.QueryString["IDPK"]);
                var dataFrom = from q in dataWeb.tbPhuKiens where q.id_phukien == idselect select q;
                if (dataFrom != null && dataFrom.Count() > 0)
                {
                    phukien = dataFrom.First();
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine($"An error occurred: {ex.Message}");


                Response.Redirect("404.html");
            }
        }

        void sp_chung()
        {
            try
            {
                if (phukien != null)
                {
                    var spcungid = from q in dataWeb.tbPhuKiens
                                   where q.id_danh_muc_phu_kien == phukien.id_danh_muc_phu_kien && q.id_phukien != phukien.id_phukien
                                   select q;

                    if (spcungid != null && spcungid.Count() > 0)
                    {
                        ListPK = spcungid.ToList();
                    }
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine($"An error occurred: {ex.Message}");


                Response.Redirect("404.html");
            }

        }
    }
}