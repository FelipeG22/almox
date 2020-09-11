<?php

session_start();
require '..\conexao\config.php';
require '..\conexao\conexao.php';
require '..\conexao\database.php';

if (!($_SESSION['apelido']) && !($_SESSION['id'])) {
    echo "<script language='JavaScript'>location.href='sair.php'</script>";
}

Acesso(1);

if (!($_GET['p'])) {
    echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
} else {
    $a = addslashes($_GET['p']);
    $del = DBDelete("lote_produto", "WHERE id_lote_produto = ". $a);
    if ($del) {
        echo "<script language='JavaScript'>alert('Exclusão do lote com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao deletar lote!');</script>";
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
    }
}