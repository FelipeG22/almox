<?php
try {

    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once 'header.php';

    Acesso(2);
    
//Se não tiver o get do id do produto, nem tenta
    if (!isset($_GET['p'])) {
        ?>
        <div class = "row">
            <div class = "col-12">
                <h3 class = "h3 text-center bg-dark text-light">Saída de Produto</h3>
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
                <h3 class = "h3 text-center bg-dark text-light">Saída de Produto</h3>
            </div>
        </div>

        <?php
        $p = addslashes($_GET['p']);

        $saida = DBView("rastreamento_saida", "WHERE id_saida = {$p}", "id_saida as idsai, "
                . "dtsai, guia, quant_sai, transp_sai, produto as nomep, lote as lp, id_cliente as idcl, "
                . "cliente as ncl, id_tipo_pedido as idtp, tipo_pedido as tp");

// se não encontrar os resultados
        if ($saida == FALSE) {
            ?>

            <div class = "row">
                <div class = "col-12">
                    <h3 class = "h3 text-center text-primary">Saída do produto não encontrada!</h3>
                </div>
            </div>

            <?php
        } else {
            foreach ($saida as $sai) {
                ?>   
                <div class="row">
                    <div class="col-1"></div>
                    <form style="padding: 2%;" class="col-10 border border-secondary" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" autocomplete="on">
                        <div class="form-row">
                            <div class="form-group col-md-8">
                                <label for="Produto">Produto</label>
                                <input type="hidden" value="<?php echo $sai['idsai'] ?>" name="id_saida_produto">
                                <input class="form-control" type="text" id="Produto" value="<?php echo $sai['nomep'] ?>" name="nome_produto" readonly>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="Lote">Lote</label>
                                <input class="form-control" type="text" id="Lote" value="<?php echo $sai['lp'] ?>" readonly>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-7">
                                <label for="Cliente">Cliente</label>
                                <select class="form-control" id="Cliente" name="id_cliente">
                                    <option value="<?php echo $sai['idcl'] ?>" ><?php echo $sai['ncl'] ?></option>

                                    <?php
                                    $clientes = DBRead("cliente", "ORDER BY nome_cliente", "id_cliente as idcl, "
                                            . "nome_cliente as ncl");

                                    foreach ($clientes as $cli) {
                                        ?>
                                        <option value="<?php echo $cli['idcl'] ?>"><?php echo $cli['ncl']?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group col-md-5">
                                <label for="guia">Nota Fiscal</label>
                                <input class="form-control" type="text" id="guia" value="<?php echo $sai['guia'] ?>" name="guia" maxlength="50" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="dtexp">Data de Expedição</label>
                                <input class="form-control" type="date" id="dtexp"  value="<?php echo $sai['dtsai'] ?>" name="data" required>
                            </div>
                            <div class="form-group col-md-8">
                                <label for="Transportadora">Transportadora</label>
                                <input class="form-control" type="text" id="Transportadora" value="<?php echo $sai['transp_sai'] ?>" name="transportadora" maxlength="100">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="Quantidade">Quantidade</label>
                                <input class="form-control" type="number" max="2000000000" id="Quantidade" value="<?php echo $sai['quant_sai'] ?>"  name="quantidade" required>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" name="btaltsaiproduto" onclick="return confirm('Os dados estão corretos?')" >Alterar</button>
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
