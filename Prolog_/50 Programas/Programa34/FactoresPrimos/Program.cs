using System;
using System.Collections.Generic;

class Program
{
    static void Main(string[] args)
    {
        int number = 100; // Cambia este número para probar otros
        List<int> factors = new List<int>();
        
        PrimeFactors(number, factors);
        
        Console.WriteLine("Los factores primos de " + number + " son: " + string.Join(", ", factors));
    }

    static void PrimeFactors(int N, List<int> factors)
    {
        if (N <= 1) return;

        // Comienza a buscar factores desde 2
        PrimeFactors(N, 2, factors);
    }

    static void PrimeFactors(int N, int F, List<int> factors)
    {
        // Si N es divisible por F
        if (N > 1 && N % F == 0)
        {
            factors.Add(F);
            Console.WriteLine($"Dividiendo: {N} por {F}"); // Mensaje de depuración
            PrimeFactors(N / F, F, factors); // Continuar con N // F
        }
        else if (N > 1 && F * F <= N)
        {
            // Buscar el siguiente factor solo si no es divisible
            if (N % F != 0)
            {
                Console.WriteLine($"Buscando siguiente factor para: {F}"); // Mensaje de depuración
                PrimeFactors(N, NextFactor(F), factors);
            }
        }
        else if (N > 1 && F * F > N)
        {
            // Si N es mayor que 1 y F es mayor que la raíz cuadrada de N
            factors.Add(N);
        }
    }

    static int NextFactor(int F)
    {
        return F > 2 ? F + 2 : 3; // Para 2, retorna 3, de lo contrario, incrementa por 2
    }
}

