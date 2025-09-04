from calculadora import Calculadora



def test_somar():
    call = Calculadora()
    resultado = call.somar(1,1)
    assert resultado == 2