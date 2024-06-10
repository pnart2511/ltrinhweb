using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSellPhone
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        SQLDataContext dataWeb = new SQLDataContext("Server=LAPTOP-NPBITMJK\\PHAMNGUYEN;Database=webSellPhone;User Id=sa;Password=123;");
        public static tb_sp sp = new tb_sp();
        public static List<tb_sp> ListSP = new List<tb_sp>();

        protected void Page_Load(object sender, EventArgs e)
        {
            load();
            sp_chung();
        }
        
        void load()
        {
            try
            {
                long idselect = Convert.ToInt64(Request.QueryString["IdPhone"]);
                var dataFrom = from q in dataWeb.tb_sps where q.id_sanpham == idselect select q;
                if (dataFrom != null && dataFrom.Count() > 0)
                {
                    sp = dataFrom.First();
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
                if (sp != null)
                {
                    var spcungid = from q in dataWeb.tb_sps
                                   where q.id_danh_muc == sp.id_danh_muc && q.id_sanpham != sp.id_sanpham
                                   select q;

                    if (spcungid != null && spcungid.Count() > 0)
                    {
                        ListSP = spcungid.ToList();
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