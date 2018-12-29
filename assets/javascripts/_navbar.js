document.addEventListener("DOMContentLoaded", function() {
  const closeBtn = document.getElementById("navbar-close");
  const openBtn = document.getElementById("navbar-open");
  const menu = document.getElementById("navbar-menu");

  closeBtn.addEventListener("click", function() {
    closeBtn.classList.add("hidden");
    openBtn.classList.remove("hidden");
    menu.classList.add("hidden");
  });

  openBtn.addEventListener("click", function() {
    closeBtn.classList.remove("hidden");
    openBtn.classList.add("hidden");
    menu.classList.remove("hidden");
  });
});
