const res = document.getElementById('res');

document.getElementById('btn0').addEventListener('click', () => res.innerHTML += '0');
document.getElementById('btn1').addEventListener('click', () => res.innerHTML += '1');
document.getElementById('btnSum').addEventListener('click', () => res.innerHTML += '+');
document.getElementById('btnSub').addEventListener('click', () => res.innerHTML += '-');
document.getElementById('btnMul').addEventListener('click', () => res.innerHTML += '*');
document.getElementById('btnDiv').addEventListener('click', () => res.innerHTML += '/');

document.getElementById('btnClr').addEventListener('click', () => res.innerHTML = '');

document.getElementById('btnEql').addEventListener('click', () => {
    const expr = res.innerHTML;
    const operatorMatch = expr.match(/[+\-*/]/);
    if (!operatorMatch) return;

    const operator = operatorMatch[0];
    const [a, b] = expr.split(operator);

    const num1 = parseInt(a, 2);
    const num2 = parseInt(b, 2);
    let result = 0;

    switch (operator) {
        case '+': result = num1 + num2; break;
        case '-': result = num1 - num2; break;
        case '*': result = num1 * num2; break;
        case '/': result = Math.floor(num1 / num2); break;
    }

    res.innerHTML = result.toString(2);
});
