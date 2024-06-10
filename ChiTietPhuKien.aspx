<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="ChiTietPhuKien.aspx.cs" Inherits="webSellPhone.ChiTietPhuKien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <style>
        nav ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
    display: flex;
    justify-content: center;
}

nav ul li {
    margin: 0 15px;
}

nav ul li a {
    color: white;
    text-decoration: none;
    padding: 5px 10px;
    display: inline-block;
}

nav ul li a:hover {
    background-color: #575757;
    border-radius: 4px;
}
main {
    padding: 20px;
}

.breadcrumb {
    font-size: 14px;
    margin-bottom: 20px;
}

.breadcrumb a {
    color: #007bff;
    text-decoration: none;
}

.breadcrumb a:hover {
    text-decoration: underline;
}

.product-container {
    display: flex;
    max-width: 1200px;
    margin: 0 auto;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
}

.product-image img {
    width: 100%;
    max-width: 600px;
}

.product-details {
    padding: 20px;
    width: 100%;
}

h1, h2, h3, h4, h5, h6 {
    font-weight: bold;
    color:black;
}

.product-title {
    font-size: 24px;
    margin-bottom: 10px;
    color: #333;
}

.product-rating {
    font-size: 14px;
    margin-bottom: 10px;
}

.product-rating a {
    color: #007bff;
    text-decoration: none;
}

.product-rating a:hover {
    text-decoration: underline;
}

.product-price {
    font-size: 20px;
    margin-bottom: 20px;
}

.current-price {
    color: #e60000;
    font-weight: bold;
}

.original-price {
    color: #666;
    text-decoration: line-through;
    margin-left: 10px;
}

.product-options {
    margin-bottom: 20px;
}

.storage-options button, .color-options button {
    padding: 10px 20px;
    margin-right: 10px;
    border: 1px solid #ddd;
    background-color: #fff;
    cursor: pointer;
}

.color-options .color {
    width: 40px;
    height: 40px;
    border-radius: 50%;
}

.color.red {
    background-color: red;
}

.color.midnight {
    background-color: #333;
}

.additional-services label {
    display: block;
    margin-bottom: 10px;
}

.action-buttons {
    margin-bottom: 20px;
}
 /*Phần style nút mua hàng và thêm giõ han*/
.buy-now, .add-to-cart {
    padding: 15px 30px;
    font-size: 16px;
    cursor: pointer;
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.buy-now {
    background-color: #ff5722;
    color: white;
    margin-right: 10px;
}

.buy-now:hover {
    background-color: #e64a19;
}

.add-to-cart {
    background-color: #ffc107;
    color: white;
}

.add-to-cart:hover {
    background-color: #ffb300;
}

.installment-options button {
    padding: 15px 30px;
    font-size: 16px;
    cursor: pointer;
    border: none;
    border-radius: 5px;
    margin-right: 10px;
    background-color: #007bff;
    color: white;
}

.installment-options button:hover {
    background-color: #0056b3;
}

.warranty, .promotion {
    margin-top: 20px;
    background-color: #fff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

.warranty h2, .promotion h2 {
    font-size: 18px;
    margin-bottom: 10px;
}

.warranty ul, .promotion ul {
    list-style-type: none;
    padding: 0;
}

.warranty ul li, .promotion ul li {
    margin-bottom: 10px;
    font-size: 14px;
}

.buy-now-button {
   
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    text-align: center;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
}
.buy-now-button:hover {
    background-color: #0056b3;
}
.li{
    color:black;
}

    </style>
     <script>
     document.addEventListener('DOMContentLoaded', function() {
         const productsContainer = document.getElementById('products');
        

         let isDown = false;
         let startX;
         let scrollLeft;

         productsContainer.addEventListener('mousedown', function(e) {
             isDown = true;
             productsContainer.classList.add('active');
             startX = e.pageX - productsContainer.offsetLeft;
             scrollLeft = productsContainer.scrollLeft;
         });

         productsContainer.addEventListener('mouseleave', function() {
             isDown = false;
             productsContainer.classList.remove('active');
         });

         productsContainer.addEventListener('mouseup', function() {
             isDown = false;
             productsContainer.classList.remove('active');
         });

         productsContainer.addEventListener('mousemove', function(e) {
             if (!isDown) return;
             e.preventDefault();
             const x = e.pageX - productsContainer.offsetLeft;
             const walk = (x - startX) * 3; //scroll-fast
             productsContainer.scrollLeft = scrollLeft - walk;
         });
     });
     </script>
     <main>
      <%--  <div class="breadcrumb">
            <a href="index.html">Trang chủ</a> &gt;
            <a href="products.html">Điện thoại</a> &gt;
            <a href="product.html">Apple iPhone 14</a>
        </div>--%>
        <div class="product-container">
            <div class="product-image">
                <img src="<%="./img/anh_sanpham/"+phukien.anh_pk %>" alt="<%=phukien.ten_phu_kien %>">
            </div>
            <div class="product-details">
                <h1 class="product-title"><%=phukien.ten_phu_kien %></h1>
                <div class="product-rating">
                    <span>⭐️⭐️⭐️⭐️☆</span>
                    <a href="#reviews">2 Đánh giá</a> | <a href="#reviews">5 Bình luận</a>
                </div>
                <div class="product-price">
                    <span class="current-price"><%= string.Format("{0:N0}đ", phukien.gia_km) %></span>
                    <span class="original-price"><%= string.Format("{0:N0}đ", phukien.gia_sp)%></span>
                </div>
                <div class="product-options">
                   
                   <%-- <div class="color-options">
                        <button class="color red">Red</button>
                        <button class="color midnight">Midnight</button>
                    </div>--%>
                </div>
                <div class="additional-services">
                   
                </div>
                <div class="action-buttons">
                    <a class="buy-now-button" href="<%= "ChiTietDatHangPhuKien.aspx?SPPhuKien=" + phukien.id_phukien.ToString() %>">Mua Ngay</a>

                    <a class="buy-now-button" id ="add-to-cart" href="<%= "ChiTietDatHangPhuKien.aspx?SPPhuKien=" + phukien.id_phukien.ToString() %>"><i class="fa-solid fa-cart-shopping"></i></a>
                </div>
                <div class="installment-options">
                    <button>TRẢ GÓP CÔNG TY TÀI CHÍNH</button>
                    <button>TRẢ GÓP QUA THẺ (Visa, Master, JCB)</button>
                </div>
            </div>
        </div>
         <br />
         <div class="container">
                <div class="warranty">
                    <h2><i class="fa-solid fa-gear"></i>Thông số kỹ thuật</h2>
                    <ul>
                        <%--<li><i class="fa-solid fa-mobile-button"></i>-Kích Thước:<%=sp.kich_thuoc %></li>
                        <li><i class="fa-solid fa-ticket"></i>-PIN:<%= %></li>
                        <li><i class="fa-solid fa-circle-info"></i>-Mô Tả:<%= %></li
                        <li><i class="fa-solid fa-warehouse"></i>-Còn:<%=%> chiếc</li>
                        <li><i class="fa-solid fa-camera"></i>-Camera:<%=sp.camera%></li>--%>
                      
                    </ul>
                </div>
             <div class="warranty">
                <h2><i class="fa-solid fa-ticket"></i>BẢO HÀNH - LỖI ĐỔI NGAY LẬP TỨC</h2>
                <ul>
                    
                    <li>Bảo hành mở rộng 24 tháng chỉ từ 149.000₫</li>
                    <li>Thu mua máy cũ. Nhận ngay voucher giảm 2% tối đa 300.000₫</li>
                    <li>Cài đặt app, game bản quyền chỉ từ 100.000₫</li>
                </ul>
            </div>
                <div class="promotion">
                    <h2>ƯU ĐÃI</h2>
                    <p>Giảm 0.5%</p>
                </div>
       </div>
           
    </main>
   <div class="container" id="product-container"> <!-- Thêm id cho container sản phẩm -->
    <h1 class="product-title">Sản phẩm khác</h1>
   <%-- <div class="tabs">
        <button class="tab-button">iPhone 15 Series</button>
        <button class="tab-button">iPhone 14 Series</button>
        <button class="tab-button">iPhone 13 Series</button>
        <button class="tab-button">iPhone 11 Series</button>
        <button class="tab-button">Xem tất cả</button>
    </div>--%>
    <div class="products" id="products">
        <% for (int i = 0; i < ListPK.Count; i++) { %>
            <div class="product" id="product<%= i %>"> <!-- Thêm id cho từng sản phẩm -->
             <div class="image-container">
                <a class="chitiet" href="<%= "ChiTietPhuKien.aspx?idpk=" + ListPK[i].id_phukien.ToString() %>">
            <img src="<%="./img/anh_sanpham/"+ ListPK[i].anh_pk %>" alt="<%= ListPK[i].ten_phu_kien %>">
             <div class="overlay"></div>
                </a>
                    </div>

              <h2><a  class="chitiet" href="<%= "ChiTietPhuKien.aspx?idpk=" + ListPK[i].id_phukien.ToString() %>"><%= ListPK[i].ten_phu_kien %></a></h2>

                <p class="price"><%= string.Format("{0:N0}đ", ListPK[i].gia_km) %><span class="old-price"> <%= string.Format("{0:N0}đ", ListPK[i].gia_sp) %></span></p>
               <%-- <p class="discount">Giảm 20% - Trả góp 0%</p>
                <div class="promo">RẺ HƠN CÁC LOẠI RẺ</div>
                <p class="promo-details">Tặng thêm 2 triệu khi lên đời</p>--%>
            </div>
        <% } %>
    </div>
</div>
</asp:Content>
