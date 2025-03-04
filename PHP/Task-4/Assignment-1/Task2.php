<?php
$fileSizeInBytes = filesize("C:/Users/irame/Videos/video.mkv");
$fileSizeInMegabytes = $fileSizeInBytes / 1024 / 1024;
$fileSizeInKilobytes = $fileSizeInBytes / 1024;

echo "Size In Megabyte Is " . $fileSizeInMegabytes . "<br>";
echo "Size In Kilobyte Is " . $fileSizeInKilobytes . "<br>";

// Output
// "Size In Megabyte Is 32"
// "Size In Kilobyte Is 33261"