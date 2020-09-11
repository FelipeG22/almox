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
            <h3 class="h3 text-center bg-dark text-light">Alterar Lote</h3>
        </div>
    </div>

    <?php
    if (!isset($_GET['p'])) {
        ?>
        <div class = "row">
            <div class = "col-12">
                <h3 class = "h3 text-center text-primary">Selecione lote de um produto</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
        </div>
        <?php
    } else if (isset($_GET['p'])) {

//id produto
        $p = addslashes($_GET['p']);
        $lote = DBView("lote_produto", "WHERE id_lote = {$p}", "id_produto, id_lote, lote, dtf, dtv");
        if (!$lote) {
            ?>
            <div class = "row">
                <div class = "col-12">
                    <h3 class = "h3 text-center text-primary">Lote não existe!</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
            </div>
            <?php
        } else {

            foreach ($lote as $l) {
                ?>

                <div class="row">
                    <div class="col-1"></div>
                    <form style="padding: 2%;" class="col-10 border border-secondary" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" autocomplete="on">
                        <div class="form-row">
                            <div class="form-group col-md-8">
                                <label for="tp">Produto</label>
                                <select class="form-control" id="tp" name="idprod" required>
                                    <?php
                                    $prod = DBView("produto", "WHERE id = {$l['id_produto']}", "id, produto");
                                    foreach ($prod as $pl) {
                                        ?>
                                        <option value="<?php echo $pl['id'] ?>" ><?php echo $pl['produto'] ?></option>
                                    <?php } ?>
                                    <?php
                                    $prods = DBView("produto", NULL, "id, produto");
                                    foreach ($prods as $pls) {
                                        ?>
                                        <option value="<?php echo $pls['id'] ?>" ><?php echo $pls['produto'] ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="Lote">Lote</label>
                                <input class="form-control" type="hidden" id="id_lote" name="id_lote" value="<?php echo $l['id_lote'] ?>">
                                <input class="form-control" type="text" id="Lote" name="lote" value="<?php echo $l['lote'] ?>" autofocus maxlength="30" placeholder="Lote" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="fabricacao">Fabricação</label>
                                <input class="form-control" type="date" id="fabricacao" value="<?php echo $l['dtf'] ?>" name="dtf" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="validade">Validade</label>
                                <input class="form-control" type="date" id="validade" value="<?php echo $l['dtv'] ?>" name="dtv" required>
                            </div>
                        </div>
                        <button type="submit" name="btaltloteproduto" class="btn btn-primary" onclick="return confirm('Os dados estão corretos?')">Alterar</button>
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
    }
    include 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
