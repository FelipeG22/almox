<?php
try {
    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once 'header.php';
    ?>

    <div class="row">
        <div class="col-12">
            <h3 class="h3 text-center bg-dark text-light">Estoque</h3>
        </div>
    </div>
    <?php if ($_SESSION['nivel'] == 1) { ?>
        <div class="row">
            <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
        </div>
    <?php } ?>

    <div class="row">
        <div class="table-responsive  col-12">
            <table style="text-align: center;" class="table table-sm table-hover table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th scope="row">#</th>
                        <th scope="col">Produto</th>
                        <th scope="col">Lote</th>
                        <th scope="col">Apresentação</th>
                        <th scope="col">Fabricação</th>
                        <th scope="col">Validade</th>
                        <th scope="col">Em estoque</th>
                        <?php if ($_SESSION['nivel'] == 1) { ?>
                            <th scope="col">Ação</th>
                        <?php } ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $pagina = (isset($_GET['pagina'])) ? (int) $_GET['pagina'] : 1;
                    $maxlinks = 4;
                    $maximo = 10;
                    $inicio = (($maximo * $pagina) - $maximo);

                    //pra saber quantidade total de registros
                    $total = Paginacao("SELECT id_produto FROM cw_produto WHERE estoque_produto = '1'");

                    //pega a quantidade de registros com LIMIT
                    $produto = DBRead('produto p', " LEFT JOIN cw_saida_produto s on p.id_produto = s.id_produto "
                            . "LEFT JOIN cw_entrada_produto e on p.id_produto = e.id_produto "
                            . "WHERE p.estoque_produto = '1'"
                            . "GROUP BY p.id_produto ORDER BY p.validade_produto, p.lote_produto, p.nome_produto LIMIT {$inicio}, {$maximo}", "p.id_produto as id,"
                            . "p.nome_produto as nome,"
                            . "p.id_produto as id,"
                            . "p.lote_produto as lote,"
                            . "p.apresentacao_produto as ap,"
                            . "DATE_FORMAT(p.fabricacao_produto, '%d/%m/%Y') as dtf,"
                            . "DATE_FORMAT(p.validade_produto, '%d/%m/%Y') as dtv,"
                            . "SUM(e.quantidade_entrada_produto) as ent,"
                            . "SUM(s.quantidade_saida_produto) as sai");

                    //quantidade de nº de paginas na paginação 
                    $total_paginas = ceil($total / $maximo);

                    //verifica se acha alguma coisa
                    if ($produto == false) {
                        ?>
                        <tr>
                            <td colspan="11">Não existem produtos no estoque!</td>
                        </tr>                
                        <?php
                    } else {
                        $q = 1;
                        foreach ($produto as $a) {
                            ?>
                            <tr>
                                <th scope="row"><?php echo $q++; ?></th>
                                <td><?php echo $a['nome'] ?></td>
                                <td><?php echo $a['lote'] ?></td>
                                <td><?php echo $a['ap'] ?></td>
                                <td><?php echo $a['dtf'] ?></td>
                                <td><?php echo $a['dtv'] ?></td>
                                <td><?php echo ($a['ent'] - $a['sai']) ?></td>
                                <?php if ($_SESSION['nivel'] == 1) { ?>
                                <td title="Retirar do estoque"><a href="<?php echo $_SERVER['PHP_SELF'] . "?i=" . $a['id'] . "&v=0"; ?>" onclick="return confirm('Deseja retirar o produto do estoque?')"><img src="../_assets/_img/box.png" /></a></td>
                                <?php } ?>
                            </tr>
                            <?php
                        }
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
    <?php
    if ($total > $maximo) {
        ?>
        <div class="row">
            <div class="col ml-auto" ></div>
            <div class="col">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="<?php echo "?pagina=1" ?>">
                                Início
                            </a>
                        </li>
                        <?php
                        for ($i = $pagina - $maxlinks; $i <= $pagina - 1; $i++) {
                            if ($i >= 1) {
                                ?>
                                <li class="page-item"><a class="page-link" href="<?php echo "?pagina=" . $i ?>"><?php echo $i; ?></a></li>
                                <?php
                            }
                        }
                        ?>
                        <li class="page-item active"><a class="page-link"><?php echo $pagina; ?><span class="sr-only">(current)</span></a></li>
                        <?php
                        for ($i = $pagina + 1; $i <= $total_paginas + $maxlinks; $i++) {
                            if ($i <= $total_paginas) {
                                ?>
                                <li class="page-item"><a class="page-link" href="<?php echo "?pagina=" . $i ?>"><?php echo $i; ?></a></li>
                                <?php
                            }
                        }
                        ?>
                        <li class="page-item">
                            <a class="page-link" href="<?php echo "?pagina=" . $total_paginas; ?>">
                                Fim
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col mr-auto" ></div>
        </div>
        <?php
    }

    require_once 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}