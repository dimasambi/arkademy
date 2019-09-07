<?php
/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/

$json = array();
$json["name"] = "Dimas Ambi Saka Putra";
$json["age"] = 20;
$json["addrees"] = "jl.J Soediman RT 18 RW 008 Tanjung Anom,Terusan Nunyai,Lampung Tengah ";
$json["hobbies"] = array("sepak bola","voli");
$json["is_married"] = false;
$json["list_school"] = array();
$json["list_school"]["sma"] = array(
    "year_in" => 2014,
    "year_out" => 2017,
    "major" => "IPA",
);

$json["list_school"]["smp"] = array(
    "year_in" => 2011,
    "year_out" => 2014,
    "major" => null,
);

$json["skills"] = array();
$json["skills"]["java"] = array(
    "skill_name" => "java",
    "level" => "beginner"
);

$json["skills"]["php"] = array(
    "skill_name" => "php",
    "level" => "beginner"
);
$json["interest_in_coding "] = true;

echo "<pre>".print_r($json, 1)."</pre>";
$result = json_encode($json);
