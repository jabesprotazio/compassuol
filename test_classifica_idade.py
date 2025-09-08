import pytest
from classifica_idade import classifica_idade


@pytest.mark.parametrize("n,esperado",
    [(11,"criança"),
     (17, "adolescente"),
     (49, "adulto"),
     (65, "idoso" )])


@pytest.mark.crianca
def test_crianca():
    assert classifica_idade(11) == "crinça"

@pytest.mark.adolescente
def test_adolescente():
    assert classifica_idade(17) == "adolescente"

@pytest.mark.adulto
def test_adulto():
    assert classifica_idade(32) == "adulto"

@pytest.mark.idoso
def test_idoso():
    assert classifica_idade(91) == "idoso"