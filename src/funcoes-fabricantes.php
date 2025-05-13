<?php
require_once "conecta.php";

/* Lógica/Funções para o CRUD de Fabricantes */

// listarUmFabricante: usada pela página fabricante/atualizar.php
function listarUmFabricante(PDO $conexao, int $idFabricante):array {
    $sql = "SELECT * FROM fabricantes WHERE id = :id";

    try {
        $consulta = $conexao->prepare($sql);
        $consulta->bindValue(":id", $idFabricante, PDO::PARAM_INT);
        $consulta->execute();

        /* Usamos o fetch para garantir o retorno
        de um único array associativo com o resultado */
        return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $erro) {
        die("Erro ao carregar fabricante: ".$erro->getMessage());
    }
}

function atualizarFabricante(
    PDO $conexao, int $idFabricante, string $nomeDoFabricante
    ): void {
    $sql = "UPDATE fabricantes SET nome = :nome WHERE id = :id";

    try {
        $consulta = $conexao->prepare($sql);
        $consulta->bindvalue(":nome", $nomeDoFabricante, PDO::PARAM_STR);
        $consulta->bindvalue(":id", $idFabricante, PDO::PARAM_INT);
        $consulta->execute();
    } catch (Exception $erro) {
        die("Erro ao atualizar fabricante: ".$erro->getMessage());
    }
}

// ecluirFabricante: usada em fabricantes/excluir.php
function excluirFabricante(PDO $conexao, int $idFabricante): void {
    $sql = "DELETE FROM fabricantes WHERE id = :id";

    try {
        $consulta = $conexao->prepare($sql);
        $consulta->bindValue(":id", $idFabricante, PDO::PARAM_INT);
        $consulta->execute();
    } catch (Exception $erro) {
        die("Erro ao excluir fabricante: ".$erro->getMessage());
    }
}