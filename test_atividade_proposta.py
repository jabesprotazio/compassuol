import pytest
from atividade_proposta_divisao import dividir

def test_atividade_proposta_divisao():
    with pytest.raises(ValueError):
        dividir(10,0)
    assert "O divisor não pode ser zero."

        