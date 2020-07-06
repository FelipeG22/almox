<?php

session_start();
require '..\conexao\config.php';
require '..\conexao\conexao.php';
require '..\conexao\database.php';

if (!($_SESSION['apelido']) && !($_SESSION['id'])) {
    echo "<script language='JavaScript'>location.href='sair.php'</script>";
}
if (!($_GET['f'])) {
    echo "<script language='JavaScript'>location.href='list_fornecedor.php'</script>";
} else {
    $a = $_GET['f'];
    $del_admin = DBDelete("fornecedor", "WHERE id_fornecedor = '{$a}'");
    if ($del_admin) {
        echo "<script language='JavaScript'>location.href='list_fornecedor.php'</script>";
    } else {
        echo "<script>alert('Erro ao deletar o fornecedor!');</script>";
        echo "<script language='JavaScript'>location.href='list_fornecedor.php'</script>";
    }
}