using System;
using System.Collections.Generic;

class Program
{
    static List<T> ExtraerRangoLista<T>(List<T> lista, int n, int m) => lista.GetRange(n - 1, m - n  + 1);


    static void Main(string[] args)
    {
        List<char> lista = new List<char>() {'a', 'b', 'c', 'd', 'e', 'f'};

        Console.WriteLine($"Lista original: {string.Join(", ", lista)}");
        Console.WriteLine($"Lista modificada: {string.Join(", ", ExtraerRangoLista(lista, 3, 5))}");
    }
}
