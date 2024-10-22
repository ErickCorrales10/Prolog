using System;
using System.Collections.Generic;

class Program
{
    static List<T> EliminarNEsimo<T>(List<T> lista, int nesimo)
    {
        List<T> resultado = new List<T>();

        for (int i = 1; i <= lista.Count; i++)
            if (i%nesimo != 0)
                resultado.Add(lista[i-1]);

        return resultado;
    }

    static void Main(string[] args)
    {
        int nesimo = 3;
        List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8};

        Console.WriteLine($"La lista original es: {string.Join(", ", lista)}");
        Console.WriteLine($"La lista sin el {nesimo}º elemento es: {string.Join(", ", EliminarNEsimo(lista, nesimo))}");
    }
}