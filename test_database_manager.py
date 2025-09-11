import pytest
from database_manager import Cliente, DatabaseManager
import sqlite3
import os


@pytest.fixture
def db_manager():
    db_file = "test.db"
    if os.path.exists(db_file):
        os.remove(db_file)
    db_manager = DatabaseManager(db_file)
    yield db_manager
    db_manager.conn.close()
    os.remove(db_file)

@pytest.mark.parametrize("nome, email, telefone, endereco, cidade, estado, cep, datacadastro, datanascimento",
    [
    ("James","james@.com","5456454654","Rua Logo Ali","Barretos","São Paulo","5465456","05-05-2025","24-09-1999"),
    ("Maria","maria@.com","1234567890","Rua das Flores","São Paulo","SP","12345678","2025-05-05","1990-01-01")
    ])


def test_incluir_cliente(db_manager, nome, email, telefone, endereco, cidade, estado, cep, datacadastro, datanascimento):
    cliente = Cliente(nome, email, telefone, endereco, cidade, estado, cep, datacadastro, datanascimento)
    result = db_manager.incluir_cliente(cliente)
    assert result == "Falha na validação dos dados do cliente."


def test_verificar_cliente(db_manager):
    #cliente = Cliente("James","james@.com","5456454654","Rua Logo Ali","Barretos","São Paulo","5465456","05-05-2025","24-09-1999")
    #db_manager.incluir_cliente(cliente)
    result = db_manager.verificar_cliente(5)
    assert result == "Erro ao buscar o cliente."
    

def test_atualizar_cliente(db_manager):
    cliente = Cliente("James","james@.com","5456454654","Rua Logo Ali","Barretos","São Paulo","5465456","05-05-2025","24-09-1999")
    id_cliente = db_manager.incluir_cliente(cliente)
    cliente.nome = "James Editado"
    result = db_manager.atualizar_cliente(id_cliente, "nome", "James Editado")
    assert result == "ID inválido ou inexistente."