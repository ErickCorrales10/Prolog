using System;
using System.Collections.Generic;

class Program 
{
    static void Main(string[] args)
    {
        List<char> lista = new List<char> { 'a', 'b', 'c', 'd'};
        char ultimoElemento = MyLast(lista);

        Console.WriteLine("El último elemento es: " + ultimoElemento);
    }

    static T MyLast<T>(List<T> list)
    {
        if (list == null || list.Count == 0)
            throw new ArgumentException("La lista no puede estar vacía");

        return list[list.Count - 1]; // Devuelve el último elemento
    }
}
