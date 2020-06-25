<?php
session_start();
require '..\conexao\config.php';
require '..\conexao\conexao.php';
require '..\conexao\database.php';

if(!($_SESSION['apelido']) && !($_SESSION['id'])){
    header("Location:sair.php");
}
if (!($_GET['c'])) {
    header("Location:list_cliente.php");
} else {
    $a  = $_GET['c'];
    $del_admin = DBDelete("cliente", "WHERE id_cliente = '{$a}'");
    if ($del_admin) {
        header("Location:list_cliente.php");
    } else {
        echo "<script>alert('Erro ao deletar o cliente!');</script>";
        header("Location:list_cliente.php");
    }
}