using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSellPhone
{
    public partial class ChiTietDatHangPhuKien : System.Web.UI.Page
    {
        SQLDataContext SQL = new SQLDataContext("Server=LAPTOP-NPBITMJK\\PHAMNGUYEN;Database=webSellPhone;User Id=sa;Password=123;");
        public static tbPhuKien sp_dathang = new tbPhuKien();

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
            long idselect = Convert.ToInt64(Request.QueryString["SPPhuKien"]);

            var dataFrom = from q in SQL.tbPhuKiens where q.id_phukien == idselect select q;

            if (dataFrom != null && dataFrom.Count() > 0)
            {
                sp_dathang = dataFrom.First();
            }

            else
            {
                // Nếu không tìm thấy sản phẩm, chuyển hướng người dùng đến trang 404
                Response.Redirect("404.html");
            }

        }

        protected void btnDat_Click(object sender, EventArgs e)
        {
            try
            {
                tb_don_dat_hang info = new tb_don_dat_hang();

                info.ten_nguoi_mua = txtName.Text;
                info.so_dien_thoai = int.Parse(txtSDT.Text);
                info.Dia_chi = txtDiaChi.Text;
                info.so_luong = int.Parse(txtSoLuong.Text);
                info.id_phu_kien = sp_dathang.id_phukien;

                SQL.tb_don_dat_hangs.InsertOnSubmit(info);
                SQL.SubmitChanges();

                // Thông báo thành công hoặc chuyển hướng người dùng đến trang cần thiết
                Response.Write("<script>alert('Đã đặt hàng thành công!');</script>");
                // Hoặc:
                // Response.Redirect("TrangChu.aspx");
            }
            catch (Exception ex)
            {
                // Xử lý lỗi bằng cách hiển thị thông báo lỗi và ghi log
                Response.Write($"<script>alert('Đã xảy ra lỗi: {ex.Message}');</script>");
                // Ghi log:
                // Log.Write("Lỗi khi thêm đơn đặt hàng: " + ex.Message);
            }
        }
    }
}