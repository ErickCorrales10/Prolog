using System;
using System.Collections.Generic;

class Program
{
    // Método para decodificar la lsita codificada
    public static List<T> Decode<T>(List<Tuple<int, T>> encodedList)
    {
        List<T> decodedList = new List<T>();

        foreach (var par in encodedList)
        {
            int count = par.Item1;
            T elemento = par.Item2;

            decodedList.AddRange(Expand(elemento, count));
        }

        return decodedList;
    }

    // Método auxiliar para expandir un elemento en una lista de longitud N
    public static List<T> Expand<T>(T elemento, int count)
    {
        List<T> expandedList = new List<T>();

        for (int i = 0; i < count; i++)
            expandedList.Add(elemento);

        return expandedList;
    }

    // Método principal
    static void Main(string[] args)
    {
        // Ejemplo de uso: lista codificada
        List<Tuple<int, char>> encodedList = new List<Tuple<int, char>>()
        {
            Tuple.Create(3, 'a'),
            Tuple.Create(2, 'b'),
            Tuple.Create(1, 'c')
        };

        List<char> decodedList = Decode(encodedList);

        // Imprimir la lista decodificada
        Console.WriteLine("Lista codificada:");
        Console.WriteLine(string.Join(", ", encodedList.Select(x => $"({x.Item1}, {x.Item2})")));
        Console.WriteLine("Lista decodificada:");
        Console.WriteLine(string.Join(", ", decodedList));
    }
}