using System;
using System.Collections.Generic;

class Program
{
    static List<T> EliminarKEsimoElemento<T>(List<T> lista, int k)
    {
        lista.RemoveAt(k - 1);
        return lista;
    }

    static void Main(string[] args)
    {
        List<int> lista = new List<int> { 1, 2, 3, 4, 5};

        Console.WriteLine($"List original: {string.Join(", ", lista)}");
        Console.WriteLine($"Lista con el k-ésimo elemento removido: {string.Join(", ", EliminarKEsimoElemento(lista, 3))}");
    }
}
