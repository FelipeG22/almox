<?php
try {
    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';

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

    if (!($_GET['f'])) {
        echo "<script language='JavaScript'>location.href='list_fornecedor.php'</script>";
    } else {
        $a = $_GET['f'];
        $alt_fornecedor = DBRead('fornecedor', " WHERE id_fornecedor = '{$a}'");
    }

    require_once 'header.php';
    if ($alt_fornecedor != FALSE) {
        foreach ($alt_fornecedor as $altf) {
            ?>
            <div class="row">
                <div class="col-12">
                    <h3 class="h3 text-center bg-dark text-light">Alterar Fornecedor</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <form style="padding: 2%;" class="col-10 border border-secondary" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" autocomplete="on">
                    <div class="form-row">
                        <input type="hidden" name="id_fornecedor" value="<?php echo $altf["id_fornecedor"]; ?>">
                        <div class="form-group col-md-12">
                            <label for="nome">Nome / Empresa</label>
                            <input class="form-control" type="text" id="nome" name="nome_fornecedor" maxlength="100" required autofocus value="<?php echo $altf["nome_fornecedor"]; ?>" placeholder="Nome / Empresa">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="Telefone">Telefone</label>
                            <input class="form-control" type="tel" id="Telefone" name="telefone_fornecedor" maxlength="12" value="<?php echo $altf["telefone_fornecedor"]; ?>" placeholder="telefone" pattern="[0-9]{6}-[0-9]{4}">
                            <small>Formato: 212222-2222</small>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="Celular">Celular</label>
                            <input class="form-control" type="tel" id="Celular" name="celular_fornecedor" maxlength="12" value="<?php echo $altf["celular_fornecedor"]; ?>" placeholder="celular" pattern="[0-9]{7}-[0-9]{4}" >
                            <small>Formato: 2199999-9999</small>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="Email">Email</label>
                            <input class="form-control" type="email" id="Email" maxlength="50" value="<?php echo $altf["email_fornecedor"]; ?>" placeholder="Email" name="email_fornecedor">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="CNPJ">CNPJ</label>
                            <input class="form-control" type="text" id="CNPJ" maxlength="20" value="<?php echo $altf["cnpj_fornecedor"]; ?>" placeholder="CNPJ" name="cnpj_fornecedor" required pattern="[0-9]{3}.[0-9]{3}.[0-9]{2}/[0-9]{4}-[0-9]{2}">
                            <small>Formato: 111.111.11/1111-11</small>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-12" >
                            <label for="ende">Endereço</label>
                            <textarea class="form-control" id="ende" name="endereco_fornecedor" placeholder="Endereço" maxlength="500" required><?php echo $altf["endereco_fornecedor"]; ?></textarea>
                            <small>Max: 500 caractéres</small>
                        </div>
                    </div>
                    <button type="submit" name="btaltfornecedor" class="btn btn-primary">Alterar</button>
                </form>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-12"><a href="list_fornecedor.php"><img src="../_assets/_img/table_go.png" />lista de Fornecedores</a></div>
            </div>
            <?php
        }
    } else {
        ?>
        <div class="row">
            <div class="col-12">
                <h3 class="h3 text-center text-primary">Fornecedor não existe!</h3>
            </div>
        </div>
    <?php } ?>
    </div>
    <?php
    include 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
