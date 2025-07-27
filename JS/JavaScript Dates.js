'use strict';

process.stdin.resume();
process.stdin.setEncoding('utf-8');

let inputString = '';
let currentLine = 0;

process.stdin.on('data', inputStdin => {
    inputString += inputStdin;
});

process.stdin.on('end', _ => {
    inputString = inputString.trim().split('\n').map(string => {
        return string.trim();
    });
    
    main();    
});

function readLine() {
    return inputString[currentLine++];
}

// The days of the week are: "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
function getDayName(dateString) {
    let dayName;
    // Write your code here
    let dateObj = new Date(dateString);
    if(dateObj.getDay() == 0) dayName = "Sunday";
    if(dateObj.getDay() == 1) dayName = "Monday";
    if(dateObj.getDay() == 2) dayName = "Tuesday";
    if(dateObj.getDay() == 3) dayName = "Wednesday";
    if(dateObj.getDay() == 4) dayName = "Thursday";
    if(dateObj.getDay() == 5) dayName = "Friday";
    if(dateObj.getDay() == 6) dayName = "Saturday";
    return dayName;
}


function main() {
    const d = +(readLine());
    
    for (let i = 0; i < d; i++) {
        const date = readLine();
        
        console.log(getDayName(date));
    }
}