using System;
using System.Collections.Generic;

class Program
{
    /* static List<int> CrearListaEnteros(int inicio, int fin)
    {
        List<int> resultado = new List<int>();

        while (inicio <= fin)
        {
            resultado.Add(inicio);
            inicio++;
        }

        return resultado;    
    } */

    static List<int> CrearListaEnteros(int inicio, int fin) => Enumerable.Range(inicio, fin - inicio + 1).ToList();


    static void Main(string[] args)
    {
        int inicio = -5;
        int fin = 5;

        Console.WriteLine($"Lista de enteros desde el {inicio} hasta el {fin}: " +
        $"{string.Join(", ", CrearListaEnteros(inicio, fin))}");
    }
}