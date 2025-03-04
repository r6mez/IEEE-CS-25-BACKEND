<?php

echo disk_total_space('C:') / 1024 / 1024 / 1024 . " TeraBytes <br>";
echo disk_total_space('D:') / 1024 / 1024 / 1024 . " TeraBytes <br>";

// Output Examples
// "1.37 Terabyte"
// "0.46 Terabyte"