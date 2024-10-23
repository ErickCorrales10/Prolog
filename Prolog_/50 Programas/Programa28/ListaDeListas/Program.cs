using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static List<List<T>> OrdenarListaDeListas<T>(List<List<T>> lista) => lista.OrderBy(sublista => sublista.Count).ToList();

    static void Main(string[] args)
    {
        List<List<char>> lista = new List<List<char>> {
            new List<char> {'a', 'b'}, 
            new List<char> {'c'}, 
            new List<char> {'d', 'e', 'f'}
        };

        List<List<char>> listaDeListas = OrdenarListaDeListas(lista);

        Console.WriteLine("Lista de listas original: [[" + string.Join("], [", lista.Select(x => string.Join(", ", x))) + "]]");
        Console.WriteLine("Lista de listas modificada: [[" + string.Join("], [", listaDeListas.Select(x => string.Join(", ", x))) + "]]");
    }
}