// main script
(function () {
  "use strict";

  // Dropdown Menu Toggler For Mobile
  // ----------------------------------------
  const dropdownMenuToggler = document.querySelectorAll(
    ".nav-dropdown > .nav-link",
  );

  dropdownMenuToggler.forEach((toggler) => {
    toggler?.addEventListener("click", (e) => {
      e.target.closest(".nav-item").classList.toggle("active");
    });
  });

// Skill Slider
// ----------------------------------------
new Swiper(".skills-slider", {
  spaceBetween: 20,
  loop: true,
  slidesPerView: 4, // Default for mobile and small screens
  pagination: {
    el: ".skills-slider-pagination",
    type: "bullets",
    clickable: true,
  },
  breakpoints: {
    992: {
      slidesPerView: 7, // Larger screens show 5 slides
    },
  },
});
})();
