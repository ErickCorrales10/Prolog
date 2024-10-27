using System;
using System.Collections.Generic;
using System.Linq;

public class HuffmanNode
{
    public string Symbol { get; set; }
    public int Frequency { get; set; }
    public HuffmanNode Left { get; set; }
    public HuffmanNode Right { get; set; }

    public HuffmanNode(string symbol, int frequency)
    {
        Symbol = symbol;
        Frequency = frequency;
        Left = Right = null;
    }

    public HuffmanNode(int frequency, HuffmanNode left, HuffmanNode right)
    {
        Symbol = null;
        Frequency = frequency;
        Left = left;
        Right = right;
    }

    public bool IsLeaf => Left == null && Right == null;
}

public class HuffmanTree
{
    public List<HuffmanNode> Frequencies { get; set; }

    public HuffmanTree()
    {
        Frequencies = new List<HuffmanNode>
        {
            new HuffmanNode("a", 5),
            new HuffmanNode("b", 9),
            new HuffmanNode("c", 12),
            new HuffmanNode("d", 13),
            new HuffmanNode("e", 16),
            new HuffmanNode("f", 45)
        };
    }

    public HuffmanNode GenerateTree()
    {
        var nodes = new List<HuffmanNode>(Frequencies.OrderBy(node => node.Frequency));

        while (nodes.Count > 1)
        {
            var left = nodes[0];
            var right = nodes[1];
            nodes.RemoveAt(0);
            nodes.RemoveAt(0);

            var parent = new HuffmanNode(left.Frequency + right.Frequency, left, right);
            nodes.Add(parent);

            nodes = nodes.OrderBy(node => node.Frequency).ToList();
        }

        return nodes.FirstOrDefault();
    }

    public void DisplayTree(HuffmanNode node)
    {
        if (node == null) return;

        if (node.IsLeaf)
        {
            Console.Write($"{node.Symbol}");
        }
        else
        {
            Console.Write("(");
            DisplayTree(node.Left);
            Console.Write(" ");
            DisplayTree(node.Right);
            Console.Write(")");
        }
    }
}

class Program
{
    static void Main()
    {
        var huffmanTree = new HuffmanTree();
        var root = huffmanTree.GenerateTree();
        
        Console.WriteLine("Árbol de Huffman:");
        huffmanTree.DisplayTree(root);
        Console.WriteLine();
    }
}
