<?php
$str = "Orezle";


$str[0] = strtolower($str[0]);
$str[4] = strtoupper($str[4]);
$str[5] = strtoupper($str[5]);
$str = strrev($str);

echo $str; // Elzero