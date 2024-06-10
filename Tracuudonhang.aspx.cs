using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webSellPhone
{
    public partial class Tracuudonhang : System.Web.UI.Page
    {
        SQLDataContext SQL = new SQLDataContext("Server=LAPTOP-NPBITMJK\\PHAMNGUYEN;Database=webSellPhone;User Id=sa;Password=123;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrders();
            }
        }
        private void BindOrders()
        {
            try
            {
                var orders = (from q in SQL.tb_don_dat_hangs
                              select new
                              {
                                  SoDienThoai = q.so_dien_thoai,
                                  TenNguoiMua = q.ten_nguoi_mua,
                                  DiaChi = q.Dia_chi,
                                  SoLuong = q.so_luong,
                                  TrangThai = q.hienThi == 0 ? "Đang vận chuyển" : "Chưa giao"
                                  // Adjust the TrangThai display logic based on your actual status codes
                              }).ToList();

          
            }
            catch (Exception ex)
            {
                // Handle exception
            }
        }
        protected void btnTraCuu_Click(object sender, EventArgs e)
        {
            try
            {
                // Convert the input from TextBox to an integer
                if (int.TryParse(txtSDT.Text, out int soDienThoai))
                {
                    var order = (from q in SQL.tb_don_dat_hangs
                                 where q.so_dien_thoai == soDienThoai
                                 select q).FirstOrDefault();

                    if (order != null)
                    {
                        if (order.hienThi == 0)  // Assuming 0 indicates 'in transit'
                        {
                            lblResult.Text = "Đơn hàng của bạn đang vận chuyển.";
                        }
                        else
                        {
                            lblResult.Text = "Đơn hàng của bạn đang chờ vận chuyển";
                        }
                    }
                    else
                    {
                        lblResult.Text = "Không tìm thấy đơn hàng với số điện thoại này.";
                    }
                }
                else
                {
                    lblResult.Text = "Số điện thoại không hợp lệ. Vui lòng nhập lại.";
                }
            }
            catch (Exception ex)
            {
                lblResult.Text = "Đã xảy ra lỗi: " + ex.Message;
            }
        }
    }
}
