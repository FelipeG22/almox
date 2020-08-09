<?php

session_start();
require '..\conexao\config.php';
require '..\conexao\conexao.php';
require '..\conexao\database.php';


if (!($_SESSION['apelido']) && !($_SESSION['id'])) {
    echo "<script language='JavaScript'>location.href='sair.php'</script>";
}

Acesso(1);

if (!($_GET['c'])) {
    echo "<script language='JavaScript'>location.href='list_cliente.php'</script>";
} else {
    $a = $_GET['c'];
    $del_admin = DBDelete("cliente", "WHERE id_cliente = '{$a}'");
    if ($del_admin) {
        echo "<script language='JavaScript'>alert('Exclusão do cliente com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='list_cliente.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao deletar o cliente!');</script>";
        echo "<script language='JavaScript'>location.href='list_cliente.php'</script>";
    }
}