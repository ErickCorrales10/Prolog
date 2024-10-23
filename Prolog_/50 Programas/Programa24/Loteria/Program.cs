using System;
using System.Collections.Generic;

class Program
{

    static void Main(string[] args)
    {
        List<int> numeros = new List<int>();
        int inicio = 1;
        int fin = 50;
        int total = 3;
        Random random = new Random();
        
        while (total > 0)
        {
            numeros.Add(random.Next(inicio, fin + 1));
            total--;
        }

        Console.WriteLine("Números aleatorios:");
        foreach (var numero in numeros)
            Console.Write(numero + " ");
    }
}
