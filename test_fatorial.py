import pytest
from fatorial import Fatorial

@pytest.fixture
def fato():
    return Fatorial()

@pytest.mark.parametrize("n, esperado",[
    (4,24),
    (0,1),
    (1, 1),
    (-2,"Tente um número positivo!")
])

def test_fatorial(fato,n,esperado):
    resultado = fato.fatorial(n)
    assert resultado == esperado

