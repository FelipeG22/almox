<?php
try {
    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';

    $fornecedor = DBRead('fornecedor', 'ORDER BY nome_fornecedor');
    ?>
    <?php include 'header.php' ?>
    <div class="row">
        <div class="col-12">
            <h3 class="h3 text-center bg-dark text-light">Lista de Fornecedores</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-12"><a href="insert_fornecedor.php"><img src="../_assets/_img/user_add.png" /> adicionar</a></div>
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
                        <th scope="col">Endereço</th>
                        <th scope="col" colspan="2">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($fornecedor == false) { ?>
                        <tr>
                            <td colspan="9">Não existem fornecedores cadastrados!</td>
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
                                <td><?php echo $a['endereco_fornecedor'] ?></td>
                                <td title="Alterar"><a href="alt_fornecedor.php?f=<?php echo $a['id_fornecedor'] ?>" onclick="return confirm('Deseja alterar Informações deste Fornecedor?')"><img src="../_assets/_img/pencil.png" /></a></td>
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
    </div>
    <?php
    include 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}