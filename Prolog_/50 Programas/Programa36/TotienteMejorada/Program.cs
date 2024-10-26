public class TotientCalculator
{
    public static int TotientImproved(int n)
    {
        var factors = PrimeFactorsWithMultiplicity(n);
        return TotientPhi(factors);
    }

    private static int TotientPhi(List<(int Prime, int Multiplicity)> factors)
    {
        int phi = 1;
        foreach (var (prime, multiplicity) in factors)
        {
            phi *= (int)(Math.Pow(prime, multiplicity - 1) * (prime - 1));
        }
        return phi;
    }

    private static List<(int Prime, int Multiplicity)> PrimeFactorsWithMultiplicity(int n)
    {
        var factors = PrimeFactors(n);
        return Encode(factors);
    }

    private static List<int> PrimeFactors(int n)
    {
        var factors = new List<int>();
        for (int i = 2; i * i <= n; i++)
        {
            while (n % i == 0)
            {
                factors.Add(i);
                n /= i;
            }
        }
        if (n > 1)
        {
            factors.Add(n);
        }
        return factors;
    }

    private static List<(int, int)> Encode(List<int> factors)
    {
        var encoded = new List<(int, int)>();
        foreach (var group in factors.GroupBy(f => f))
        {
            encoded.Add((group.Key, group.Count()));
        }
        return encoded;
    }
}

class Program
{
    static void Main()
    {
        int n = 10; // Cambia este valor para probar con otros números
        int phi = TotientCalculator.TotientImproved(n);
        Console.WriteLine($"Phi({n}) = {phi}");
    }
}

