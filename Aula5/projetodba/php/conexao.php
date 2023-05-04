<?php
// Conectando com o MYSQL - localhost
$conexao = mysqli_connect('localhost','root','');
mysqli_set_charset($conexao,'utf8');

if(!$conexao){
    die("Erro de conexao , erro ->".mysqli_error());

//Selecionando o banco de dados:

$banco = mysqli_select_db($conexao,'empresa');

if(!$banco){
    die("Erro ao selecionar banco, erro ->" .mysqli_error());
}

}


?>
