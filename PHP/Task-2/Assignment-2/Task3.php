<?php

$added = 3;
$printed = 1;

$num = 2;
while ($num < 520) {
  // Your Code Here
  echo $printed . "<br>";
  $printed += $added;
  $added *= 2;
  $num++;
  if($num == 10) break;
}

// Needed Output
// 1
// 4
// 10
// 22
// 46
// 94
// 190
// 382