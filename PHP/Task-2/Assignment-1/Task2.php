<?php

function solve($a, $b, $c){
    if($a <= $b && $a <= $c){
        echo "A Is Not Larger Than B Or C" . "<br>";
        return;
    }

    if($a > $b){
        echo "A Is Larger Than B" . "<br>";
    } 
    
    if ($a > $c){
        echo "A Is Larger Than C" . "<br>";
    } 
}

// Test Case 1
$a = 100;
$b = 200;
$c = 300;

solve($a, $b, $c);
// A Is Not Larger Than B Or C

// Test Case 2
$a = 200;
$b = 100;
$c = 300;

solve($a, $b, $c);
// A Is Larger Than B

// Test Case 3
$a = 200;
$b = 200;
$c = 100;

solve($a, $b, $c);
// A Is Larger Than c