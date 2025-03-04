<?php

date_default_timezone_set('Africa/Cairo');
echo date_default_timezone_get() . "<br>";

$date = "2005-10-02";
$dateObject = new DateTime($date);
$dateObject->add(new DateInterval('PT15H15M15S'));
echo $dateObject->format('Y, F, l \'dS\' H:i:s') . "<br>";

// Output Needed
// "Africa/Cairo"
// "2005, October, Sunday '02nd' 15:15:15"