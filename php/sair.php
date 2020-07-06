<?php
session_start();

if(!($_SESSION['id']) && !($_SESSION['apelido'])){
    header("Location:..\index.php");
    echo "<script language='JavaScript'>location.href='..\index.php'</script>";
}
if($_SESSION['id'] && $_SESSION['apelido']){
    unset($_SESSION['id']);
    unset($_SESSION['apelido']);
    echo "<script language='JavaScript'>location.href='sair.php'</script>";
}