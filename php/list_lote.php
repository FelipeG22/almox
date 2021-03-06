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
            <h3 class="h3 text-center bg-dark text-light">Lotes</h3>
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
            <div class="row navbar">
                <div class="col-auto"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
                <?php foreach ($prodlote as $pl) { ?>
                    <div class="col-auto"><a href="insert_lote.php?p=<?php echo $pl['id']; ?>"><img src="../_assets/_img/package_add.png" /> adicionar lote</a></div>
                </div>
                <div class = "row">
                    <div class = "col-12">
                        <h3 class = "h3 text-center bg-dark text-light"><?php echo $pl['produto']; ?></h3>
                    </div>
                </div>
            <?php } ?>
            <div class="row">
                <div class="col mr-auto"></div>
                <div class="col-auto">
                    <div>Legenda: <img src="../_assets/_img/pencil.png" /> Alterar <img src="../_assets/_img/cancel.png" /> Excluir</div>
                </div>
            </div>
            <div class="row">
                <div class="table-responsive  col-12">
                    <table style="text-align: center;" class="table table-sm table-hover table-striped table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="row">#</th>
                                <th scope="col">Lote</th>
                                <th scope="col">Fabricação</th>
                                <th scope="col">Validade</th>
                                <th scope="col" colspan="3">Rastreamento</th>
                                <th scope="col">Em estoque</th>
                                <?php if ($_SESSION['nivel'] == 1) { ?>
                                    <th scope="col" colspan="2">Ação</th>
                                <?php } ?>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $pagina = (isset($_GET['pagina'])) ? (int) $_GET['pagina'] : 1;
                            $maxlinks = 4;
                            $maximo = 10;
                            $inicio = (($maximo * $pagina) - $maximo);

                            //pra saber quantidade total de registros com aquela pesquisa
                            $total = Paginacao("SELECT id_produto FROM estoque "
                                    . "WHERE id_produto = '{$p}'");

                            //pega a quantidade de registros com LIMIT
                            $produto = DBView('estoque', "WHERE id_produto = '{$p}' ORDER BY lote DESC LIMIT {$inicio}, {$maximo}", "id_produto as id,"
                                    . "id_lote, "
                                    . "lote, "
                                    . "em_estoque as est, "
                                    . "DATE_FORMAT(dtf, '%d/%m/%Y') as dtf, "
                                    . "DATE_FORMAT(dtv, '%d/%m/%Y') as dtv, "
                                    . "total_entrada as ent, "
                                    . "total_saida as sai");

                            //quantidade de nº de paginas na paginação 
                            $total_paginas = ceil($total / $maximo);

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
                                        <td title="Entrada"><a href="entrada_produto.php?p=<?php echo $a['id_lote'] ?>" onclick="return confirm('Deseja dar entrada deste Lote no estoque?')"><img src="../_assets/_img/application_form_add.png" /></a></td>
                                        <td title="Saída"><a href="saida_produto.php?p=<?php echo $a['id_lote'] ?>" onclick="return confirm('Deseja dar saída deste Lote no estoque?')"><img src="../_assets/_img/application_form_delete.png" /></a></td>
                                        <td title="Gerar"><a href="rastreamento.php?p=<?php echo $a['id_lote']; ?>" onclick="return confirm('Deseja fazer rastreamento deste Lote?')"><img src="../_assets/_img/application_form.png" /></a></td>
                                        <td><?php echo number_format($a['ent'] - $a['sai'], null, '', '.') ?></td>
                                        <?php if ($_SESSION['nivel'] == 1) { ?>
                                            <td title="Alterar"><a href="alt_lote.php?p=<?php echo $a['id_lote'] ?>" onclick="return confirm('Deseja alterar Informações deste lote?')"><img src="../_assets/_img/pencil.png" /></a></td>
                                            <td title="Excluir"><a href="del_lote.php?p=<?php echo $a['id_lote'] ?>" onclick="return confirm('Deseja excluir Lote?')"><img src="../_assets/_img/cancel.png" /></a></td>
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
                                    <a class="page-link" href="<?php echo $_SERVER['PHP_SELF'] . "?p=" . $p . "&pagina=1" ?>">
                                        Início
                                    </a>
                                </li>
                                <?php
                                for ($i = $pagina - $maxlinks; $i <= $pagina - 1; $i++) {
                                    if ($i >= 1) {
                                        ?>
                                        <li class="page-item"><a class="page-link" href="<?php echo "?pagina=" . $i . "&p=" . $p ?>"><?php echo $i; ?></a></li>
                                        <?php
                                    }
                                }
                                ?>
                                <li class="page-item active"><a class="page-link"><?php echo $pagina; ?><span class="sr-only">(current)</span></a></li>
                                <?php
                                for ($i = $pagina + 1; $i <= $total_paginas + $maxlinks; $i++) {
                                    if ($i <= $total_paginas) {
                                        ?>
                                        <li class="page-item"><a class="page-link" href="<?php echo "?pagina=" . $i . "&p=" . $p ?>"><?php echo $i; ?></a></li>
                                        <?php
                                    }
                                }
                                ?>
                                <li class="page-item">
                                    <a class="page-link" href="<?php echo "?p=" . $p . "&pagina=" . $total_paginas; ?>">
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
        }
    }
    require_once 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}