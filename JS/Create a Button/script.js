const btn = document.getElementById("btn");

btn.addEventListener("click", function () {
    btn.innerHTML = parseInt(btn.innerHTML) + 1;
});