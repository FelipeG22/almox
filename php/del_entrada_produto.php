<?php

session_start();
require '..\conexao\config.php';
require '..\conexao\conexao.php';
require '..\conexao\database.php';

if (!($_SESSION['apelido']) && !($_SESSION['id'])) {
    echo "<script language='JavaScript'>location.href='sair.php'</script>";
}
if (!($_GET['e'])) {
    echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
} else {
    $a = $_GET['e'];
    
    $del = DBDelete("entrada_produto", "WHERE id_entrada_produto = " . $a);
    if ($del) {
        echo "<script language='JavaScript'>location.href='rastreamento.php'</script>";
    } else {
        echo "<script>alert('Erro ao deletar a entrada deste produto!');</script>";
        echo "<script language='JavaScript'>location.href='rastreamento.php'</script>";
    }
}