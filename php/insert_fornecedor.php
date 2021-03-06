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
            <h3 class="h3 text-center bg-dark text-light">Cadastro Fornecedor</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-1"></div>
        <form style="padding: 2%;" class="col-10 border border-secondary" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" autocomplete="on">
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="nome">Nome / Empresa</label>
                    <input class="form-control" type="text" id="nome" name="nome_fornecedor" maxlength="100" required autofocus placeholder="Nome / Empresa">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="Telefone">Telefone</label>
                    <input class="form-control" type="tel" id="Telefone" name="telefone_fornecedor" maxlength="14" placeholder="telefone">
                    <small>Formato: (21) 2222-2222</small>
                </div>
                <div class="form-group col-md-6">
                    <label for="Celular">Celular</label>
                    <input class="form-control" type="tel" id="Celular" name="celular_fornecedor" maxlength="15" placeholder="celular">
                    <small>Formato: (21) 99999-9999</small>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="Email">Email</label>
                    <input class="form-control" type="email" id="Email" maxlength="50" placeholder="Email" name="email_fornecedor">
                </div>
                <div class="form-group col-md-6">
                    <label for="CNPJ">CNPJ</label>
                    <input class="form-control data-mask " type="text" id="CNPJ" maxlength="18" placeholder="CNPJ" name="cnpj_fornecedor" required>
                    <small>Formato: 111.111.11/1111-11</small>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-12" >
                    <label for="ende">Endereço</label>
                    <textarea class="form-control" id="ende" name="endereco_fornecedor" placeholder="Endereço" maxlength="500" required></textarea>
                    <small>Max: 500 caractéres</small>
                </div>
            </div>
            <button type="submit" name="btcadfornecedor" class="btn btn-primary" onclick="return confirm('Os dados estão corretos?')">Cadastrar</button>
            <button type="reset" class="btn btn-danger">Limpar</button>
        </form>
        <div class="col-1"></div>
    </div>
    <div class="row">
        <div class="col-12"><a href="list_fornecedor.php"><img src="../_assets/_img/table_go.png" />lista de Fornecedores</a></div>
    </div>
    </div>
    <?php
    include 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
