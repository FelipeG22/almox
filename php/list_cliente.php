<?php
try {
require_once 'head.php';
require_once '..\conexao\config.php';
require_once '..\conexao\conexao.php';
require_once '..\conexao\database.php';
?>
<?php require_once 'header.php' ?>
<div class="row">
    <div class="col-12">
        <h3 class="h3 text-center bg-dark text-light">Clientes</h3>
    </div>
</div>
<div class="row navbar">
    <div class="col-4 mr-auto"><a href="insert_cliente.php"><img src="../_assets/_img/user_add.png" /> adicionar</a></div>
    <div class="col-auto">
        <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" class="form-inline">
            <input class="form-control mr-sm-2" type="search" required placeholder="cliente, email, celular" name="pesq" aria-label="Search">
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
                    <th scope="col">Cliente</th>
                    <th scope="col">Email</th>
                    <th scope="col">Telefone</th>
                    <th scope="col">Celular</th>
                    <th scope="col">Endereço</th>
                    <th scope="col" colspan="2">Ação</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if (isset($_POST['btpesq'])) {
                $pesq = $_POST['pesq'];
                $cliente = DBRead('cliente', "WHERE `nome_cliente` LIKE '%{$pesq}%'"
                . " OR `endereco_cliente`  LIKE '%{$pesq}%'"
                . " OR `telefone_cliente`  LIKE '%{$pesq}%'"
                . " OR `celular_cliente`  LIKE '%{$pesq}%'"
                . " OR `email_cliente`  LIKE '%{$pesq}%'"
                . " ORDER BY `nome_cliente`");


                if ($cliente == false) {
                ?>
                <tr>
                    <td colspan="8">Não existem clientes com esta pesquisa!</td>
                </tr>                
                <?php
                } else {
                $q = 1;
                foreach ($cliente as $a) {
                ?>
                <tr>
                    <th scope="row"><?php echo $q++; ?></th>
                    <td><?php echo $a['nome_cliente'] ?></td>
                    <td><?php echo $a['email_cliente'] ?></td>
                    <td><?php echo $a['telefone_cliente'] ?></td>
                    <td><?php echo $a['celular_cliente'] ?></td>
                    <td><?php echo $a['endereco_cliente'] ?></td>
                    <td title="Alterar"><a href="alt_cliente.php?c=<?php echo $a['id_cliente'] ?>" onclick="return confirm('Deseja alterar Informações deste Cliente?')"><img src="../_assets/_img/pencil.png" /></a></td>
                    <td title="Excluir"><a href="del_cliente.php?c=<?php echo $a['id_cliente'] ?>" onclick="return confirm('Deseja excluir Cliente?')"><img src="../_assets/_img/cancel.png" /></a></td>
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