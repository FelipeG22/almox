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
            <h3 class="h3 text-center bg-dark text-light">Cadastro de Produtos</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-1"></div>
        <form style="padding: 2%;" class="col-10 border border-secondary" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" autocomplete="on">
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="nome">Produto</label>
                    <input class="form-control" type="text" id="nome" name="nome_produto" maxlength="100" required autofocus placeholder="Produto">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="Lote">Lote</label>
                    <input class="form-control" type="text" id="Lote" name="lote_produto" maxlength="30" placeholder="Lote" required>
                </div>
                <div class="form-group col-md-8">
                    <label for="apres">Apresentação</label>
                    <input class="form-control" type="text" id="apres" maxlength="100" placeholder="Apresentação" name="apresentacao_produto" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="fabricacao">Fabricação</label>
                    <input class="form-control" type="date" id="fabricacao" name="fabricacao_produto" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="validade">Validade</label>
                    <input class="form-control" type="date" id="validade" name="validade_produto" required>
                </div>
            </div>
            <button type="submit" name="btcadproduto" class="btn btn-primary" onclick="return confirm('Os dados estão corretos?')">Cadastrar</button>
            <button type="reset" class="btn btn-danger">Limpar</button>
        </form>
        <div class="col-1"></div>
    </div>
    <div class="row">
        <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
    </div>
    </div>
    <?php
    include 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
