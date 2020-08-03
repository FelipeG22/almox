<?php
session_start();

session_destroy();

echo "<script language='JavaScript'>alert('Sessão encerrada!');</script>";

echo "<script language='JavaScript'>location.href='../index.php'</script>";
