using System;
using System.Collections.Generic;

class Program
{

    static List<T> DuplicarElementosLista<T>(List<T> lista)
    {
        List<T> result = new List<T>();

        foreach (var item in lista)
        {
            result.Add(item);
            result.Add(item);
        }

        return result;

    }

    static void Main(string[] args)
    {
        List<char> lista = new List<char>() {'a', 'b', 'c', 'd', 'e'};

        List<char> listaDuplicada = DuplicarElementosLista(lista);

        Console.WriteLine("La lista duplicada es: " + string.Join(", ", listaDuplicada));
        Console.ReadKey();
    }


}
