<?php
try {
    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once 'header.php';
    
    Acesso(3);
    ?>

    <div class="row">
        <div class="col-12">
            <h3 class="h3 text-center bg-dark text-light">Estoque</h3>
        </div>
    </div>
    <?php if ($_SESSION['nivel'] < 3) { ?>
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
                        <th scope="col">Em estoque</th>
                        <?php if ($_SESSION['nivel'] < 3) { ?>
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
                    $total = Paginacao("SELECT id_produto FROM estoque_final WHERE em_estoque = '1'");

                    //pega a quantidade de registros com LIMIT
                    //nome do produto = nome,
                    //id do produto = id,
                    //lote do produto = lote,
                    //apresentacao_produto = ap,
                    //fabricacao_produto = dtf,
                    //validade_produto = dtv,
                    //soma das entradas do produto = ent,
                    //soma das saidas do produto = sai");

                    $produto = DBView("estoque_final", " WHERE em_estoque = '1' LIMIT {$inicio}, {$maximo}");

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
                                <td><?php echo $a['produto'] ?></td>
                                <td><?php echo ($a['total_entrada'] - $a['total_saida']) ?></td>
                                <?php if ($_SESSION['nivel'] < 3) { ?>
                                    <td title="Retirar do estoque"><a href="?i=<?php echo $a['id_produto'] . "&v=0" ?>" onclick="return confirm('Deseja retirar o produto do estoque?')"><img src="../_assets/_img/box.png" /></a></td>
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