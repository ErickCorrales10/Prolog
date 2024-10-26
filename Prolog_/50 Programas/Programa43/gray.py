def gray(n):
    if n == 1:
        return ['0', '1']
    else:
        # Recursivamente generar el código de Gray para n-1
        previous_gray = gray(n - 1)
        
        # Prefijar '0' a la lista anterior
        with_zero = ['0' + code for code in previous_gray]
        
        # Prefijar '1' a la lista revertida de la anterior
        with_one = ['1' + code for code in reversed(previous_gray)]
        
        # Combinar ambas listas
        return with_zero + with_one

# Ejemplo de uso
n = 3  # Cambia este valor para generar códigos de Gray para diferentes longitudes
gray_codes = gray(n)
print(gray_codes)
