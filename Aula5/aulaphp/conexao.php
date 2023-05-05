<?php
    //conexao
    $conexao = mysqli_connect('localhost','root','');
    mysqli_set_charset($conexao,'utf8');

    if(!$conexao)
        die ("Erro de conexao ao banco de dados" .mysqli_error());

    $banco = mysqli_select_db($conexao,'empresa');

    if(!$banco)
        die ("Erro de conexao ao banco de dados" .mysqli_error());

?>