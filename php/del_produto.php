<?php

session_start();
require '..\conexao\config.php';
require '..\conexao\conexao.php';
require '..\conexao\database.php';

if (!($_SESSION['apelido']) && !($_SESSION['id'])) {
    header("Location:sair.php");
}
if (!($_GET['p'])) {
    header("Location:list_produto.php");
} else {
    $a = $_GET['p'];
    $del_admin = DBDelete("produto", "WHERE id_produto = '{$a}'");
    if ($del_admin) {
        header("Location:list_produto.php");
    } else {
        throw new Exception("Erro ao excluir o produto!!! Contate com administrador.", 61);
        header("Location:list_produto.php");
    }
}