using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSellPhone
{
    public partial class ShowSanPham : System.Web.UI.Page
    {
        SQLDataContext dataWeb = new SQLDataContext("Server=LAPTOP-NPBITMJK\\PHAMNGUYEN;Database=webSellPhone;User Id=sa;Password=123;");
        public static List<tb_danh_muc> listDanhMuc = new List<tb_danh_muc>();
        public static List<tb_sp> listSP = new List<tb_sp>();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                load();
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ bằng cách hiển thị thông báo lỗi và chuyển hướng người dùng đến trang 404
                Response.Write($"<script>alert('Đã xảy ra lỗi: {ex.Message}');</script>");
                Response.Redirect("404.html");
            }
        }
        void load()
        {
            try
            {
                
                if (!string.IsNullOrEmpty(Request.QueryString["IdDanhMuc"]))
                {
                    long idDanhMuc = Convert.ToInt64(Request.QueryString["IdDanhMuc"]);

                    
                    var data = from q in dataWeb.tb_danh_mucs where q.hienThi == 1 orderby q.id_danh_muc ascending select q;

                  
                    var products = from q in dataWeb.tb_sps where q.id_danh_muc == idDanhMuc select q;

                    // Assign loaded data to the lists
                    if (products != null && products.Any())
                    {
                        listSP = products.ToList();
                    }
                    else
                    {
                        Response.Write($"<script>alert('Sản phẩm đã hết');</script>");
                    }
                   

                    if (data.Any())
                    {
                        listDanhMuc = data.ToList();
                    }
                    else
                    {
                        Response.Write($"<script>alert('Sản phẩm đã hết');</script>");
                    }

                }
                else
                {
                    
                }
            }
            catch (Exception ex)
            {
                // Handle exception
                Response.Write($"<script>alert('Đã xảy ra lỗi: {ex.Message}');</script>");
                Response.Redirect("404.html");
            }
        }
    }
}