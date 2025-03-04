<?php

$baseDir = 'Programming';
$subDir = $baseDir . '/PHP';

if (!file_exists($baseDir)) {
    mkdir($baseDir, 0751, true);
}
if (!file_exists($subDir)) {
    mkdir($subDir, 0751, true);
}

if (file_exists($subDir)) {
    rmdir($subDir);
    echo "Directory $subDir Removed <br>";
}
if (file_exists($baseDir)) {
    rmdir($baseDir);
    echo "Directory $baseDir Removed <br>";
}

// Output
// "Directory Programming/PHP Removed"
// "Directory Programming Removed"