<?php
try {
    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once 'header.php';
    
    Acesso(2);

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

    if (!($_GET['p'])) {
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
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
                            <input class="form-control" type="hidden" value="<?php echo $altp['id_produto'] ?>" name="id">
                            <label for="nome">Produto</label>
                            <input class="form-control" type="text" id="nome" value="<?php echo $altp['nome_produto'] ?>" name="produto" maxlength="100" required autofocus placeholder="Produto">
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
