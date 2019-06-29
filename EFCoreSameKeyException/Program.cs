using System;
using UnitTest.EFModel.Models;
using TestModel.Models;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace EFCoreSameKeyException
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = new demoContext())
            {
                var defaultPrimaryKey = "test";
                var data = context.Set<item>().Find(defaultPrimaryKey);
                context.Set<item>().Remove(data);
                var item1 = new item
                {
                    ItemGID = defaultPrimaryKey,ItemID = defaultPrimaryKey,
                    TS = DateTime.Now
                };
                context.Set<item>().Add(item1);
                context.SaveChanges();
            }
        }
    }
}
