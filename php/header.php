<header>
    <nav class="navbar navbar-expand-lg navbar-light sticky-top mb-3" style="font-size: 18px;">
        <a class="navbar-brand" href="home.php">
            <img src="../_assets/_img/lqfex_logo.png" width="50" height="50" alt="" loading="lazy" >
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse col-auto" id="navbarTogglerDemo02">
            <?php
            if ($_SESSION['nivel'] != 3) {
                ?>
                <ul class="navbar-nav">                
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Cadastrar
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="insert_cliente.php">Cliente</a>
                            <a class="dropdown-item" href="insert_fornecedor.php">Fornecedor</a>
                            <a class="dropdown-item" href="insert_produto.php">Produto</a>
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Lista
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="list_cliente.php">Cliente</a>
                            <a class="dropdown-item" href="list_fornecedor.php">Fornecedor</a>
                            <a class="dropdown-item" href="list_produto.php">Produto</a>
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Relatório
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="list_cliente.php">Cliente</a>
                            <a class="dropdown-item" href="list_fornecedor.php">Fornecedor</a>
                            <a class="dropdown-item" href="list_produto.php">Produto</a>
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Rastreamento
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="entrada_produto.php">Recebimento</a>
                            <a class="dropdown-item" href="saida_produto.php">Expedir</a>
                            <a class="dropdown-item" href="rastreamento.php">Pesquisar</a>
                        </div>
                    </li>
                </ul>
            <?php } ?>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link" href="estoque.php" id="navbarDropdown">
                        Estoque
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-auto">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <h5 class=" navbar-text"><?php
                            if ($_SESSION['apelido'] != null) {
                                $no = $_SESSION['apelido'];
                                $date = date('H');
                                switch ($date) {
                                    case $date >= 0 and $date < 6:
                                        echo "Boa noite, " . $no;
                                        break;
                                    case $date >= 6 and $date < 12:
                                        echo "Bom dia, " . $no;
                                        break;
                                    case $date >= 12 and $date < 18:
                                        echo "Boa tarde, " . $no;
                                        break;
                                    default:
                                        echo "Boa noite, " . $no;
                                        break;
                                }
                            }
                            ?>
                        </h5>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="sair.php">Sair</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>