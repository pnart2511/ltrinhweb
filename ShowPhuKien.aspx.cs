using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSellPhone
{
    public partial class ShowPhuKien : System.Web.UI.Page
    {
        SQLDataContext dataContext = new SQLDataContext("Server=LAPTOP-NPBITMJK\\PHAMNGUYEN;Database=webSellPhone;User Id=sa;Password=123;");
        public static List<tb_danh_muc_phu_kien> listpk_DM = new List<tb_danh_muc_phu_kien>();
        public static List<tbPhuKien> listSPK = new List<tbPhuKien>();

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
            var data = from q in dataContext.tb_danh_muc_phu_kiens where q.hienThi == 0 orderby q.id_danh_muc_phu_kien ascending select q;
            long idDanhMuc = Convert.ToInt64(Request.QueryString["IdDanhMucPK"]);
            var products = from q in dataContext.tbPhuKiens where q.id_danh_muc_phu_kien == idDanhMuc select q;
            if (products != null && products.Count() > 0)
            {
                listSPK = products.ToList();
            }

            if (data.Any())
            {
                listpk_DM = data.ToList();
            }
        }
    }
}