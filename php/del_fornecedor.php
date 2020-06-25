<?php
session_start();
require '..\conexao\config.php';
require '..\conexao\conexao.php';
require '..\conexao\database.php';

if(!($_SESSION['apelido']) && !($_SESSION['id'])){
    header("Location:sair.php");
}
if (!($_GET['f'])) {
    header("Location:list_fornecedor.php");
} else {
    $a  = $_GET['f'];
    $del_admin = DBDelete("fornecedor", "WHERE id_fornecedor = '{$a}'");
    if ($del_admin) {
        header("Location:list_fornecedor.php");
    } else {
        echo "<script>alert('Erro ao deletar o fornecedor!');</script>";
        header("Location:list_fornecedor.php");
    }
}