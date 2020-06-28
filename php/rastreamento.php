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
        $prod = DBRead("produto", "WHERE id_produto = {$p}", "id_produto, nome_produto, lote_produto, apresentacao_produto");
        $total_ent = DBRead("entrada_produto", "WHERE id_produto = {$p}", "SUM(quantidade_entrada_produto) as qdtentp");
        $total_sai = DBRead("saida_produto", "WHERE id_produto = {$p}", "SUM(quantidade_saida_produto) as qdtsaip");
        $entrada = DBRead("entrada_produto ep", "INNER JOIN cw_fornecedor f ON ep.id_fornecedor = f.id_fornecedor "
                . "WHERE id_produto = {$p}", "DATE_FORMAT(ep.data_entrada_produto, '%d/%m/%Y') as dtexp, "
                . "ep.id_entrada_produto as id,"
                . "ep.nota_fiscal_entrada_produto as nota, "
                . "ep.quantidade_entrada_produto as quant, "
                . "ep.transporte_entrada_produto as transp, "
                . "f.nome_fornecedor, "
                . "f.cnpj_fornecedor");
        $saida = DBRead("saida_produto sp", "INNER JOIN cw_cliente c ON sp.id_cliente = c.id_cliente "
                . "WHERE id_produto = {$p}", "DATE_FORMAT(sp.data_saida_produto, '%d/%m/%Y') as dtsai, "
                . "sp.id_saida_produto as id,"
                . "sp.guia_saida_produto as guia, "
                . "sp.quantidade_saida_produto as quant, "
                . "sp.transporte_saida_produto as transp, "
                . "c.nome_cliente");

// se não encontrar os resultados
        if ($prod == FALSE) {
            ?>

            <div class = "row">
                <div class = "col-12">
                    <h3 class = "h3 text-center text-primary">Selecione um produto no estoque!</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
            </div>

            <?php
        } else {

            foreach ($prod as $p) {
                foreach ($total_ent as $te) {
                    foreach ($total_sai as $ts) {
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
                                                <td>PRODUTO: <?php echo $p['nome_produto'] ?></td>
                                                <td>LOTE: <?php echo $p['lote_produto'] ?></td>
                                            </tr>
                                            <tr>
                                                <td>APRESENTAÇÃO: <?php echo $p['apresentacao_produto'] ?></td>
                                                <td>QUANTIDADE RECEBIDA: <?php echo $te['qdtentp'] ?></td>
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
                                                <th scope="col">Data de Expedição</th>
                                                <th scope="col">Nota Fiscal</th>
                                                <th scope="col">Quantidade</th>
                                                <th scope="col">Fornecedor / CNPJ</th>
                                                <th scope="col">Transportadora</th>
                                                <th scope="col" class="d-print-none" colspan="2">Ação</th>
                                            </tr>
                                        </thead>
                                        <?php
                                        if ($entrada == false) {
                                            ?>
                                            <tr>
                                                <td colspan="8">Não possui recebimento lançado deste Produto</td>
                                            </tr>                
                                            <?php
                                        } else {
                                            $q = 1;
                                            foreach ($entrada as $e) {
                                                ?>
                                                <tr>
                                                    <th scope="row"><?php echo $q++; ?></th>
                                                    <td><?php echo $e['dtexp'] ?></td>
                                                    <td><?php echo $e['nota'] ?></td>
                                                    <td><?php echo $e['quant'] ?></td>
                                                    <td><?php echo $e['nome_fornecedor'] . "<br>" . $e['cnpj_fornecedor'] ?></td>
                                                    <td><?php echo $e['transp'] ?></td>
                                                    <td class="d-print-none" title="Alterar"><a href="alt_entrada_produto.php?k=<?php echo $e['id'] ?>" onclick="return confirm('Deseja alterar Informações deste Produto?')"><img src="../_assets/_img/pencil.png" /></a></td>
                                                    <td class="d-print-none" title="Excluir"><a href="del_entrada_produto.php?k=<?php echo $e['id'] ?>" onclick="return confirm('Deseja excluir Produto?')"><img src="../_assets/_img/cancel.png" /></a></td>
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
                                                <th scope="col">Data de Expedição</th>
                                                <th scope="col">Guia</th>
                                                <th scope="col">Quantidade</th>
                                                <th scope="col">Cliente</th>
                                                <th scope="col">Transportadora</th>
                                                <th scope="col" class="d-print-none" colspan="2">Ação</th>
                                            </tr>
                                        </thead>
                                        <?php
                                        if ($entrada == false) {
                                            ?>
                                            <tr>
                                                <td colspan="8">Não possui expedição lançada deste Produto</td>
                                            </tr>                
                                            <?php
                                        } else {
                                            $q = 1;
                                            foreach ($saida as $e) {
                                                ?>
                                                <tr>
                                                    <th scope="row"><?php echo $q++; ?></th>
                                                    <td><?php echo $e['dtsai'] ?></td>
                                                    <td><?php echo $e['guia'] ?></td>
                                                    <td><?php echo $e['quant'] ?></td>
                                                    <td><?php echo $e['nome_cliente'] ?></td>
                                                    <td><?php echo $e['transp'] ?></td>
                                                    <td class="d-print-none" title="Alterar"><a href="alt_produto.php?p=<?php echo $e['id'] ?>" onclick="return confirm('Deseja alterar Informações deste Produto?')"><img src="../_assets/_img/pencil.png" /></a></td>
                                                    <td class="d-print-none" title="Excluir"><a href="del_produto.php?p=<?php echo $e['id'] ?>" onclick="return confirm('Deseja excluir Produto?')"><img src="../_assets/_img/cancel.png" /></a></td>
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
                                                <td class="col-6 mr-auto">QUANTIDADE EXPEDIDA: <?php echo $ts['qdtsaip'] ?></td>
                                                <td>CONFERIDO POR:</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-5 d-print-none"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
                            <button class="btn btn-primary d-print-none" onclick="print()">Imprimir</button>
                        </div>
                        <?php
                    }
                }
            }
        }
    }
    require_once 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
