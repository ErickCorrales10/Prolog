using System;
using System.Collections.Generic;

class Program
{
    static void Main(string[] args)
    {
        Console.Write("Introduce un numero: ");
        if(int.TryParse(Console.ReadLine(), out int numero))
            if (EsPrimo(numero))
                Console.WriteLine($"{numero} es un numero primo.");
            else
                Console.WriteLine($"{numero} no es un numero primo.");
        else
            Console.WriteLine("Por favor ingrese un numero valido");
    }

    static bool EsPrimo(int numero)
    {
        if (numero <= 1)
            return false;

        for (int i = 2; i <= Math.Sqrt(numero); i++)
            if (numero % i == 0)
                return false;
        
        return true;
    }
}