<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="webSellPhone.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <style>
      .image-container {
    position: relative;
    display: inline-block; /* Để phần tử div giữ nguyên kích thước của ảnh */
}

.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0); /* Màu sắc của overlay, có thể thay đổi */
}
 .tab-button a {
            text-decoration: none; /* Xóa gạch chân mặc định của thẻ <a> */
        }
.overlay:hover {
    background-color: rgba(0, 0, 0, 0.5); /* Màu sắc của overlay khi rê chuột vào */
}
.container img {
    max-width: 100%; /* Hình ảnh tự động co dãn để vừa với chiều rộng của container */
    height: auto; /* Đảm bảo tỷ lệ khung hình bảo toàn */
}
  </style>


<div class="container">
     
        <div class="container-DM">
    <div class="sidebar">
        <ul class="vertical-menu">
            <% for (int i = 0; i < listDanhMuc.Count; i++) { %>
                <li><a  href="<%= "ShowSanPham.aspx?IdDanhMuc=" + listDanhMuc[i].id_danh_muc.ToString() %>" style="text-decoration: none;"><%=listDanhMuc[i].ten_danh_muc %></a></li>
            <% } %>
        </ul>
    </div>
   
  <div class="content">
        <div class="slideshow-container">
            <% for (int i = 0; i < Listbanner.Count; i++) { %>
                <div class="slides">
                    <img class="slide-image" src="<%= "./img/banner/" + Listbanner[i].ten_banner %>" alt="Banner <%= i + 1 %>">
                </div>
            <% } %>

            <a class="prev" onclick="changeSlide(-1)">&#10094;</a>
            <a class="next" onclick="changeSlide(1)">&#10095;</a>
        </div>

        <div class="dots-container">
            <% for (int i = 0; i < Listbanner.Count; i++) { %>
                <span class="dot" onclick="currentSlide(<%= i + 1 %>)"></span>
            <% } %>
        </div>
    </div>



<script>
    let slideIndex = 1;
    showSlides(slideIndex);

    function changeSlide(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        let i;
        let slides = document.getElementsByClassName("slides");
        let dots = document.getElementsByClassName("dot");
        if (n > slides.length) { slideIndex = 1 }
        if (n < 1) { slideIndex = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }
</script>
</div>


</div>
  <%--  <div class="container">
      <img src="https://2tmobile.com/wp-content/uploads/2024/02/banner-iphone-15-q1-2tmobile-1024x405.png">
   </div>--%>
   
       <br />
      
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
<div class="container" id="product-container"> <!-- Thêm id cho container sản phẩm -->
    <h1 class="product-title">Sản Phẩm Hot</h1>
   <%-- <div class="tabs">
        <button class="tab-button">iPhone 15 Series</button>
        <button class="tab-button">iPhone 14 Series</button>
        <button class="tab-button">iPhone 13 Series</button>
        <button class="tab-button">iPhone 11 Series</button>
        <button class="tab-button">Xem tất cả</button>
    </div>--%>
    <div class="products" id="products">
        <% for (int i = 0; i < listSP.Count; i++) { %>
            <div class="product" id="product<%= i %>"> <!-- Thêm id cho từng sản phẩm -->
             <div class="image-container">
                <a class="chitiet" href="<%= "ChiTietSanPham.aspx?IdPhone=" + listSP[i].id_sanpham.ToString() %>">
            <img src="<%="./img/anh_sanpham/"+ listSP[i].anh_sp %>" alt="<%= listSP[i].ten_sanPham %>">
             <div class="overlay"></div>
                </a>
                    </div>

              <h2><a  class="chitiet" style="color:black" href="<%= "ChiTietSanPham.aspx?IdPhone=" + listSP[i].id_sanpham.ToString() %>"><%= listSP[i].ten_sanPham %></a></h2>

                <p class="price"><%= string.Format("{0:N0}đ", listSP[i].giaKM) %><span class="old-price"> <%= string.Format("{0:N0}đ", listSP[i].giaSP) %></span></p>
                <p class="discount">Giảm 20% - Trả góp 0%</p>
                <div class="promo">RẺ HƠN CÁC LOẠI RẺ</div>
                <p class="promo-details">Tặng thêm 2 triệu khi lên đời</p>
            </div>
        <% } %>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // JavaScript để thêm/xóa gạch chân khi click vào nút
    document.querySelector('.tab-button').addEventListener('click', function () {
        var link = this.querySelector('a');
        link.classList.toggle('underline'); // Thêm hoặc xóa lớp 'underline'
    });
</script>
<div class="container">
        <h1 class="product-title">Tất cả sản phẩm</h1>
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
     
       <div class="product-grid">
            <% for (int i = 0; i < listSP.Count; i++) { %>
                <div class="product-card">
                   
                    <%--<span class="badge installment">Trả góp 0%</span>
                    <span class="badge best-seller">BEST SELLER</span>--%>
                   <div class="image-container">
                    <a class="chitiet" style="color:black" href="<%= "ChiTietSanPham.aspx?IdPhone=" + listSP[i].id_sanpham.ToString() %>">
                        <img src="<%= "./img/anh_sanpham/"+listSP[i].anh_sp %>" alt="<%= listSP[i].ten_sanPham %>">
                        <div class="overlay"></div>
                    </a>
                </div>


                     <h2><a  class="chitiet" style="color:black" href="<%= "ChiTietSanPham.aspx?IdPhone=" + listSP[i].id_sanpham.ToString() %>"><%= listSP[i].ten_sanPham %></a></h2>
                    <p class="new-price"><%= string.Format("{0:N0}đ", listSP[i].giaKM) %><span class="old-price"> <%= string.Format("{0:N0}đ", listSP[i].giaSP) %></span></p>
                    <p class="price-details">Trả trước 0₫, 0% lãi suất</p>
                    <%--<button class="buy-now">Mua ngay</button>--%>
                </div>
            <% } %>
        </div>
    </div>
<div class="container">
      <img src="https://trivietit.net/uploads/images/banner_slide/1592990160_qungcaotrnthitbding.png">
   </div>
<div class="container">
        
          <h1 class="product-title">Phụ kiện điện thoại</h1>
  <div class="tab-links">
       <ul>
           <% for (int i = 0; i < listDMphuKien.Count; i++) { %>
              
               <button class="tab-button">
                  <a href="<%= "ShowPhuKien.aspx?IdDanhMucPK=" + listDMphuKien[i].id_danh_muc_phu_kien.ToString() %>" style="text-decoration: none;">
                      <%= listDMphuKien[i].ten_danh_muc_phu_kien %>
                  </a>
              </button>
           <% } %>
      </ul>
      
  </div>
     
       <div class="product-grid">
            <% for (int i = 0; i < listSPphuKien.Count; i++) { %>
                <div class="product-card">
                       <div class="image-container">
                        <a class="chitiet" style="color:black" href="<%= "ChiTietPhuKien.aspx?IDPK=" + listSPphuKien[i].id_phukien.ToString() %>">
                            <img src="<%= "./img/anh_sanpham/"+listSPphuKien[i].anh_pk %>" alt="<%= listSPphuKien[i].ten_phu_kien %>">
                            <div class="overlay"></div>
                        </a>
                    </div>
                    <h2><a  class="chitiet" href="<%= "ChiTietPhuKien.aspx?IDPK=" + listSPphuKien[i].id_phukien.ToString() %>"><%= listSPphuKien[i].ten_phu_kien %></a></h2>
                    <p class="new-price"><%= string.Format("{0:N0}đ", listSPphuKien[i].gia_km) %><span class="old-price"> <%= string.Format("{0:N0}đ", listSPphuKien[i].gia_sp) %></span></p>
                    <p class="price-details">Trả trước 0₫, 0% lãi suất</p>
                    <%--<button class="buy-now">Mua ngay</button>--%>
                </div>
            <% } %>
        </div>
    </div>
             
</asp:Content>
