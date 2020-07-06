<?php

session_start();
require '..\conexao\config.php';
require '..\conexao\conexao.php';
require '..\conexao\database.php';

if (!($_SESSION['apelido']) && !($_SESSION['id'])) {
    echo "<script language='JavaScript'>location.href='sair.php'</script>";
}
if (!($_GET['p'])) {
    echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
} else {
    $a = $_GET['p'];
    $del_admin = DBDelete("produto", "WHERE id_produto = '{$a}'");
    if ($del_admin) {
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
    } else {
        echo "<script>alert('Erro ao deletar produto!');</script>";
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
    }
}