using System;
using System.Collections.Generic;

namespace Programa3
{
    class Program
    {
        private static IList<string> _lista = new List<string> {"Erick", "Messi", "Federer", "Ronaldinho"}; 

        public static void Main(string[] args)
        {
            BuscarLista();
            Console.Clear();
        }

        static void BuscarLista()
        {
            int posicion;

            while(true)
            {
                Console.Clear();
                Console.WriteLine("Valores en la lista: ");
                foreach (var item in _lista)
                    Console.WriteLine(item);

                Console.Write($"Ingrese la posición  del elemento a buscar (número máximo: {_lista.Count}): ");
                string ?entrada = Console.ReadLine();

                // Intentar convertir la entrada a un número entero
                if (int.TryParse(entrada, out posicion))
                {
                    // Verificar si la posición es válida
                    if (posicion >= 0 && posicion < _lista.Count)
                    {
                        Console.WriteLine($"El elemento en la posición {posicion} es: {_lista[posicion]}");
                        Console.ReadKey();
                        break;
                    }
                    else
                    {
                        Console.WriteLine($"Por favor, ingrese una posición válida dentro del rango");
                        Console.ReadKey();
                    }
                }
                else
                {
                    Console.WriteLine($"Entrada no válida. Debe ingresar un número");
                    Console.ReadKey();
                }
            }
            
        }
    }
}
