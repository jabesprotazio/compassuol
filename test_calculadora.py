import pytest
from calculadora import Calculadora

@pytest.fixture 
def calc():
    return Calculadora()

@pytest.mark.parametrize("escolha,primeiro_valor,segundo_valor,esperado",
     [(1,1,1,2),
     (2,5,2,3),
     (3,3,3,9),
     (4,2,2,1)])

def test_menu(calc,escolha,primeiro_valor,segundo_valor, esperado):
    resultado = calc.menu(escolha,primeiro_valor, segundo_valor)
    assert resultado == esperado




def test_somar(calc):
    resultado = calc.somar(1,1)
    assert resultado == 2


def test_subtrair(calc):
    resultado = calc.subtrair(2,1)
    assert resultado == 1
    

def test_dividir(calc):
    resultado = calc.dividir(10,2)
    assert resultado == 5


def test_multiplicar(calc):
    resultado = calc.multiplicar(2,1)
    assert resultado == 2


    