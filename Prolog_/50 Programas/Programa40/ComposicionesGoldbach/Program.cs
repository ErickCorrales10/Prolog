
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        int low = 4; // Cambia este valor según sea necesario
        int high = 20; // Cambia este valor según sea necesario
        GoldbachList(low, high);
    }

    static void GoldbachList(int low, int high)
    {
        var results = new List<(int N, int P1, int P2)>();

        for (int n = low; n <= high; n += 2)
        {
            if (n > 2)
            {
                var (p1, p2) = Goldbach(n);
                if (p1 <= p2)
                {
                    results.Add((n, p1, p2));
                }
            }
        }

        MostrarResultados(results);
    }

    static (int P1, int P2) Goldbach(int n)
    {
        var primes = PrimeList(2, n);
        foreach (var p1 in primes)
        {
            int p2 = n - p1;
            if (IsPrime(p2))
            {
                return (p1, p2);
            }
        }
        return (0, 0); // Si no se encuentra ninguna pareja
    }

    static List<int> PrimeList(int low, int high)
    {
        var primes = new List<int>();
        for (int p = low; p <= high; p++)
        {
            if (IsPrime(p))
            {
                primes.Add(p);
            }
        }
        return primes;
    }

    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        if (n == 2 || n == 3) return true;
        if (n % 2 == 0) return false;

        return !HasFactor(n, 3);
    }

    static bool HasFactor(int n, int l)
    {
        if (l * l > n) return false;
        if (n % l == 0) return true;
        return HasFactor(n, l + 2);
    }

    static void MostrarResultados(List<(int N, int P1, int P2)> results)
    {
        foreach (var result in results)
        {
            Console.WriteLine($"[{result.N}, {result.P1}, {result.P2}]");
        }
    }
}
