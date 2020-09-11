<?php
// Cadastro Saída de Produtos
if (isset($_POST['btsaidaproduto'])) {

    $dados = array(
        'id_usuario' => addslashes($_SESSION['id']),
        'id_lote_produto' => addslashes($_POST['id_lote']),
        'id_cliente' => addslashes($_POST['id_cliente']),
        'guia_saida_produto' => addslashes(trim($_POST['guia'])),
        'data_saida_produto' => addslashes($_POST['data']),
        'id_tipo_pedido' => addslashes($_POST['tp']),
        'transporte_saida_produto' => addslashes(trim($_POST['transp'])),
        'quantidade_saida_produto' => addslashes($_POST['quant'])
    );

    $deubomsaiproduto = DBCreate('saida_produto', $dados);

    if ($deubomsaiproduto) {
        echo "<script language='JavaScript'>alert('Saída do produto cadastrata!');</script>";
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao dar saída!\nChame o Administrador');</script>";
    }
}

// Alterando dados da saida do produto
if (isset($_POST['btaltsaiproduto'])) {
    $a = $_POST['id_saida_produto'];
    $altdados = array(
        'id_cliente' => addslashes($_POST['id_cliente']),
        'guia_saida_produto' => addslashes($_POST['guia']),
        'data_saida_produto' => addslashes($_POST['data']),
        'transporte_saida_produto' => addslashes($_POST['transportadora']),
        'quantidade_saida_produto' => addslashes($_POST['quantidade'])
    );

    $deubomalt = DBUpdate('saida_produto', $altdados, "WHERE id_saida_produto = '{$a}'");

    if ($deubomalt) {
        echo "<script language='JavaScript'>alert('Atualização de saída com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao alterar os dados!');</script>";
    }
}

// Cadastro Entrada de Produtos
if (isset($_POST['btentproduto'])) {

    $dados = array(
        'id_usuario' => addslashes($_SESSION['id']),
        'id_lote_produto' => addslashes($_POST['id_lote']),
        'id_fornecedor' => addslashes($_POST['id_fornecedor']),
        'nota_fiscal_entrada_produto' => addslashes(trim($_POST['guia'])),
        'data_entrada_produto' => addslashes($_POST['data']),
        'quantidade_entrada_produto' => addslashes($_POST['quant'])
    );

    $deubomentproduto = DBCreate('entrada_produto', $dados);

    if ($deubomentproduto) {
        echo "<script language='JavaScript'>alert('Entrada do produto cadastrada!');</script>";
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao dar entrada! Chame o Administrador!');</script>";
    }
}

// Alterando dados da entrada do produto
if (isset($_POST['btaltentproduto'])) {
    $a = $_POST['id_entrada_produto'];
    $altdados = array(
        'id_fornecedor' => addslashes($_POST['id_fornecedor']),
        'nota_fiscal_entrada_produto' => addslashes($_POST['guia']),
        'data_entrada_produto' => addslashes($_POST['data']),
        'quantidade_entrada_produto' => addslashes($_POST['quantidade'])
    );

    $deubomalt = DBUpdate('entrada_produto', $altdados, "WHERE id_entrada_produto = '{$a}'");

    if ($deubomalt) {
        echo "<script language='JavaScript'>alert('Atualização de entrada com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao alterar os dados!');</script>";
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

// Alterando dados do cliente
if (isset($_POST['btaltcliente'])) {
    $a = $_POST['id_cliente'];
    $altdados = array(
        'nome_cliente' => addslashes($_POST['nome_cliente']),
        'telefone_cliente' => addslashes($_POST['telefone_cliente']),
        'celular_cliente' => addslashes($_POST['celular_cliente']),
        'email_cliente' => addslashes($_POST['email_cliente']),
        'endereco_cliente' => addslashes($_POST['endereco_cliente'])
    );

    $deubomalt = DBUpdate('cliente', $altdados, "WHERE id_cliente = '{$a}'");

    if ($deubomalt) {
        echo "<script language='JavaScript'>alert('Atualização dos dados do cliente com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='list_cliente.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao alterar os dados!');</script>";
    }
}

// Cadastro lote do produto
if (isset($_POST['btcadloteproduto'])) {

    $dados = array(
        'id_produto' => addslashes($_POST['id_produto']),
        'lote_produto' => addslashes(strtoupper(trim($_POST['lote']))),
        'fabricacao_produto' => addslashes($_POST['dtf']),
        'validade_produto' => addslashes($_POST['dtv'])
    );

    $deubomcadlotprodut = DBCreate('lote_produto', $dados);

    if ($deubomcadlotprodut) {
        echo "<script language='JavaScript'>alert('Cadastro do lote com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='../php/list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao cadastrar! Chame o administrador do Sistema!');</script>";
    }
}

// Alterar dados do lote do produto
if (isset($_POST['btaltloteproduto'])) {

    $a = $_POST['id_lote'];
    $altdados = array(
        'id_produto' => addslashes($_POST['idprod']),
        'lote_produto' => addslashes(strtoupper(trim($_POST['lote']))),
        'fabricacao_produto' => addslashes($_POST['dtf']),
        'validade_produto' => addslashes($_POST['dtv'])
    );

    $deubomalt = DBUpdate('lote_produto', $altdados, "WHERE id_lote_produto = '{$a}'");

    if ($deubomalt) {
        echo "<script language='JavaScript'>alert('Atualização dos dados do lote com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao alterar os dados!');</script>";
    }
}

// Cadastro produto
if (isset($_POST['btcadproduto'])) {

    $dados = array(
        'nome_produto' => addslashes(strtoupper(trim($_POST['produto'])))
    );

    $deubomcadprodut = DBCreate('produto', $dados);

    if ($deubomcadprodut) {
        echo "<script language='JavaScript'>alert('Cadastro do produto com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='../php/list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao cadastrar!');</script>";
    }
}

// Alterando dados do produto
if (isset($_POST['btaltproduto'])) {
    $a = $_POST['id'];
    $altdados = array(
        'nome_produto' => addslashes(strtoupper(trim($_POST['produto'])))
    );

    $deubomalt = DBUpdate('produto', $altdados, "WHERE id_produto = '{$a}'");

    if ($deubomalt) {
        echo "<script language='JavaScript'>alert('Atualização dos dados do produto com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao alterar os dados!');</script>";
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

// Alterando dados do fornecedor
if (isset($_POST['btaltfornecedor'])) {
    $a = $_POST['id_fornecedor'];
    $altdados = array(
        'nome_fornecedor' => addslashes($_POST['nome_fornecedor']),
        'telefone_fornecedor' => addslashes($_POST['telefone_fornecedor']),
        'celular_fornecedor' => addslashes($_POST['celular_fornecedor']),
        'email_fornecedor' => addslashes($_POST['email_fornecedor']),
        'cnpj_fornecedor' => addslashes($_POST['cnpj_fornecedor']),
        'endereco_fornecedor' => addslashes($_POST['endereco_fornecedor'])
    );

    $deubomalt = DBUpdate('fornecedor', $altdados, "WHERE id_fornecedor = '{$a}'");

    if ($deubomalt) {
        echo "<script language='JavaScript'>alert('Atualização dos dados do fornecedor com sucesso!');</script>";
        echo "<script language='JavaScript'>location.href='list_fornecedor.php'</script>";
    } else {
        echo "<script language='JavaScript'>alert('Erro ao alterar os dados!');</script>";
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
            echo "<script language='JavaScript'>alert('Produto retirado do Estoque!');</script>";
            echo "<script language='JavaScript'>location.href='estoque.php'</script>";
        } else if ($valor == 1) {
            echo "<script language='JavaScript'>alert('Produto inserido no Estoque!');</script>";
            echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
        }
    } else {
        echo "<script language='JavaScript'>alert('Erro ao executar a ação!');</script>";
    }
}

// Verifica acesso
// Pede até o maior nível
function Acesso($n) {
    if ($_SESSION['nivel'] > $n) {
        echo "<script language='JavaScript'>alert('Acesso Negado!');</script>";
        echo "<script language='JavaScript'>location.href='sair.php'</script>";
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
