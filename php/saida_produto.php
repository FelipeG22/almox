<?php
try {

    require_once 'head.php';
    require_once '..\conexao\config.php';
    require_once '..\conexao\conexao.php';
    require_once '..\conexao\database.php';
    require_once 'header.php';
    
    Acesso(2);

//Se não tiver o get do id do produto, nem tenta
    if (!isset($_GET['p'])) {
        ?>
        <div class = "row">
            <div class = "col-12">
                <h3 class = "h3 text-center bg-dark text-light">Expedição de Produto</h3>
            </div>
        </div>
        <div class = "row">
            <div class = "col-12">
                <h3 class = "h3 text-center text-primary">Selecione um produto na lista de produtos</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
        </div>
        <?php
    } else {
//Tem o id do produto, agora preciso do cliente
        ?>
        <div class = "row">
            <div class = "col-12">
                <h3 class = "h3 text-center bg-dark text-light">Expedição de Produtos</h3>
            </div>
        </div>
        <?php if (!isset($_GET['c'])) { ?>
            <div class = "row">
                <div class = "col-12">
                    <h3 class = "h3 text-center text-primary">Pesquise e selecione um cliente</h3>
                </div>
            </div>
        <?php } ?>
        <div class = "row navbar">
            <div class = "col-1 mr-auto"></div>
            <div class = "col-auto">
                <form action = "<?php echo $_SERVER['PHP_SELF'] . "?p=" . $_GET['p'] ?>" method = "post" class = "form-inline">
                    <label class = "mr-sm-2" for = "pesqcli">Cliente:</label>
                    <input class = "form-control mr-sm-2" type = "search" id = "pesqcli" name = "pesq" required placeholder="cliente, email"  aria-label = "Search">
                    <button class = "btn btn-outline-primary my-2 my-sm-0" type = "submit" name = "btpesq">Pesquisar</button>
                </form>
            </div>
        </div>

        <?php
        if (isset($_POST['btpesq'])) {

            $pesq = $_POST['pesq'];
            //pega o cliente com a pesquisa
            $cliente = DBRead('cliente', "WHERE `nome_cliente` LIKE '%{$pesq}%'"
                    . " OR `endereco_cliente`  LIKE '%{$pesq}%'"
                    . " OR `telefone_cliente`  LIKE '%{$pesq}%'"
                    . " OR `celular_cliente`  LIKE '%{$pesq}%'"
                    . " OR `email_cliente`  LIKE '%{$pesq}%'"
                    . " ORDER BY `nome_cliente`");
            ?>
            <div class = "row">
                <div class = "table-responsive  col-12">
                    <table style = "text-align: center;" class = "table table-sm table-hover table-striped table-bordered">
                        <thead class = "thead-dark">
                            <tr>
                                <th scope = "row">#</th>
                                <th scope = "col">Nome Cliente</th>
                                <th scope = "col">Email</th>
                                <th scope = "col">Telefone</th>
                                <th scope = "col">Celular</th>
                                <th scope = "col">Endereço</th>
                                <th scope = "col">Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if ($cliente == false) {
                                ?>
                                <tr>
                                    <td colspan="8">Não existem clientes com esta pesquisa</td>
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
                                        <td title="Selecionar"><a href="saida_produto.php?p=<?php echo $_GET['p'] . '&c=' . $a['id_cliente'] ?>" onclick="return confirm('Este é o Cliente?')"><img src="../_assets/_img/user_add.png" /></a></td>
                                    </tr>
                                    <?php
                                }
                            }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
        <?php
        if (isset($_GET['p']) AND isset($_GET['c'])) {

            $p = addslashes($_GET['p']);
            $c = addslashes($_GET['c']);
            $prod = DBRead("produto", "WHERE id_produto = {$p}",
                    "id_produto, nome_produto, lote_produto, apresentacao_produto");
            $cli = DBRead("cliente", "WHERE id_cliente = {$c}", "id_cliente, nome_cliente");
            $tipoP = DBRead("tipo_pedido");

// se não encontrar os resultados
            if ($prod == FALSE || $cli == FALSE) {
                ?>

                <div class = "row">
                    <div class = "col-12">
                        <h3 class = "h3 text-center text-primary">Selecione um produto e um cliente cadastrados</h3>
                    </div>
                </div>

                <?php
            } else {

                foreach ($prod as $p) {
                    foreach ($cli as $c) {
                        ?>   
                        <div class="row">
                            <div class="col-1"></div>
                            <form style="padding: 2%;" class="col-10 border border-secondary" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" autocomplete="on">
                                <div class="form-row">
                                    <input class="form-control" type="hidden" name="id_produto" value="<?php echo $p['id_produto'] ?>">
                                    <div class="form-group col-md-12">
                                        <label for="Produto">Produto</label>
                                        <input class="form-control" type="text" id="Produto" value="<?php echo $p['nome_produto'] ?>" name="nome_produto" readonly>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="Lote">Lote</label>
                                        <input class="form-control" type="text" id="Lote" value="<?php echo $p['lote_produto'] ?>" name="lote_produto" readonly>
                                    </div>
                                    <div class="form-group col-md-8">
                                        <label for="apres">Apresentação</label>
                                        <input class="form-control" type="text" id="apres" value="<?php echo $p['apresentacao_produto'] ?>" name="apresentacao_produto" readonly>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <input class="form-control" type="hidden" name="id_cliente" value="<?php echo $c['id_cliente'] ?>" >
                                    <div class="form-group col-md-7">
                                        <label for="Fornecedor">Cliente</label>
                                        <input class="form-control" type="text" id="Fornecedor" value="<?php echo $c['nome_cliente'] ?>" name="nome_cliente" readonly>
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label for="guia">Guia de Remessa</label>
                                        <input class="form-control" type="text" id="guia" name="guia" maxlength="50" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="dtexp">Data de Expedição</label>
                                        <input class="form-control" type="date" id="dtexp" name="data" required>
                                    </div>
                                    <div class="form-group col-md-8">
                                        <label for="Transportadora">Transportadora CNPJ</label>
                                        <input class="form-control" type="text" id="Transportadora" name="transportadora">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="Quantidade">Quantidade</label>
                                        <input class="form-control" type="number" max="2000000000" id="Quantidade" name="quantidade" required>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="tp">Tipo Pedido</label>
                                        <select class="form-control" id="tp" name="tp" required>
                                            <?php foreach ($tipoP as $tp ){ ?>
                                            <option value="<?php echo $tp['id_tipo_pedido'] ?>" ><?php echo $tp['tipo_pedido'] ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary" name="btsaidaproduto" onclick="return confirm('Os dados estão corretos?')" >Cadastrar</button>
                                <button type="reset" class="btn btn-danger">Limpar</button>
                            </form>
                            <div class="col-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-12"><a href="list_produto.php"><img src="../_assets/_img/table_go.png" /> Lista Produtos</a></div>
                        </div>
                        </div>
                        <?php
                    }
                }
            }
        }
    }
    require_once 'rodape.php';
} catch (Exception $e) {
    echo $e->getMessage();
}
