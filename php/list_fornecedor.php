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
            <h3 class="h3 text-center bg-dark text-light">Fornecedores</h3>
        </div>
    </div>
    <div class="row navbar">
        <div class="col-4 mr-auto"><a href="insert_fornecedor.php"><img src="../_assets/_img/user_add.png" /> adicionar</a></div>
        <div class="col-auto">
            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="get" class="form-inline">
                <input class="form-control mr-sm-2" type="search" placeholder="fornecedor, cnpj, celular" name="p" aria-label="Search">
                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" name="btpesq">Pesquisar</button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="table-responsive  col-12">
            <table style="text-align: center;" class="table table-sm table-hover table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th scope="row">#</th>
                        <th scope="col">Nome / Empresa</th>
                        <th scope="col">CNPJ</th>
                        <th scope="col">Email</th>
                        <th scope="col">Telefone</th>
                        <th scope="col">Celular</th>
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
                        $total = Paginacao("SELECT * FROM cw_fornecedor "
                                . "WHERE nome_fornecedor LIKE '%{$pesq}%' "
                                . "OR endereco_fornecedor LIKE '%{$pesq}%' "
                                . "OR telefone_fornecedor LIKE '%{$pesq}%' "
                                . "OR celular_fornecedor LIKE '%{$pesq}%' "
                                . "OR email_fornecedor LIKE '%{$pesq}%' "
                                . "OR cnpj_fornecedor LIKE '%{$pesq}%'");

                        $fornecedor = DBRead("fornecedor", "WHERE nome_fornecedor LIKE '%{$pesq}%' "
                                . "OR endereco_fornecedor LIKE '%{$pesq}%' "
                                . "OR telefone_fornecedor LIKE '%{$pesq}%' "
                                . "OR celular_fornecedor LIKE '%{$pesq}%' "
                                . "OR email_fornecedor LIKE '%{$pesq}%' "
                                . "OR cnpj_fornecedor LIKE '%{$pesq}%' "
                                . "ORDER BY nome_fornecedor LIMIT {$inicio}, {$maximo}");

                        //quantidade de nº de paginas na paginação 
                        $total_paginas = ceil($total / $maximo);

                        if ($fornecedor == false) {
                            ?>
                            <tr>
                                <td colspan="9">Não existem fornecedores com esta pesquisa!</td>
                            </tr>                
                            <?php
                        } else {
                            $q = 1;
                            foreach ($fornecedor as $a) {
                                ?>
                                <tr>
                                    <th scope="row"><?php echo $q++; ?></th>
                                    <td><?php echo $a['nome_fornecedor'] ?></td>
                                    <td><?php echo $a['cnpj_fornecedor'] ?></td>
                                    <td><?php echo $a['email_fornecedor'] ?></td>
                                    <td><?php echo $a['telefone_fornecedor'] ?></td>
                                    <td><?php echo $a['celular_fornecedor'] ?></td>
                                    <td title="Alterar"><a href="alt_fornecedor.php?f=<?php echo $a['id_fornecedor'] ?>" onclick="return confirm('Deseja alterar Informações deste Fornecedor?')"><img src="../_assets/_img/lupa.ico" /></a></td>
                                    <td title="Excluir"><a href="del_fornecedor.php?f=<?php echo $a['id_fornecedor'] ?>" onclick="return confirm('Deseja excluir Fornecedor?')"><img src="../_assets/_img/cancel.png" /></a></td>
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