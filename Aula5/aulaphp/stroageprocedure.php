<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procedure</title>
</head>
<body>
    <?php
        include 'conexao.php';
        if(isset($_POST['QTDE'])){
            $qtde=$_POST['QTDE'];
            $produtos='';

            $result=mysqli_query($conexao, "CALL SP_SelecionaProdutos('" .$qtde."');")

            or die ("Erro ao executar a query: " . mysqli_error());    

            print "<h2> Resultados </h2>";
            print "<br>";

            while($linha= mysqli_fetch_assoc($result)){
                print $linha["id"] . " - " . $linha["descricao"];
                print "<br>";
            }
        }
    ?>
</body>
</html>