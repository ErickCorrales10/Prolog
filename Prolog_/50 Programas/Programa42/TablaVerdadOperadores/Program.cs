using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Truth Table for AND");
        GenerateTruthTable("and");

        Console.WriteLine("\nTruth Table for OR");
        GenerateTruthTable("or");

        Console.WriteLine("\nTruth Table for NAND");
        GenerateTruthTable("nand");

        Console.WriteLine("\nTruth Table for NOR");
        GenerateTruthTable("nor");

        Console.WriteLine("\nTruth Table for XOR");
        GenerateTruthTable("xor");

        Console.WriteLine("\nTruth Table for IMPLICATION");
        GenerateTruthTable("impl");

        Console.WriteLine("\nTruth Table for EQUIVALENCE");
        GenerateTruthTable("equ");
    }

    static void GenerateTruthTable(string operatorType)
    {
        // Generates the truth table based on the specified operator
        Console.WriteLine("A B Result");

        switch (operatorType)
        {
            case "and":
                Table(true, true, And);
                Table(true, false, And);
                Table(false, true, And);
                Table(false, false, And);
                break;

            case "or":
                Table(true, true, Or);
                Table(true, false, Or);
                Table(false, true, Or);
                Table(false, false, Or);
                break;

            case "nand":
                Table(true, true, Nand);
                Table(true, false, Nand);
                Table(false, true, Nand);
                Table(false, false, Nand);
                break;

            case "nor":
                Table(true, true, Nor);
                Table(true, false, Nor);
                Table(false, true, Nor);
                Table(false, false, Nor);
                break;

            case "xor":
                Table(true, true, Xor);
                Table(true, false, Xor);
                Table(false, true, Xor);
                Table(false, false, Xor);
                break;

            case "impl":
                Table(true, true, Impl);
                Table(true, false, Impl);
                Table(false, true, Impl);
                Table(false, false, Impl);
                break;

            case "equ":
                Table(true, true, Equ);
                Table(true, false, Equ);
                Table(false, true, Equ);
                Table(false, false, Equ);
                break;
        }
    }

    static void Table(bool A, bool B, Func<bool, bool, bool> expr)
    {
        bool result = expr(A, B);
        Console.WriteLine($"{A} {B} {result}");
    }

    // Logical operations
    static bool And(bool A, bool B) => A && B;
    static bool Or(bool A, bool B) => A || B;
    static bool Nand(bool A, bool B) => !(A && B);
    static bool Nor(bool A, bool B) => !(A || B);
    static bool Xor(bool A, bool B) => A ^ B;
    static bool Impl(bool A, bool B) => !A || B;
    static bool Equ(bool A, bool B) => (A && B) || (!A && !B);
}
