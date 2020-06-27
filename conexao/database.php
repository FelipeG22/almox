<?php
// Cadastro Entrada de Produtos
if (isset($_POST['btentproduto'])) {

    $dados = array(
        'id_usuario' => addslashes($_SESSION['id']),
        'id_produto' => addslashes($_POST['id_produto']),
        'id_fornecedor' => addslashes($_POST['id_fornecedor']),
        'nota_fiscal_entrada_produto' => addslashes($_POST['guia']),
        'data_entrada_produto' => addslashes($_POST['data']),
        'transporte_entrada_produto' => addslashes($_POST['transportadora']),
        'quantidade_entrada_produto' => addslashes($_POST['quantidade'])
    );

    $deubomentproduto = DBCreate('entrada_produto', $dados);

    if ($deubomentproduto) {
        header("Location:../php/list_produto.php");
    } else {
        echo "<script>alert('Erro ao dar entrada!');</script>";
    }
}
// Cadastro cliente
if (isset($_POST['btcadcliente'])) {

    $dados = array(
        'nome_cliente' => addslashes($_POST['nome_cliente']),
        'email_cliente' => addslashes($_POST['email_cliente']),
        'telefone_cliente' => addslashes($_POST['telefone_cliente']),
        'celular_cliente' => addslashes($_POST['celular_cliente']),
        'endereco_cliente' => addslashes($_POST['endereco_cliente'])
    );

    $deubomcadcliente = DBCreate('cliente', $dados);

    if ($deubomcadcliente) {
        header("Location:../php/list_cliente.php");
    } else {
        echo "<script>alert('Erro ao cadastrar!');</script>";
    }
}

// Cadastro produto
if (isset($_POST['btcadproduto'])) {

    $dados = array(
        'nome_produto' => addslashes($_POST['nome_produto']),
        'lote_produto' => addslashes($_POST['lote_produto']),
        'apresentacao_produto' => addslashes($_POST['apresentacao_produto']),
        'fabricacao_produto' => addslashes($_POST['fabricacao_produto']),
        'validade_produto' => addslashes($_POST['validade_produto'])
    );

    $deubomcadprodut = DBCreate('produto', $dados);

    if ($deubomcadprodut) {
        header("Location:../php/list_produto.php");
    } else {
        echo "<script>alert('Erro ao cadastrar!');</script>";
    }
}

// Cadastro fornecedor
if (isset($_POST['btcadfornecedor'])) {

    $dados = array(
        'nome_fornecedor' => addslashes($_POST['nome_fornecedor']),
        'telefone_fornecedor' => addslashes($_POST['telefone_fornecedor']),
        'celular_fornecedor' => addslashes($_POST['celular_fornecedor']),
        'email_fornecedor' => addslashes($_POST['email_fornecedor']),
        'cnpj_fornecedor' => addslashes($_POST['cnpj_fornecedor']),
        'endereco_fornecedor' => addslashes($_POST['endereco_fornecedor'])
    );

    $deubomcadfornecedor = DBCreate('fornecedor', $dados);

    if ($deubomcadfornecedor) {
        header("Location:../php/list_fornecedor.php");
    } else {
        echo "<script>alert('Erro ao cadastrar!');</script>";
    }
}

// Login
if (isset($_POST['btlogar'])) {

    $login = addslashes($_POST['login_usuario']);
    $senha = addslashes($_POST['senha_usuario']);

    function DBLogin($login, $senha) {
        $query = "SELECT `id_usuario`, `apelido_usuario` FROM `cw_usuario`"
                . " WHERE `login_usuario` = '{$login}' AND `senha_usuario` = '$senha' AND `status_usuario` = '1'";
        return DBExecute($query);
    }

    $deubom = DBLogin($login, $senha);
    if (mysqli_num_rows($deubom) > 0) {
        while ($l = mysqli_fetch_assoc($deubom)) {
            $id = "{$l['id_usuario']}";
            $apelido = $l['apelido_usuario'];
        }
        if ($id != null && $apelido != null) {
            session_start();
            $_SESSION['id'] = $id;
            $_SESSION['apelido'] = $apelido;
            header("Location:php\home.php");
            //echo "<script>alert('Login sucesso!');</script>";
        }
    } else {
        echo "<script>alert('Usuário ou senha incorretos!');</script>";
    }
}

// Deleta Registro
function DBDelete($table, $where = null) {
    $table = DB_PREFIX . '_' . $table;
    $where = ($where) ? " {$where}" : null;
    $query = "DELETE FROM {$table}{$where}";
    return DBExecute($query);
}

// Altera Registro
function DBUpdate($table, array $data, $where = null, $insertId = false) {
    foreach ($data as $key => $value) {
        $fields[] = "{$key} = '{$value}'";
    }

    $fields = implode(', ', $fields);

    $table = DB_PREFIX . '_' . $table;
    $where = ($where) ? " {$where}" : null;
    $query = "UPDATE {$table} SET {$fields}{$where}";
    return DBExecute($query, $insertId);
}

// Ler registros
function DBRead($table, $params = null, $fields = '*') {
    $table = DB_PREFIX . '_' . $table;
    $params = ($params) ? " {$params}" : null;
    $query = "SELECT {$fields} FROM {$table}{$params}";
    $result = DBExecute($query);

    if (!mysqli_num_rows($result)) {
        return false;
    } else {
        while ($res = mysqli_fetch_assoc($result)) {
            $data[] = $res;
        }
        return $data;
    }
}

// Grava Registros
function DBCreate($table, array $data, $insertId = false) {
    $table = DB_PREFIX . '_' . $table;
    $data = DBEscape($data);

    $fields = implode(', ', array_keys($data));
    $values = "'" . implode("', '", $data) . "'";
    $query = "INSERT INTO {$table} ({$fields}) VALUES ({$values})";

    return DBExecute($query, $insertId);
}

// Executa Querys
function DBExecute($query, $insertId = false) {
    $link = DBConnect();
    $result = @mysqli_query($link, $query) or die(mysqli_error());

    if ($insertId) {
        $result = mysqli_insert_id($link);
    }

    DBClose($link);
    return $result;
}
