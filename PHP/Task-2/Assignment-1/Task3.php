<?php
$admins = ["Osama", "Ahmed", "Sayed"];

// Input Name "Osama"
// Needed Output
// "The Request Method Is Post And Username Is Osama"
// "This Username Osama Is Admin"

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user = $_POST["user"];
    echo "The Request Method Is Post And Username Is " . $user , "<br>";

    if(in_array($user, $admins)){
        echo "This Username ". $user . " Is Admin" . "<br>";
    }
} 

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Small Form</title>
</head>
<body>
    <form action="./Task3.php" method="POST">
    <input type="text" name="user">
    <input type="submit" value="Send">
    </form>
</body>
</html>