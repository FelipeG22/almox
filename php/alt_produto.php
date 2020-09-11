<?php
try {
    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once 'header.php';
    
    Acesso(2);

    if (!($_GET['p'])) {
        echo "<script language='JavaScript'>location.href='list_produto.php'</script>";
    } else {
        $a = $_GET['p'];
        $alt_produto = DBView('produto', " WHERE id = '{$a}'");
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
                            <input class="form-control" type="hidden" value="<?php echo $altp['id'] ?>" name="id">
                            <label for="nome">Produto</label>
                            <input class="form-control" type="text" id="nome" value="<?php echo $altp['produto'] ?>" name="produto" maxlength="100" required autofocus placeholder="Produto">
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
