<?php
try {

    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once 'header.php';


//Se não tiver o get do id do produto, nem tenta
    if (!isset($_GET['p'])) {
        ?>
        <div class = "row">
            <div class = "col-12">
                <h3 class = "h3 text-center bg-dark text-light">Rastreamento</h3>
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
//Tem o id do produto faço as consultas
        ?>

        <?php
        $p = addslashes($_GET['p']);
        //pega o produto
        $prod = DBView("rastreamento_entrada", "WHERE id_lote = {$p}", "produto, lote, dtf, dtv, ap");
        //pega a soma de todas as entradas
        $total_ent = DBView("rastreamento_entrada", "WHERE id_lote = {$p}", "SUM(quant_ent) as qdtentp");
        //pega a soma de todas as saídas
        $total_sai = DBView("rastreamento_saida", "WHERE id_lote = {$p}", "SUM(quant_sai) as qdtsaip");
        //pega todas as entradas do produto especificado
        $entrada = DBView("rastreamento_entrada", "WHERE id_lote = {$p} ORDER BY dtent, nota", "dtent, nota, quant_ent, "
                . "id_entrada, fornecedor, cnpj_fornecedor, transp");
        //pega todas as saidas do produto especificado
        $saida = DBView("rastreamento_saida", "WHERE id_lote = {$p} ORDER BY dtsai, guia", "dtsai, id_saida, guia, quant_sai, "
                . "transp_sai, cliente, tipo_pedido as tp");

// se não encontrar os resultados
        if ($prod == FALSE) {
            ?>

            <div class = "row">
                <div class = "col-12">
                    <h3 class = "h3 text-center text-primary">Não existe entrada e saída deste produto!</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
            </div>

            <?php
        } else {
            ?>   
            <div class = "row">
                <div class = "col-12">
                    <h3 class = "h3 text-center bg-dark text-light d-print-none">Rastreamento</h3>
                </div>
            </div>
            <div class="d-none d-block d-print-block">
                <div class="row">
                    <div class="table-responsive col-12">
                        <table style="text-align: center;" class="table table-sm table-bordered">
                            <tbody>
                                <tr>
                                    <td><img class="d-print-table-cell" src="../_assets/_img/lqfex_logo.png" width="50" height="63" alt="" loading="lazy" ></td>
                                    <td>
                                        <p><b>LABORATÓRIO QUÍMICO FARMACÊUTICO DO EXÉRCITO<br>FORMULÁRIO DE RASTREAMENTO DE PRODUTO TERMINADO</b></p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="table-responsive  col-12">
                        <table class="table table-sm table-bordered">
                            <tbody>
                                <tr>
                                    <?php foreach ($prod as $p) { ?>
                                        <td>PRODUTO: <?php echo $p['produto'] ?></td>
                                        <td>LOTE: <?php echo $p['lote'] ?></td>
                                    </tr>
                                    <tr>
                                        <td>APRESENTAÇÃO: <?php echo $p['ap'] ?></td>
                                    <?php } foreach ($total_ent as $te) { ?>
                                        <td>QUANTIDADE RECEBIDA: <?php echo $te['qdtentp'] ?></td>
                                    <?php } ?>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class = "row">
                    <div class = "col-12">
                        <h3 class = "h3 text-center bg-dark text-light">Quantidade Recebida</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="table-responsive  col-12">
                        <table style="text-align: center;" class="table table-sm table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Nota Fiscal</th>
                                    <th scope="col">Data</th>
                                    <th scope="col">Quantidade</th>
                                    <th scope="col">Fornecedor / CNPJ</th>
                                    <th scope="col">Transportadora</th>
                                    <th scope="col" colspan="2" class="d-print-none">Ação</th>
                                </tr>
                            </thead>
                            <?php
                            if ($entrada == false) {
                                ?>
                                <tr>
                                    <td colspan="8">Não possui entrada deste Produto</td>
                                </tr>                
                                <?php
                            } else {
                                $q = 1;
                                foreach ($entrada as $e) {
                                    ?>
                                    <tr>
                                        <th scope="row"><?php echo $q++; ?></th>
                                        <td><?php echo $e['nota'] ?></td>
                                        <td><?php echo $e['dtent'] ?></td>
                                        <td><?php echo $e['quant_ent'] ?></td>
                                        <td><?php echo $e['fornecedor'] . "<br>" . $e['cnpj_fornecedor'] ?></td>
                                        <td><?php echo $e['transp'] ?></td>
                                        <td class="d-print-none" title="Alterar"><a href="alt_entrada_produto.php?p=<?php echo $e['id_entrada'] ?>" onclick="return confirm('Deseja alterar Informações deste Recebimento?')"><img src="../_assets/_img/pencil.png" /></a></td>
                                        <td class="d-print-none" title="Excluir"><a href="del_entrada_produto.php?e=<?php echo $e['id_entrada'] ?>" onclick="return confirm('Deseja excluir este Lançamento?')"><img src="../_assets/_img/cancel.png" /></a></td>
                                    </tr>
                                    <?php
                                }
                            }
                            ?>
                        </table>
                    </div>
                </div>
                <div class = "row">
                    <div class = "col-12">
                        <h3 class = "h3 text-center bg-dark text-light">Quantidade Expedida</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="table-responsive  col-12">
                        <table style="text-align: center;" class="table table-sm table-bordered d-print-table">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Guia</th>
                                    <th scope="col">Data</th>
                                    <th scope="col">Quantidade</th>
                                    <th scope="col">Cliente</th>
                                    <th scope="col">Transportadora</th>
                                    <th scope="col" colspan="2" class="d-print-none">Ação</th>
                                </tr>
                            </thead>
                            <?php
                            if ($saida == false) {
                                ?>
                                <tr>
                                    <td colspan="8">Não possui saída deste Produto</td>
                                </tr>                
                                <?php
                            } else {
                                $q = 1;
                                foreach ($saida as $s) {
                                    ?>
                                    <tr>
                                        <th scope="row"><?php echo $q++; ?></th>
                                        <td><?php echo $s['guia'] . " - " . $s['tp'] ?> </td>
                                        <td><?php echo $s['dtsai'] ?></td>
                                        <td><?php echo $s['quant_sai'] ?></td>
                                        <td><?php echo $s['cliente'] ?></td>
                                        <td><?php echo $s['transp_sai'] ?></td>
                                        <td class="d-print-none" title="Alterar"><a href="alt_saida_produto.php?p=//<?php echo $s['id_saida'] ?>" onclick="return confirm('Deseja alterar Informações desta saída?')"><img src="../_assets/_img/pencil.png" /></a></td>
                                        <td class="d-print-none" title="Excluir"><a href="del_saida_produto.php?e=//<?php echo $s['id_saida'] ?>" onclick="return confirm('Deseja excluir Produto?')"><img src="../_assets/_img/cancel.png" /></a></td>
                                    </tr>
                                    <?php
                                }
                            }
                            ?>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="table-responsive d-print-table col-12">
                        <table class="table table-sm table-bordered">
                            <tbody>
                                <tr>
                                    <?php foreach ($total_sai as $ts) { ?>
                                        <td class="col-6 mr-auto">QUANTIDADE EXPEDIDA: <?php echo $ts['qdtsaip'] ?></td>
                                    <?php } ?>
                                    <td>CONFERIDO POR:</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row d-print-none">
                    <div class="table-responsive d-print-table col-12">
                        <table class="table table-sm table-bordered">
                            <tbody>
                                <tr>
                                    <td class="col">EM ESTOQUE: <?php echo ($te['qdtentp'] - $ts['qdtsaip']) ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col mr-auto"></div>
                <button class="btn btn-primary col-auto d-print-none" onclick="print()">Imprimir</button>
                <div class="col ml-auto"></div>
            </div>
            <?php
        }
    }
    require_once 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
