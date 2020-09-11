<?php
try {

    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once 'header.php';

    Acesso(2);
    ?>
    <div class="row">
        <div class="col-12">
            <h3 class="h3 text-center bg-dark text-light">Cadastro de Lote</h3>
        </div>
    </div>

    <?php
    if (!isset($_GET['p'])) {
        ?>
        <div class = "row">
            <div class = "col-12">
                <h3 class = "h3 text-center text-primary">Selecione um produto na lista de produtos</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
        </div>
        <?php
    } else if (isset($_GET['p'])) {

//id produto
        $p = addslashes($_GET['p']);
        $prodlote = DBView("produto", "WHERE id = {$p}", "id, produto");
        if (!$prodlote) {
            ?>
            <div class = "row">
                <div class = "col-12">
                    <h3 class = "h3 text-center text-primary">Produto não existe!</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
            </div>
        <?php } else { ?>

            <div class="row">
                <div class="col-1"></div>
                <form style="padding: 2%;" class="col-10 border border-secondary" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" autocomplete="on">
                    <div class="form-row">
                        <div class="form-group col-md-8">
                            <label for="nome">Produto</label>
                            <?php foreach ($prodlote as $pl) { ?>
                            <input class="form-control" type="hidden" id="id_produto" value="<?php echo $pl['id'] ?>" name="id_produto">
                                <input class="form-control" type="text" id="nome" readonly value="<?php echo $pl['produto'] ?>" >
                            <?php } ?>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="Lote">Lote</label>
                            <input class="form-control" type="text" id="Lote" name="lote" maxlength="30" placeholder="Lote" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="fabricacao">Fabricação</label>
                            <input class="form-control" type="date" id="fabricacao" name="dtf" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="validade">Validade</label>
                            <input class="form-control" type="date" id="validade" name="dtv" required>
                        </div>
                    </div>
                    <button type="submit" name="btcadloteproduto" class="btn btn-primary" onclick="return confirm('Os dados estão corretos?')">Cadastrar</button>
                    <button type="reset" class="btn btn-danger">Limpar</button>
                </form>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
            </div>
            </div>
            <?php
        }
    }
    include 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
