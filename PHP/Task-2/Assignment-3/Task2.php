<?php

// Write Function Content Here
function get_arguments(...$args){
    $all = "";
    foreach($args as $arg){
        $all = $all . " ". $arg;
    }
    return $all;
}

// Needed Output
echo get_arguments("Hello", "Elzero", "Web", "School"); // Hello Elzero Web School
echo get_arguments("I", "Love", "PHP"); // I Love PHP