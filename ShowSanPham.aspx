<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="ShowSanPham.aspx.cs" Inherits="webSellPhone.ShowSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1> Thông tin về điện thoại </h1>
        <div class="tab-links">
             <ul>
                 <% for (int i = 0; i < listDanhMuc.Count; i++) { %>
                    
                     <button class="tab-button">
                        <a href="<%= "ShowSanPham.aspx?IdDanhMuc=" + listDanhMuc[i].id_danh_muc.ToString() %>" style="text-decoration: none;">
                            <%= listDanhMuc[i].ten_danh_muc %>
                        </a>
                    </button>
                 <% } %>
            </ul>
            
        </div>
    <div class="container">
       <div class="product-grid">
            <% for (int i = 0; i < listSP.Count; i++) { %>
                <div class="product-card">
                   
                    <%--<span class="badge installment">Trả góp 0%</span>
                    <span class="badge best-seller">BEST SELLER</span>--%>
                   <div class="image-container">
                    <a class="chitiet" href="<%= "ChiTietSanPham.aspx?IdPhone=" + listSP[i].id_sanpham.ToString() %>">
                        <img src="<%= "./img/anh_sanpham/"+listSP[i].anh_sp %>" alt="<%= listSP[i].ten_sanPham %>">
                        <div class="overlay"></div>
                    </a>
                </div>


                    <h2><a  class="chitiet" href="<%= "ChiTietSanPham.aspx?IdPhone=" + listSP[i].id_sanpham.ToString() %>"><%= listSP[i].ten_sanPham %></a></h2>
                    <p class="new-price"><%= string.Format("{0:N0}đ", listSP[i].giaKM) %><span class="old-price"> <%= string.Format("{0:N0}đ", listSP[i].giaSP) %></span></p>
                    <p class="price-details">Trả trước 0₫, 0% lãi suất</p>
                    <%--<button class="buy-now">Mua ngay</button>--%>
                </div>
            <% } %>
        </div>
    </div>
</asp:Content>
