<?php 
$monthDuration = 60 * 60 * 24 * 30;
$dayDuration = 60 * 60 * 24;
$expireDate = time() + $monthDuration + $dayDuration * 5;
setCookie('layout', 'boxed', $expireDate);
setCookie('font', 'swat', $expireDate);
setCookie('color', 'blue', $expireDate);
