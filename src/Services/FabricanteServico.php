<?php
namespace ExemploCrud\Services;

use ExemploCrud\Database\ConexaoBD;

use Exception;
use ExemploCrud\Models\Fabricante;
use PDO;
use Throwable;




final class FabricanteServico {
    private PDO $conexao;

    public function __construct()
    {
        $this->conexao = ConexaoBD::getConexao();
    }

    public function listarTodos():array {
        $sql = "SELECT * FROM fabricantes ORDER BY nome";
        try {
            $consulta = $this->conexao->prepare($sql);
            $consulta->execute();
            return $consulta->fetchALL(PDO::FETCH_ASSOC);
        } catch (Throwable $erro) {
            throw new Exception("Erro ao carregar fabricantes: ".$erro->getMessage());
        }
    }

    public function inserir(Fabricante $fabricante): void { 
        $sql = "INSERT INTO fabricantes(nome) VALUES(:nome)";

        try {
            $consulta = $this->conexao->prepare($sql);
            $consulta->bindValue(":nome", $fabricante->getNome(), PDO::PARAM_STR);
            $consulta->execute();
        } catch (Throwable $erro) {
            throw new Exception("Erro ao inserir: ".$erro->getMessage());
        }
    }
}