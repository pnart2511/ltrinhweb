<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="ChiTietDatHang.aspx.cs" Inherits="webSellPhone.ChiTietDatHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .container {
    width: 50%;
    margin: auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.container h1 {
    text-align: center;
}

.container input[type="text"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.container input[type="submit"] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
.container img {
    display: block;
    margin: 0 auto;
    max-width: 100%; /* Đảm bảo rằng hình ảnh không vượt quá chiều rộng của container */
    height: auto; /* Đảm bảo tỉ lệ hình ảnh được giữ khi thay đổi kích thước */
}
.container input[type="submit"]:hover {
    background-color: #45a049;
}
    </style>
     <h1>Trang đặt hàng</h1>
   
   <div class="container" >
       <h1>Bạn đang mua <%=sp_dathang.ten_sanPham %></h1>
         <img src="<%="./img/anh_sanpham/"+sp_dathang.anh_sp %>" alt="Ảnh sản phẩm">
       Nhập thông tin để hoàn tất đơn hàng.<br />
       Tên của bạn: <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
       <br />
       Số điện thoại:<asp:TextBox ID="txtSDT" runat="server"></asp:TextBox><br />
       <br />
       Địa chỉ:<asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox><br />
       <br />
       Số lượng:<asp:TextBox ID="txtSoLuong" runat="server"></asp:TextBox><br />
       <asp:Button ID="btnDat" runat="server" Text="Đặt Hàng" OnClick="btnDat_Click"></asp:Button><br />

   </div>
   
</asp:Content>
