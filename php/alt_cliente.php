<?php
try {
    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';

    if (isset($_POST['btaltcliente'])) {
        $a = $_POST['id_cliente'];
        $altdados = array(
            'nome_cliente' => addslashes($_POST['nome_cliente']),
            'telefone_cliente' => addslashes($_POST['telefone_cliente']),
            'celular_cliente' => addslashes($_POST['celular_cliente']),
            'email_cliente' => addslashes($_POST['email_cliente']),
            'endereco_cliente' => addslashes($_POST['endereco_cliente'])
        );

        $deubomalt = DBUpdate('cliente', $altdados, "WHERE id_cliente = '{$a}'");

        if ($deubomalt){
            
            echo "<script language='JavaScript'>location.href='list_cliente.php'</script>";
            
        } else {
            echo "<script>alert('Erro ao alterar os dados!');</script>";
        }
    }

    if (!($_GET['c'])) {
        echo "<script language='JavaScript'>location.href='list_cliente.php'</script>";
    } else {
        $a = $_GET['c'];
        $alt_cliente = DBRead('cliente', " WHERE id_cliente = '{$a}'");
    }
    ?>
    <?php require_once 'header.php' ?>
    <?php
    if ($alt_cliente != FALSE) {
        foreach ($alt_cliente as $altc) {
            ?>
            <div class="row">
                <div class="col-12">
                    <h3 class="h3 text-center bg-dark text-light">Alterar Cliente</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <form style="padding: 2%;" class="col-10 border border-secondary" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" autocomplete="on">
                    <div class="form-row">
                        <div class="form-group col-md-7">
                            <input class="form-control" type="hidden" value="<?php echo $altc['id_cliente'] ?>" name="id_cliente">
                            <label for="nome">Cliente</label>
                            <input class="form-control" type="text" id="nome" value="<?php echo $altc['nome_cliente'] ?>" name="nome_cliente" maxlength="100" required autofocus placeholder="Cliente">
                        </div>
                        <div class="form-group col-md-5">
                            <label for="Email">Email</label>
                            <input class="form-control" type="email" id="Email" value="<?php echo $altc['email_cliente'] ?>" name="email_cliente" maxlength="50" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="Telefone">Telefone</label>
                            <input class="form-control" type="tel" id="Telefone" value="<?php echo $altc['telefone_cliente'] ?>" name="telefone_cliente" maxlength="11" placeholder="Telefone" pattern="[0-9]{6}-[0-9]{4}">
                            <small>Formato: 212222-2222</small>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="Celular">Celular</label>
                            <input class="form-control" type="tel" id="Celular" maxlength="12" placeholder="Celular" value="<?php echo $altc['celular_cliente'] ?>" name="celular_cliente" pattern="[0-9]{7}-[0-9]{4}">
                            <small>Formato: 2199999-9999</small>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="endereco">Endereço</label>
                            <textarea class="form-control" id="endereco" name="endereco_cliente" placeholder="Endereço" maxlength="500"><?php echo $altc['endereco_cliente'] ?></textarea>
                            <small>Max: 500 caractéres</small>
                        </div>
                    </div>
                    <button type="submit" name="btaltcliente" class="btn btn-primary">Alterar</button>
                </form>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-12"><a href="list_cliente.php"><img src="../_assets/_img/table_go.png" /> Lista Clientes</a></div>
            </div>
        <?php }
    } else {
        ?>
        <div class="row">
            <div class="col-12">
                <h3 class="h3 text-center text-primary">Cliente não existe!</h3>
            </div>
        </div>
    <?php } ?>
    </div>
    <?php
    require_once 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
