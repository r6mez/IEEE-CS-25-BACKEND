<?php
// Write Function Content Here
function greeting($name, $gender = ""){
    if($gender == "Male"){
        echo "Hello Mr " . $name;
    } else if ($gender == "Female"){
        echo "Hello Miss " . $name;
    } else {
        echo "Hello " . $name;
    }
    echo "<br>";
}


// Needed Output
echo greeting("Osama", "Male"); // Hello Mr Osama
echo greeting("Eman", "Female"); // Hello Miss Eman
echo greeting("Sameh"); // Hello Sameh