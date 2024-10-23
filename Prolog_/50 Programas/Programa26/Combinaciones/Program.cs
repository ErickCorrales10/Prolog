using System;
using System.Collections.Generic;

class Program
{
    static List<List<T>> Combinacion<T>(int k, List<T> lista)
    {
        List<List<T>> resultado = new List<List<T>>();

        if (k == 0)
        {
            resultado.Add(new List<T>());
            return resultado;
        }

        if (lista.Count == 0)
            return resultado;

        T head = lista[0];
        List<T> tail = lista.GetRange(1, lista.Count - 1);

        foreach (var combinacion in Combinacion(k - 1, tail))
        {
            combinacion.Insert(0, head);
            resultado.Add(combinacion);
        }

        resultado.AddRange(Combinacion(k, tail));

        return resultado;
    }

    static void Main(string[] args)
    {
        List<int> lista = new List<int> { 1, 2, 3, 4, 5};
        int k = 3;

        List<List<int>> combinaciones = Combinacion(k, lista);

        Console.WriteLine("Combinaciones");
        foreach (var combinacion in combinaciones)
            Console.WriteLine("[" + string.Join(", ", combinacion) + "]");
    }

}
