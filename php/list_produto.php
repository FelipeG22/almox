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
            <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" class="form-inline">
                <input class="form-control mr-sm-2" type="search" required placeholder="produto, lote, apresentação" name="pesq" aria-label="Search">
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
                        <th scope="col" colspan="2">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    
                    if (isset($_POST['btpesq'])) {
                        $pesq = $_POST['pesq'];
                        $produto = DBRead('produto', "WHERE `nome_produto` LIKE '%{$pesq}%'"
                                . " OR `lote_produto`  LIKE '%{$pesq}%'"
                                . " OR `fabricacao_produto`  LIKE '%{$pesq}%'"
                                . " OR `validade_produto`  LIKE '%{$pesq}%'"
                                . " OR `apresentacao_produto`  LIKE '%{$pesq}%'"
                                . " ORDER BY `nome_produto`");
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
                                    <td><?php echo $a['nome_produto'] ?></td>
                                    <td><?php echo $a['lote_produto'] ?></td>
                                    <td><?php echo $a['apresentacao_produto'] ?></td>
                                    <td><?php echo date_format(date_create($a['fabricacao_produto']), "d/m/Y") ?></td>
                                    <td><?php echo date_format(date_create($a['validade_produto']), "d/m/Y") ?></td>
                                    <td title="Entrada"><a href="entrada_produto.php?p=<?php echo $a['id_produto'] ?>" onclick="return confirm('Deseja dar entrada deste Produto no Estoque?')"><img src="../_assets/_img/application_form_add.png" /></a></td>
                                    <td title="Saída"><a href="saida_produto.php?p=<?php echo $a['id_produto'] ?>" onclick="return confirm('Deseja excluir Produto?')"><img src="../_assets/_img/application_form_delete.png" /></a></td>
                                    <td title="Gerar"><a href="rastreamento.php?p=<?php echo $a['id_produto'] ?>" onclick="return confirm('Deseja fazer rastreamento do Produto?')"><img src="../_assets/_img/application_form.png" /></a></td>
                                    <td title="Alterar"><a href="alt_produto.php?p=<?php echo $a['id_produto'] ?>" onclick="return confirm('Deseja alterar Informações deste Produto?')"><img src="../_assets/_img/pencil.png" /></a></td>
                                    <td title="Excluir"><a href="del_produto.php?p=<?php echo $a['id_produto'] ?>" onclick="return confirm('Deseja excluir Produto?')"><img src="../_assets/_img/cancel.png" /></a></td>
                                </tr>
                                <?php
                            }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
        </div>
        <?php
    }
    require_once 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}