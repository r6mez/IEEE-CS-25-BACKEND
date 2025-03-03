<?php
$str = 'aAa';
$num = 3;
$char = "_";

// Write Your Code Here
$str = strtolower($str);
$str .= $char;
$str = str_repeat($str, $num);
echo $str; // aaa_aaa_aaa_