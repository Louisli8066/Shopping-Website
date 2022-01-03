using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public partial class Member
{
    public Member(int id, string account, string password, string email, string name)
    {
        this.Id = id;
        this.Account = account;
        this.Password = password;
        this.Email = email;
        this.Name = name;
    }
    public Member() { }
}

public partial class Product
{
    public Product(int id, string productName, string property, int price, string description, string imageFileName)
    {
        this.Id = id;
        this.ProductName = productName;
        this.Property = property;
        this.Price = price;
        this.Description = description;
        this.ImageFileName = imageFileName;
    }
    public Product() { }
}