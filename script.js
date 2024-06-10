const productsContainer = document.getElementById('products');

let isDown = false;
let startX;
let scrollLeft;

productsContainer.addEventListener('mousedown', (e) => {
    isDown = true;
    productsContainer.classList.add('active');
    startX = e.pageX - productsContainer.offsetLeft;
    scrollLeft = productsContainer.scrollLeft;
});

productsContainer.addEventListener('mouseleave', () => {
    isDown = false;
    productsContainer.classList.remove('active');
});

productsContainer.addEventListener('mouseup', () => {
    isDown = false;
    productsContainer.classList.remove('active');
});

productsContainer.addEventListener('mousemove', (e) => {
    if (!isDown) return;
    e.preventDefault();
    const x = e.pageX - productsContainer.offsetLeft;
    const walk = (x - startX) * 3; //scroll-fast
    productsContainer.scrollLeft = scrollLeft - walk;
});
