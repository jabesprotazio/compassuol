class Calculadora:


    def somar(self,numero1,numero2):
        resultado = numero1 + numero2 
        return resultado
    

    def subtrair(self, numero1, numero2):
        return numero1 - numero2
    
    
    def dividir(self, numero1, numero2):
        if numero2 == 0:
            return None, "O denominador precisa ser diferente de 0."
        else:
            return numero1 / numero2