<?php
session_start();
require '..\conexao\config.php';
require '..\conexao\conexao.php';
require '..\conexao\database.php';

if(!($_SESSION['apelido']) && !($_SESSION['id'])){
    header("Location:sair.php");
}
if (!($_GET['p'])) {
    header("Location:list_produto.php");
} else {
    $a  = $_GET['p'];
    $del_admin = DBDelete("produto", "WHERE id_produto = '{$a}'");
    if ($del_admin) {
        header("Location:list_produto.php");
    } else {
        echo "<script>alert('Erro ao deletar o produto!');</script>";
        header("Location:list_produto.php");
    }
}