using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductUtility
/// </summary>
public class ProductUtility
{
    public static void addProduct(Product p)
    {
        PokemonDBEntities db = new PokemonDBEntities();
        db.Products.Add(p);
        db.SaveChanges();
    }

    public static void updateProduct(Product p)
    {
        PokemonDBEntities db = new PokemonDBEntities();
        db.Entry(p).State = System.Data.Entity.EntityState.Modified;
        db.SaveChanges();
    }

    public static void deleteProduct(int id)
    {
        PokemonDBEntities db = new PokemonDBEntities();
        Product p = db.Products.SingleOrDefault(s => s.Id == id);
        db.Products.Remove(p);
    }

    public static List<Product> getProducts()
    {
        PokemonDBEntities db = new PokemonDBEntities();
        return db.Products.ToList();
    }

    public static Product getProduct(int id)
    {
        PokemonDBEntities db = new PokemonDBEntities();
        Product p = db.Products.SingleOrDefault(s => s.Id == id);
        return p;
    }

    public static List<Product> getProducts(string property)
    {
        PokemonDBEntities db = new PokemonDBEntities();
        List<Product> p = db.Products.Where(s => s.Property == property).ToList();
        return p;
    }
}