import pytest
from calculadora import Calculadora

@pytest.fixture 
def calc():
    return Calculadora()

def test_somar(calc):
    resultado = calc.somar(1,1)
    assert resultado == 2


def test_subtrair(calc):
    resultado = calc.subtrair(2,1)
    assert resultado == 1