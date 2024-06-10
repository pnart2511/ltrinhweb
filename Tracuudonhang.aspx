<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="Tracuudonhang.aspx.cs" Inherits="webSellPhone.Tracuudonhang" %>
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

        .container input[type="text"], .container input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .container input[type="submit"]:hover {
            background-color: #45a049;
        }
        .gridview-container {
    text-align: center;
}
    </style>

    <h1>Tra cứu đơn hàng</h1>
    <div class="container">
        Nhập số điện thoại để kiểm tra trạng thái đơn hàng.<br /><br />
        Số điện thoại: <asp:TextBox ID="txtSDT" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="btnTraCuu" runat="server" Text="Tra Cứu" OnClick="btnTraCuu_Click"></asp:Button><br /><br />
        <asp:Label ID="lblResult" runat="server" Text="" ForeColor="Red"></asp:Label>
  
     <%-- <h1>Danh sách đơn hàng</h1>
    <div class="gridview-container">
        <asp:GridView ID="gridOrders" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="SoDienThoai" HeaderText="Số Điện Thoại" />
                <asp:BoundField DataField="TenNguoiMua" HeaderText="Tên Người Mua" />
                <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" />
                <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" />
                <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" />
            </Columns>
        </asp:GridView>
    </div>--%>
          </div>
</asp:Content>
