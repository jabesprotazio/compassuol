class Calculadora:

    def menu(self, escolha, primeiro_valor, segundo_valor):
        print("Bem vindo a Calculadora Python: \n Escolha uma das opções: ")
        print("1- Somar \n 2- Subtrair \n 3- Multiplicar \n 4- Dividir")

        match escolha:
            case 1:
                return self.somar(primeiro_valor,segundo_valor)

            case 2:
                return self.subtrair(primeiro_valor,segundo_valor)
            
            case 3:
                return self.multiplicar(primeiro_valor,segundo_valor)
            
            case 4:
                return self.dividir(primeiro_valor, segundo_valor)


    def somar(self,numero1,numero2):
        resultado = numero1 + numero2 
        return resultado
    

    def subtrair(self, numero1, numero2):
        resultado = numero1 - numero2
        return resultado
    
    
    def dividir(self, numero1, numero2):
        if numero2 == 0:
            return None, "O denominador precisa ser diferente de 0."
        else:
            resultado = numero1 / numero2
            return resultado
        

    def multiplicar(self, numero1, numero2):
        resultado = numero1 * numero2
        return resultado
    
