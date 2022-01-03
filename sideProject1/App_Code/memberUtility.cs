using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for memberUtility
/// </summary>
public class memberUtility
{
    //新增會員
    public static void addMember(Member m)
        
    {
        PokemonDBEntities db = new PokemonDBEntities();
        db.Members.Add(m);
        db.SaveChanges();
    }

    //會員登入
    public static Member GetMember(string account, string password)
    {
        PokemonDBEntities db = new PokemonDBEntities();
        Member m = db.Members.SingleOrDefault(d => d.Account == account && d.Password == password);
        return m;
    }

    //查詢所有會員資料
    public static List<Member> GetMembers()
    {
        PokemonDBEntities db = new PokemonDBEntities();
        return db.Members.ToList();
    }


    //forgetPassword
    public static Member GetMemberByNameEmail(string account, string email)
    {
        PokemonDBEntities db = new PokemonDBEntities();
        Member m = db.Members.SingleOrDefault(d => d.Account == account && d.Email == email);
        return m;
    }

    //更新
    public static void updateMember(Member m)
    {
        PokemonDBEntities db = new PokemonDBEntities();
        db.Entry(m).State = System.Data.Entity.EntityState.Modified;
        db.SaveChanges();
    }


    //查詢會員資料by id(SqlAdapter)
    public static Member GetMemberById(int id)
    {
        PokemonDBEntities db = new PokemonDBEntities();
        Member m = db.Members.SingleOrDefault(s=>s.Id==id);
        return m;
    }

    //刪除
    public static void deleteMember(int id)
    {
        PokemonDBEntities db = new PokemonDBEntities();
        Member m = db.Members.SingleOrDefault(s => s.Id == id);
        db.Members.Remove(m);
        db.SaveChanges();
    }
}
