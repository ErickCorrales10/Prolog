def mcd(numero1, numero2):
    if numero1 % numero2 == 0:
        return numero2
    else:
        return mcd(numero2, numero1%numero2)

numero1 = int(input('Ingrese el primer número entero positivo: '))
numero2 = int(input('Ingrese el segundo número entero positivo: '))

print(f'\nEl máximo común divisor es: {mcd(numero1, numero2)}')
