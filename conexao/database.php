<?php
// Cadastro Saída de Produtos
if (isset($_POST['btsaidaproduto'])) {

    $dados = array(
        'id_usuario' => addslashes($_SESSION['id']),
        'id_produto' => addslashes($_POST['id_produto']),
        'id_cliente' => addslashes($_POST['id_cliente']),
        'guia_saida_produto' => addslashes($_POST['guia']),
        'data_saida_produto' => addslashes($_POST['data']),
        'id_tipo_pedido' => addslashes($_POST['tp']),
        'transporte_saida_produto' => addslashes($_POST['transportadora']),
        'quantidade_saida_produto' => addslashes($_POST['quantidade'])
    );

    $deubomsaiproduto = DBCreate('saida_produto', $dados);

    if ($deubomsaiproduto) {
        echo "<script language='JavaScript'>alert('Saída do produto cadastrata!');</script>";
        echo "<script language='JavaScript'>location.href='../php/list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao dar saída!');</script>";
    }
}
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
        echo "<script language='JavaScript'>alert('Entrada do produto cadastrada!');</script>";
        echo "<script language='JavaScript'>location.href='../php/list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao dar entrada!');</script>";
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
        echo "<script language='JavaScript'>alert('Cadastro do cliente com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='../php/list_cliente.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao casdastrar o cliente!');</script>";
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
        echo "<script language='JavaScript'>alert('Cadastro do produto com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='../php/list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao cadastrar!');</script>";
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
        echo "<script language='JavaScript'>alert('Cadastro do fornecedor com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='../php/list_fornecedor.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao cadastrar!');</script>";
    }
}

// Login
if (isset($_POST['btlogar'])) {

    $login = addslashes($_POST['login_usuario']);
    $senha = addslashes($_POST['senha_usuario']);

    function DBLogin($login, $senha) {
        $query = "SELECT `id_usuario` as id, `apelido_usuario` as ap, nivel_usuario as nvl FROM `cw_usuario`"
                . " WHERE `login_usuario` = '{$login}' AND `senha_usuario` = '$senha' AND `status_usuario` = '1'";
        return DBExecute($query);
    }

    $deubom = DBLogin($login, $senha);
    if (mysqli_num_rows($deubom) > 0) {
        while ($l = mysqli_fetch_assoc($deubom)) {
            $id = "{$l['id']}";
            $apelido = $l['ap'];
            $nivel = "{$l['nvl']}";
        }
        if ($id != null && $apelido != null) {
            session_start();
            $_SESSION['id'] = $id;
            $_SESSION['apelido'] = $apelido;
            $_SESSION['nivel'] = $nivel;
            echo "<script language='JavaScript'>location.href='php/home.php'</script>";
        }
    } else {
        echo "<script language='JavaScript'>alert('Usuário ou senha incorretos!');</script>";
    }
}

// Alternando produtos no estoque
if (isset($_GET['i']) AND isset($_GET['v'])) {

    $id = addslashes($_GET['i']);
    
    $valor = addslashes($_GET['v']);

    $altdados = array(
        'em_estoque' => $valor
    );
    $deubomalt = DBUpdate('produto', $altdados, "WHERE id_produto = '{$id}'");

    if ($deubomalt) {
        if ($valor == 0) {
            echo "<script language='JavaScript'>location.href='estoque.php'</script>";
        } else if ($valor == 1) {
            echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
        }
    } else {
        echo "<script language='JavaScript'>alert('Erro ao executar a ação!');</script>";
    }
}

// paginação
function Paginacao($query) {
    return mysqli_num_rows(DBExecute($query));
}

// Deleta Registro
function DBDelete($table, $where = null) {
    $table = DB_PREFIX . '_' . $table;
    $where = ($where) ? " {$where}" : null;
    $query = "DELETE FROM {$table} {$where}";
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

// Ler views
function DBView($view, $params = null, $fields = '*') {
    $params = ($params) ? " {$params}" : null;
    $query = "SELECT {$fields} FROM {$view}{$params}";
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
