using System;
using System.Collections.Generic;

namespace Programa2
{
    class Program
    {
        public static void Main(string[] args)
        {
            Console.Clear();
            List<char> lista = new List<char> { 'a', 'b', 'c', 'd'};
            char penultimoElemento = MyPenultimate(lista);

            Console.WriteLine($"El penúltimo elemento de la lista es: {penultimoElemento}");
            Console.ReadKey();
            Console.Clear();
        }

        static T MyPenultimate<T>(List<T> lista)
        {
            if(lista == null || lista.Count <= 1)
                throw new ArgumentException("La lista debe de tener más de un elemento");
            
            return lista[lista.Count - 2];
        }
    }
}
