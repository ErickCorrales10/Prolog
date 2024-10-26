class Program
{
    static bool EsPrimo(int num)
    {
        if (num <= 1)
            return false;

        for (int i = 2; i <= Math.Sqrt(num); i++)
            if (num % i == 0)
                return false;
        
        return true;
        
    }

    static void Main(string[] args)
    {
        int low = 10;
        int high = 30;
        List<int> lista = new List<int>();

        for (int i = low; i <= high; i++)
            if (EsPrimo(i))
                lista.Add(i);

        Console.WriteLine("Números primos entre {0} y {1}:", low, high);
        foreach (var numero in lista)
            Console.Write("{0} ", numero);
        Console.WriteLine();
    }
}
