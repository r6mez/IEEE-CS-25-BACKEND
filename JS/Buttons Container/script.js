  const btn5 = document.getElementById("btn5");

btn5.addEventListener("click", function () {
    const btn1 = document.getElementById("btn1");
    const btn2 = document.getElementById("btn2");
    const btn3 = document.getElementById("btn3");
    const btn6 = document.getElementById("btn6");
    const btn9 = document.getElementById("btn9");
    const btn8 = document.getElementById("btn8");
    const btn7 = document.getElementById("btn7");
    const btn4 = document.getElementById("btn4");

    let temp = btn1.innerHTML;

    btn1.innerHTML = btn4.innerHTML;
    btn4.innerHTML = btn7.innerHTML;
    btn7.innerHTML = btn8.innerHTML;
    btn8.innerHTML = btn9.innerHTML;
    btn9.innerHTML = btn6.innerHTML;
    btn6.innerHTML = btn3.innerHTML;
    btn3.innerHTML = btn2.innerHTML;
    btn2.innerHTML = temp;
});
