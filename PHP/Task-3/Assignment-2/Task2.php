<?php
$codes = ["H", "C", "J"];
$means = ["HTML", "CSS", "JavaScript"];

$friends = array_combine($codes, $means);
echo "<pre>";
var_dump($friends);
// Output
// Array
// (
//   [h] => HTML
//   [c] => CSS
//   [j] => JavaScript
// )