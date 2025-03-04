<?php

$monthDuration = 60 * 60 * 24 * 30;
$dayDuration = 60 * 60 * 24;
$expireDate = time() + $monthDuration + $dayDuration * 5;
setCookie('layout', 'boxed', $expireDate);
setCookie('font', 'swat', $expireDate);
setCookie('color', 'blue', $expireDate);

echo "<pre>";
var_dump($_COOKIE);
echo "<br>";
echo "Your Color Is " . $_COOKIE['color'] . " And Your Font Is " . $_COOKIE['font'];


// Array
// (
//   [site] => Array
//     (
//       [color] => blue
//       [font] => Swat
//       [layout] => boxed
//     )
// )
// "Your Color Is blue And Your Font Is Swat"