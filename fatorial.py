class Fatorial:

    def fatorial(self, n):
        if n < 0:
            return "Tente um número positivo!"
        elif n == 0:
            return 1
        elif n == 1:
            return 1
        else:
            return n * self.fatorial(n - 1)