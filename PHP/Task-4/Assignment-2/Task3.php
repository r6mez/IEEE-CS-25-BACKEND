<?php

$date = "1990-10-01";
$epoch = strtotime($date);
$days = $epoch / (60 * 60 * 24);
$years = $days / 365;
echo "From Epoch Time Till $date Is Approximately $days Days <br>";
echo "From Epoch Time Till $date Is Approximately $years Years <br>";

// Output Needed
// "From Epoch Time Till 1990-10-01 Is Approximately 7577.9 Days"
// "From Epoch Time Till 1990-10-01 Is Approximately 20.8 Years"