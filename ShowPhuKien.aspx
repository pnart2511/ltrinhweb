<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="ShowPhuKien.aspx.cs" Inherits="webSellPhone.ShowPhuKien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1> Thông tin về điện thoại </h1>
        <div class="tab-links">
             <ul>
                 <% for (int i = 0; i < listpk_DM.Count; i++) { %>
                    
                     <button class="tab-button">
                        <a href="<%= "ShowPhuKien.aspx?IdDanhMucPK=" + listpk_DM[i].id_danh_muc_phu_kien.ToString() %>" style="text-decoration: none;">
                            <%= listpk_DM[i].ten_danh_muc_phu_kien %>
                        </a>
                    </button>
                 <% } %>
            </ul>
            
        </div>
    <div class="container">
       <div class="product-grid">
            <% for (int i = 0; i < listSPK.Count; i++) { %>
                <div class="product-card">
                   
                    <%--<span class="badge installment">Trả góp 0%</span>
                    <span class="badge best-seller">BEST SELLER</span>--%>
                   <div class="image-container">
                    <a class="chitiet" href="<%= "ChiTietPhuKien.aspx?idpk=" + listSPK[i].id_phukien.ToString() %>">
                        <img src="<%= "./img/anh_sanpham/"+listSPK[i].anh_pk %>" alt="<%= listSPK[i].ten_phu_kien %>">
                        <div class="overlay"></div>
                    </a>
                </div>


                    <h2><a  class="chitiet" href="<%= "ChiTietPhuKien.aspx?idpk=" + listSPK[i].id_phukien.ToString() %>"><%= listSPK[i].ten_phu_kien %></a></h2>
                    <p class="new-price"><%= string.Format("{0:N0}đ", listSPK[i].gia_km) %><span class="old-price"> <%= string.Format("{0:N0}đ", listSPK[i].gia_sp) %></span></p>
                    <p class="price-details">Trả trước 0₫, 0% lãi suất</p>
                    <%--<button class="buy-now">Mua ngay</button>--%>
                </div>
            <% } %>
        </div>
    </div>
</asp:Content>
