<?php
session_start();

if(!($_SESSION['id']) && !($_SESSION['apelido'])){
    header("Location:..\index.php");
}
if($_SESSION['id'] && $_SESSION['apelido']){
    unset($_SESSION['id']);
    unset($_SESSION['apelido']);
    header("Location:sair.php");
}