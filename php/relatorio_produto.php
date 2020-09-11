<?php
try {
    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once './header.php';

    Acesso(2);
    ?>

    <div class="row">
        <div class="col-12">
            <h3 class="h3 text-center bg-dark text-light d-print-none">Relatório do Produto</h3>
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
            <div class="d-none d-block d-print-block">
                <div class="row">
                    <div class="table-responsive col-12">
                        <table style="text-align: center;" class="table table-sm table-bordered">
                            <tbody>
                                <tr>
                                    <td><img class="d-print-table-cell" src="../_assets/_img/lqfex_logo.png" width="50" height="63" alt="" loading="lazy" ></td>
                                    <td>
                                        <p><b>LABORATÓRIO QUÍMICO FARMACÊUTICO DO EXÉRCITO<br>RELATÓRIO DE PRODUTO TERMINADO</b></p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <?php foreach ($prodlote as $pl) { ?>
                    <div class = "row">
                        <div class = "col-12">
                            <h3 class = "h3 text-center bg-dark text-light">PRODUTO</h3>
                        </div>
                    </div>
                    <div class = "row">
                        <div class = "col-12">
                            <h3 class = "h3 text-center border"><?php echo $pl['produto']; ?></h3>
                        </div>
                    </div>
                <?php } ?>
                <div class="row">
                    <div class="table-responsive  col-12">
                        <table style="text-align: center;" class="table table-sm table-hover table-striped table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="row">#</th>
                                    <th scope="col">Lote</th>
                                    <th scope="col">Fabricação</th>
                                    <th scope="col">Validade</th>
                                    <th scope="col">Em estoque</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                //pega a quantidade de registros com LIMIT
                                $produto = DBView('estoque', "WHERE id_produto = '{$p}' ORDER BY lote", "id_produto as id,"
                                        . "id_lote, "
                                        . "lote, "
                                        . "DATE_FORMAT(dtf, '%d/%m/%Y') as dtf, "
                                        . "DATE_FORMAT(dtv, '%d/%m/%Y') as dtv, "
                                        . "total_entrada as ent, "
                                        . "total_saida as sai");

                                //verifica se acha alguma coisa
                                if ($produto == false) {
                                    ?>
                                    <tr>
                                        <td colspan="12">Não existem lotes cadastrados com este produto!</td>
                                    </tr>                
                                    <?php
                                } else {
                                    $q = 1;
                                    foreach ($produto as $a) {
                                        ?>
                                        <tr>
                                            <th scope="row"><?php echo $q++; ?></th>
                                            <td><?php echo $a['lote'] ?></td>
                                            <td><?php echo $a['dtf'] ?></td>
                                            <td><?php echo $a['dtv'] ?></td>
                                            <td><?php echo number_format($a['ent'] - $a['sai'], null, '', '.') ?></td>
                                        </tr>
                                        <?php
                                    }
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="table-responsive d-print-table col-12">
                        <table class="table table-sm table-bordered">
                            <tbody>
                                <tr>
                                    <?php
                                    $final = DBView("estoque_final", "WHERE id_produto = {$p}", "total_entrada as ent, total_saida as sai");
                                    foreach ($final as $f) {
                                        ?>
                                    <td class="col text-center">TOTAL EM ESTOQUE: <?php echo number_format($f['ent'] - $f['sai'], null, '','.') ?></td>
                                    <?php } ?>
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