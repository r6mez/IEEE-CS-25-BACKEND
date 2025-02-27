<?php
// Write Function Content Here
function sum_all(...$args){
    $sum = 0;
    foreach($args as $arg){
        if($arg == 5) continue;
        else if ($arg == 10) $sum += 20;
        else $sum += $arg;
    }
    return $sum;
}

// Needed Output
echo sum_all(10, 12, 5, 6, 6, 10); // 64
echo sum_all(5, 10, 5, 10); // 40