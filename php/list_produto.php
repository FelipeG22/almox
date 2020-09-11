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
            <h3 class="h3 text-center bg-dark text-light">Produtos</h3>
        </div>
    </div>
    <div class="row navbar">
        <div class="col mr-auto"></div>
        <div class="col-auto">
            <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="get" class="form-inline">
                <input class="form-control mr-sm-2" autofocus type="search" placeholder="Produto" name="p" aria-label="Search">
                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Pesquisar</button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-4 mr-auto"><a href="insert_produto.php"><img src="../_assets/_img/package_add.png" /> adicionar</a></div>
        <div class="col-auto">
            <div>Legenda: 
                <img src="../_assets/_img/lupa.ico" /> Visualizar Lotes 
                <img src="../_assets/_img/script.png" /> Relatório 
                <img src="../_assets/_img/pencil.png" /> Alterar 
                <img src="../_assets/_img/cancel.png" /> Excluir</div>
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
                        <th scope="col" colspan="2" >Em estoque</th>
                        <?php if ($_SESSION['nivel'] == 1) { ?>
                            <th scope="col" colspan="4">Ação</th>
                        <?php } else { ?>
                            <th scope="col">Ação</th>
                        <?php } ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
			if (!isset($_GET['p'])){
			?>
			<tr>
				<td colspan="11">Faça uma pesquisa dos produtos!</td>
                        </tr>
			<?php 
			}else
                    if (isset($_GET['p'])) {
                        $pagina = (isset($_GET['pagina'])) ? (int) $_GET['pagina'] : 1;
                        $maxlinks = 4;
                        $maximo = 10;
                        $inicio = (($maximo * $pagina) - $maximo);

                        //a pesquisa em si
                        $pesq = addslashes($_GET['p']);

                        //pra saber quantidade total de registros com aquela pesquisa
                        $total = Paginacao("SELECT id_produto FROM estoque_final WHERE `produto` LIKE '%{$pesq}%'");

                        //pega a quantidade de registros com LIMIT
                        $produto = DBView('estoque_final', "WHERE `produto` LIKE '%{$pesq}%'"
                                . " ORDER BY produto LIMIT {$inicio}, {$maximo}", "id_produto as id, "
                                . "produto, "
                                . "total_entrada as ent, "
                                . "total_saida as sai, "
                                . "em_estoque as est");

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
                                    <td><?php echo $a['produto'] ?></td>
                                    <td><?php echo number_format($a['ent'] - $a['sai'], null, '','.') ?></td>
                                    <?php if ($a['est'] == 0) { ?>
                                        <td title="Incluir no estoque"><a href="?i=<?php echo $a['id'] . "&v=1" ?>" onclick="return confirm('Deseja incluir este produto no estoque?')"><img src="../_assets/_img/package_go.png" /></a></td>
                                    <?php } else { ?>
                                        <td title="Em estoque"><img src="../_assets/_img/check.ico" /></td>
                                    <?php } ?>
                                    <td title="Visualizar"><a href="list_lote.php?p=<?php echo $a['id'] ?>" onclick="return confirm('Deseja visualizar os lotes deste produto?')"><img src="../_assets/_img/lupa.ico" /></a></td>
                                    <?php if ($_SESSION['nivel'] == 1) { ?>
                                        <td title="Relatório"><a href="relatorio_produto.php?p=<?php echo $a['id'] ?>" onclick="return confirm('Deseja visualizar Relatório do Produto?')"><img src="../_assets/_img/script.png" /></a></td>
                                        <td title="Alterar"><a href="alt_produto.php?p=<?php echo $a['id'] ?>" onclick="return confirm('Deseja alterar Informações deste Produto?')"><img src="../_assets/_img/pencil.png" /></a></td>
                                        <td title="Excluir"><a href="del_produto.php?p=<?php echo $a['id'] ?>" onclick="return confirm('Deseja excluir Produto?')"><img src="../_assets/_img/cancel.png" /></a></td>
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