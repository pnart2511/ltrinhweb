using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSellPhone
{
    public partial class Home : System.Web.UI.Page
    {
        SQLDataContext dataContext = new SQLDataContext("Server=LAPTOP-NPBITMJK\\PHAMNGUYEN;Database=webSellPhone;User Id=sa;Password=123;");
        public static List<tb_danh_muc> listDanhMuc = new List<tb_danh_muc>();
        public static List<tb_sp> listSP = new List<tb_sp>();
        public static List<tb_banner> Listbanner = new List<tb_banner>();
        public static List<tb_danh_muc_phu_kien> listDMphuKien = new List<tb_danh_muc_phu_kien>();
        public static List<tbPhuKien> listSPphuKien = new List<tbPhuKien>();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        void LoadData()
        {
            try
            {
                var data = from q in dataContext.tb_danh_mucs where q.hienThi == 1 orderby q.id_danh_muc ascending select q;
                var sp = from q in dataContext.tb_sps where q.sp_hot == 0 orderby q.id_sanpham ascending select q;
                var banner = from q in dataContext.tb_banners where q.hienthi == 0 orderby q.id_banner ascending select q;
                var danhmucphukien = from q in dataContext.tb_danh_muc_phu_kiens where q.hienThi == 0 orderby q.id_danh_muc_phu_kien ascending select q;
                var sp_phukien = from q in dataContext.tbPhuKiens where q.hienThi == 0 orderby q.id_phukien ascending select q;
                if (data != null && data.Count() > 0)
                {
                    listDanhMuc = data.ToList();
                }

                if (sp != null && sp.Count() > 0)
                {
                    listSP = sp.ToList();
                }
                if (banner != null && banner.Count() > 0)
                {
                    Listbanner = banner.ToList();
                }
                if (danhmucphukien != null && danhmucphukien.Count() > 0)
                {
                    listDMphuKien = danhmucphukien.ToList();
                }

                    if (sp_phukien != null && sp_phukien.Count() > 0)
                    {
                        listSPphuKien = sp_phukien.ToList();
                    }
                    foreach (var product in listSP)
                    {
                        // Tìm danh mục tương ứng của sản phẩm
                        var danhMuc = listDanhMuc.FirstOrDefault(dm => dm.id_danh_muc == product.id_danh_muc);

                        // Nếu tìm thấy danh mục, hiển thị thông tin sản phẩm kèm theo tên danh mục
                        if (danhMuc != null)
                        {
                            listSP = sp.ToList();
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