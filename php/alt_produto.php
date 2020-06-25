<?php
try {
    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once 'header.php';

    if (isset($_POST['btaltproduto'])) {
        $a = $_POST['id_produto'];
        $altdados = array(
            'nome_produto' => addslashes($_POST['nome_produto']),
            'lote_produto' => addslashes($_POST['lote_produto']),
            'apresentacao_produto' => addslashes($_POST['apresentacao_produto']),
            'fabricacao_produto' => addslashes($_POST['fabricacao_produto']),
            'validade_produto' => addslashes($_POST['validade_produto'])
        );

        $deubomalt = DBUpdate('produto', $altdados, "WHERE id_produto = '{$a}'");

        if ($deubomalt) {
            header("Location:list_produto.php");
        } else {
            echo "<script>alert('Erro ao alterar os dados!');</script>";
        }
    }

    if (!($_GET['p'])) {
        header("Location:list_produto.php");
    } else {
        $a = $_GET['p'];
        $alt_produto = DBRead('produto', " WHERE id_produto = '{$a}'");
    }

    if ($alt_produto != FALSE) {
        foreach ($alt_produto as $altp) {
            ?>
            <div class="row">
                <div class="col-12">
                    <h3 class="h3 text-center bg-dark text-light">Alterar Produto</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <form style="padding: 2%;" class="col-10 border border-secondary" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" autocomplete="on">
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="nome">Produto</label>
                            <input class="form-control" type="text" id="nome" value="<?php echo $altp['nome_produto'] ?>" name="nome_produto" maxlength="100" required autofocus placeholder="Produto">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="Lote">Lote</label>
                            <input class="form-control" type="text" id="Lote" value="<?php echo $altp['lote_produto'] ?>" name="lote_produto" maxlength="30" placeholder="Lote" required>
                        </div>
                        <div class="form-group col-md-8">
                            <label for="apres">Apresentação</label>
                            <input class="form-control" type="text" id="apres" maxlength="100" placeholder="Apresentação" value="<?php echo $altp['apresentacao_produto'] ?>" name="apresentacao_produto" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="fabricacao">Fabricação</label>
                            <input class="form-control" type="date" id="fabricacao" value="<?php echo $altp['fabricacao_produto'] ?>" name="fabricacao_produto" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="validade">Validade</label>
                            <input class="form-control" type="date" id="validade" value="<?php echo $altp['validade_produto'] ?>" name="validade_produto" required>
                        </div>
                    </div>
                    <button type="submit" name="btaltproduto" class="btn btn-primary">Alterar</button>
                </form>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
            </div>
            <?php
        }
    } else {
        ?>
        <div class="row">
            <div class="col-12">
                <h3 class="h3 text-center text-primary">Produto não existe!</h3>
            </div>
        </div>
    <?php } ?>
    </div>
    <?php
    require_once 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
