<header>
    <nav class="navbar navbar-expand-lg navbar-light sticky-top mb-3" style="font-size: 18px;">
        <a class="navbar-brand" href="home.php">
            <img class="" src="../_assets/_img/lqfex_logo.png" width="50" height="50" alt="" loading="lazy" >
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
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
                        Relatório
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="list_cliente.php">Cliente</a>
                        <a class="dropdown-item" href="list_fornecedor.php">Fornecedor</a>
                        <a class="dropdown-item" href="list_produto.php">Produto</a>
                    </div>
                </li>
            </ul>
        </div>
        <div>
            <h5 class="navbar-text"><?php
                if ($_SESSION['apelido'] != null) {
                    $no = $_SESSION['apelido'];
                    //date_default_timezone_set('America/Sao_Paulo');
                    $date = date('H');
                    if (($date >= 0) AND ( $date < 6)) {
                        echo "Boa noite, " . $no . " <a href='sair.php'>(Sair)</a>";
                    } else {
                        if (($date >= 6) AND ( $date < 12)) {
                            echo "Bom dia, " . $no . " <a href='sair.php'>(Sair)</a>";
                        } else {
                            if (($date >= 12) AND ( $date < 18)) {
                                echo "Boa tarde, " . $no . " <a href='sair.php'>(Sair)</a>";
                            } else {
                                if (($date >= 18) AND ( $date < 24)) {
                                    echo "Boa noite, " . $no . " <a href='sair.php'>(Sair)</a>";
                                }
                            }
                        }
                    }
                }
                ?>
            </h5>
        </div>
    </nav>
</header>