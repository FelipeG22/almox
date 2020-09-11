<?php
try {

    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once 'header.php';

    Acesso(2);

//Se não tiver o get do id da entrada, nem tenta
    if (!isset($_GET['p'])) {
        ?>
        <div class = "row">
            <div class = "col-12">
                <h3 class = "h3 text-center bg-dark text-light">Alteração de Recebimento de Produto</h3>
            </div>
        </div>
        <div class = "row">
            <div class = "col-12">
                <h3 class = "h3 text-center text-primary">Selecione um produto na lista de produtos</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
        </div>
        <?php
    } else {
//Tem o id do produto, agora preciso do fornecedor
        ?>
        <div class = "row">
            <div class = "col-12">
                <h3 class = "h3 text-center bg-dark text-light">Alteração de Recebimento de Produto</h3>
            </div>
        </div>

        <?php
        $p = addslashes($_GET['p']);

        $entrada = DBView("rastreamento_entrada", "WHERE id_entrada = {$p}", "id_entrada as ident, produto as nomep, "
                . "lote as lp, id_fornecedor as idf, "
                . "fornecedor as nf, cnpj_fornecedor as cnpjf, nota, dtent, quant_ent");

// se não encontrar os resultados
        if ($entrada == FALSE) {
            ?>

            <div class = "row">
                <div class = "col-12">
                    <h3 class = "h3 text-center text-primary">Entrada do produto não encontrada!</h3>
                </div>
            </div>

            <?php
        } else {
            foreach ($entrada as $ent) {
                ?>   
                <div class="row">
                    <div class="col-1"></div>
                    <form style="padding: 2%;" class="col-10 border border-secondary" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" autocomplete="on">
                        <div class="form-row">
                            <div class="form-group col-md-8">
                                <label for="Produto">Produto</label>
                                <input type="hidden" value="<?php echo $ent['ident'] ?>" name="id_entrada_produto">
                                <input class="form-control" type="text" id="Produto" value="<?php echo $ent['nomep'] ?>" readonly>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="Lote">Lote</label>
                                <input class="form-control" type="text" id="Lote" value="<?php echo $ent['lp'] ?>" readonly>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-8">
                                <label for="Fornecedor">Fornecedor - CNPJ</label>
                                <select class="form-control" id="Fornecedor" name="id_fornecedor">
                                    <option value="<?php echo $ent['idf'] ?>" ><?php echo $ent['nf'] . " - " . $ent['cnpjf'] ?></option>

                                    <?php
                                    $fornecedores = DBRead("fornecedor", "ORDER BY nome_fornecedor", "id_fornecedor as idf, "
                                            . "nome_fornecedor as nf, cnpj_fornecedor as cnpj");

                                    foreach ($fornecedores as $for) {
                                        ?>
                                        <option value="<?php echo $for['idf'] ?>"><?php echo $for['nf'] . " - " . $for['cnpj'] ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="guia">Nota Fiscal</label>
                                <input class="form-control" type="text" id="guia" value="<?php echo $ent['nota'] ?>" name="guia" maxlength="50" required>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="dtexp">Data de Expedição</label>
                                <input class="form-control" type="date" id="dtexp"  value="<?php echo $ent['dtent'] ?>" name="data" required>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="Quantidade">Quantidade</label>
                                <input class="form-control" type="number" max="2000000000" id="Quantidade" value="<?php echo $ent['quant_ent'] ?>"  name="quantidade" required>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" name="btaltentproduto" onclick="return confirm('Os dados estão corretos?')" >Alterar</button>
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

    require_once 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
