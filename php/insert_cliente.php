<?php
try {

    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once 'header.php'
    ?>
    <div class="row">
        <div class="col-12">
            <h3 class="h3 text-center bg-dark text-light">Cadastro Clientes</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-1"></div>
        <form style="padding: 2%;" class="col-10 border border-secondary" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" autocomplete="on">
            <div class="form-row">
                <div class="form-group col-md-7">
                    <label for="nome">Cliente</label>
                    <input class="form-control" type="text" id="nome" name="nome_cliente" maxlength="100" required autofocus placeholder="Cliente">
                </div>
                <div class="form-group col-md-5">
                    <label for="Email">Email</label>
                    <input class="form-control" type="email" id="Email" name="email_cliente" maxlength="50" placeholder="Email">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="Telefone">Telefone</label>
                    <input class="form-control" type="tel" id="Telefone" name="telefone_cliente" maxlength="11" placeholder="Telefone" pattern="[0-9]{6}-[0-9]{4}">
                    <small>Formato: 212222-2222</small>
                </div>
                <div class="form-group col-md-6">
                    <label for="Celular">Celular</label>
                    <input class="form-control" type="tel" id="Celular" maxlength="12" placeholder="Celular" name="celular_cliente" pattern="[0-9]{7}-[0-9]{4}">
                    <small>Formato: 2199999-9999</small>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="endereco">Endereço</label>
                    <textarea class="form-control" id="endereco" name="endereco_cliente" placeholder="Endereço" maxlength="500"></textarea>
                    <small>Max: 500 caractéres</small>
                </div>
            </div>
            <button type="submit" name="btcadcliente" class="btn btn-primary" onclick="return confirm('Os dados estão corretos?')">Cadastrar</button>
            <button type="reset" class="btn btn-danger">Limpar</button>
        </form>
        <div class="col-1"></div>
    </div>
    <div class="row">
        <div class="col-12"><a href="list_cliente.php"><img src="../_assets/_img/table_go.png" /> Lista Clientes</a></div>
    </div>
    </div>
    <?php
    include 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
