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
            <h3 class="h3 text-center bg-dark text-light">Produtos</h3>
        </div>
    </div>
    <div class="row navbar">
        <div class="col-4 mr-auto"><a href="insert_produto.php"><img src="../_assets/_img/package_add.png" /> adicionar</a></div>
        <div class="col-auto">
            <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="get" class="form-inline">
                <input class="form-control mr-sm-2" type="search" placeholder="produto, lote, apresentação" name="p" aria-label="Search">
                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" name="btpesq">Pesquisar</button>
            </form>
        </div>
    </div>
    <div class="row">
    </div>
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
                        <th scope="col" colspan="3">Rastreamento</th>
                        <th scope="col">Em estoque</th>
                        <th scope="col" colspan="2">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if (isset($_GET['p'])) {
                        $pagina = (isset($_GET['pagina'])) ? (int) $_GET['pagina'] : 1;
                        $maxlinks = 4;
                        $maximo = 10;
                        $inicio = (($maximo * $pagina) - $maximo);

                        //a pesquisa em si
                        $pesq = addslashes($_GET['p']);

                        //pra saber quantidade total de registros com aquela pesquisa
                        $total = Paginacao("SELECT id_produto FROM cw_produto "
                                . "WHERE nome_produto LIKE '%{$pesq}%' "
                                . "OR `lote_produto` LIKE '%{$pesq}%' "
                                . "OR fabricacao_produto LIKE '%{$pesq}%' "
                                . "OR `validade_produto` LIKE '%{$pesq}%' "
                                . "OR `apresentacao_produto` LIKE '%{$pesq}%'");

                        //pega a quantidade de registros com LIMIT
                        $produto = DBRead('produto', "WHERE `nome_produto` LIKE '%{$pesq}%'"
                                . " OR `lote_produto`  LIKE '%{$pesq}%'"
                                . " OR fabricacao_produto LIKE '%{$pesq}%'"
                                . " OR `validade_produto`  LIKE '%{$pesq}%'"
                                . " OR `apresentacao_produto`  LIKE '%{$pesq}%'"
                                . " ORDER BY validade_produto, "
                                . "lote_produto, "
                                . "nome_produto LIMIT {$inicio}, {$maximo}", "id_produto as id,"
                                . "nome_produto as nome,"
                                . "lote_produto as lote,"
                                . "apresentacao_produto as ap,"
                                . "estoque_produto as est,"
                                . "DATE_FORMAT(fabricacao_produto, '%d/%m/%Y') as dtf,"
                                . "DATE_FORMAT(validade_produto, '%d/%m/%Y') as dtv");

                        //quantidade de nº de paginas na paginação 
                        $total_paginas = ceil($total / $maximo);

                        //verifica se acha alguma coisa
                        if ($produto == false) {
                            ?>
                            <tr>
                                <td colspan="11">Não existem produtos cadastrados com esta pesquisa!</td>
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
                                    <td title="Entrada"><a href="entrada_produto.php?p=<?php echo $a['id'] ?>" onclick="return confirm('Deseja dar entrada deste Produto no estoque?')"><img src="../_assets/_img/application_form_add.png" /></a></td>
                                    <td title="Saída"><a href="saida_produto.php?p=<?php echo $a['id'] ?>" onclick="return confirm('Deseja dar saída deste Produto no estoque?')"><img src="../_assets/_img/application_form_delete.png" /></a></td>
                                    <td title="Gerar"><a href="rastreamento.php?p=<?php echo $a['id'] ?>" onclick="return confirm('Deseja fazer rastreamento do Produto?')"><img src="../_assets/_img/application_form.png" /></a></td>
                                    <?php if ($a['est'] == 0) { ?>
                                    <td title="Incluir no estoque"><a href="?i=<?php echo $a['id'] . "&v=1" ?>" onclick="return confirm('Deseja incluir este produto no estoque?')"><img src="../_assets/_img/package_go.png" /></a></td>
                                    <?php } else { ?>
                                        <td title="Em estoque"><img src="../_assets/_img/check.ico" /></td>
                                    <?php } ?>
                                        <td title="Alterar"><a href="alt_produto.php?p=<?php echo $a['id'] ?>" onclick="return confirm('Deseja alterar Informações deste Produto?')"><img src="../_assets/_img/pencil.png" /></a></td>
                                    <td title="Excluir"><a href="del_produto.php?p=<?php echo $a['id'] ?>" onclick="return confirm('Deseja excluir Produto?')"><img src="../_assets/_img/cancel.png" /></a></td>
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
                                <a class="page-link" href="<?php echo $_SERVER['PHP_SELF'] . "?p=" . $pesq . "&pagina=1" ?>">
                                    Início
                                </a>
                            </li>
                            <?php
                            for ($i = $pagina - $maxlinks; $i <= $pagina - 1; $i++) {
                                if ($i >= 1) {
                                    ?>
                                    <li class="page-item"><a class="page-link" href="<?php echo "?pagina=" . $i . "&p=" . $pesq ?>"><?php echo $i; ?></a></li>
                                    <?php
                                }
                            }
                            ?>
                            <li class="page-item active"><a class="page-link"><?php echo $pagina; ?><span class="sr-only">(current)</span></a></li>
                            <?php
                            for ($i = $pagina + 1; $i <= $total_paginas + $maxlinks; $i++) {
                                if ($i <= $total_paginas) {
                                    ?>
                                    <li class="page-item"><a class="page-link" href="<?php echo "?pagina=" . $i . "&p=" . $pesq ?>"><?php echo $i; ?></a></li>
                                    <?php
                                }
                            }
                            ?>
                            <li class="page-item">
                                <a class="page-link" href="<?php echo "?p=" . $pesq . "&pagina=" . $total_paginas; ?>">
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
    require_once 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}