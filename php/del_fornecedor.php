<?php

session_start();
require '..\conexao\config.php';
require '..\conexao\conexao.php';
require '..\conexao\database.php';

if (!($_SESSION['apelido']) && !($_SESSION['id'])) {
    echo "<script language='JavaScript'>location.href='sair.php'</script>";
}

Acesso(1);

if (!($_GET['f'])) {
    echo "<script language='JavaScript'>location.href='list_fornecedor.php'</script>";
} else {
    $a = $_GET['f'];
    $del_admin = DBDelete("fornecedor", "WHERE id_fornecedor = '{$a}'");
    if ($del_admin) {
        echo "<script language='JavaScript'>alert('Exclusão do fornecedor com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='list_fornecedor.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao excluir o fornecedor!');</script>";
        echo "<script language='JavaScript'>location.href='list_fornecedor.php'</script>";
    }
}